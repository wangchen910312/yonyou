<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">

    <section class="group">
            <div class="header_area">
                <h1 class="title_basic"><spring:message code="ser.title.packageMng" /><!-- 작업Package구성 --></h1>
                    <div class="btn_right">
                        <!-- 조회 버튼 -->
                        <button id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /><!-- 조회 --></button>
                        <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button>
                        <%-- <button id="btnCancel" class="btn_m btn_Cancel"><spring:message code="global.btn.cancel" /></button> --%>
                    </div>
            </div>
            <div class="table_form" role="search" data-btnid="btnSearch">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:23%;">
                        <col style="width:10%;">
                        <col style="width:20%;">
                        <col style="width:10%;">
                        <col style="width:31%;">
                    </colgroup>
                    <tbody>

                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.carLine" /><!-- 차종 --></th>
                            <td >
                                <input id="sLtsModelCd" name="sLtsModelCd" class="form_comboBox">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.packageCd" /><!-- Package번호 --></th>
                            <td>
                                <input id="sPkgItemCd" name="sPkgItemCd" class="form_input">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.packageNm" /><!-- Package명 --></th>
                            <td >
                                <input id="sPkgItemNm" name="sPkgItemNm" class="form_input" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"></th>
                            <td></td>
                            <th scope="row"><spring:message code="ser.lbl.lbrCd" /><!-- 공임코드 --></th>
                            <td>
                                <input id="sLbrCd" name="sLbrCd" class="form_input">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.lbrNm" /><!-- 정비항목 --></th>
                            <td >
                                <input id="sLbrNm" name="sLbrNm" class="form_input">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"></th>
                            <td></td>
                            <th scope="row"><spring:message code="ser.lbl.itemCd" /><!-- 부품번호 --></th>
                            <td>
                                <input id="sItemCd" name="sItemCd" class="form_input">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.itemNm" /><!-- 부품명 --></th>
                            <td >
                                <input id="sItemNm" name="sItemNm" class="form_input">
                            </td>

                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="table_grid mt10">

                <!-- 그리드1 -->
                <div id="itemGrid" class="grid"></div>
                <!-- 그리드1 -->

            </div>
        </section>
        <!-- // 부품 조회 -->
         <!-- 그리드 시작 -->
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="ser.title.lbrInfo" /></h1><!-- 공임정보 -->
        </div>
        <!-- 그리드 시작 -->
        <div class="table_grid">
            <div id="ltsGrid"></div>
        </div>

         <!-- 그리드 시작 -->
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="ser.title.itemInfo" /></h1><!-- 부품정보 -->
        </div>
        <!-- 그리드 시작 -->
        <div class="table_grid">
            <div id="parGrid"></div>
        </div>
        <input type="hidden" id="pkgItemCd" name="pkgItemCd" />
        <input type="hidden" id="pkgItemNm" name="pkgItemNm" />

</section>

