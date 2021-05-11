<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 판매이익 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="mis.title.saleprofit" /></h1>
    </div>

    <!-- 탭메뉴 전체 영역 -->
    <div class="tab_area">
        <!-- 탭메뉴 -->
        <ul>
            <li id="saleTargetTab" class="k-state-active"><spring:message code="mis.lbl.saletarget" /></li>
            <li id="carLineTab"><spring:message code="mis.lbl.carlineprofitconfig" /></li>
            <li id="profitTargetTab"><spring:message code="mis.lbl.profittarget" /></li>
        </ul>
        <!-- //탭메뉴 -->

        <!-- 판매목표 -->
        <div class="mt0">
            <div class="header_area">
                <div class="left_area ml0">
                    <span class="span_txt"><spring:message code="mis.lbl.targetyearmonth" /></span>
                    <input type="text" id="sSaleTargetYyMm" name="sSaleTargetYyMm" class="form_datepicker" maxlength="6" style="width:100px;">
                    <button type="button" class="btn_s" id="btnSaletargetSearch" name="btnSaletargetSearch"><spring:message code="global.btn.search" /></button>
                </div>
            </div>
            <br>

            <form method="post" name="frmSaleTarget" id="frmSaleTarget">
            <%
                String sSaleTargetYyMmParam = request.getParameter("sSaleTargetYyMmParam");
                pageContext.setAttribute("sSaleTargetYyMmParam", sSaleTargetYyMmParam);

            %>
            <input type="hidden" id="sSaleTargetYyMmParam" name="sSaleTargetYyMmParam" value="${pageContext.request.contextPath}">
            <div class="table_info table_info_v2">
                <div class="table_grid">
                    <div id="saleTargetgrid"></div>
                </div>
            </div>
            </form>

        </div>
        <!-- //판매목표 -->

        <!-- 차형별 이익 설정 -->
        <div class="mt0">
            <div class="header_area">
                <div class="left_area ml0">
                    <span class="span_txt"><spring:message code="mis.lbl.targetyearmonth" /></span>
                    <input type="text" id="sCarlineYyMm" name="sCarlineYyMm" class="form_datepicker" maxlength="6" style="width:100px;">
                    <button type="button" class="btn_s" id="btnCarlineSearch" name="btnCarlineSearch"><spring:message code="global.btn.search" /></button>
                </div>
                <div class="btn_right">
                    <button type="button" id="btnCarlineSave" name="btnCarlineSave" class="btn_s"><spring:message code="global.btn.save" /></button>
                </div>
            </div>
            <br>
            <div class="table_info table_info_v2">
                <form method="post" name="frmCarlineProfit" id="frmCarlineProfit">
                <%
                    String sCarlineYyMmParam = request.getParameter("sCarlineYyMmParam");
                    pageContext.setAttribute("sCarlineYyMmParam", sCarlineYyMmParam);

                %>
                <input type="hidden" id="sCarlineYyMmParam" name="sCarlineYyMmParam" value="${pageContext.request.contextPath}">
                    <div class="table_grid">
                        <div id="carlinegrid"></div>
                    </div>
                </form>
            </div>
        </div>
        <!-- //차형별 이익 설정 -->

        <!-- 이익목표 -->
        <div class="mt0">
            <div class="header_area">
                <div class="left_area ml0">
                    <span class="span_txt"><spring:message code="mis.lbl.targetyearmonth" /></span>
                    <input type="text" id="sProfitTargetYyMm" name="sProfitTargetYyMm" class="form_datepicker" maxlength="6" style="width:100px;">
                    <button type="button" class="btn_s" id="btnProfitTargetSearch" name="btnProfitTargetSearch"><spring:message code="global.btn.search" /></button>
                </div>
                <div class="btn_right">
                    <button type="button" id="btnProfitTargetSave" name="btnProfitTargetSave" class="btn_s"><spring:message code="global.btn.save" /></button>
                </div>
            </div>
            <br>
            <div class="table_info table_info_v2">
                <form method="post" name="frmProfitTarget" id="frmProfitTarget">
                <%
                    String sProfitTargetYyMmParam = request.getParameter("sProfitTargetYyMmParam");
                    pageContext.setAttribute("sProfitTargetYyMmParam", sProfitTargetYyMmParam);

                %>
                <input type="hidden" id="sProfitTargetYyMmParam" name="sProfitTargetYyMmParam" value="${pageContext.request.contextPath}">
                    <div class="table_grid">
                        <div id="profittargetgrid"></div>
                    </div>
                </form>
            </div>
        </div>
        <!-- //이익목표 -->
    </div>
    <!-- //탭메뉴 전체 영역 -->
