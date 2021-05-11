<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- 부품그룹선택 팝업 -->
    <section id="windows" class="pop_wrap">
        <div class="header_area">
        </div>
        <section class="group">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code="par.title.partItemGrpType" /></h2>
                <div class="btn_right">
                <!-- 버튼 -->
                <button id="btnSelect" class="btn_m btn_Select"><spring:message code="par.btn.select" /><!-- 선택 --></button>
            </div>
            </div>
            <div class="table_grid">
                <!-- grid -->
                <div id="grid01"></div>
                <!-- grid -->
            </div>
        </section>

        <section class="group">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code="par.title.partItemGrpTypeOne" /></h2>
                <div class="btn_right">
                </div>
            </div>

            <div class="table_grid">
                <!-- grid -->
                <div id="grid02"></div>
                <!-- grid -->
            </div>
        </section>

        <section class="group">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code="par.title.partItemGrpTypeTwo" /></h2>
                <div class="btn_right">
                </div>
            </div>

            <div class="table_grid">
                <!-- grid -->
                <div id="grid03"></div>
                <!-- grid -->
            </div>
        </section>

        <section class="group">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code="par.title.partItemGrpTypeThree" /></h2>
                <div class="btn_right">
                </div>
            </div>

            <div class="table_grid">
                <!-- grid -->
                <div id="grid04"></div>
                <!-- grid -->
            </div>
        </section>

    </section>

    <section class="group hidden">
        <input id="itemGrpCd01" type="hidden" value="" />
        <input id="itemGrpNm01" type="hidden" value="" />
        <input id="pentItemDstinCd01" type="hidden" value="" />
        <input id="itemGrpCd02" type="hidden" value="" />
        <input id="itemGrpNm02" type="hidden" value="" />
        <input id="pentItemDstinCd02" type="hidden" value="" />
        <input id="itemGrpCd03" type="hidden" value="" />
        <input id="itemGrpNm03" type="hidden" value="" />
        <input id="pentItemDstinCd03" type="hidden" value="" />

    </section>

    <!-- //부품그룹선택 팝업 -->

 <script type="text/javascript">

    $(document).ready(function() {

        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
        var options = parent.searchItemMasterGroupPopupWindow.options.content.data,
            itemDstinCdList = [],
            partItemGrpTypeOneCdList = [],
            partItemGrpTypeTwoCdList = [],
            partItemGrpTypeThreeCdList = [];

         //itemDstinCdList
         <c:forEach var="obj" items="${itemDstinCdList}">
         itemDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         </c:forEach>
         //partItemGrpTypeOneCdList
         <c:forEach var="obj" items="${partItemGrpTypeOneCdList}">
         partItemGrpTypeOneCdList.push({
             "cmmCd":"${obj.itemGrpCd}"
             ,"cmmCdNm":"${obj.itemGrpNm}"
         });
         </c:forEach>
         //partItemGrpTypeTwoCdList
         <c:forEach var="obj" items="${partItemGrpTypeTwoCdList}">
         partItemGrpTypeTwoCdList.push({
             "cmmCd":"${obj.itemGrpCd}"
             ,"cmmCdNm":"${obj.itemGrpNm}"
         });
         </c:forEach>
         //partItemGrpTypeThreeCdList
         <c:forEach var="obj" items="${partItemGrpTypeThreeCdList}">
         partItemGrpTypeThreeCdList.push({
             "cmmCd":"${obj.itemGrpCd}"
             ,"cmmCdNm":"${obj.itemGrpNm}"
         });
         </c:forEach>

        // 그리드 더블 클릭 이벤트.
        $("#grid01").on("dblclick", "tr.k-state-selected", function (e) {
            //$("#btnSelect").click();
        });

        /************************************************************
                    기능버튼 설정
        *************************************************************/

        // 선택 버튼.
        $("#btnSelect").kendoButton({
            click:function(e){
                var grid01 = $("#grid01").data("kendoExtGrid"),
                grid02 = $("#grid02").data("kendoExtGrid"),
                grid03 = $("#grid03").data("kendoExtGrid"),
                grid04 = $("#grid04").data("kendoExtGrid"),
                rows01 = grid01.select(),
                rows02 = grid02.select(),
                rows03 = grid03.select(),
                rows04 = grid04.select(),
                data = [];

                if(rows01.length > 0){
                    $.each(rows01, function(idx, row){
                        data.push(grid01.dataItem(row));
                    });
                }
                if(rows02.length > 0){
                    $.each(rows02, function(idx, row){
                        data.push(grid02.dataItem(row));
                    });
                }
                if(rows03.length > 0){
                    $.each(rows03, function(idx, row){
                        data.push(grid03.dataItem(row));
                    });
                }
                if(rows04.length > 0){
                    $.each(rows04, function(idx, row){
                        data.push(grid04.dataItem(row));
                    });
                }

                options.callbackFunc(data);
            }
        });

        $("#sItemDstinCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,optionLabel:" "
            ,dataSource:itemDstinCdList
            ,index:0
        });

        /************************************************************
                    조회조건 설정
        *************************************************************/

        /************************************************************
                    그리드 설정
        *************************************************************/
        //grid01
        $("#grid01").kendoExtGrid({
            gridId:"G-PAR-0214-095901"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/itemGroup/selectItemGroupLevels.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sDlrCd"] = "";
                            params["sItemGrpCd"] = "";
                            params["sItemGrpNm"] = "";
                            params["sUseYn"] = "";
                            params["sLvlVal"] = "1";

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"itemGrpCd"
                        ,fields:{
                            rnum:{ type:"string", editable:false}
                            ,dlrCd:{ type:"string" , validation:{required:true} }
                            ,itemDstinCd:{ type:"string" , validation:{required:true} }
                            ,itemGrpCd:{ type:"string" , validation:{required:true} }
                            ,itemGrpNm:{ type:"string" , validation:{required:true} }
                            ,useYn:{ type:"string" , defaultValue:"Y", editable:true }
                            ,dbYn:{ type:"string" , defaultValue:"Y" }
                            ,remark:{ type:"string" }
                            ,regUsrId:{ type:"string", editable:false }
                            ,regDt:{ type:"date", editable:false }
                            ,updtUsrId:{ type:"string", editable:false }
                            ,updtDt:{ type:"date", editable:false }
                        }
                    }
                }
            }
            ,height:94
            ,pageable:false
            ,navigatable:true
            ,selectable:"row"
            ,editable:false
            ,autoBind:true
            ,multiSelectWithCheckbox:true
            ,appendEmptyColumn:true//default:false
            ,filterable:false
            ,indvColumnRows:1
            ,change:function(e){
                var selectedItem = this.dataItem(this.select());
                if( selectedItem != null && selectedItem != 'undefined'){

                    $("#itemGrpCd01").val(selectedItem.itemGrpCd);
                    $("#itemGrpNm01").val(selectedItem.itemGrpNm);
                    $("#pentItemDstinCd01").val(selectedItem.pentItemDstinCd);

                    $('#grid02').data('kendoExtGrid').dataSource.read();
                }
            }
            ,dataBound:function(e){
                var rows = e.sender.tbody.children();

                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);
                    e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                });
            }
            ,columns:[
                {field:"rnum", title:"<spring:message code='par.lbl.no' />", width:40}
                ,{field:"itemGrpCd", title:"<spring:message code='par.lbl.partItemGrpCd' />" ,width:120 ,attributes:{"class":"editable-cell"}}//itemGrpCd
                ,{field:"itemGrpNm", title:"<spring:message code='par.lbl.partItemGrpNm' />",width:270 ,attributes:{"class":"editable-cell"}}//itemGrpNm
                ,{field:"useYn", title:"<spring:message code='par.lbl.partItemGrpUse' />" ,width:80 ,attributes:{"class":"ac editable-cell"}}//useYn
                ,{field:"remark", title:"<spring:message code='par.lbl.remark' />" ,width:300}//remark
            ]
        });
        //grid02
        $("#grid02").kendoExtGrid({
            gridId:"G-PAR-0214-095902"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/itemGroup/selectItemGroupLevels.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sDlrCd"] = "";
                            var itemGrpCd01 = $('#itemGrpCd01').val() == "" ? "X":$('#itemGrpCd01').val();
                            params["sItemDstinCd"] = $('#itemGrpCd01').val();
                            params["sItemGrpCd"] = "";
                            params["sItemGrpNm"] = "";
                            params["sUseYn"] = "";
                            params["sLvlVal"] = "2";

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"itemGrpCd"
                        ,fields:{
                            rnum:{ type:"string", editable:false}
                            ,dlrCd:{ type:"string" , validation:{required:true} }
                            ,itemDstinCd:{ type:"string" , validation:{required:true} }
                            ,itemGrpCd:{ type:"string" , validation:{required:true} }
                            ,itemGrpNm:{ type:"string" , validation:{required:true} }
                            ,useYn:{ type:"string" , defaultValue:"Y", editable:true }
                            ,dbYn:{ type:"string" , defaultValue:"Y" }
                            ,remark:{ type:"string" }
                            ,regUsrId:{ type:"string", editable:false }
                            ,regDt:{ type:"date", editable:false }
                            ,updtUsrId:{ type:"string", editable:false }
                            ,updtDt:{ type:"date", editable:false }
                        }
                    }
                }
            }
            ,height:94
            ,pageable:false
            ,navigatable:true
            ,selectable:"row"
            ,editable:false
            ,autoBind:false
            ,multiSelectWithCheckbox:true
            ,appendEmptyColumn:true//default:false
            ,filterable:false
            ,indvColumnRows:1
            ,change:function(e){
                var selectedItem = this.dataItem(this.select());

                if( selectedItem != null && selectedItem != 'undefined'){
                    $("#itemGrpCd02").val(selectedItem.itemGrpCd);
                    $("#itemGrpNm02").val(selectedItem.itemGrpNm);
                    $("#pentItemDstinCd02").val(selectedItem.pentItemDstinCd);

                    $('#grid03').data('kendoExtGrid').dataSource.read();
                }
            }
            ,dataBound:function(e){
                var rows = e.sender.tbody.children();

                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);
                    e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                });
            }
            ,columns:[
                {field:"rnum", title:"<spring:message code='par.lbl.no' />", width:40}
                ,{field:"itemDstinCd", title:"<spring:message code='par.lbl.partItemGrp' />", width:120}
                ,{field:"itemGrpCd", title:"<spring:message code='par.lbl.partItemGrpTypeOne' />" ,width:120 ,attributes:{"class":"editable-cell"}}//itemGrpCd
                ,{field:"itemGrpNm", title:"<spring:message code='par.lbl.partItemGrpTypeOneNm' />",width:150 ,attributes:{"class":"editable-cell"}}//itemGrpNm
                ,{field:"useYn", title:"<spring:message code='par.lbl.partItemGrpUse' />" ,width:80 ,attributes:{"class":"ac editable-cell"}}//useYn
                ,{field:"remark", title:"<spring:message code='par.lbl.remark' />" ,width:300 }//remark
            ]
        });
        //grid03
        $("#grid03").kendoExtGrid({
            gridId:"G-PAR-0214-095903"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/itemGroup/selectItemGroupLevels.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sDlrCd"] = "";
                            var itemGrpCd02 = $('#itemGrpCd02').val() == "" ? "X":$('#itemGrpCd02').val();
                            params["sItemDstinCd"] = itemGrpCd02;
                            params["sItemGrpCd"] = "";
                            params["sItemGrpNm"] = "";
                            params["sUseYn"] = "";
                            params["sLvlVal"] = "3";

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"itemGrpCd"
                        ,fields:{
                            rnum:{ type:"string", editable:false}
                            ,dlrCd:{ type:"string" , validation:{required:true} }
                            ,itemDstinCd:{ type:"string" , validation:{required:true} }
                            ,itemGrpCd:{ type:"string" , validation:{required:true} }
                            ,itemGrpNm:{ type:"string" , validation:{required:true} }
                            ,useYn:{ type:"string" , defaultValue:"Y", editable:true }
                            ,dbYn:{ type:"string" , defaultValue:"Y" }
                            ,remark:{ type:"string" }
                            ,regUsrId:{ type:"string", editable:false }
                            ,regDt:{ type:"date", editable:false }
                            ,updtUsrId:{ type:"string", editable:false }
                            ,updtDt:{ type:"date", editable:false }
                        }
                    }
                }
            }
            ,height:127
            ,pageable:false
            ,navigatable:true
            ,selectable:"row"
            ,editable:false
            ,autoBind:false
            ,multiSelectWithCheckbox:true
            ,appendEmptyColumn:true//default:false
            ,filterable:false
            ,indvColumnRows:1
            ,change:function(e){
                var selectedItem = this.dataItem(this.select());

                if( selectedItem != null && selectedItem != 'undefined'){
                    $("#itemGrpCd03").val(selectedItem.itemGrpCd);
                    $("#itemGrpNm03").val(selectedItem.itemGrpNm);
                    $("#pentItemDstinCd03").val(selectedItem.pentItemDstinCd);

                    $('#grid04').data('kendoExtGrid').dataSource.read();
                }
            }
            ,dataBound:function(e){
                var rows = e.sender.tbody.children();

                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                });
            }
            ,columns:[
                {field:"rnum", title:"<spring:message code='par.lbl.no' />", width:40}
                ,{field:"itemDstinCd", title:"<spring:message code='par.lbl.partItemGrpTypeOne' />", width:120}
                ,{field:"itemGrpCd", title:"<spring:message code='par.lbl.partItemGrpTypeTwo' />" ,width:120 ,attributes:{"class":"editable-cell"}}//itemGrpCd
                ,{field:"itemGrpNm", title:"<spring:message code='par.lbl.partItemGrpTypeTwoNm' />",width:150 ,attributes:{"class":"editable-cell"}}//itemGrpNm
                ,{field:"useYn", title:"<spring:message code='par.lbl.partItemGrpUse' />" ,width:80 ,attributes:{"class":"ac editable-cell"}}//useYn
                ,{field:"remark", title:"<spring:message code='par.lbl.remark' />" ,width:300 }//remark
            ]
        });
        //grid04
        $("#grid04").kendoExtGrid({
            gridId:"G-PAR-0214-095904"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/itemGroup/selectItemGroupLevels.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sDlrCd"] = "";
                            var itemGrpCd03 = $('#itemGrpCd03').val() == "" ? "X":$('#itemGrpCd03').val();
                            params["sItemDstinCd"] = itemGrpCd03;
                            params["sItemGrpCd"] = "";
                            params["sItemGrpNm"] = "";
                            params["sUseYn"] = "";
                            params["sLvlVal"] = "4";

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"itemGrpCd"
                        ,fields:{
                            rnum:{ type:"string", editable:false}
                            ,dlrCd:{ type:"string" , validation:{required:true} }
                            ,itemDstinCd:{ type:"string" , validation:{required:true} }
                            ,itemGrpCd:{ type:"string" , validation:{required:true} }
                            ,itemGrpNm:{ type:"string" , validation:{required:true} }
                            ,useYn:{ type:"string" , defaultValue:"Y", editable:true }
                            ,dbYn:{ type:"string" , defaultValue:"Y" }
                            ,remark:{ type:"string" }
                            ,regUsrId:{ type:"string", editable:false }
                            ,regDt:{ type:"date", editable:false }
                            ,updtUsrId:{ type:"string", editable:false }
                            ,updtDt:{ type:"date", editable:false }
                        }
                    }
                }
            }
            ,height:127
            ,pageable:false
            ,navigatable:true
            ,selectable:"row"
            ,editable:false
            ,autoBind:false
            ,multiSelectWithCheckbox:true
            ,appendEmptyColumn:true//default:false
            ,filterable:false
            ,indvColumnRows:1
            ,dataBound:function(e){

                var rows = e.sender.tbody.children();

                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");

                });

            }
            ,columns:[
                {field:"rnum", title:"<spring:message code='par.lbl.no' />", width:40}
                ,{field:"itemDstinCd", title:"<spring:message code='par.lbl.partItemGrpTypeTwo' />", width:120}
                ,{field:"itemGrpCd", title:"<spring:message code='par.lbl.partItemGrpTypeThree' />" ,width:120 ,attributes:{"class":"editable-cell"}}//itemGrpCd
                ,{field:"itemGrpNm", title:"<spring:message code='par.lbl.partItemGrpTypeThreeNm' />",width:150 ,attributes:{"class":"editable-cell"}}//itemGrpNm
                ,{field:"useYn", title:"<spring:message code='par.lbl.partItemGrpUse' />" ,width:80 ,attributes:{"class":"ac editable-cell"}}//useYn
                ,{field:"remark", title:"<spring:message code='par.lbl.remark' />" ,width:300 }//remark
            ]
        });
    });

 </script>