<script type="text/javascript">


    //지점
    /* var loginDlrCd = "${dlrCd}";
    $("#bpTp").kendoExtDropDownList({

    });
 */
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

      //조회조건 - 품목구분선택
        $("#sItemDstinCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:itemDstinCdList
            ,index:0
        });

        //조회조건 - 차종
        $("#sLtsModelCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:ltsModelList
            ,optionLabel:" "
            ,index:0
        });

        /**
         * 팝업 옵션
         */
         var options = parent.workPackagePopup.options.content.data;

         $("#btnSearch").kendoButton({
             click:function(){
                 $("#itemGrid").data("kendoExtGrid").dataSource.read();
             }
         });

         // 선택 버튼.
         $("#btnSelect").kendoButton({
             click:function(e){
                 var ltsGrid = $("#ltsGrid").data("kendoExtGrid");
                 var parGrid = $("#parGrid").data("kendoExtGrid");

                 var parData = parGrid.dataSource.data();
                 var ltsData = ltsGrid.dataSource.data();

                 options.callbackFunc(parData, ltsData);
                 parent.workPackagePopup.close();
             }
         });

         // 닫기 버튼.
         $("#btnCancel").kendoButton({
             click:function(e){
                 parent.workPackagePopup.close();
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

                    /* $.ajax({
                        url:"<c:url value='/par/pmm/itemMaster/selectItemMasterByKey.do' />",
                        ,data:JSON.stringify({ sDlrCd:selectedItem.dlrCd, sItemCd:selectedItem.itemCd})
                        ,type:"POST"
                        ,dataType:"json"
                        ,contentType:"application/json"
                        ,error:function(jqXHR,status,error) {
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                    }).done(function(result) {

                        $("#itemCd").val(result.itemCd);
                        $("#itemNm").val(result.itemNm);
                        $("#ltsGrid").data("kendoExtGrid").dataSource.read();
                        $("#parGrid").data("kendoExtGrid").dataSource.read();
                    }); */

                    $("#pkgItemCd").val(selectedItem.pkgItemCd);
                    $("#pkgItemNm").val(selectedItem.pkgItemNm);
                    $("#ltsGrid").data("kendoExtGrid").dataSource.read();
                    $("#parGrid").data("kendoExtGrid").dataSource.read();

                }
             }
            ,pageable:{
                refresh:false
               ,pageSize:30
               ,pageSizes:[10, 20, 30, 50, 100]
               ,buttonCount:1
               ,input:true
             }
            ,scrollable:true
            ,sortable:false
            ,resizable:true
            ,height:131
            ,columns:[
                 {field:"rnum",   title:"<spring:message code='ser.lbl.no' />", width:30, sortable:false, attributes:{"class":"ac"}}
                ,{field:"dlrCd", title:"<spring:message code='ser.lbl.dlrCd' />", width:100, attributes:{"class":"ac"},hidden:true}
                ,{field:"ltsModelCd", title:"<spring:message code='ser.lbl.carLine' />", width:100, attributes:{"class":"ac"}}
                ,{field:"pkgItemCd", title:"<spring:message code='ser.lbl.packageCd' />", width:100, attributes:{"class":"ac"}}
                ,{field:"pkgItemNm", title:"<spring:message code='ser.lbl.packageNm' />", width:140, attributes:{"class":"ac"}}
            ]
        });


        //공임 설정
        $("#ltsGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/ser/svi/package/selectPackageLtss.do' />"
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
                           ,pkgItemCd:{ type:"string"}
                           ,lineNo:{ type:"string"}
                           ,lbrCd:{ type:"string",editable:false}
                           ,lbrNm:{ type:"string",editable:false}
                           ,lbrQty:{ type:"number"}
                           ,lbrHm:{ type:"number",editable:false}
                           ,lbrPrc:{ type:"number",editable:false}
                           ,lbrRate01:{ type:"number",editable:false}
                           ,lbrAmt:{ type:"number",editable:false}
                        }
                    }
                }
              }
            ,pageable:false
            ,height:91
            ,autoBind:false
            ,columns:[
                 {field:"lineNo", title:"<spring:message code='ser.lbl.no' />", width:30, sortable:false, attributes:{"class":"ac"}}
                ,{field:"lbrCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:50,attributes:{"class":"ac"}}//공임코드
                ,{field:"lbrNm", title:"<spring:message code='ser.lbl.lbrNm' />", width:150,attributes:{"class":"ac"}}//공임명
                ,{field:"lbrQty", title:"<spring:message code='ser.lbl.qty' />", width:40, attributes:{"class":"ac"}}//수량
                ,{field:"lbrHm", title:"<spring:message code='ser.lbl.lbrTime' />", width:40, attributes:{"class":"ac"}}//수량단위
                ,{field:"lbrPrc", title:"<spring:message code='ser.lbl.prc' />", width:40,attributes:{"class":"ac"}}//단가
                ,{field:"lbrAmt", title:"<spring:message code='ser.lbl.amt' />", attributes:{"class":"ac"}, width:40}//금액
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
            ,height:91
            ,pageable:false
            ,autoBind:false
            ,columns:[
                 {field:"lineNo", title:"<spring:message code='ser.lbl.no' />", width:30, sortable:false, attributes:{"class":"ac"}}
                ,{field:"itemCd", title:"<spring:message code='ser.lbl.itemCd' />", width:50,attributes:{"class":"ac"}}//부품번호
                ,{field:"itemNm", title:"<spring:message code='ser.lbl.itemNm' />", width:150,attributes:{"class":"ac"}}//부품명
                ,{field:"itemQty", title:"<spring:message code='ser.lbl.qty' />", width:40, attributes:{"class":"ac"}}//수량
                ,{field:"itemUnitCd", title:"<spring:message code='ser.lbl.unitCd' />", width:40, attributes:{"class":"ac"}}//단가
                ,{field:"itemPrc", title:"<spring:message code='ser.lbl.prc' />", width:40,attributes:{"class":"ac"}}//수량단위
                ,{field:"itemAmt", title:"<spring:message code='ser.lbl.amt' />", attributes:{"class":"ac"}, width:40}//금액
                ,{field:"avlbStockQty", title:"<spring:message code='ser.lbl.qty' />", attributes:{"class":"ac"}, width:40, hidden:true}//가용재고
            ]

        });

    });

    // 부품 구분
    itemDstinCdGrid = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(itemDstinCdMap[val] != undefined)
            returnVal = itemDstinCdMap[val].cmmCdNm;
        }
        return returnVal;
    }

</script>
