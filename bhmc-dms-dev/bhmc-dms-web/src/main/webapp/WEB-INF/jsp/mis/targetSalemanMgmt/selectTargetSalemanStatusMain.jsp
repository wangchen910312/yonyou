<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<%--
    JSP Name :selectTargetSalemanStatusMain.jsp
    Description :[딜러사] 판매고문 실적현황
    author chibeom.song
    since 2016. 10. 23.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2016.10.23.    chibeom.song     최초 생성
--%>
<!-- [딜러사] 판매고문 실적현황 -->
<div id="resizableContainer">
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="mis.title.targetsalemanstatus" /></h1>
        <div class="btn_right">
        <dms:access viewId="VIEW-D-10821" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_m btn_search" id="btnSalemanStatusSearch" name="btnSalemanStatusSearch"><spring:message code="global.btn.search" /></button>
		</dms:access>
        </div>
    </div>
    <div class="table_form">
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
                <col style="width:15%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="mis.lbl.searchYm" /></th>
                    <td>
                        <input type="text" id="sSalemanStatusYyMm" name="sSalemanStatusYyMm" value="" class="form_comboBox" style="width:150px;"><!-- 조회년월  -->
                    </td>
                    <th scope="row"></th>
                    <td></td>
                    <th scope="row"></th>
                    <td></td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="table_info table_info_v2 mt10">
    <!-- 그리드 시작 -->
        <div class="table_grid">
            <div id="grid" class="resizable_grid"></div>
        </div>
    <!-- 그리드 종료 -->
    </div>
</section>
</div>
<!-- script -->
<script type="text/javascript">

$(document).ready(function() {

    $("#sSalemanStatusYyMm").kendoDatePicker({
        value:"${sysdate}"
       ,start:"year"
       ,depth:"year"
       ,format:"yyyyMM"
    });

    $("#sSalemanStatusYyMm").kendoMaskedTextBox({
        mask:"######"
    });

    var now = new Date();

    function leadingZeros(n, digits) {
        var zero = '';
        n = n.toString();
        if (n.length < digits) {
            for (i = 0; i < digits - n.length; i++)
                zero += '0';
        }
        return zero + n;
    }

    $("#sSalemanStatusYyMm").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2));

    //버튼 - 조회
    $("#btnSalemanStatusSearch").kendoButton({
        click:function(e) {

            if($("#sSalemanStatusYyMm").val() == ''){
                alert("<spring:message code='global.info.required.select'/>");
                return;
            }

            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
        gridId:"G-MIS-1023-183635"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/mis/tss/selectTargetSalemanStatusGrid.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["sSalemanStatusYyMm"] = $("#sSalemanStatusYyMm").val();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"carlineCd"
                    ,fields:{
                         carlineCd:{type:"string"}
                        ,carlineNm:{type:"string"}
                        ,goalPrefVal:{type:"string"}
                        ,dealPrefVal:{type:"string"}
                    }
                }
            }
        }
        ,height:600
        ,filterable:false
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
        ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,enableTooltip:false               //Tooltip 적용, default:false
        ,sortable:false
        ,editable:false
        ,columns:[
            {field:"carlineNm", title:"<spring:message code='mis.lbl.carlineNm' />", width:200, attributes:{"class":"ac"}

            }
            ,{field:"goalPrefVal", title:"<spring:message code='mis.lbl.goalPrefVal' />", width:200, attributes:{"class":"ac"}

            }
            ,{field:"dealPrefVal", title:"<spring:message code='mis.lbl.dealPrefVal' />", width:200, attributes:{"class":"ac"}

            }
        ]
    });

});
</script>
<!-- //script -->

<!-- [딜러사] 판매고문 실적현황 -->