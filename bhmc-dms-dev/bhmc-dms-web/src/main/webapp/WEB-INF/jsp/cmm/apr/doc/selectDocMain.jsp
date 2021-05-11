<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 결재 양식 -->
<div id="resizableContainer">
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="global.title.signDocInfoMng" /></h1>
        <div class="btn_right">
	        <dms:access viewId="VIEW-D-11410" hasPermission="${dms:getPermissionMask('READ')}">
	            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
	        </dms:access>
        </div>
    </div>
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
                    <th scope="row"><spring:message code='global.lbl.signDocId' /></th>
                    <td>
                        <input id="sSignDocId" type="text" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.signDocNm' /></th>
                    <td>
                        <input id="sSignDocNm" type="text" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.useYn' /></th>
                    <td>
                        <input id="sUseYn" type="text" class="form_comboBox" />
                    </td>
                    <th></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- 결재 양식 그리드 기능버튼 -->
    <div class="header_area">
        <div class="btn_right">
        	<dms:access viewId="VIEW-D-11411" hasPermission="${dms:getPermissionMask('READ')}">
	            <button class="btn_s" id="btnSave"><spring:message code='global.btn.save' /><!-- 저장 --></button>
	        </dms:access>
	        <dms:access viewId="VIEW-D-11413" hasPermission="${dms:getPermissionMask('READ')}">
	            <button class="btn_s btn_add" id="btnAdd"><spring:message code='global.btn.rowAdd' /><!-- 행추가 --></button>
	        </dms:access>
	        <dms:access viewId="VIEW-D-11414" hasPermission="${dms:getPermissionMask('READ')}">
	            <button class="btn_s btn_delete" id="btnDel"><spring:message code='global.btn.rowDel' /><!-- 행삭제 --></button>
	        </dms:access>
	        <dms:access viewId="VIEW-D-11412" hasPermission="${dms:getPermissionMask('READ')}">
	            <button class="btn_s" id="btnCancel"><spring:message code='global.btn.cancel' /><!-- 취소 --></button>
	        </dms:access>
        </div>
    </div>

    <!-- 결재양식 그리드 -->
    <div class="table_grid">
        <div id="grid" class="resizable_grid"></div>
    </div>

    <!-- 결재선 기능버튼 -->
    <div class="header_area">
        <h2 class="title_basic"><spring:message code="global.title.signLine" /><!-- 결재선 --></h2>
        <div class="btn_right">
	        <dms:access viewId="VIEW-D-11415" hasPermission="${dms:getPermissionMask('READ')}">
	            <button class="btn_s btn_save" id="btnLineSave"><spring:message code='global.btn.save' /><!-- 저장 --></button>
	        </dms:access>
	        <dms:access viewId="VIEW-D-11416" hasPermission="${dms:getPermissionMask('READ')}">
	            <button class="btn_s btn_add" id="btnLineAdd"><spring:message code='global.btn.rowAdd' /><!-- 행추가 --></button>
	        </dms:access>
	        <dms:access viewId="VIEW-D-11417" hasPermission="${dms:getPermissionMask('READ')}">
	            <button class="btn_s btn_del" id="btnLineDel"><spring:message code='global.btn.rowDel' /><!-- 행삭제 --></button>
	        </dms:access>
	        <dms:access viewId="VIEW-D-11418" hasPermission="${dms:getPermissionMask('READ')}">
	            <button class="btn_s btn_cancel" id="btnLineCancel"><spring:message code='global.btn.cancel' /><!-- 취소 --></button>
	        </dms:access>
        </div>
    </div>

    <!-- 결재선 그리드 -->
    <div class="table_grid">
        <div id="gridSignLine"></div>
    </div>
</section>
</div>

<script type="text/javascript">
//마지막에 선택된 결재 양식ID
var lastSelectedSignDocId = "";

function userSearchPopup() {
    var grid = $("#gridSignLine").data("kendoExtGrid");
    var row  = grid.select();
    var uid  = row[0].attributes["data-uid"].nodeValue;
    var dataItem = grid.dataSource.getByUid(uid);

    dms.window.popup({
        windowId:"userSearchPopupWin"
        ,title:"<spring:message code='cmm.title.user.search'/>"
        ,content:{
            url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
            , data:{
                "autoBind":false
                ,"closeAfterSelect":true
                ,"selectable":"single"
                ,"callbackFunc":function(data){
                    //결재선 중복 체크
                    var flag = true
                    $.each(grid.dataSource.data(), function(idx, obj){
                        if(data[0].usrId == obj.signUsrId){
                            flag = false;
                            return false;
                        }
                    });

                    if(!flag){
                        dms.notification.info("<spring:message code='global.info.already'/>");
                        return;
                    }

                    dataItem.signUsrId = data[0].usrId;
                    dataItem.signUsrNm = data[0].usrNm;
                    dataItem.signEmpNo = data[0].empNo;
                    dataItem.signDeptCd = data[0].deptCd;
                    dataItem.signPsitCd = data[0].pstnCd;

                    grid.closeCell();
                }
            }
        }
    });
}

