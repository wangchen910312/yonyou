<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<%--
    JSP Name:selectTargetDerivationProfitSearch.jsp
    Description:파생이익지표분해
    author chibeom.song
    since 2016. 9. 20.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2016. 9. 20.   chibeom.song     최초 생성
--%>
<!-- 파생이익지표분해 -->
<div id="resizableContainer">
    <section class="group">
        <div class="mt0">
            <div class="header_area">
                <div class="left_area ml0">
                    <span class="span_txt"><spring:message code="mis.lbl.monitordate" /></span>
                    <input type="text" id="sMonitorProfitDate" name="sMonitorProfitDate" value="${targetDcptStepSearchVO.sMonitorProfitDate}" style="width:150px;" class="form_comboBox" >
                    <dms:access viewId="VIEW-D-10809" hasPermission="${dms:getPermissionMask('READ')}">
                    	<button type="button" class="btn_s" id="btnTargetDcptProfitSearch" name="btnTargetDcptProfitSearch"><spring:message code="global.btn.search" /></button>
    				</dms:access>
                </div>
            </div>

            <div class="header_area">
                <h2 class="title_basic"><spring:message code="mis.lbl.carlineprofitconfig" /></h2>
                <div class="btn_right">
                	<dms:access viewId="VIEW-D-10810" hasPermission="${dms:getPermissionMask('READ')}">
                    	<button type="button" id="btnCarlineSave" name="btnCarlineSave" class="btn_s"><spring:message code="global.btn.save" /></button>
                    </dms:access>
                </div>
            </div>
            <div class="table_grid">
                <div id="carlinegrid"></div>
            </div>

            <div class="header_area">
                <h2 class="title_basic"><spring:message code="mis.lbl.profittarget" /></h2>
                <div class="btn_right">
                	<dms:access viewId="VIEW-D-10811" hasPermission="${dms:getPermissionMask('READ')}">
                    	<button type="button" id="btnProfitSave" name="btnProfitSave" class="btn_s"><spring:message code="global.btn.save" /></button>
                    </dms:access>
                </div>
            </div>
            <div class="table_grid">
                <div id="profittargetgrid"></div>
            </div>
        </div>
    </section>
</div>
<!-- 파생이익지표분해 -->

