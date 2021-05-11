<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div id="resizableContainer">
    <!-- 부품선택 팝업 -->
    <section id="windows" class="pop_wrap">
        <div class="header_area">
            <div class="btn_right">
                <!-- 조회 버튼 -->
                <button id="btnSearch" class="btn_m btn_Search"><spring:message code="par.btn.search" /><!-- 조회 --></button>
                <button id="btnSelect" class="btn_m btn_Select"><spring:message code="par.btn.select" /><!-- 선택 --></button>
            </div>
        </div>
        <div class="table_form" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:24%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                    <col style="width:10%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부품코드 --></th>
                        <td>
                            <input id="sItemCd" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 부품명 --></th>
                        <td>
                            <input id="sItemNm" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.bmpOrdNo" /><!-- BMP订单编号 --></th>
                        <td>
                            <input id="sBmpOrdNo" class="form_input" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid mt10">
        <!-- 그리드1 -->
            <div id="grid" class="resizable_grid"></div>
        <!-- 그리드1 -->
        </div>
    </section>
    <!-- //부품선택 팝업 -->
</div>
 <script type="text/javascript">

    $(document).ready(function() {

        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         var options = parent.searchPurcOrdPopupWindow.options.content.data,
             itemDstinCdList     = [],
             itemDstinCdObj      = {},
             itemGrpCdObj        = {},
             abcIndList          = [],
             abcIndObj           = {},
             carlineCdList       = [],
             carlineCdObj        = {},
             urlInfo             = "<c:url value='/par/cmm/selectPurcOrdByCondition.do' />",
             sStrgeCd;

        // 그리드 더블 클릭 이벤트.
        $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
            $("#btnSelect").click();
        });

        /************************************************************
                    기능버튼 설정
        *************************************************************/

        // 조회 버튼.
        $("#btnSearch").kendoButton({
            click:function(e){
                $("#grid").data("kendoExtGrid").dataSource.read();
            }
        });

        // 선택 버튼.
        $("#btnSelect").kendoButton({
            click:function(e){
                var grid = $("#grid").data("kendoExtGrid");
                var rows = grid.select();

                if(rows !== null)
                {
                    var data = [];
                    $.each(rows, function(idx, row){
                        data.push(grid.dataItem(row));
                    });

                    options.callbackFunc(data);
                    if(options.autoClose){
                        parent.searchPurcOrdPopupWindow.close();
                    }
                }
            }
        });

        /************************************************************
                    조회조건 설정
        *************************************************************/

        urlInfo = "<c:url value='/par/cmm/selectPurcOrdByCondition.do' />";
        var sPurcOrdStatLst = new Array();
        sPurcOrdStatLst.push("02");
        sPurcOrdStatLst.push("03");

        /************************************************************
                    그리드 설정
        *************************************************************/
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0519-185402"
            ,dataSource:{
                transport:{
                    read:{
                        url:urlInfo//"<c:url value='/par/cmm/selectSearchItemPopupByCondition.do' />"
                        ,dataType:"json"
                        ,type:"POST"
                        ,contentType:"application/json;"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;

                            // 품목구분코드.
                            params["sItemCd"]          = $("#sItemCd").val();
                            params["sItemNm"]          = $("#sItemNm").val();
                            params["sBmpOrdNo"]        = $("#sBmpOrdNo").val();
                            params["sBpCd"]        	   = 'A10AA001';
                            params["sDelYn"]           = 'Y';
                            params["sPurcOrdStatLst"]  = sPurcOrdStatLst;

                            return kendo.stringify(params);
                        }
                    }
                }
                ,navigatable:false
                ,serverPaging:true
                ,schema:{
                    data:"data"
                    , total:"total"
                    , model:{
                        id:"itemCd"
                        , fields:{
                        	  dlrCd        :{ type:"string" }
	                        , bmpOrdNo     :{ type:"string" }
	                        , itemCd       :{ type:"string" }
	                        , itemNm       :{ type:"string" }
                        }
                    }
                }
            }
            ,selectable:options.selectable === "multiple"? "multiple,row":"row"
            ,editable:false
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,height:280
            ,columns:[
                 {field:"dlrCd" ,title:"<spring:message code='par.lbl.dlrCd' />" ,width:105 ,hidden:true}           //딜러 코드
                ,{field:"bmpOrdNo" ,title:"<spring:message code='par.lbl.bmpOrdNo' />" ,width:130}     				//bmp订单编号
                ,{field:"itemCd" ,title:"<spring:message code='par.lbl.itemCd' />" ,width:130 }                     //配件代码
                ,{field:"itemNm" ,title:"<spring:message code='par.lbl.itemNm' />" ,width:180 }                     //配件名称
            ]
        });

        //  품목구분
        changeItemDstinCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = itemDstinCdObj[val];
            }
            return returnVal;
        };

        //  ABC CLASS
        changeAbcInd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = abcIndObj[val];
            }
            return returnVal;
        };

        // 차형
        changeCarlineCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = carlineCdObj[val];
            }
            return returnVal;
        };

        $("#grid").data("kendoExtGrid").dataSource.read();

        /*if(!dms.string.isEmpty(options.parentTp)){
            if(options.parentTp === "QNA"){
                $("#grid").data("kendoExtGrid").hideColumn('avlbStockQty');
            }else{
                $("#grid").data("kendoExtGrid").showColumn('avlbStockQty');
            }

        }else{
            $("#grid").data("kendoExtGrid").showColumn('avlbStockQty');
        }*/
    });

 </script>