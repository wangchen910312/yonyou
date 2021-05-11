<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 공통코드 그룹 -->
<div id="resizableContainer">
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="cmm.title.cmmGrpMgr" /></h1>
        <div class="btn_right">
	        <dms:access viewId="VIEW-D-10850" hasPermission="${dms:getPermissionMask('READ')}">
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
                <tr><!-- 공통코드 그룹 코드 -->
                    <th scope="row"><spring:message code='global.lbl.cmmGrpCd' /></th>
                    <td>
                        <input id="sCmmGrpCd" type="text" class="form_input" />
                    </td>
                    <!-- 공통코드 그룹 명 -->
                    <th scope="row"><spring:message code='global.lbl.cmmGrpCdNm' /></th>
                    <td>
                        <input id="sCmmGrpCdNm" type="text" class="form_input" />
                    </td>
                    <!-- 시스템코드여부 -->
                    <th scope="row"><spring:message code='global.lbl.sysCdYn' /></th>
                    <td>
                        <input id="sSysCdYn" type="text" class="form_comboBox" />
                    </td>
                    <!-- 사용여부 -->
                    <th scope="row"><spring:message code='global.lbl.useYn' /></th>
                    <td>
                        <input id="sUseYn" type="text" class="form_comboBox" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- 공통코드 그룹 그리드 기능버튼 -->
    <div class="header_area">
        <h2 class="title_basic"><spring:message code='cmm.title.cmmGrp' /></h2>
    </div>
    <!-- //공통코드 그룹 그리드 기능버튼 -->

    <!-- 공통코드 그룹 그리드 -->
    <div class="table_grid">
        <div id="groupGrid"></div>
    </div>
    <!-- //공통코드 그룹 그리드 -->

    <!-- 공통코드 그리드 기능버튼 -->
    <div class="header_area">
        <h2 class="title_basic"><spring:message code='cmm.title.cmmCdMng' /></h2>
        <div class="btn_right">
	        <dms:access viewId="VIEW-D-10851" hasPermission="${dms:getPermissionMask('READ')}">
	            <button type="button" class="btn_s" id="btnSaveCode"><spring:message code='global.btn.save' /><!-- 저장 --></button>
			</dms:access>
			<dms:access viewId="VIEW-D-10852" hasPermission="${dms:getPermissionMask('READ')}">
	            <button type="button" class="btn_s" id="btnAddCode"><spring:message code='global.btn.rowAdd' /><!-- 행추가 --></button>
			</dms:access>
			<dms:access viewId="VIEW-D-10853" hasPermission="${dms:getPermissionMask('READ')}">
	            <button type="button" class="btn_s" id="btnDelCode"><spring:message code='global.btn.rowDel' /><!-- 행삭제 --></button>
			</dms:access>
			<dms:access viewId="VIEW-D-10854" hasPermission="${dms:getPermissionMask('READ')}">
	            <button type="button" class="btn_s" id="btnCancelCode"><spring:message code='global.btn.cancel' /><!-- 취소 --></button>
			</dms:access>
        </div>
    </div>
    <!-- //공통코드 그리드 기능버튼 -->

    <!-- 공통코드 그리드 -->
    <div class="table_grid">
        <div id="codeGrid" class="resizable_grid"></div>
    </div>
    <!-- //공통코드 그리드 -->
</section>
</div>

<script type="text/javascript">
//공통코드그룹 선택코드
var lastSelectedCmmGrpCd = "";
var sysCdYn = "";

//공통코드 언어설정 설정 팝업
var cmmCdTextPopupWin;
function cmmCdTextPopup(cmmGrpCd,cmmCd) {
    if(sysCdYn != "N"){
        return;
    }

    cmmCdTextPopupWin = dms.window.popup({
        windowId:"cmmGrpTextPopupWin"
        ,title:"<spring:message code='cmm.title.cmmCdLang' />"
        ,content:{
            url:"<c:url value='/cmm/sci/commonCode/selectCommonCodeTxtPopup.do' />"
            , data:{
                "autoBind":true
                ,"cmmGrpCd":cmmGrpCd
                ,"cmmCd":cmmCd
                ,"selectable":"multiple"
                ,"callbackFunc":function(data){
                    dms.notification.info(JSON.stringify(data));
                }
            }
        }
    });
}