<script type="text/javascript">

    $(document).ready(function() {

        $("#sMonitorProfitDate").kendoDatePicker({
            value:"${sysDate}"
            ,start:"year"
            ,depth:"year"
            ,format:"yyyyMM"
        });

        $("#btnTargetDcptProfitSearch").kendoButton({
            click:function(e) {
                $('#carlinegrid').data('kendoExtGrid').dataSource.page(1);
                $('#profittargetgrid').data('kendoExtGrid').dataSource.page(1);
            }
        });

        //그리드 설정
        $("#carlinegrid").kendoExtGrid({
            //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
            gridId:"G-MIS-0925-151710"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/mis/tds/selectCarlineProfitGrid.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sMonitorProfitDate"] = $("#sMonitorProfitDate").val();

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
                            ,goalProfitYy:{type:"string", editable:false}
                            ,goalProfitMm:{type:"string", editable:false}
                            ,carlineProfitCd:{type:"string", editable:false}
                            ,carlineProfitNm:{type:"string", editable:false}
                            ,productProfitVal:{type:"number",editable:true}
                            ,settingProfitVal:{type:"number",editable:true}
                            ,carProfitVal:{type:"number",editable:true}
                            ,allProfitVal:{type:"number",editable:true}
                            ,goalProfitPrefVal:{type:"number", editable:false}
                        }
                    }
                }
            }
            ,height:300
            ,filterable:false
            ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
            ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
            ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
            ,appendEmptyColumn:false           //빈컬럼 적용. default:false
            ,enableTooltip:false               //Tooltip 적용, default:false
            ,sortable:false
            ,selectable :"row"
            ,edit:function(e){
                var grid = this,

                fieldName = e.container.find("input[name][data-bind]").attr("name");

                if (e.model.carlineProfitNm == "TOTAL") {
                    if(fieldName=="productProfitVal" || fieldName=="settingProfitVal" || fieldName=="carProfitVal" || fieldName=="allProfitVal"){
                        this.closeCell();
                    }
                }

                if(fieldName=="allProfitVal" || fieldName=="carProfitVal"){
                    this.closeCell();
                }
            }
            , columns:[{
                title:"<spring:message code='mis.lbl.predictioncarinfo' />",
                headerAttributes:{ "class":"hasBob" },
                columns:[ {
                    field:"carlineProfitNm",
                    title:"<spring:message code='mis.lbl.dealermodel' />",
                    width:200
                },{
                    field:"productProfitVal",
                    title:"<spring:message code='mis.lbl.basiccstAmt' />(￥)",
                    width:200, format:"{0:n0}", attributes:{"class":"ar"}
                        ,editor:function(container, options){
                            $('<input required name="productProfitVal" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                 format:"n0"                // n0:###,###, n2:###,###.##
                                ,decimals:0                 // 소숫점
                                ,min:0
                                ,value:0
                                ,spinners:false
                                ,change:sumCarlineGrid
                            });
                            $('<span class="k-invalid-msg" data-for="productProfitVal"></span>').appendTo(container);
                        }
                },{
                    field:"settingProfitVal",
                    title:"<spring:message code='mis.lbl.expectationsalePrice' />(￥)",
                    width:200, format:"{0:n0}", attributes:{"class":"ar"}
                        ,editor:function(container, options){
                            $('<input required name="settingProfitVal" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                 format:"n0"                // n0:###,###, n2:###,###.##
                                ,decimals:0                 // 소숫점
                                ,min:0
                                ,value:0
                                ,spinners:false
                                ,change:sumCarlineGrid
                            });
                            $('<span class="k-invalid-msg" data-for="settingProfitVal"></span>').appendTo(container);
                        }
                },{
                    field:"goalProfitPrefVal",
                    title:"<spring:message code='mis.lbl.salestargetcar' />",
                    width:200, format:"{0:n0}", attributes:{"class":"ar","style":"background-color:silver"}
                }]
            },{
                title:"<spring:message code='mis.lbl.predictioncarprofit' />",
                headerAttributes:{ "class":"hasBob" },
                columns:[ {
                    field:"carProfitVal",
                    title:"<spring:message code='mis.lbl.carone' />(￥)",
                    width:150, format:"{0:n0}", attributes:{"class":"ar","style":"background-color:silver"}
                },{
                    field:"allProfitVal",
                    title:"<spring:message code='mis.lbl.carall' />(￥)",
                    width:150, format:"{0:n0}", attributes:{"class":"ar","style":"background-color:silver"}
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
                        url:"<c:url value='/mis/tds/insertCarlineProfitGridSave.do' />"
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
                            $('#carlinegrid').data('kendoExtGrid').dataSource.page(1);
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
            gridId:"G-MIS-0925-164111"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/mis/tds/selectProfitTargetGrid.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sMonitorProfitDate"] = $("#sMonitorProfitDate").val();

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
                            ,goalTargetYy:{type:"string", editable:false}
                            ,goalTargetMm:{type:"string", editable:false}
                            ,carlineTargetCd:{type:"string", editable:false}
                            ,carlineTargetNm:{type:"string", editable:false}
                            ,goalTargetPrefVal:{type:"number", editable:false}
                            ,goodsCarQty:{type:"number", editable:true}
                            ,goodsCarRate:{type:"number", editable:true}
                            ,goodsCarVal:{type:"number", editable:true}
                            ,insPassesRate:{type:"number", editable:true}
                            ,insCarProfitQty:{type:"number", editable:true}
                            ,insCarVal:{type:"number", editable:true}
                            ,fncPassesRate:{type:"number", editable:true}
                            ,fncCarProfitQty:{type:"number", editable:true}
                            ,fncCarVal:{type:"number", editable:true}
                            ,etcCarQty:{type:"number", editable:true}
                            ,etcCarVal:{type:"number", editable:true}
                            ,sumCarVal:{type:"number", editable:true}
                        }
                    }
                }
            }
            ,height:300
            ,filterable:false
            ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
            ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
            ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
            ,appendEmptyColumn:false           //빈컬럼 적용. default:false
            ,enableTooltip:false               //Tooltip 적용, default:false
            ,sortable:false
            ,selectable :"row"
            ,edit:function(e){
                var grid = this,

                fieldName = e.container.find("input[name][data-bind]").attr("name");

                if (e.model.carlineTargetCd == "TOTAL") {
                    if(fieldName=="goodsCarQty" || fieldName=="goodsCarRate" || fieldName=="goodsCarVal" || fieldName=="insPassesRate" || fieldName=="insCarProfitQty" || fieldName=="insCarVal" || fieldName=="fncPassesRate"
                        || fieldName=="fncCarProfitQty" || fieldName=="fncCarVal" || fieldName=="etcCarQty" || fieldName=="etcCarVal"){
                        this.closeCell();
                    }
                }

                if(fieldName=="goodsCarVal" || fieldName=="insCarVal" || fieldName=="fncCarVal" || fieldName=="etcCarVal" || fieldName=="sumCarVal"){
                    this.closeCell();
                }
            }
            , columns:[{
                title:"<spring:message code='mis.lbl.providecarinfo' />  / <spring:message code='mis.lbl.predictionprovideprofit' />",
                headerAttributes:{ "class":"hasBob" },
                columns:[ {
                    field:"carlineTargetNm",
                    title:"<spring:message code='mis.lbl.dealermodel' />" ,
                    width:150
                },{
                    field:"goalTargetPrefVal",
                    title:"<spring:message code='mis.lbl.salestargetcar' />",
                    width:150, format:"{0:n0}", attributes:{"class":"ar","style":"background-color:silver"}
                }]
            },{
                title:"<spring:message code='mis.lbl.localOption' />",
                headerAttributes:{ "class":"hasBob" },
                columns:[ {
                    field:"goodsCarQty",
                    title:"<spring:message code='mis.lbl.goodscarqty' />(￥)",
                    width:120, format:"{0:n0}", attributes:{"class":"ar"}
                        ,editor:function(container, options){
                            $('<input required name="goodsCarQty" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                 format:"n0"                // n0:###,###, n2:###,###.##
                                ,decimals:0                 // 소숫점
                                ,min:0
                                ,value:0
                                ,spinners:false
                                ,change:sumProfitTargetGrid
                            });
                            $('<span class="k-invalid-msg" data-for="goodsCarQty"></span>').appendTo(container);
                        }
                },{
                    field:"goodsCarRate",
                    title:"<spring:message code='mis.lbl.goodscarrate' />(%)",
                    width:120, format:"{0:n0}", attributes:{"class":"ar"}
                        ,editor:function(container, options){
                            $('<input required name="goodsCarRate" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                 format:"n0"                // n0:###,###, n2:###,###.##
                                ,decimals:0                 // 소숫점
                                ,min:0
                                ,value:0
                                ,spinners:false
                                ,change:sumProfitTargetGrid
                            });
                            $('<span class="k-invalid-msg" data-for="goodsCarRate"></span>').appendTo(container);
                        }
                },{
                    field:"goodsCarVal",
                    title:"<spring:message code='mis.lbl.profitAmt' />(￥)",
                    width:120, format:"{0:n0}", attributes:{"class":"ar","style":"background-color:silver"}
                }]
            },{
                title:"<spring:message code='mis.lbl.insurance' />",
                headerAttributes:{ "class":"hasBob" },
                columns:[ {
                    field:"insPassesRate",
                    title:"<spring:message code='mis.lbl.inspassesrate' />",
                    width:120, format:"{0:n0}", attributes:{"class":"ar"}
                        ,editor:function(container, options){
                            $('<input required name="insPassesRate" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                 format:"n0"                // n0:###,###, n2:###,###.##
                                ,decimals:0                 // 소숫점
                                ,min:0
                                ,value:0
                                ,spinners:false
                                ,change:sumProfitTargetGrid
                            });
                            $('<span class="k-invalid-msg" data-for="insPassesRate"></span>').appendTo(container);
                        }
                },{
                    field:"insCarProfitQty",
                    title:"<spring:message code='mis.lbl.inscarprofitqty' />(￥)",
                    width:120, format:"{0:n0}", attributes:{"class":"ar"}
                        ,editor:function(container, options){
                            $('<input required name="insCarProfitQty" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                 format:"n0"                // n0:###,###, n2:###,###.##
                                ,decimals:0                 // 소숫점
                                ,min:0
                                ,value:0
                                ,spinners:false
                                ,change:sumProfitTargetGrid
                            });
                            $('<span class="k-invalid-msg" data-for="insCarProfitQty"></span>').appendTo(container);
                        }
                },{
                    field:"insCarVal",
                    title:"<spring:message code='mis.lbl.profitAmt' />(￥)",
                    width:120, format:"{0:n0}", attributes:{"class":"ar","style":"background-color:silver"}
                }]
            },{
                title:"<spring:message code='mis.lbl.finc' />",
                headerAttributes:{ "class":"hasBob" },
                columns:[ {
                    field:"fncPassesRate",
                    title:"<spring:message code='mis.lbl.fncpassesrate' />",
                    width:120, format:"{0:n0}", attributes:{"class":"ar"}
                        ,editor:function(container, options){
                            $('<input required name="fncPassesRate" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                 format:"n0"                // n0:###,###, n2:###,###.##
                                ,decimals:0                 // 소숫점
                                ,min:0
                                ,value:0
                                ,spinners:false
                                ,change:sumProfitTargetGrid
                            });
                            $('<span class="k-invalid-msg" data-for="fncPassesRate"></span>').appendTo(container);
                        }
                },{
                    field:"fncCarProfitQty",
                    title:"<spring:message code='mis.lbl.fnccarprofitqty' />(￥)",
                    width:120, format:"{0:n0}", attributes:{"class":"ar"}
                        ,editor:function(container, options){
                            $('<input required name="fncCarProfitQty" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                 format:"n0"                // n0:###,###, n2:###,###.##
                                ,decimals:0                 // 소숫점
                                ,min:0
                                ,value:0
                                ,spinners:false
                                ,change:sumProfitTargetGrid
                            });
                            $('<span class="k-invalid-msg" data-for="fncCarProfitQty"></span>').appendTo(container);
                        }
                },{
                    field:"fncCarVal",
                    title:"<spring:message code='mis.lbl.profitAmt' />(￥)",
                    width:120, format:"{0:n0}", attributes:{"class":"ar","style":"background-color:silver"}
                }]
            },{
                title:"<spring:message code='mis.lbl.etcdefinecomment' />",
                headerAttributes:{ "class":"hasBob" },
                columns:[ {
                    field:"etcCarQty",
                    title:"<spring:message code='mis.lbl.etccarqty' />(￥)",
                    width:120, format:"{0:n0}", attributes:{"class":"ar"}
                        ,editor:function(container, options){
                            $('<input required name="etcCarQty" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                 format:"n0"                // n0:###,###, n2:###,###.##
                                ,decimals:0                 // 소숫점
                                ,min:0
                                ,value:0
                                ,spinners:false
                                ,change:sumProfitTargetGrid
                            });
                            $('<span class="k-invalid-msg" data-for="etcCarQty"></span>').appendTo(container);
                        }
                },{
                    field:"etcCarVal",
                    title:"<spring:message code='mis.lbl.profitAmt' />(￥)",
                    width:120, format:"{0:n0}", attributes:{"class":"ar","style":"background-color:silver"}
                }]
            },{
                title:"<spring:message code='mis.lbl.profitAmt' /><spring:message code='mis.lbl.total' />",
                headerAttributes:{ "class":"hasBob" },
                columns:[ {
                    field:"sumCarVal",
                    title:"<spring:message code='mis.lbl.total' />(￥)",
                    width:120, format:"{0:n0}", attributes:{"class":"ar","style":"background-color:silver"}
                }]
            }]
        });

        //버튼 - 저장
        $("#btnProfitSave").kendoButton({
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
                        url:"<c:url value='/mis/tds/insertProfitTargetSave.do' />"
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
                            $('#profittargetgrid').data('kendoExtGrid').dataSource.page(1);
                        }
                    });
                }else{
                    //입력값을 확인하여 주십시오.
                    dms.notification.warning("<spring:message code='global.info.check.input'/>");
                }
            }
        });

        /** 차형별 이익 설정 계산**/
        sumCarlineGrid = function(e){

            var grid = $("#carlinegrid").data("kendoExtGrid");
            var gridData = grid.dataSource._data;

            var selectedVal = grid.dataItem(grid.select());

            var productProfitVal = Number(selectedVal.productProfitVal);
            var settingProfitVal  = Number(selectedVal.settingProfitVal);
            var carProfitVal = Number(selectedVal.carProfitVal);
            var allProfitVal = Number(selectedVal.allProfitVal);
            var goalProfitPrefVal = Number(selectedVal.goalProfitPrefVal);

            var carProfitVal = Number((settingProfitVal - productProfitVal));
            selectedVal.set("carProfitVal",carProfitVal);

            var allProfitVal = Number((settingProfitVal - productProfitVal)*goalProfitPrefVal);
            selectedVal.set("allProfitVal",allProfitVal);

        };

        /** 이익목표 **/
        sumProfitTargetGrid = function(e){

            var grid = $("#profittargetgrid").data("kendoExtGrid");
            var gridData = grid.dataSource._data;

            var selectedVal = grid.dataItem(grid.select());

            var goalTargetPrefVal = Number(selectedVal.goalTargetPrefVal);

            var goodsCarQty  = Number(selectedVal.goodsCarQty);
            var goodsCarRate = Number(selectedVal.goodsCarRate);
            var goodsCarVal = Number(selectedVal.goodsCarVal);

            var insPassesRate  = Number(selectedVal.insPassesRate);
            var insCarProfitQty = Number(selectedVal.insCarProfitQty);
            var insCarVal = Number(selectedVal.insCarVal);

            var fncPassesRate  = Number(selectedVal.fncPassesRate);
            var fncCarProfitQty = Number(selectedVal.fncCarProfitQty);
            var fncCarVal = Number(selectedVal.fncCarVal);

            var etcCarQty = Number(selectedVal.etcCarQty);
            var etcCarVal = Number(selectedVal.etcCarVal);

            var sumCarVal = Number(selectedVal.sumCarVal);

            var goodsCarVal = Number((goodsCarQty*goodsCarRate)*goalTargetPrefVal);
            selectedVal.set("goodsCarVal",goodsCarVal);

            var insCarVal = Number((insPassesRate*insCarProfitQty)*goalTargetPrefVal);
            selectedVal.set("insCarVal",insCarVal);

            var fncCarVal = Number((fncPassesRate*fncCarProfitQty)*goalTargetPrefVal);
            selectedVal.set("fncCarVal",fncCarVal);

            var etcCarQty = Number((etcCarQty*goalTargetPrefVal));
            selectedVal.set("etcCarQty",etcCarQty);

            var sumCarVal = Number((goodsCarVal+insCarVal+fncCarVal+etcCarQty));
            selectedVal.set("sumCarVal",etcCarQty);

        };
    });

</script>