</section>
<!-- //판매이익 -->

<script>
    $(document).ready(function() {

        $("#sSaleTargetYyMm").kendoDatePicker({
            value:"${sysdate}"
           ,start:"year"
           ,depth:"year"
           ,format:"yyyyMM"
        });

        $("#sSaleTargetYyMm").kendoMaskedTextBox({
            mask:"######"
        });

        $("#sCarlineYyMm").kendoDatePicker({
            value:"${sysdate}"
           ,start:"year"
           ,depth:"year"
           ,format:"yyyyMM"
        });

        $("#sCarlineYyMm").kendoMaskedTextBox({
            mask:"######"
        });


        $("#sProfitTargetYyMm").kendoDatePicker({
            value:"${sysdate}"
           ,start:"year"
           ,depth:"year"
           ,format:"yyyyMM"
        });

        $("#sProfitTargetYyMm").kendoMaskedTextBox({
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

        $("#sSaleTargetYyMm").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2));
        $("#sCarlineYyMm").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2));
        $("#sProfitTargetYyMm").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2));


        $("#btnSaletargetSearch").kendoButton({
            click:function(e) {
                $('#saleTargetgrid').data('kendoExtGrid').dataSource.page(1);
            }
        });

        $("#saleTargetTab").kendoButton({
            click:function(e) {
                $('#saleTargetgrid').data('kendoExtGrid').dataSource.page(1);
            }
        });

        $("#btnCarlineSearch").kendoButton({
            click:function(e) {
                $('#carlinegrid').data('kendoExtGrid').dataSource.page(1);
            }
        });

        $("#carLineTab").kendoButton({
            click:function(e) {
                $('#carlinegrid').data('kendoExtGrid').dataSource.page(1);
            }
        });

        $("#btnProfitTargetSearch").kendoButton({
            click:function(e) {
                $('#profittargetgrid').data('kendoExtGrid').dataSource.page(1);
            }
        });

        $("#profitTargetTab").kendoButton({
            click:function(e) {
                $('#profittargetgrid').data('kendoExtGrid').dataSource.page(1);
            }
        });


        $(".tab_area").kendoExtTabStrip({
            animation:false
        });

        //그리드 설정
        $("#saleTargetgrid").kendoExtGrid({
            //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
            gridId:"G-MIS-0805-120459"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/mis/tsp/selectTargetSaleProfitSearch.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sSaleTargetYyMm"] = $("#sSaleTargetYyMm").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"rnum"
                        ,fields:{
                             rnum:{type:"number", editable:false}
                            ,targetGubn:{type:"string"}
                            ,carNo1:{type:"number"}
                            ,carNo2:{type:"number"}
                            ,carNo3:{type:"number"}
                            ,carNo4:{type:"number"}
                            ,carNo5:{type:"number"}
                            ,carNo6:{type:"number"}
                            ,carNo7:{type:"number"}
                            ,carNo8:{type:"number"}
                            ,carNo9:{type:"number"}
                            ,carNo10:{type:"number"}
                            ,carNo11:{type:"number"}
                            ,carNo12:{type:"number"}
                            ,carNo13:{type:"number"}
                            ,carNo14:{type:"number"}
                            ,carNo15:{type:"number"}
                            ,carNo16:{type:"number"}
                            ,carNo17:{type:"number"}
                            ,carNo18:{type:"number"}
                            ,carNo19:{type:"number"}
                            ,carNo20:{type:"number"}
                            ,carNo21:{type:"number"}
                        }
                    }
                }
            }
            ,height:150
            ,filterable:false
            ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
            ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
            ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:false               //Tooltip 적용, default:false
            ,editable:false
            ,sortable:false
            ,pageable:false
            ,columns:[
                {field:"targetGubn", title:"<spring:message code='mis.lbl.dealermodel' />", width:150, sortable:false, attributes:{"class":"ac"}

                }
                ,{field:"carNo1", title:"2C", width:70, attributes:{"class":"ac"}, format:"{0:n0}"

                }
                ,{field:"carNo2", title:"B3", width:70, attributes:{"class":"ac"}, format:"{0:n0}"

                }
                ,{field:"carNo3", title:"BX", width:70, attributes:{"class":"ac"}, format:"{0:n0}"

                }
                ,{field:"carNo4", title:"C3", width:70, attributes:{"class":"ac"}, format:"{0:n0}"

                }
                ,{field:"carNo5", title:"C7", width:70, attributes:{"class":"ac"}, format:"{0:n0}"

                }
                ,{field:"carNo6", title:"C9", width:70, attributes:{"class":"ac"}, format:"{0:n0}"

                }
                ,{field:"carNo7", title:"CE", width:70, attributes:{"class":"ac"}, format:"{0:n0}"

                }
                ,{field:"carNo8", title:"CH", width:70, attributes:{"class":"ac"}, format:"{0:n0}"

                }
                ,{field:"carNo9", title:"CP", width:70, attributes:{"class":"ac"}, format:"{0:n0}"

                }
                ,{field:"carNo10", title:"DC", width:70, attributes:{"class":"ac"}, format:"{0:n0}"

                }
                ,{field:"carNo11", title:"DZ", width:70, attributes:{"class":"ac"}, format:"{0:n0}"

                }
                ,{field:"carNo12", title:"E5", width:70, attributes:{"class":"ac"}, format:"{0:n0}"

                }
                ,{field:"carNo13", title:"ES", width:70, attributes:{"class":"ac"}, format:"{0:n0}"

                }
                ,{field:"carNo14", title:"F0", width:70, attributes:{"class":"ac"}, format:"{0:n0}"

                }
                ,{field:"carNo15", title:"F8", width:70, attributes:{"class":"ac"}, format:"{0:n0}"

                }
                ,{field:"carNo16", title:"F9", width:70, attributes:{"class":"ac"}, format:"{0:n0}"

                }
                ,{field:"carNo17", title:"ID", width:70, attributes:{"class":"ac"}, format:"{0:n0}"

                }
                ,{field:"carNo18", title:"IK", width:70, attributes:{"class":"ac"}, format:"{0:n0}"

                }
                ,{field:"carNo19", title:"IV", width:70, attributes:{"class":"ac"}, format:"{0:n0}"

                }
                ,{field:"carNo20", title:"IZ", width:70, attributes:{"class":"ac"}, format:"{0:n0}"

                }
                ,{field:"carNo21", title:"TE", width:70, attributes:{"class":"ac"}, format:"{0:n0}"

                }
            ]
        });

        //그리드 설정
        $("#carlinegrid").kendoExtGrid({
            //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
            gridId:"G-MIS-0805-120620"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/mis/tsp/selectCarlineProfitSearch.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sCarlineYyMm"] = $("#sCarlineYyMm").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"rnum"
                        ,fields:{
                             rnum:{type:"number", validation:{required:true}, editable:false}
                            ,goalYy:{type:"string", validation:{required:true}, editable:false}
                            ,goalMm:{type:"string", validation:{required:true}, editable:false}
                            ,carlineCd:{type:"string", validation:{required:true}, editable:false}
                            ,carlineNm:{type:"string", validation:{required:true}, editable:false}
                            ,productVal:{type:"number", validation:{required:true}}
                            ,settingVal:{type:"number", validation:{required:true}}
                            ,carProfitVal:{type:"number", validation:{required:true}}
                            ,allProfitVal:{type:"number", validation:{required:true}}
                            ,goalPrefVal:{type:"number", validation:{required:true}, editable:false}
                        }
                    }
                }
            }
            ,height:600
            ,filterable:false
            ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
            ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
            ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:false               //Tooltip 적용, default:false
            ,sortable:false
            ,edit:function(e){
                var grid = this,

                fieldName = e.container.find("input[name][data-bind]").attr("name");

                if (e.model.carlineNm == "TOTAL") {
                    if(fieldName=="productVal" || fieldName=="settingVal" || fieldName=="carProfitVal" || fieldName=="allProfitVal"){
                        this.closeCell();
                    }
                }
            }
            , columns:[{
                title:"<spring:message code='mis.lbl.predictioncarinfo' />",
                headerAttributes:{ "class":"hasBob" },
                columns:[ {
                    field:"carlineNm",
                    title:"<spring:message code='mis.lbl.dealermodel' />",
                    width:200
                },{
                    field:"productVal",
                    title:"<spring:message code='mis.lbl.cstAmt' />",
                    width:200, format:"{0:n0}"
                },{
                    field:"settingVal",
                    title:"<spring:message code='mis.lbl.salePrice' />",
                    width:200, format:"{0:n0}"
                },{
                    field:"goalPrefVal",
                    title:"<spring:message code='mis.lbl.salestargetcar' />",
                    width:200, format:"{0:n0}"
                }]
            },{
                title:"<spring:message code='mis.lbl.predictioncarprofit' />",
                headerAttributes:{ "class":"hasBob" },
                columns:[ {
                    field:"carProfitVal",
                    title:"<spring:message code='mis.lbl.carone' />",
                    width:150, format:"{0:n0}"
                },{
                    field:"allProfitVal",
                    title:"<spring:message code='mis.lbl.carall' />",
                    width:150, format:"{0:n0}"
                }]
            }]
        });

        //버튼 - 저장
        $("#btnCarlineSave").kendoButton({
            click:function(e) {

                var grid = $("#carlinegrid").data("kendoExtGrid");

                var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

                if (grid.cudDataLength == 0) {
                    //변경된 정보가 없습니다.
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return;
                }

                if (grid.gridValidation()) {
                    $.ajax({
                        url:"<c:url value='/mis/tsp/insertCarlineProfitSave.do' />"
                        ,data:JSON.stringify(saveData)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR, status, error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
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

        //그리드 설정
        $("#profittargetgrid").kendoExtGrid({
            //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
            gridId:"G-MIS-0805-160620"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/mis/tsp/selectProfitTargetSearch.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sProfitTargetYyMm"] = $("#sProfitTargetYyMm").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"rnum"
                        ,fields:{
                             rnum:{type:"number", validation:{required:true}, editable:false}
                            ,goalYy:{type:"string", validation:{required:true}, editable:false}
                            ,goalMm:{type:"string", validation:{required:true}, editable:false}
                            ,carlineCd:{type:"string", validation:{required:true}, editable:false}
                            ,carlineNm:{type:"string", validation:{required:true}, editable:false}
                            ,goalPrefVal:{type:"number", validation:{required:true}, editable:false}
                            ,goodsCarQty:{type:"number"}
                            ,goodsCarRate:{type:"number"}
                            ,goodsCarVal:{type:"number"}
                            ,insPassesRate:{type:"number"}
                            ,insCarProfitQty:{type:"number"}
                            ,insCarVal:{type:"number"}
                            ,fncPassesRate:{type:"number"}
                            ,fncCarProfitQty:{type:"number"}
                            ,fncCarVal:{type:"number"}
                            ,etcCarQty:{type:"number"}
                            ,etcCarVal:{type:"number"}
                        }
                    }
                }
            }
            ,height:600
            ,filterable:false
            ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
            ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
            ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:false               //Tooltip 적용, default:false
            ,sortable:false
            ,edit:function(e){
                var grid = this,

                fieldName = e.container.find("input[name][data-bind]").attr("name");

                if (e.model.carlineNm == "TOTAL") {
                    if(fieldName=="goodsCarQty" || fieldName=="goodsCarRate" || fieldName=="goodsCarVal" || fieldName=="insPassesRate" || fieldName=="insCarProfitQty" || fieldName=="insCarVal" || fieldName=="fncPassesRate"
                        || fieldName=="fncCarProfitQty" || fieldName=="fncCarVal" || fieldName=="etcCarQty" || fieldName=="etcCarVal"){
                        this.closeCell();
                    }
                }
            }
            , columns:[{
                title:"<spring:message code='mis.lbl.providecarinfo' />  / <spring:message code='mis.lbl.predictionprovideprofit' />",
                headerAttributes:{ "class":"hasBob" },
                columns:[ {
                    field:"carlineNm",
                    title:"<spring:message code='mis.lbl.dealermodel' />" ,
                    width:150
                },{
                    field:"goalPrefVal",
                    title:"<spring:message code='mis.lbl.salestargetcar' />",
                    width:150, format:"{0:n0}"
                }]
            },{
                title:"<spring:message code='mis.lbl.localOption' />",
                headerAttributes:{ "class":"hasBob" },
                columns:[ {
                    field:"goodsCarQty",
                    title:"<spring:message code='mis.lbl.goodscarqty' />",
                    width:120, format:"{0:n0}"
                },{
                    field:"goodsCarRate",
                    title:"<spring:message code='mis.lbl.goodscarrate' />",
                    width:120, format:"{0:n0}"
                },{
                    field:"goodsCarVal",
                    title:"<spring:message code='mis.lbl.profitAmt' />",
                    width:120, format:"{0:n0}"
                }]
            },{
                title:"<spring:message code='mis.lbl.insurance' />",
                headerAttributes:{ "class":"hasBob" },
                columns:[ {
                    field:"insPassesRate",
                    title:"<spring:message code='mis.lbl.inspassesrate' />",
                    width:120, format:"{0:n0}"
                },{
                    field:"insCarProfitQty",
                    title:"<spring:message code='mis.lbl.inscarprofitqty' />",
                    width:120, format:"{0:n0}"
                },{
                    field:"insCarVal",
                    title:"<spring:message code='mis.lbl.profitAmt' />",
                    width:120, format:"{0:n0}"
                }]
            },{
                title:"<spring:message code='mis.lbl.finc' />",
                headerAttributes:{ "class":"hasBob" },
                columns:[ {
                    field:"fncPassesRate",
                    title:"<spring:message code='mis.lbl.fncpassesrate' />",
                    width:120, format:"{0:n0}"
                },{
                    field:"fncCarProfitQty",
                    title:"<spring:message code='mis.lbl.fnccarprofitqty' />",
                    width:120, format:"{0:n0}"
                },{
                    field:"fncCarVal",
                    title:"<spring:message code='mis.lbl.profitAmt' />",
                    width:120, format:"{0:n0}"
                }]
            },{
                title:"<spring:message code='mis.lbl.etcdefinecomment' />",
                headerAttributes:{ "class":"hasBob" },
                columns:[ {
                    field:"etcCarQty",
                    title:"<spring:message code='mis.lbl.etccarqty' />",
                    width:120, format:"{0:n0}"
                },{
                    field:"etcCarVal",
                    title:"<spring:message code='mis.lbl.profitAmt' />",
                    width:120, format:"{0:n0}"
                }]
            }]
        });

        //버튼 - 저장
        $("#btnProfitTargetSave").kendoButton({
            click:function(e) {

                var grid = $("#profittargetgrid").data("kendoExtGrid");

                var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

                if (grid.cudDataLength == 0) {
                    //변경된 정보가 없습니다.
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return;
                }

                if (grid.gridValidation()) {
                    $.ajax({
                        url:"<c:url value='/mis/tsp/insertProfitTargetSave.do' />"
                        ,data:JSON.stringify(saveData)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR, status, error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
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

    });
</script>
<!-- //script -->