$(document).ready(function() {
    //버튼 - 결재양식 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 결재양식 저장
    $("#btnSave").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid");

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList", ["regDtFormat"]);
            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/cmm/apr/doc/multiDocs.do' />",
                    data:JSON.stringify(saveData),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
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

  	//버튼 - 결재양식 행추가
    $("#btnAdd").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.insert({
                 signDocId:""
                ,signDocNm:""
                ,signAlrtYn:"Y"
                ,signCallBackAlrtYn:"N"
                ,useYn:"Y"
            });
        }
    });

    //버튼 - 결재양식 행삭제
    $("#btnDel").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    //버튼 - 결재양식  취소
    $("#btnCancel").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').cancelChanges();
        }
    });

    //버튼 - 결재라인 저장
    $("#btnLineSave").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            if(rows.length == 0){
                //결재양식을 선택해 주세요
                dms.notification.warning("<spring:message code='global.info.checkSignDocId' />");
                return;
            }

            var gridSignLine = $("#gridSignLine").data("kendoExtGrid");

            var docLineList = gridSignLine.dataSource.data();
            if (docLineList.length == 0) {
                dms.notification.warning("<spring:message code='global.lbl.signLine' var='signLineMsg' /><spring:message code='global.info.required.min.list' arguments='${signLineMsg},"+1+"' />");
                return;
            }

            if (gridSignLine.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/cmm/apr/doc/deleteAndInsertDocLines.do' />",
                    data:JSON.stringify({"signDocId":grid.dataItem(rows).signDocId, "docLineList":docLineList}),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    },
                    success:function(jqXHR, textStatus) {
                        $("#gridSignLine").data("kendoExtGrid").dataSource.read();

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

    //버튼 - 결재라인 행추가
    $("#btnLineAdd").kendoButton({
        click:function(e) {
            var grid = $('#grid').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());

            if(selectedItem != null) {
                var signDocId = selectedItem.signDocId;

                if(signDocId != "") {
                    var gridSignLine = $('#gridSignLine').data('kendoExtGrid');
                    var total = gridSignLine.dataSource.data().length;

                    //결재라인 항목의 최종결재자 여부 'N' 설정
                    $.each(gridSignLine.dataSource.data(), function(idx, obj){
                        obj.set("lastSignYn", "N");
                    });

                    //결재라인 항목 추가
                    gridSignLine.dataSource.add({
                        "signDocId":signDocId
                        ,"signDocLineNo":total+1
                        ,"lastSignYn":"Y"
                        ,"signTp":"01"
                        ,"signUsrId":""
                        ,"signUsrNm":""
                        ,"signEmpNo":""
                        ,"signDeptCd":""
                        ,"signPsitCd":""
                    });
                }
            } else {
                //결재양식을 먼저 선택해 주십시오.
                dms.notification.success("<spring:message code='global.lbl.signDocId' var='cmmGrpCdNmMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${cmmGrpCdNmMsg}' />");
            }
        }
    });

    //버튼 - 결재라인 행삭제
    $("#btnLineDel").kendoButton({
        click:function(e) {
            var grid = $("#gridSignLine").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });

            //마지막 라인을 최종 결재자로 설정한다.
            var dataItem = grid.dataItem(grid.tbody.find("tr:last"));
            if(dataItem){
                dataItem.set("lastSignYn", "Y");
            }
        }
    });

    //버튼 - 결재 라인  취소
    $("#btnLineCancel").kendoButton({
        click:function(e) {
            $('#gridSignLine').data('kendoExtGrid').cancelChanges();
        }
    });

    //조회조건 - 사용여부
    $("#sUseYn").kendoExtDropDownList({
        dataSource:['Y','N']
        ,autoBind:false
        ,optionLabel:" "
        ,index:0
    });

    //결재양식 그리드
    $("#grid").kendoExtGrid({
        gridId:"G-CMM-0118-150001"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/apr/doc/selectDocs.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sSignDocId"] = $("#sSignDocId").val();
                        params["sSignDocNm"] = $("#sSignDocNm").val();
                        params["sUseYn"] = $("#sUseYn").data("kendoExtDropDownList").value();

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
                        ,signDocId:{type:"string", validation:{required:true}}
                        ,signDocNm:{type:"string", validation:{required:true}}
                        ,signAlrtYn:{type:"string", validation:{required:true}}
                        ,signCallBackAlrtYn:{type:"string", validation:{required:true}}
                        ,useYn:{type:"string", validation:{required:true}}
                        ,refDocViewUrlNm:{type:"string"}
                        ,regUsrId:{type:"string", editable:false}
                        ,regDt:{type:"date", editable:false}
                        ,regDtFormat:{type:"date", editable:false}
                    }
                }
	            ,parse:function(d) {
	                if(d.data){
	                    $.each(d.data, function(idx, elem) {
	                        elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
	                    });
	                }
	                return d;
	            }
            }
        }
        ,height:250
        ,selectable:"row"
        ,appendEmptyColumn:true
        ,indvColumnVisible:false
        ,indvColumnReorderable:false
        ,editableOnlyNew:true
        ,editableOnlyNewExcludeColumns:["signDocNm","signAlrtYn","useYn","signCallBackAlrtYn","signCallBackUrlNm","refDocViewUrlNm"]
        ,dataBinding:function(e) {
            $("#gridSignLine").data("kendoExtGrid").dataSource.data([]);
        }
        ,change:function(e){
            var dataItem = this.dataItem(this.select());

            if (dataItem.signDocId !== lastSelectedSignDocId) {
                lastSelectedSignDocId = dataItem.signDocId;

                if (dataItem.isNew()) {
                    $("#gridSignLine").data("kendoExtGrid").dataSource.data([]);
                } else {
                    $("#gridSignLine").data("kendoExtGrid").dataSource.read();
                }
            }
         }
        ,columns:[
            {field:"signDocId", title:"<spring:message code='global.lbl.signDocId' />", width:100, attributes:{"class":"ac"}}
            ,{field:"signDocNm", title:"<spring:message code='global.lbl.signDocNm' />", width:400 }
            ,{field:"signAlrtYn", title:"<spring:message code='global.lbl.signAlrtYn' />", width:100, attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    $('<input required name="signAlrtYn" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:true
                        ,dataSource:['Y','N']
                    });
                    $('<span class="k-invalid-msg" data-for="signAlrtYn"></span>').appendTo(container);
                }
                ,filterable:{
	                cell:{
	                    showOperators:false
	                    ,template: function (e) {
	                        e.element.kendoExtDropDownList({
	                            dataSource:['','Y','N']
	                            ,valuePrimitive:true
	                        });
	                    }
	                }
	        	}
            }
            ,{field:"signCallBackAlrtYn", title:"<spring:message code='global.lbl.signCallBackAlrtYn' />", width:100, attributes:{"class":"ac"}
                ,editor:function(container, options) {
                   $('<input required name="signCallBackAlrtYn" data-bind="value:' + options.field + '"/>')
                   .appendTo(container)
                   .kendoExtDropDownList({
                       autoBind:true
                       ,dataSource:['Y','N']
                   });
                   $('<span class="k-invalid-msg" data-for="signCallBackAlrtYn"></span>').appendTo(container);
               }
                ,filterable:{
	                cell:{
	                    showOperators:false
	                    ,template: function (e) {
	                        e.element.kendoExtDropDownList({
	                            dataSource:['','Y','N']
	                            ,valuePrimitive:true
	                        });
	                    }
	                }
	        	}
            }
            ,{field:"useYn", title:"<spring:message code='global.lbl.useYn' />", width:80, attributes:{"class":"ac"}
                ,editor:function(container, options) {
                   $('<input required name="useYn" data-bind="value:' + options.field + '"/>')
                   .appendTo(container)
                   .kendoExtDropDownList({
                       autoBind:true
                       ,dataSource:['Y','N']
                   });
                   $('<span class="k-invalid-msg" data-for="useYn"></span>').appendTo(container);
               	}
                ,filterable:{
	                cell:{
	                    showOperators:false
	                    ,template: function (e) {
	                        e.element.kendoExtDropDownList({
	                            dataSource:['','Y','N']
	                            ,valuePrimitive:true
	                        });
	                    }
	                }
	        	}
       		}
            ,{field:"refDocViewUrlNm", title:"<spring:message code='global.lbl.refDocViewUrlNm' />", width:120, attributes:{"class":"ac"}}
            ,{field:"regUsrId", title:"<spring:message code='global.lbl.regUsrId' />", width:100, attributes:{"class":"ac"}}
            ,{field:"regDtFormat", title:"<spring:message code='global.lbl.regDt' />", width:80, attributes:{"class":"ac"}
            	,template:"#= kendo.toString(data.regDt, '<dms:configValue code='dateFormat' />') #"
            }
        ]
    });

    //결재라인 그리드
    $("#gridSignLine").kendoExtGrid({
        gridId:"G-CMM-0118-150002"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/cmm/apr/doc/selectDocLines.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["sort"] = options.sort;
                        params["sSignDocId"] = lastSelectedSignDocId;

                        return kendo.stringify(params);
                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,navigatable:false
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                         rnum:{type:"number", editable:false}
                        ,signDocId:{type:"string", editable:false, validation:{required:true}}
                        ,signDocLineNo:{type:"string", editable:false, validation:{required:true}}
                        ,lastSignYn:{type:"string", validation:{required:true}}
                        ,signTp:{type:"string", editable:false, validation:{required:true}}
                        ,signUsrId:{type:"string", validation:{required:true}}
                        ,signUsrNm:{type:"string", validation:{required:true}}
                        ,signDeptCd:{type:"string"}
                        ,signPsitCd:{type:"string"}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        var lineNo = 1;
                        $.each(d.data, function(idx, elem) {
                            elem.signDocLineNo = lineNo++;
                        });
                    }
                    return d;
                }
            }
        }
        ,appendEmptyColumn:true
        ,indvColumnVisible:false
        ,indvColumnReorderable:false
        ,height:200
        ,multiSelectWithCheckbox:true
        ,pageable:false
        ,selectable:"row"
        ,edit:function(e){
            var fieldName = e.container.find("input[name][data-bind]").attr("name");

            if(fieldName == "lastSignYn"){
                this.closeCell();
            }
        }
        ,columns:[
             {field:"signDocId", title:"<spring:message code='global.lbl.signDocId' />", width:100, sortable:false ,attributes:{"class":"ac"}}
            ,{field:"signDocLineNo", title:"<spring:message code='global.lbl.signDocLineNo' />", width:100, sortable:false ,attributes:{"class":"ac"}}
            ,{field:"lastSignYn", title:"<spring:message code='global.lbl.final' />", width:100 ,attributes:{"class":"ac"}
	            ,filterable:{
	                cell:{
	                    showOperators:false
	                    ,template: function (e) {
	                        e.element.kendoExtDropDownList({
	                            dataSource:['','Y','N']
	                            ,valuePrimitive:true
	                        });
	                    }
	                }
	        	}
            }
            ,{field:"signUsrNm", title:"<spring:message code='global.lbl.apprUsrNm' />", width:200
                ,editor:function(container, options) {
                    var oldSignUsrId = options.model.signUsrId;
                    var oldSignUsrNm = options.model.signUsrNm;

                    $("<div class=\"form_search\"><input required id=\"signUsrNm\" type=\"text\" data-bind=\"value:" + options.field + "\" class=\"form_auto\" /><a id=\"btnUserSearch\" href=\"javascript:userSearchPopup();\">검색</a></div>")
                    .appendTo(container);

                    container
                    .find("#signUsrNm")
                    .bind("change", function(){
                        if(dms.string.isEmpty(options.model.signUsrId) || options.model.signUsrId == oldSignUsrId){
                            this.value = oldSignUsrNm;
                            $("#gridSignLine").data("kendoExtGrid").closeCell();
                        };
                    })
                    .kendoAutoComplete({
                        minLength:2
                        ,template:"[#:data.usrId#]#:data.usrNm#"
                        ,dataTextField:"usrNm"
                        ,dataSource:{
                             serverFiltering:true
                            ,transport:{
                                read:{
                                     url:"<c:url value='/cmm/sci/user/selectUsersForSuggest.do' />"
                                     ,dataType:"json"
                                     ,type:"POST"
                                     ,contentType:"application/json"
                                }
                                ,parameterMap:function(options, operation) {
                                    if (operation === "read") {
                                        return kendo.stringify({
                                            "sText":$("#signUsrNm").data("kendoAutoComplete").value()
                                            ,"recordCountPerPage":5
                                        });
                                    }
                                }
                            }
                            ,schema:{
                                 data:"data"
                                ,total:"total"
                                ,parse:function(d){
                                    //결재선 중복 체크
                                    var signLineList = $("#gridSignLine").data("kendoExtGrid").dataSource.data();
                                    var items = [];
                                    if(d.data){
                                        $.each(d.data, function(idx2, suggestItem){
                                            var exist = false;

                                            $.each(signLineList, function(idx, signLineItem){
                                               if(dms.string.isNotEmpty(signLineItem.signUsrId) && signLineItem.signUsrId == suggestItem.usrId){
                                                   exist = true;
                                                   return false;
                                               }
                                            });

                                            if(!exist){
                                                items.push(suggestItem);
                                            }
                                        });
                                    }

                                    return {data:items, total:items.length};
                                }
                            }
                        }
                        ,select:function(e){
                            options.model.signUsrId = e.dataItem.usrId;
                            options.model.signEmpNo = e.dataItem.empNo;
                            options.model.signDeptCd = e.dataItem.deptCd;
                            options.model.signPsitCd = e.dataItem.pstnCd;
                        }
                    });

                    $('<span class="k-invalid-msg" data-for="signUsrNm"></span>').appendTo(container);
                }
            }
        ]
    });
});
</script>