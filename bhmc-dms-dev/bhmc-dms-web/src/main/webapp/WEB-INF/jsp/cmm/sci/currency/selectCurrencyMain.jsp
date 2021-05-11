<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 통화코드 관리 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="cmm.title.currencyMng" /></h1>
        <div class="btn_right">
	        <dms:access viewId="VIEW-D-10833" hasPermission="${dms:getPermissionMask('READ')}">
	            <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
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
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.currencyCd" /></th>
                    <td>
                        <input id="sCurrencyCd" type="text" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.currencyNm" /></th>
                    <td>
                        <input id="sCurrencyNm" type="text" class="form_input" >
                    </td>
                    <th scope="row"><spring:message code="global.lbl.exrTargYn" /></th>
                    <td>
                        <input id="sExrTargYn" type="text" class="form_comboBox">
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
        	<dms:access viewId="VIEW-D-10834" hasPermission="${dms:getPermissionMask('READ')}">
	            <button type="button" class="btn_s" id="btnSave"><spring:message code="global.btn.save" /><!-- 저장 --></button>
			</dms:access>
	        <dms:access viewId="VIEW-D-10836" hasPermission="${dms:getPermissionMask('READ')}">
	            <button type="button" class="btn_s" id="btnAdd"><spring:message code="global.btn.rowAdd" /><!-- 행추가 --></button>
			</dms:access>
			<dms:access viewId="VIEW-D-10837" hasPermission="${dms:getPermissionMask('READ')}">
	            <button type="button" class="btn_s" id="btnDel"><spring:message code="global.btn.rowDel" /><!-- 행삭제 --></button>
			</dms:access>
			<dms:access viewId="VIEW-D-10835" hasPermission="${dms:getPermissionMask('READ')}">
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
</section>
</div>

<script type="text/javascript">
$(document).ready(function() {
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
                    url:"<c:url value='/cmm/sci/currency/multiCurrencies.do' />",
                    data:JSON.stringify(saveData),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
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
    
    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 추가
    $("#btnAdd").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.insert(0, {
                "currencyCd":""
                ,"currencySym":""
                ,"symbolPosTp":"P"
                ,"exrUnitAmt":0
                ,"currencyNm":""
                ,"fractionCnt":0
                ,"numberSym":","
                ,"decimalSym":"."
                ,"exrTargYn":"N"
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

    //취소
    $("#btnCancel").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').cancelChanges();
        }
    });
    
  	//조회조건 - 환율관리대상여부
    $("#sExrTargYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
        ,index:0
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/sci/currency/selectCurrencies.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sCurrencyCd"] = $("#sCurrencyCd").val();
                        params["sCurrencyNm"] = $("#sCurrencyNm").val();
                        params["sExrTargYn"] = $("#sExrTargYn").val();

                        return kendo.stringify(params);
                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"currencyCd"
                    ,fields:{
                        rnum:{type:"number", editable:false}
                        ,currencyCd:{type:"string", validation:{required:true}}
                        ,currencySym:{type:"string", validation:{required:true}}
                        ,currencyNm:{type:"string", validation:{required:true}}
                        ,symbolPosTp:{type:"string", validation:{required:true, pattern:"[P|S]"}}
                        ,exrUnitAmt:{type:"number", validation:{required:true, min:0}}
                        ,fractionCnt:{type:"number", validation:{required:true, min:0}}
                        ,numberSym:{type:"string", validation:{required:true}}
                        ,decimalSym:{type:"string", validation:{required:true}}
                        ,exrTargYn:{type:"string", validation:{required:true, pattern:"[Y|N]"}}
                    }
                }
            }
        }
        ,edit:function(e) {
            e.container.find("input[name=currencyCd]").attr("maxlength", 10);
            e.container.find("input[name=currencySym]").attr("maxlength", 10);
            e.container.find("input[name=currencyNm]").attr("maxlength", 50);
            e.container.find("input[name=numberSym]").attr("maxlength", 1);
            e.container.find("input[name=decimalSym]").attr("maxlength", 1);
        }
        ,multiSelectWithCheckbox:true
        ,appendEmptyColumn:true
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, filterable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"currencyCd", title:"<spring:message code='global.lbl.currencyCd' />", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"currencySym", title:"<spring:message code='global.lbl.currencySym' />", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"currencyNm", title:"<spring:message code='global.lbl.currencyNm' />", width:180}
            ,{field:"symbolPosTp", title:"<spring:message code='global.lbl.symbolPosTp' />", width:120
                ,attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    $('<input required name="symbolPosTp" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataSource:["P", "S"]
                    });
                    $('<span class="k-invalid-msg" data-for="symbolPosTp"></span>').appendTo(container);
                }
                ,filterable:{
	                cell:{
	                    showOperators:false
	                    ,template: function (e) {
	                        e.element.kendoExtDropDownList({
	                            dataSource:["", "P", "S"]
	                            ,valuePrimitive:true
	                        });
	                    }
	                }
	        	}
            }
            ,{field:"exrUnitAmt", title:"<spring:message code='global.lbl.exrUnitAmt' />", width:120
                ,format:"{0:n0}"
                ,attributes:{"class":"ar"}
            }
            ,{field:"fractionCnt", title:"<spring:message code='global.lbl.fractionCnt' />", width:120
                ,format:"{0:n0}"
                ,attributes:{"class":"ar"}
            }
            ,{field:"numberSym", title:"<spring:message code='global.lbl.numberSym' />", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"decimalSym", title:"<spring:message code='global.lbl.decimalSym' />", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"exrTargYn", title:"<spring:message code='global.lbl.exrTargYn' />", width:150
                ,attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    $('<input required name="exrTargYn" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataSource:["Y","N"]
                    });
                    $('<span class="k-invalid-msg" data-for="exrTargYn"></span>').appendTo(container);
                }
                ,filterable:{
	                cell:{
	                    showOperators:false
	                    ,template: function (e) {
	                        e.element.kendoExtDropDownList({
	                            dataSource:["", "Y", "N"]
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