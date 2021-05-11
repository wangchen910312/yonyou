<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 결재 양식 그룹 -->
<div id="resizableContainer">
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="cmm.title.signMain" /></h1>
        <div class="btn_right">
			<dms:access viewId="VIEW-D-11420" hasPermission="${dms:getPermissionMask('READ')}">
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
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.signDocNm' /></th>
                    <td>
                        <input id="sSignDocNm" type="text" class="form_input" />
                    </td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- 결재 양식 그룹 그리드 기능버튼 -->
    <div class="header_area">
        <div class="btn_right">
			<dms:access viewId="VIEW-D-11421" hasPermission="${dms:getPermissionMask('READ')}">
	            <button class="btn_s btn_add" id="btnAdd"><spring:message code='global.title.signWrite' /><!-- 기안문작성 --></button>
			</dms:access>
        </div>
    </div>

    <div class="table_grid">
        <div id="grid" class="resizable_grid"></div>
    </div>
</section>
</div>

<script type="text/javascript">
//기안문작성 팝업화면에서 결재선 변경 팝업
function changeSignLine(signLineGrid){
    var signLines = signLineGrid.dataSource.data();

    dms.window.popup({
        windowId:"changeSignLinePopupWin"
        ,title:"<spring:message code='global.title.signLineChange' />"
        ,modal:true
        ,content:{
            url:"<c:url value='/cmm/apr/sign/selectChangeSignLinePopup.do' />"
            ,data:{
                 "signLines":JSON.stringify({"total":signLines.length, "data":signLines})
                ,"callbackFunc":function(data){
                    signLineGrid.dataSource.data([]);

                    for (var i = 0; i < data.length; i++) {
                        signLineGrid.dataSource.insert(i, {
                            "signDocLineNo":(i + 1)
                            ,"signTp":data[i].signTp
                            ,"lastSignYn":data[i].lastSignYn
                            ,"signUsrId":data[i].signUsrId
                            ,"signUsrNm":data[i].signUsrNm
                        });
                    }
                }
            }
        }
    });
}

$(document).ready(function() {
    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 기안문 작성
    $("#btnAdd").kendoButton({
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var row = grid.select();

            if (row.length < 1) {
                //결재양식을 선택해 주세요
                dms.notification.warning("<spring:message code='global.info.checkSignDocId' />");
                return;
            }

            dms.window.popup({
                windowId:"signWritePopupWin"
                ,title:"<spring:message code='global.title.signWrite' />"
                ,content:{
                    url:"<c:url value='/cmm/apr/sign/selectSignWritePopup.do?signDocId="+grid.dataItem(row).signDocId+"'/>"
                }
            });
        }
    });

    //결재양식 그리드
    $("#grid").kendoExtGrid({
        gridId:"G-CMM-0106-083401"
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

                        params["sSignDocNm"] = $("#sSignDocNm").val();

                        return kendo.stringify(params);
                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"signDocId"
                    ,fields:{
                         signDocId:{type:"string", editable:true}
                        ,signDocNm:{type:"string", editable:true}
                    }
                }
            }
        }
        ,appendEmptyColumn:true
        ,selectable:"row"
        ,editable:false
        ,indvColumnVisible:false
        ,indvColumnReorderable:false
        ,columns:[
            {field:"signDocId", title:"<spring:message code='global.lbl.signDocId' />", width:150, attributes:{"class":"ac"}}
            ,{field:"signDocNm", title:"<spring:message code='global.lbl.signDocNm' />", width:600 }
        ]
    });
});
</script>