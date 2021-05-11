<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 게시판 관리 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="global.title.boardMng" /></h1>
        <div class="btn_right">
	        <dms:access viewId="VIEW-D-10907" hasPermission="${dms:getPermissionMask('READ')}">
	            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
	        </dms:access>
	        <dms:access viewId="VIEW-D-10908" hasPermission="${dms:getPermissionMask('READ')}">
	            <button class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /><!-- 저장 --></button>
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
                    <th scope="row"><spring:message code='cmm.lbl.bbsNm' /></th>
                    <td>
                        <input type="text" id="sBbsNm" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.useYn' /></th>
                    <td>
                        <input type="text" id="sUseYn" class="form_comboBox" style="width:100%" />
                    </td>
                    <th scope="row"></th>
                    <td></td>
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
    		<dms:access viewId="VIEW-D-10909" hasPermission="${dms:getPermissionMask('READ')}">
	            <button class="btn_s" id="btnAdd"><spring:message code="global.btn.rowAdd" /><!-- 추가 --></button>
	        </dms:access>
	        <dms:access viewId="VIEW-D-10910" hasPermission="${dms:getPermissionMask('READ')}">
	            <button class="btn_s" id="btnDel"><spring:message code="global.btn.rowDel" /><!-- 삭제 --></button>
	        </dms:access>
	        <dms:access viewId="VIEW-D-10911" hasPermission="${dms:getPermissionMask('READ')}">
	            <button class="btn_s" id="btnCancel"><spring:message code="global.btn.cancel" /><!-- 취소 --></button>
	        </dms:access>
        </div>
    </div>
    <!-- 그리드 기능 버튼 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid">
        <div id="grid" class="resizable_grid"></div>
    </div>
    <!-- 그리드 종료 -->
</section>
</div>

<script type="text/javascript">
var repTp = [{"repCd":"", "repNm":""}];
repTp.push({"repCd":"1", "repNm":"<spring:message code='global.lbl.genInfo'/>"});
repTp.push({"repCd":"2", "repNm":"<spring:message code='global.lbl.tree'/>"});
var repTpMap = dms.data.arrayToMap(repTp, function(obj){ return obj.repCd; });

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
                    url:"<c:url value='/cmm/bbs/boardMaster/multiBoardMaster.do' />",
                    data:JSON.stringify(saveData),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR, status, error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    },
                    success:function(jqXHR, textStatus) {
                        grid.dataSource._destroyed = [];
                        grid.dataSource.page(1);

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });
            }
            else {
                //입력값을 확인하여 주십시오.
                dms.notification.warning("<spring:message code='global.info.check.input'/>");
            }
        }
    });

    //버튼 - 행추가
    $("#btnAdd").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.insert(0);
        }
    });

    //버튼 - 행삭제
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
	
    //조회조건 - 사용여부
    $("#sUseYn").kendoExtDropDownList({
        autoBind:false,
        dataSource:["", "Y", "N"]
    });

    // 그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/bbs/boardMaster/selectBoardMaster.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sBbsNm"] = $("#sBbsNm").val();
                        params["sUseYn"] = $("#sUseYn").val();

                        return kendo.stringify(params);
                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"bbsId"
                    ,fields:{
                        rnum:{type:"string", editable:false}
                        ,bbsId:{type:"string"}
                        ,bbsNm:{type:"string", validation:{required:true}}
                        ,useYn:{type:"string", validation:{required:true, pattern:"[Y|N]"}}
                        ,repTp:{type:"string", validation:{required:true}}
                        ,cmntUseYn:{type:"string", validation:{required:true, pattern:"[Y|N]"}}
                        ,fileCnt:{type:"number", validation:{required:true, min:0}}
                        ,fileMaxSizeVal:{type:"number", validation:{required:true, min:0}}
                        ,usrNm:{type:"string", editable:false}
                        ,regUsrId:{type:"string", editable:false}
                        ,regDt:{type:"string", editable:false}
                    }
                }
            }
        }
        ,edit:function(e) {
            e.container.find("input[name=bbsNm]").attr("maxlength", 255);
            e.container.find("input[name=fileCnt]").attr("maxlength", 10);
            e.container.find("input[name=fileMaxSizeVal]").attr("maxlength", 10);
        }
        ,multiSelectWithCheckbox:true
        ,editableOnlyNew:true
        ,editableOnlyNewExcludeColumns:["bbsNm", "useYn", "repTp", "cmntUseYn", "fileCnt", "fileMaxSizeVal"]
        ,appendEmptyColumn:true
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, attributes:{"class":"ac"}}
          ,{field:"bbsId", title:"<spring:message code='global.lbl.bbsId' />", width:150, attributes:{"class":"ac"}}
          ,{field:"bbsNm", title:"<spring:message code='cmm.lbl.bbsNm' />", width:250}
          ,{field:"useYn", title:"<spring:message code='global.lbl.useYn' />", width:120, attributes:{"class":"ac"}
              ,editor:function(container, options) {
                  $('<input required name="useYn" data-bind="value:' + options.field + '"/>')
                  .appendTo(container)
                  .kendoExtDropDownList({
                      autoBind:false
                      ,dataSource:["Y", "N"]
                  });

                  $('<span class="k-invalid-msg" data-for="useYn"></span>').appendTo(container);
              }
          }
          ,{field:"repTp", title:"<spring:message code='cmm.lbl.repTp' />", width:120, attributes:{"class":"ac"}
              ,template:"# if(repTpMap[repTp] != null) { # #= repTpMap[repTp].repNm# # }#"
              ,editor:function(container, options) {
                  $('<input required name="repTp" data-bind="value:' + options.field + '"/>')
                  .appendTo(container)
                  .kendoExtDropDownList({
                      autoBind:false
                    ,dataSource:repTp
                    ,dataTextField:"repNm"
                    ,dataValueField:"repCd"
                    ,index:0
                  });

                  $('<span class="k-invalid-msg" data-for="repTp"></span>').appendTo(container);
              }
          }
          ,{field:"cmntUseYn", title:"<spring:message code='cmm.lbl.cmntUseYn' />", width:120, attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    $('<input required name="cmntUseYn" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                      ,dataSource:["Y", "N"]
                    });

                    $('<span class="k-invalid-msg" data-for="cmntUseYn"></span>').appendTo(container);
                }
            }
            ,{field:"fileCnt", title:"<spring:message code='global.lbl.fileCnt' />", width:120, format:"{0:n0}", attributes:{"class":"ar"}}
            ,{field:"fileMaxSizeVal", title:"<spring:message code='global.lbl.fileMaxSizeVal' />", width:120, format:"{0:n0}", attributes:{"class":"ar"}}
            ,{field:"usrNm", title:"<spring:message code='global.lbl.wrtrNm' />", width:120, attributes:{"class":"ac"}}
            ,{field:"regDt", title:"<spring:message code='global.lbl.wrtrDt' />", width:150, attributes:{"class":"ac"}}
        ]
    });
});
</script>