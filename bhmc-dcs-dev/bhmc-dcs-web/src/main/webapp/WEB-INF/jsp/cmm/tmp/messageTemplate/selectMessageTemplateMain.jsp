<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 메세지 템플릿 관리 -->
<div id="resizableContainer">
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="cmm.title.messageTmplMng" /></h1>
        <div class="btn_right">
            <dms:access viewId="VIEW-I-12180" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_m btn_search" id="btnSearchGroup"><spring:message code="global.btn.search" /><!-- 조회 --></button>
            </dms:access>            
        </div>
    </div>
    <div class="table_form" role="search" data-btnid="btnSearchGroup">
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
                    <th scope="row"><spring:message code='global.lbl.mesgTmplGrpTp' /></th>
                    <td>
                        <input id="sMesgTmplGrpTp" type="text" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.mesgTmplGrpId' /></th>
                    <td>
                        <input id="sMesgTmplGrpId" type="text" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.mesgTmplGrpNm' /></th>
                    <td>
                        <input id="sMesgTmplGrpNm" type="text" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.useYn' /></th>
                    <td>
                        <input id="sUseYn" type="text" class="form_comboBox" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- 메세지 템플릿 그룹 그리드 기능버튼 -->
    <div class="header_area">
        <h2 class="title_basic"><spring:message code="cmm.title.messageTmplGrp" /></h2>
        <div class="btn_right">
        	<dms:access viewId="VIEW-I-12179" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_s" id="btnSaveGroup"><spring:message code='global.btn.save' /><!-- 저장 --></button>
            </dms:access>
            <dms:access viewId="VIEW-I-12177" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_s" id="btnAddGroup"><spring:message code='global.btn.rowAdd' /><!-- 행추가 --></button>
            </dms:access>
            <dms:access viewId="VIEW-I-12176" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_s" id="btnDelGroup"><spring:message code='global.btn.rowDel' /><!-- 행삭제 --></button>
            </dms:access>
            <dms:access viewId="VIEW-I-12178" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_s" id="btnCancelGroup"><spring:message code='global.btn.cancel' /><!-- 취소 --></button>
            </dms:access>
        </div>
    </div>

    <div class="table_grid">
        <div id="mesgTmplGrpGrid" class="resizable_grid"></div>
    </div>

    <!-- 메세지 템플릿 그리드 -->
    <div class="header_area">
        <h3 class="title_basic"><spring:message code="cmm.title.messageTmpl" /></h3>
        <div class="btn_right">
            <dms:access viewId="VIEW-I-12175" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_xs" id="btnSaveTmpl"><spring:message code='global.btn.save' /><!-- 저장 --></button>
            </dms:access>
            <dms:access viewId="VIEW-I-12174" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_xs" id="btnAddTmpl"><spring:message code='global.btn.add' /><!-- 추가 --></button>
            </dms:access>
            <dms:access viewId="VIEW-I-12173" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_xs" id="btnUpdateTmpl"><spring:message code='global.btn.update' /><!-- 수정 --></button>
            </dms:access>
            <dms:access viewId="VIEW-I-12172" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_xs" id="btnDelTmpl"><spring:message code='global.btn.del' /><!-- 삭제 --></button>
            </dms:access>
            <dms:access viewId="VIEW-I-12171" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_xs" id="btnCancelTmpl"><spring:message code='global.btn.cancel' /><!-- 취소 --></button>
            </dms:access>
        </div>
    </div>
    <div class="table_grid">
        <div id="mesgTmplGrid"></div>
    </div>
</section>
</div>

<script type="text/javascript">
//메세지템플릿그룹 선택아이디
var lastSelectedTmplGrpId = "";

//메세지템플릿그룹구분
var mesgTmplGrpTpList = [];
<c:forEach var="obj" items="${mesgTmplGrpTpList}">
mesgTmplGrpTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//메세지템플릿그룹구분 Map
var mesgTmplGrpTpMap = dms.data.arrayToMap(mesgTmplGrpTpList, function(obj){ return obj.cmmCd; });

//메세지템플릿 유형 Array
var mesgTmplTpList = [];
<c:forEach var="obj" items="${mesgTmplTpList}">
mesgTmplTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//메세지템플릿 유형 Map
var mesgTmplTpMap = dms.data.arrayToMap(mesgTmplTpList, function(obj){ return obj.cmmCd; });

//메세지 템플릿 작성  팝업
var messageTemplateWritePopupWin;
function messageTemplateWritePopup(dataItem) {
    var grid = $("#mesgTmplGrid").data("kendoExtGrid");

    messageTemplatePopupWin = dms.window.popup({
        windowId:"messageTemplateWritePopupWin"
        ,title:"<spring:message code='cmm.title.messageTmpl' />"
        ,content:{
            url:"<c:url value='/cmm/tmp/messageTemplate/selectMessageTemplateWritePopup.do' />"
            , data:{
                "autoBind":false
                ,"mesgTmplGrpId":dataItem.mesgTmplGrpId
                ,"callbackFunc":function(){
                    grid.dataSource.read();
                }
            }
        }
    });
}