$(document).ready(function() {
    //버튼 - 공통코드그룹 조회
    $("#btnSearchGroup").kendoButton({
        click:function(e) {
            $('#groupGrid').data('kendoExtGrid').dataSource.page(1);
            $("#btnAddCode").data("kendoButton").enable(false);
            $("#btnDelCode").data("kendoButton").enable(false);
            $("#btnSaveCode").data("kendoButton").enable(false);
            $("#btnCancelCode").data("kendoButton").enable(false);
        }
    });

    //버튼 - 공통코드 저장
    $("#btnSaveCode").kendoButton({
        enable:false
        ,click:function(e) {
            var grid = $("#codeGrid").data("kendoExtGrid");

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/cmm/sci/commonCode/multiCommonCodes.do' />"
                    ,data:JSON.stringify(saveData)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
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

    //버튼 - 공통코드 추가
    $("#btnAddCode").kendoButton({
        enable:false
        ,click:function(e) {
        	var grid = $('#groupGrid').data('kendoExtGrid');
          	var selectedItem = grid.dataItem(grid.select());

          	if(selectedItem!=null) {
            	var cmmGrpCd = selectedItem.cmmGrpCd;
              	var cmmGrpCdNm = selectedItem.cmmGrpCdNm;
              	if(cmmGrpCd!="") {
                  	$('#codeGrid').data('kendoExtGrid').dataSource.insert(0, {
                      	"cmmGrpCd":cmmGrpCd
                      	,"cmmGrpCdNm":cmmGrpCdNm
                      	,"cmmCd":""
                      	,"cmmCdNm":""
                      	,"cmmCdNmLang":""
                  	});
              	}
          	} else {
              	//공통코드 그룹을 먼저 선택해 주십시오.
              	dms.notification.success("<spring:message code='global.lbl.cmmGrpCdNm' var='cmmGrpCdNmMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${cmmGrpCdNmMsg}' />");
          	}
        }
    });

    //버튼 - 공통코드 삭제
    $("#btnDelCode").kendoButton({
        enable:false
        ,click:function(e) {
            var grid = $("#codeGrid").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    //취소 - 공통코드 취소
    $("#btnCancelCode").kendoButton({
        enable:false
        ,click:function(e) {
            $('#codeGrid').data('kendoExtGrid').cancelChanges();
        }
    });

    //조회조건 - 시스템코드여부
    $("#sSysCdYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
    });

    //조회조건 - 사용여부
    $("#sUseYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
    }).data("kendoExtDropDownList").select(1);

    //공통코드그룹 그리드
    $("#groupGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/sci/commonCode/selectCommonCodeGroups.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sCmmGrpCd"] = $("#sCmmGrpCd").val();
                        params["sCmmGrpCdNm"] = $("#sCmmGrpCdNm").val();
                        params["sSysCdYn"] = $("#sSysCdYn").data("kendoExtDropDownList").value();
                        params["sUseYn"] = $("#sUseYn").data("kendoExtDropDownList").value();

                        return kendo.stringify(params);
                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"cmmGrpCd"
                    ,fields:{
                        cmmGrpCd:{type:"string", editable:true}
                        ,cmmGrpCdNm:{type:"string", editable:true}
                        ,sysCdYn:{type:"string", editable:true}
                        ,useYn:{type:"string", editable:true}
                        ,remark:{type:"string", editable:true}
                        ,remarkTitleNm:{type:"string", editable:true}
                        ,remarkTitleLang:{type:"string", editable:true}
                    }
                }
            }
        }
        ,dataBinding:function(e) {
            lastSelectedCmmGrpCd = "";
            sysCdYn = "";
            $("#codeGrid").data("kendoExtGrid").dataSource.data([]);
        }
        ,height:300
        ,selectable:"row"
        ,editable:false
        ,columns:[
            {field:"cmmGrpCd", title:"<spring:message code='global.lbl.cmmGrpCd' />", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"cmmGrpCdNm", title:"<spring:message code='global.lbl.cmmGrpCdNm' />", width:350
                ,template:"#=cmmGrpCdNm#[#=cmmGrpCdNmLang#]"
            }
            ,{field:"sysCdYn", title:"<spring:message code='global.lbl.sysCdYn' />", width:120
                ,attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    $('<input required name="sysCdYn" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false,
                        dataSource:['Y','N'],
                        index:0
                    });
                    $('<span class="k-invalid-msg" data-for="sysCdYn"></span>').appendTo(container);
                }
                ,filterable:{
	                cell:{
	                    showOperators:false
	                    ,template: function (e) {
	                        e.element.kendoExtDropDownList({
	                            dataSource:["","Y","N"]
	                            ,valuePrimitive:true
	                        });
	                    }
	                }
	        	}
            }
            ,{field:"useYn", title:"<spring:message code='global.lbl.useYn' />", width:120
                ,attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    $('<input required name="useYn" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false,
                        dataSource:['Y','N'],
                        index:0
                    });
                    $('<span class="k-invalid-msg" data-for="useYn"></span>').appendTo(container);
                }
                ,filterable:{
	                cell:{
	                    showOperators:false
	                    ,template: function (e) {
	                        e.element.kendoExtDropDownList({
	                            dataSource:["","Y","N"]
	                            ,valuePrimitive:true
	                        });
	                    }
	                }
	        	}
            }
            ,{field:"remark", title:"<spring:message code='global.lbl.remark' />", width:300 }
            ,{field:"remarkTitleNm", title:"<spring:message code='cmm.lbl.remarkTitleNm' />" }
        ]
        ,change:function(e){
            var dataItem = this.dataItem(this.select());

            if (dataItem.cmmGrpCd !== lastSelectedCmmGrpCd) {
                lastSelectedCmmGrpCd = dataItem.cmmGrpCd;
                sysCdYn = dataItem.sysCdYn;

                //시스템코드 여부 에따라 버튼을 활성화/비활성화 한다.
                if(sysCdYn == "Y"){
                    $("#btnAddCode").data("kendoButton").enable(false);
                    $("#btnDelCode").data("kendoButton").enable(false);
                    $("#btnSaveCode").data("kendoButton").enable(false);
                    $("#btnCancelCode").data("kendoButton").enable(false);
                }else{
                    $("#btnAddCode").data("kendoButton").enable(true);
                    $("#btnDelCode").data("kendoButton").enable(true);
                    $("#btnSaveCode").data("kendoButton").enable(true);
                    $("#btnCancelCode").data("kendoButton").enable(true);
                }

                var remarkTitleNm = dms.string.defaultString(dataItem.remarkTitleLang, dataItem.remarkTitleNm);
                var remarkTitle = {
                    "remark1":"remark1"
                    ,"remark2":"remark2"
                    ,"remark3":"remark3"
                    ,"remark4":"remark4"
                    ,"remark5":"remark5"
                    ,"remark6":"remark6"
                    ,"remark7":"remark7"
                    ,"remark8":"remark8"
                    ,"remark9":"remark9"
                    ,"remark10":"remark10"
                }

                if(!dms.string.isEmpty(remarkTitleNm)){
                    $.each(remarkTitleNm.split(","), function(idx, val){
                        remarkTitle["remark"+(idx+1)] = dms.string.trim(val);
                    });
                }

                $("#codeGrid").data("kendoExtGrid").setColumnHeaderText(remarkTitle);

                if (dataItem.isNew()) {
                    $("#codeGrid").data("kendoExtGrid").dataSource.data([]);
                } else {
                    $("#codeGrid").data("kendoExtGrid").dataSource.read();
                }
            }
         }
    });

    //공통코드 그리드
    $("#codeGrid").kendoExtGrid({
      dataSource:{
           transport:{
              read:{
                  url:"<c:url value='/cmm/sci/commonCode/selectCommonCodes.do' />"
              }
              ,parameterMap:function(options, operation) {
                  if (operation === "read") {
                      var params = {};

                      params["recordCountPerPage"] = options.pageSize;
                      params["pageIndex"] = options.page;
                      params["firstIndex"] = options.skip;
                      params["lastIndex"] = options.skip + options.take;
                      params["sort"] = options.sort;

                      var grid = $('#groupGrid').data('kendoExtGrid');
                      var selectedItem = grid.dataItem(grid.select());
                      var cmmGrpCd = "";
                      if(selectedItem!=null)  {
                          var cmmGrpCd = selectedItem.cmmGrpCd;
                          var cmmGrpCdNm = selectedItem.cmmGrpCdNm;
                      }

                      params["sCmmGrpCd"] = cmmGrpCd;

                      return kendo.stringify(params);
                  } else if (operation !== "read" && options.models) {
                      return kendo.stringify(options.models);
                  }
              }
          }
          ,schema:{
              model:{
                  id:"cmmCd"
                  ,fields:{
                      cmmGrpCd:{type:"string", editable:false}
                      ,cmmGrpCdNm:{type:"string", editable:false}
                      ,cmmCd:{type:"string", validation:{required:true}}
                      ,cmmCdNm:{type:"string", validation:{required:true}}
                      ,useYn:{type:"string", validation:{required:true}}
                      ,sortOrder:{type:"string", validation:{required:true}}
                      ,remark1:{type:"string", editable:true}
                      ,remark2:{type:"string", editable:true}
                      ,remark3:{type:"string", editable:true}
                      ,remark3:{type:"string", editable:true}
                      ,remark4:{type:"string", editable:true}
                      ,remark5:{type:"string", editable:true}
                      ,remark6:{type:"string", editable:true}
                      ,remark7:{type:"string", editable:true}
                      ,remark8:{type:"string", editable:true}
                      ,remark9:{type:"string", editable:true}
                      ,remark10:{type:"string", editable:true}
                  }
              }
          }
      }
      ,autoBind:false
      ,multiSelectWithCheckbox:true
      ,editableOnlyNew:true
      ,editableOnlyNewExcludeColumns:["cmmCdNm","sortOrder","useYn","remark1","remark2","remark3","remark4","remark5","remark6","remark7","remark8","remark9","remark10"]
      ,appendEmptyColumn:true
      ,edit:function(e){
          if(sysCdYn != "N"){
              this.closeCell();
          }
      }
      ,columns:[
          {title:"", width:80, sortable:false
              ,attributes:{"class":"ac"}
              ,template:"<span class='txt_label bg_yellow' onClick='cmmCdTextPopup(\"#=cmmGrpCd#\",\"#=cmmCd#\")'><spring:message code='global.lbl.set.lang' /></span>"
          }
          ,{field:"cmmGrpCd", title:"<spring:message code='global.lbl.cmmGrpCd' />", width:120, sortable:false
              ,attributes:{"class":"ac"}
          }
          ,{field:"cmmGrpCdNm", title:"<spring:message code='global.lbl.cmmGrpCdNm' />", width:250, sortable:false}
          ,{field:"cmmCd", title:"<spring:message code='global.lbl.cmmCd' />", width:100
              ,attributes:{"class":"ac"}
          }
          ,{field:"cmmCdNm", title:"<spring:message code='global.lbl.cmmCdNm' />", width :200
              ,template:"#=cmmCdNm#[#=cmmCdNmLang#]"
          }
          ,{field:"sortOrder", title:"<spring:message code='global.lbl.sortOrder' />", width:75
              ,attributes:{"class":"ac"}
          }
          ,{field:"useYn", title:"<spring:message code='global.lbl.useYn' />", width:75
              ,attributes:{"class":"ac"}
              ,editor:function(container, options) {
                  $('<input required name="useYn" data-bind="value:' + options.field + '"/>')
                  .appendTo(container)
                  .kendoExtDropDownList({
                      autoBind:true
                      ,dataSource:['Y','N']
                      ,index:0
                  });
                  $('<span class="k-invalid-msg" data-for="resourceTp"></span>').appendTo(container);
              }
              ,filterable:{
	                cell:{
	                    showOperators:false
	                    ,template: function (e) {
	                        e.element.kendoExtDropDownList({
	                            dataSource:["","Y","N"]
	                            ,valuePrimitive:true
	                        });
	                    }
	                }
	        	}
          }
          ,{field:"remark1", title:"<spring:message code='global.lbl.remark' />1", width:100}
          ,{field:"remark2", title:"<spring:message code='global.lbl.remark' />2", width:100}
          ,{field:"remark3", title:"<spring:message code='global.lbl.remark' />3", width:100}
          ,{field:"remark4", title:"<spring:message code='global.lbl.remark' />4", width:100}
          ,{field:"remark5", title:"<spring:message code='global.lbl.remark' />5", width:100}
          ,{field:"remark6", title:"<spring:message code='global.lbl.remark' />6", width:100}
          ,{field:"remark7", title:"<spring:message code='global.lbl.remark' />7", width:100}
          ,{field:"remark8", title:"<spring:message code='global.lbl.remark' />8", width:100}
          ,{field:"remark9", title:"<spring:message code='global.lbl.remark' />9", width:100}
          ,{field:"remark10", title:"<spring:message code='global.lbl.remark' />10", width:100}
      ]
    });
});
</script>