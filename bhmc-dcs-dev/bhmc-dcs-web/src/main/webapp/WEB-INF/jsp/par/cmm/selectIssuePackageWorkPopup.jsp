<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">

    <section class="group">
            <div class="header_area">
                <h1 class="title_basic"><%-- <spring:message code="par.title.packageSub" /> --%></h1>
                    <div class="btn_right">
                        <!-- 조회 버튼 -->
                        <button id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /><!-- 조회 --></button>
                        <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button>
                    </div>
            </div>
            <div class="table_form" role="search" data-btnid="btnSearch">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:23%;">
                        <col style="width:10%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.packageCd" /></th>
                            <td>
                                <input id="sPkgItemCd" name="sPkgItemCd" class="form_input">
                            </td>
                            <th scope="row"><spring:message code="par.lbl.packageNm" /></th>
                            <td >
                                <input id="sPkgItemNm" name="sPkgItemNm" class="form_input" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
    </section>
        <!-- // 부품 조회 -->
        <div class="clfix">
            <div class="left_areaStyle" style="width:39%">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code="par.title.packageSub" /></h2>
                    <div class="btn_right">
                        &nbsp;
                    </div>
                </div>
                <div class="table_grid">
                    <!-- 그리드1 -->
                    <div id="itemGrid" class="grid"></div>
                    <!-- 그리드1 -->
                </div>
            </div>
            <div class="right_areaStyle" style="width:60%;">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code="par.title.itemCdList" /></h2>
                    <div class="btn_right">
                        &nbsp;
                    </div>
                </div>
                <div class="table_grid">
                    <!-- 그리드 시작 -->
                    <div class="table_grid">
                        <div id="parGrid" class="grid"></div>
                    </div>
                </div>
            </div>
        </div>

        <input type="hidden" id="pkgItemCd" name="pkgItemCd" />
        <input type="hidden" id="pkgItemNm" name="pkgItemNm" />

</section>

<script type="text/javascript">
    //품목구분 Array
    var itemDstinCdList = [{"cmmCd":"", "cmmCdNm":""}];
    <c:forEach var="obj" items="${itemDstinCdList}">
    itemDstinCdList.push({
        "cmmCd":"${obj.cmmCd}"
        , "cmmCdNm":"${obj.cmmCdNm}"
    });
    </c:forEach>

    //품목구분 Map
    var itemDstinCdMap = dms.data.arrayToMap(itemDstinCdList, function(obj){ return obj.cmmCd; });

    //LtsModel Array
    var ltsModelList = [];
    <c:forEach var="obj" items="${ltsModelDs}">
    ltsModelList.push({
        "cmmCd":"${obj.ltsModelCd}"
        , "cmmCdNm":"${obj.ltsModelNm}"
    });
    </c:forEach>

    $(document).ready(function() {

        /**
         * 팝업 옵션
         */
         var options = parent.selectIssueWorkPackagePopup.options.content.data;

         $("#btnSearch").kendoButton({
             click:function(){
                 $("#itemGrid").data("kendoExtGrid").dataSource.read();
             }
         });

         // 선택 버튼.
         $("#btnSelect").kendoButton({
             click:function(e){
                 var parGrid = $("#parGrid").data("kendoExtGrid");

                 var parData = parGrid.dataSource.data();

                 options.callbackFunc(parData, []);
                 //parent.selectIssueWorkPackagePopup.close();
             }
        });

        $("#itemGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/ser/svi/package/selectPackages.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            // 품목구분코드.
                            params["sPkgItemCd"] = $("#sPkgItemCd").val();
                            params["sPkgItemNm"] = $("#sPkgItemNm").val();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,serverPaging:true
                ,schema:{
                     model:{
                        id:"rnum"
                       ,fields:{
                            rnum :{ type:"number" , validation:{required:true} }
                           ,dlrCd :{ type:"string" , validation:{required:true} }
                           ,pkgItemCd:{ type:"string" , validation:{required:true} }
                           ,pkgItemNm:{ type:"string" , validation:{required:true} }
                        }
                    }
                }
              }
            ,editable:false
            ,autoBind:false
            ,selectable:"row"
            ,change:function(e){
                var selectedItem = this.dataItem(this.select());
                if( selectedItem != null && selectedItem != 'undefined'){

                    $("#pkgItemCd").val(selectedItem.pkgItemCd);
                    $("#pkgItemNm").val(selectedItem.pkgItemNm);
                    $("#parGrid").data("kendoExtGrid").dataSource.read();

                }
            }
            ,height:219
            ,pageable:false
            ,scrollable:true
            ,sortable:false
            ,resizable:true
            ,columns:[
                {field:"pkgItemCd", title:"<spring:message code='par.lbl.pkgItemCd' />", width:100, attributes:{"class":"ac"}}
                ,{field:"pkgItemNm", title:"<spring:message code='par.lbl.pkgItemNm' />", width:140, attributes:{"class":"ac"}}
            ]
        });
        //부품 설정
        $("#parGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/ser/svi/package/selectPackagePars.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sPkgItemCd"] = $("#pkgItemCd").val();
                            params["sPkgItemNm"] = $("#pkgItemNm").val();
                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                     model:{
                        id:"rnum"
                       ,fields:{
                            dlrCd :{ type:"string" }
                           ,itemCd:{ type:"string" , validation:{required:true} ,editable:false}
                           ,itemNm:{ type:"string" , validation:{required:true} ,editable:false}
                           ,pkgItemCd:{ type:"string"}
                           ,lineNo:{ type:"string"}
                           ,itemQty:{ type:"number"}
                           ,itemUnitCd:{ type:"string",editable:false}
                           ,itemPrc:{ type:"number",editable:false}
                           ,itemAmt:{ type:"number",editable:false}
                           ,avlbStockQty:{ type:"number",editable:false}
                        }
                    }
                }
              }
            ,height:219
            ,pageable:false
            ,autoBind:false
            ,columns:[
                {field:"itemCd", title:"<spring:message code='ser.lbl.itemCd' />", width:50,attributes:{"class":"ac"}}//부품번호
                ,{field:"itemNm", title:"<spring:message code='ser.lbl.itemNm' />", width:150,attributes:{"class":"ac"}}//부품명
                ,{field:"itemQty", title:"<spring:message code='ser.lbl.qty' />", width:40, attributes:{"class":"ac"}}//수량
                ,{field:"itemPrc", title:"<spring:message code='ser.lbl.prc' />", width:40,attributes:{"class":"ac"}}//수량단위
                ,{field:"avlbStockQty", title:"<spring:message code='ser.lbl.qty' />", attributes:{"class":"ac"}, width:40, hidden:true}//가용재고
            ]
        });

    });

    // 부품 구분
    itemDstinCdGrid = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = itemDstinCdMap[val].cmmCdNm;
        }
        return returnVal;
    }

</script>