//메세지 템플릿  수정 팝업
var messageTemplateUpdatePopupWin;
function messageTemplateUpdatePopup(dataItem) {
    var mesgTmplGrid = $("#mesgTmplGrid").data("kendoExtGrid");

    messageTemplatePopupWin = dms.window.popup({
        windowId:"messageTemplateUpdatePopupWin"
        ,title:"<spring:message code='cmm.title.messageTmpl' />"
        ,content:{
            url:"<c:url value='/cmm/tmp/messageTemplate/selectMessageTemplateUpdatePopup.do' />"
            , data:{
                "autoBind":false
                ,"mesgTmplNo":dataItem.mesgTmplNo
                ,"mesgTmplGrpId":dataItem.mesgTmplGrpId
                ,"mesgTmplTp":dataItem.mesgTmplTp
                ,"mesgTmplNm":dataItem.mesgTmplNm
                ,"mesgTmplCont":dataItem.mesgTmplCont
                ,"defaultYn":dataItem.defaultYn
                ,"useYn":dataItem.useYn
                ,"callbackFunc":function(){
                    mesgTmplGrid.dataSource.read();
                }
            }
        }
    });
}

$(document).ready(function() {
    //버튼 - 메세지템플릿그룹 조회
    $("#btnSearchGroup").kendoButton({
        click:function(e) {
            $('#mesgTmplGrpGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });
    
    //버튼 - 메세지템플릿그룹 저장
    $("#btnSaveGroup").kendoButton({
        click:function(e) {
            var grid = $("#mesgTmplGrpGrid").data("kendoExtGrid");

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/cmm/tmp/messageTemplate/multiMessageTemplateGroups.do' />",
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

    //버튼 - 메세지템플릿그룹 행추가
    $("#btnAddGroup").kendoButton({
        click:function(e) {
            $('#mesgTmplGrpGrid').data('kendoExtGrid').dataSource.insert(0, {
                "mesgTmplGrpTp":""
                ,"mesgTmplGrpId":""
                ,"mesgTmplGrpNm":""
                ,"useYn":"Y"
            });
        }
    });

    //버튼 - 메세지템플릿그룹 행삭제
    $("#btnDelGroup").kendoButton({
        click:function(e) {
            var grid = $("#mesgTmplGrpGrid").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    //취소 - 메세지템플릿그룹 취소
    $("#btnCancelGroup").kendoButton({
        click:function(e) {
            $('#mesgTmplGrpGrid').data('kendoExtGrid').cancelChanges();
        }
    });
    
    //버튼 - 메세지 템플릿 저장
    $("#btnSaveTmpl").kendoButton({
        click:function(e) {
            var grid = $("#mesgTmplGrid").data("kendoExtGrid");

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/cmm/tmp/messageTemplate/multiMessageTemplates.do' />",
                    data:JSON.stringify(saveData),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    },
                    success:function(jqXHR, textStatus) {
                        grid.dataSource.read();

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

    //버튼 - 메세지 템플릿 추가
    $("#btnAddTmpl").kendoButton({
        click:function(e) {

          var grid = $('#mesgTmplGrpGrid').data('kendoExtGrid');
          var selectedItem = grid.dataItem(grid.select());
          if(selectedItem == null) {
              //메세지 템플릿 그룹을 먼저 선택해 주십시오.
              dms.notification.success("<spring:message code='global.lbl.mesgTmplGrpId' var='mesgTmplGrpIdMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${mesgTmplGrpIdMsg}' />");
              return;
          }

          messageTemplateWritePopup(selectedItem);
        }
    });

    //버튼 - 메세지 템플릿 수정
    $("#btnUpdateTmpl").kendoButton({
        click:function(e) {
          var grid = $('#mesgTmplGrid').data('kendoExtGrid');
          var selectedItem = grid.dataItem(grid.select());

          if(selectedItem == null) {
              //메세지 템플릿을 먼저 선택해 주십시오.
              dms.notification.success("<spring:message code='global.lbl.mesgTmpl' var='mesgTmplMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${mesgTmplMsg}' />");
              return;
          }

          messageTemplateUpdatePopup(selectedItem);
        }
    });

    //버튼 - 메세지 템플릿 삭제
    $("#btnDelTmpl").kendoButton({
        click:function(e) {
            var grid = $("#mesgTmplGrid").data("kendoExtGrid");
            var rows = grid.select();
            var valid = true;

            //디폴트로 설정된 메세지 템플릿 포함 여부를 체크 한다.
            rows.each(function(index, row) {
                var dataItem = grid.dataItem(row);
                if(dataItem.defaultYn == "Y") {
                    valid = false;
                    return false;
                }
            });

            if(!valid){
                //디폴트로 설정된 메세지 템플릿은 삭제 할 수 없습니다.
                dms.notification.info("<spring:message code='cmm.err.delete.defaultMessageTemplate'/>");
                return;
            }

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    //버튼 - 메세지 템플릿 취소
    $("#btnCancelTmpl").kendoButton({
        click:function(e) {
            $('#mesgTmplGrid').data('kendoExtGrid').cancelChanges();
        }
    });
    
    //조회조건 메세지템플릿그룹구분
    $("#sMesgTmplGrpTp").kendoExtDropDownList({
        dataSource:mesgTmplGrpTpList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,optionLabel:" "
        ,index:0
    });

    //조회조건 사용여부
    $("#sUseYn").kendoExtDropDownList({
        dataSource:['', 'Y','N']
        ,autoBind:false
        ,index:0
    });

    //메세지 템플릿그룹 그리드
    $("#mesgTmplGrpGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/tmp/messageTemplate/selectMessageTemplateGroups.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sMesgTmplGrpTp"] = $("#sMesgTmplGrpTp").data("kendoExtDropDownList").value();
                        params["sMesgTmplGrpId"] = $("#sMesgTmplGrpId").val();
                        params["sMesgTmplGrpNm"] = $("#sMesgTmplGrpNm").val();
                        params["sUseYn"] = $("#sUseYn").data("kendoExtDropDownList").value();

                        return kendo.stringify(params);
                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"mesgTmplGrpId"
                    ,fields:{
                        mesgTmplGrpTp:{type:"string"}
                        ,mesgTmplGrpId:{type:"string"}
                        ,mesgTmplGrpNm:{type:"string"}
                        ,useYn:{type:"string"}
                    }
                }
            }
        }
        ,dataBinding:function(e) {
            lastSelectedTmplGrpId = "";
            $("#mesgTmplGrid").data("kendoExtGrid").dataSource.data([]);
        }
        ,selectable:"row"
        ,editableOnlyNew:true
        ,editableOnlyNewExcludeColumns:["mesgTmplGrpTp","mesgTmplGrpNm","useYn"]
        ,appendEmptyColumn:true
        ,columns:[
            {field:"mesgTmplGrpId", title:"<spring:message code='global.lbl.mesgTmplGrpId' />", width:150, attributes:{"class":"ac"}}
            ,{field:"mesgTmplGrpTp", title:"<spring:message code='global.lbl.mesgTmplGrpTp' />", width:150, attributes:{"class":"ac"}
                ,template:"# if(mesgTmplGrpTpMap[mesgTmplGrpTp] != null) { # #= mesgTmplGrpTpMap[mesgTmplGrpTp].cmmCdNm# # }#"
                ,editor:function(container, options) {
                    $('<input required name="mesgTmplGrpTp" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataSource:dms.data.cmmCdFilter(mesgTmplGrpTpList)
                        ,dataValueField:"cmmCd"
                        ,dataTextField:"cmmCdNm"
                        ,optionLabel:" "
                    });
                    $('<span class="k-invalid-msg" data-for="mesgTmplGrpTp"></span>').appendTo(container);
                }
                ,filterable:{
	                cell:{
	                    showOperators:false
	                    ,template: function (e) {
	                        e.element.kendoExtDropDownList({
	                            dataSource:mesgTmplGrpTpList
	                            ,dataTextField:"cmmCdNm"
	                            ,dataValueField:"cmmCd"
	                            ,valuePrimitive:true
	                            ,optionLabel:" "
	                        });
	                    }
	                }
	        	}
            }
            ,{field:"mesgTmplGrpNm", title:"<spring:message code='global.lbl.mesgTmplGrpNm' />", width:400 }
            ,{field:"useYn", title:"<spring:message code='global.lbl.useYn' />", width:80, attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    $('<input required name="useYn" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:true
                        ,dataSource:['Y','N']
                        ,index:0
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
        ]
        ,change:function(e){
            var dataItem = this.dataItem(this.select());

            if (dataItem.mesgTmplGrpId !== lastSelectedTmplGrpId) {
                lastSelectedTmplGrpId = dataItem.mesgTmplGrpId;
                if (dataItem.isNew()) {
                    $("#mesgTmplGrid").data("kendoExtGrid").dataSource.data([]);
                } else {
                    $("#mesgTmplGrid").data("kendoExtGrid").dataSource.read();
                }
            }
         }
    });

    //메세지 템플릿 그리드
    $("#mesgTmplGrid").kendoExtGrid({
      dataSource:{
           transport:{
              read:{
                  url:"<c:url value='/cmm/tmp/messageTemplate/selectMessageTemplates.do' />"
              }
              ,parameterMap:function(options, operation) {
                  if (operation === "read") {
                      var params = {};
                      
                      params["sort"] = options.sort;

                      var grid = $('#mesgTmplGrpGrid').data('kendoExtGrid');
                      var selectedItem = grid.dataItem(grid.select());

                      params["sMesgTmplGrpId"] = selectedItem.mesgTmplGrpId;

                      return kendo.stringify(params);
                  } else if (operation !== "read" && options.models) {
                      return kendo.stringify(options.models);
                  }
              }
          }
          ,schema:{
              model:{
                  id:"mesgTmplNo"
                  ,fields:{
                      mesgTmplNo:{type:"number", editable:false}
                      ,mesgTmplGrpId:{type:"string", editable:false}
                      ,mesgTmplGrpNm:{type:"string", editable:false}
                      ,mesgTmplTp:{type:"string", validation:{required:true}}
                      ,mesgTmplNm:{type:"string", validation:{required:true}}
                      ,mesgTmplCont:{type:"string", validation:{required:true}}
                      ,defaultYn:{type:"string", validation:{required:true}}
                      ,useYn:{type:"string", validation:{required:true}}
                  }
              }
          }
      }
      ,multiSelectWithCheckbox:true
      ,editableOnlyNew:true
      ,editableOnlyNewExcludeColumns:["mesgTmplNm","defaultYn","useYn"]
      ,appendEmptyColumn:true
      ,autoBind:false
      ,pageable:false
      ,height:250
      ,edit:function(e){
          if(e.model.defaultYn == "Y"){
              var fieldName = e.container.find("input[name][data-bind]").attr("name");
              if(fieldName == "defaultYn" || fieldName == "useYn"){
                  this.closeCell();
              }
          }
      }
      ,columns:[
    	  {field:"mesgTmplGrpId", title:"<spring:message code='global.lbl.mesgTmplGrpId' />", width:150, sortable:false, attributes:{"class":"ac"}}
          ,{field:"mesgTmplGrpNm", title:"<spring:message code='global.lbl.mesgTmplGrpNm' />", width:400, sortable:false}
          ,{field:"mesgTmplTp", title:"<spring:message code='global.lbl.mesgTmplTp' />", width:100, attributes:{"class":"ac"}
              ,template:"# if(mesgTmplTpMap[mesgTmplTp] != null) { # #= mesgTmplTpMap[mesgTmplTp].cmmCdNm# # }#"
           	  ,filterable:{
                  cell:{
                      showOperators:false
                      ,template: function (e) {
                          e.element.kendoExtDropDownList({
                              dataSource:mesgTmplTpList
                              ,dataTextField:"cmmCdNm"
                              ,dataValueField:"cmmCd"
                              ,valuePrimitive:true
                              ,optionLabel:" "
                          });
                      }
                  }
       		  }
          }
          ,{field:"mesgTmplNm", title:"<spring:message code='global.lbl.mesgTmplNm' />", width :300}
          ,{field:"defaultYn", title:"<spring:message code='global.lbl.defaultYn' />", width:80, attributes:{"class":"ac"}
              ,editor:function(container, options) {
                  $('<input required name="defaultYn" data-bind="value:' + options.field + '" data-uid="' + options.model.uid + '" />')
                  .appendTo(container)
                  .kendoExtDropDownList({
                      autoBind:true
                      ,dataSource:['Y','N']
                      ,index:0
                      ,change:function(e){
                          var val = this.value();
                          var uid = $(this.element).data("uid");
                          var mesgTmplGrid = $("#mesgTmplGrid").data("kendoExtGrid");
                          var dataItem = mesgTmplGrid.dataSource.getByUid(uid);

                          //기본여부를 'Y'로 변경하면 메세지템플릿 번호가 같지않고 메세지템플릿 유형이 같으면서 기본여부가 'Y'인 목록을 'N'로 변경한다.
                          if(val == "Y"){
                              $.each(mesgTmplGrid.dataSource.data(), function(idx, obj){
                                  if(obj.defaultYn == "Y"
                                          && obj.mesgTmplNo != dataItem.mesgTmplNo
                                          && obj.mesgTmplTp == dataItem.mesgTmplTp){
                                      obj.set("defaultYn","N");
                                  }
                              });

                              dataItem.set("useYn", "Y");
                              mesgTmplGrid.refresh();
                          }
                      }
                  });
                  $('<span class="k-invalid-msg" data-for="defaultYn"></span>').appendTo(container);
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
                  $('<input required name="useYn" data-bind="value:' + options.field + '" data-uid="' + options.model.uid + '" />')
                  .appendTo(container)
                  .kendoExtDropDownList({
                      autoBind:true
                      ,dataSource:['Y','N']
                      ,index:0
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
      ]
    });
});
</script>