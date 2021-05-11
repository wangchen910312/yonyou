<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <!-- 품목전송리스트 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><%-- <spring:message code="par.title.itemList" /> --%><!-- 품목전송리스트 --></h1>
            <div class="btn_right">
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
                <button class="btn_m" id="btnItemAdd"><spring:message code="par.btn.addItem" /></button>
            </div>
        </div>
        <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
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
                    <tr class="hidden">
                        <th scope="row"><spring:message code="par.lbl.dlrCd" /><!-- 딜러코드 --></th>
                        <td>
                            <input type="text" id="sDlrCd"  readonly class="form_input form_readonly">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.spyrCd" /><!-- 로컬여부 --></th>
                        <td>
                            <input id="sSpyrCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 품목번호 --></th>
                        <td>
                            <input type="text" id="sItemCd" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 품목명 --></th>
                        <td>
                            <input type="text" id="sItemNm" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemDstinCd" /><!-- 품목구분 --></th>
                        <td>
                            <input id="sItemDstinCd" type="text" class="form_comboBox">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid mt10">
            <div id="gridItem" class="grid"></div>
        </div>

        <section class="group">
            <div class="header_area">
                <h1 class="title_basic"><spring:message code="par.title.itemList" /><!-- 품목전송리스트 --></h1>
                <div class="btn_right">
                    <button class="btn_m" id="btnItemSend"><spring:message code="par.btn.transmission" /></button>
                </div>
            </div>

            <div class="table_grid">
                <div id="gridItemSend" class="grid"></div>
            </div>
        </section>
    </section>
    <!-- //품목리스트 -->
<!-- script -->
<script>
        var spyrCdList             = [],
            itemDstinCdList        = [],
            itemDstinCdObj         = {},
            itemGroupObj           = {},
            stockUnitList          = [],
            storageList            = [],
            carlineCdList          = [],
            carlineCdObj           = {},
            abcIndObj              = {},
            comCarlineCdList       = [],
            brandCdList            = [],
            brandCdObj             = {},
            sucList                = [],
            parSpecCdList          = [],
            mobisImpLocalYnTpList  = [],
            selectCarlinePopupWindow,
            toDate,
            gCrud;

        toDate = new Date();

        storageList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${storageList}" varStatus="status">
            storageList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
        </c:forEach>

        spyrCdList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${spyrCdList}" varStatus="status">
            spyrCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>

        itemDstinCdList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${itemDstinCdList}" varStatus="status">
            itemDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            itemDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>


        <c:forEach var="obj" items="${itemGroupList}">
            if(itemGroupObj.hasOwnProperty("${obj.itemDstinCd}")){
                itemGroupObj["${obj.itemDstinCd}"].push({cmmCd:"${obj.itemGrpCd}", cmmCdNm:"${obj.itemGrpNm}"});
            }else{
                itemGroupObj["${obj.itemDstinCd}"] = [];
                itemGroupObj["${obj.itemDstinCd}"].push({cmmCd:"${obj.itemGrpCd}", cmmCdNm:"${obj.itemGrpNm}"});
            }
        </c:forEach>

        stockUnitList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${stockUnitList}" varStatus="status">
            stockUnitList.push({cmmCd:"${obj.unitExtCd}", cmmCdNm:"${obj.unitExtCd}"});
        </c:forEach>


        carlineCdList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${carlineCdList}" varStatus="status">
            carlineCdList.push({cmmCd:"${obj.carlineCd}", cmmCdNm:"${obj.carlineNm}"});
            comCarlineCdList.push({cmmCd:"${obj.carlineCd}", cmmCdNm:"${obj.carlineNm}"});
            carlineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
        </c:forEach>

        <c:forEach var="obj" items="${abcIndList}" varStatus="status">
            abcIndObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        brandCdList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${brandCdList}" varStatus="status">
            brandCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            brandCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        sucList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${sucList}" varStatus="status">
            sucList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>

        parSpecCdList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${parSpecCdList}" varStatus="status">
            parSpecCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>

        mobisImpLocalYnTpList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${mobisImpLocalYnTpList}" varStatus="status">
            mobisImpLocalYnTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>

    $(document).ready(function() {
        var validator = $("#itemForm").kendoExtValidator().data("kendoExtValidator");

        //조회조건 - 품목구분선택
        $("#sItemDstinCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:itemDstinCdList
            ,index:0
        });


        //조회조건 - 로컬여부선택
        $("#sSpyrCd").kendoExtDropDownList({
            enable:false
            ,dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:spyrCdList
            ,index:1
        });

        //품목구분선택
        $("#itemDstinCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:itemDstinCdList
            ,index:0
        });

        // 조회 버튼.
        $("#btnSearch").kendoButton({
            click:function(e){

                // 품목 마스터 조회.
                selectItemMasters();
            }
        });

        //부품추가
        $("#btnItemAdd").kendoButton({
            click:function(e){

                var gridItem = $("#gridItem").data("kendoExtGrid");
                var parData = gridItem.select();

                for(var i=0; i<parData.length; i++){
                    var data = gridItem.dataItem(parData[i]);

                    var itemCheckCnt = 0;
                    var grid = $("#gridItemSend").data("kendoExtGrid");
                    grid.tbody.find('>tr').each(function(){
                        var dataItem = grid.dataItem(this);
                        if(dataItem.dpsPno === data.itemCd && dataItem.dpsDlrCd === data.dlrCd){
                            itemCheckCnt++;
                        }

                    });

                    if(itemCheckCnt === 0){
                        var itemMasterSendVO = {
                            rnum:$('#gridItemSend').data('kendoExtGrid').dataSource.total()+1
                            ,dpsCrp:'BMP'
                            ,dpsCmpKnd:'H'
                            ,dpsDlrCd:data.dlrCd
                            ,dpsPno:data.itemCd
                            ,dpsEntTyp:'I'
                            ,dpsLoc:' '
                            ,dpsPnmChm:data.itemNm
                            ,dpsCar:' '
                            ,dpsOhadQt:0
                            ,dpsDpsQt:0
                            ,dpsBo:0
                            ,dpsOord:' '
                            ,dpsNonMov:'N'
                            ,dpsCls:' '
                            ,dpsAmd3:0
                            ,dpsAmd6:0
                            ,dpsAmd12:0
                            ,dpsDmdFrq:0
                            ,dpsOldPno:' '
                            ,dpsOldItc:'N'
                            ,dpsNewPno:' '
                            ,dpsNewItc:'N'
                            ,dpsQfp:0
                            ,ptrRtlPrice:0
                            ,dpsEaiFlg:'N'
                            ,dpsEaiErr :' '
                            ,regUsrId:' '
                            ,regDt:null
                            ,sendDt:null
                            ,ifresult:'N'
                            ,iffailmsg:' '
                            ,createdate:' '
                            ,updatedate:' '
                            ,ifRegDt:null
                            ,batStatCd:'N'
                            ,batRsltDt:null
                            ,batMesgCont:null
                        }
                        $('#gridItemSend').data('kendoExtGrid').dataSource.add(itemMasterSendVO).set("dirty", true);
                    }
                }
            }

        });

        //부품전송
        $("#btnItemSend").kendoButton({
            click:function(e){

                var grid = $("#gridItemSend").data("kendoExtGrid");
                var dateItems = [ ];
                var itemSendCnt = 0;
                var rows = grid.select();
                $.each(rows, function(idx, row){
                    //전송안된것만 가능
                    var item = grid.dataItem(row);
                    dateItems.push(item);
                    itemSendCnt++;
                });

                if (itemSendCnt === 0) {
                    dms.notification.info("<spring:message code = 'global.info.required.change'/>");
                    return;
                }

                var multiItemsMasterSends = { "insertList":[], "updateList" :dateItems, "deleteList":[]};

                $.ajax({
                    url:"<c:url value='/par/pmm/itemMaster/multiItemMasterStockSends.do' />",
                    data:JSON.stringify(multiItemsMasterSends),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    },
                    success:function(jqXHR, textStatus) {
                        grid.dataSource.read();
                        //success message
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });
            }
        });

        $("#itemDstinCd").on("change", function (){
            $("#itemGrpCd").data("kendoExtDropDownList").setDataSource(itemGroupObj[$(this).data("kendoExtDropDownList").value()]);
        });

        $("#gridItem").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/itemMaster/selectItemMasters.do' />"
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
                            params["sItemCd"] = $("#sItemCd").val();
                            params["sItemNm"] = $("#sItemNm").val();
                            params["sSpyrCd"] = $("#sSpyrCd").val();
                            params["sItemDstinCd"] = $("#sItemDstinCd").val();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,serverPaging:true
                ,schema:{
                     model:{
                        id:"itemCd"
                       ,fields:{
                            dlrCd        :{ type:"string" , validation:{required:true} }
                           ,itemCd       :{ type:"string" , validation:{required:true} }
                           ,itemNm       :{ type:"string" , validation:{required:true} }
                           ,itemDstinCd  :{ type:"string" }
                           ,brandCd      :{ type:"string" }
                           ,abcInd       :{ type:"string" }
                           ,carlineCd    :{ type:"string" }

                        }
                    }
                }
              }
            ,editable:false
            ,selectable:"row"
            ,pageable:{
                refresh:false
               ,pageSize:30
               ,pageSizes:[10, 20, 30, 50, 100]
               ,buttonCount:1
               ,input:false
             }
            ,scrollable:true
            ,sortable:false
            ,resizable:true
            ,height:196
            ,columns:[
                 {field:"rnum",   title:"<spring:message code='par.lbl.no' />", width:30, sortable:false, attributes:{"class":"ac"}}
                ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd' />", width:100}                 //품목 코드
                ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm' />", width:140}                //품목명
                ,{field:"itemDstinCd", title:"<spring:message code='par.lbl.itemDstinCd' />", template:'#= changeItemDstinCd(itemDstinCd)#', width:80 }                //품목구분
                ,{field:"brandCd", title:"<spring:message code='par.lbl.brand' />", template:'#= changeBrandCd(brandCd)#', width:80 }                //브랜드
                ,{field:"abcInd", title:"<spring:message code='par.lbl.abcInd' />",width:60 } //ABC CLASS
                ,{field:"carlineCd", title:"<spring:message code='par.lbl.carLine' />", template:'#= changeCarlineCd(carlineCd)#', width:100 }
                ,{title:""}
            ]
        });

        $("#gridItemSend").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/itemMaster/selectItemMasterSends.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            return kendo.stringify(params);
                        }
                    }
                }
                ,serverPaging:true
                ,schema:{
                     model:{
                        id:"dpsPno"
                       ,fields:{
                           rnum:{ type:"number" }
                           ,dpsCrp:{ type:"string" }
                           ,dpsCmpKnd:{ type:"string" }
                           ,dpsDlrCd:{ type:"string" }
                           ,dpsPno:{ type:"string" }
                           ,dpsEntTyp:{ type:"string" }
                           ,dpsLoc:{ type:"string" }
                           ,dpsPnmChm:{ type:"string" }
                           ,dpsCar:{ type:"string" }
                           ,dpsOhadQt:{ type:"string" }
                           ,dpsDpsQt:{ type:"string" }
                           ,dpsOord:{ type:"string" }
                           ,dpsNonMov:{ type:"string" }
                           ,dpsCls:{ type:"string" }
                           ,dpsAmd3:{ type:"string" }
                           ,dpsAmd6:{ type:"string" }
                           ,dpsAmd12:{ type:"string" }
                           ,dpsDmdFrq:{ type:"string" }
                           ,dpsOldPno:{ type:"string" }
                           ,dpsOldItc:{ type:"string" }
                           ,dpsNewPno:{ type:"string" }
                           ,dpsNewItc:{ type:"string" }
                           ,dpsQfp:{ type:"string" }
                           ,ptrRtlPrice:{ type:"string" }
                           ,dpsEaiFlg:{ type:"string" }
                           ,dpsEaiErr:{ type:"string" }
                           ,regUsrId:{ type:"string" }
                           ,regDt:{ type:"string" }
                           ,sendDt:{ type:"string" }
                           ,ifresult:{ type:"string" }
                           ,iffailmsg:{ type:"string" }
                           ,createdate:{ type:"string" }
                           ,updatedate:{ type:"string" }
                           ,ifRegDt:{ type:"string" }
                           ,batStatCd:{ type:"string" }
                           ,batRsltDt:{ type:"string" }
                           ,batMesgCont:{ type:"string" }
                        }
                    }
                }
            }
            ,editable:false
            ,selectable:"row"
            ,pageable:{
                refresh:false
               ,pageSize:30
               ,pageSizes:[10, 20, 30, 50, 100]
               ,buttonCount:1
               ,input:false
             }
            ,scrollable:true
            ,sortable:false
            ,resizable:true
            ,height:500
            ,multiSelectWithCheckbox:true
            ,columns:[
                 {field:"rnum",   title:"<spring:message code='par.lbl.no' />", width:30, sortable:false, attributes:{"class":"ac"}}
                ,{field:"dpsCrp", title:"법인코드", width:100}//법인코드
                ,{field:"dpsCmpKnd", title:"회사구분", width:100}//회사구분
                ,{field:"dpsPno", title:"부번", width:100}//부번
                ,{field:"dpsPnmChm", title:"품명(중문)", width:140}//품명(중문)
                ,{field:"dpsCar", title:"CAR MODEL", width:140}//CAR MODEL
                ,{field:"dpsEntTyp", title:"등록유형", width:140}//등록유형
                ,{field:"dpsLoc", title:"LOCATION", width:140}//LOCATION
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

        // 브랜드
        changeBrandCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = brandCdObj[val];
            }
            return returnVal;
        };

         // 품목 마스터 조회.
        function selectItemMasters(){
            $("#gridItem").data("kendoExtGrid").dataSource.page(1);
        }

        function initPage(){

            $("#sItemDstinCd").data("kendoExtDropDownList").value('02');

            $("#itemCd").attr("disabled", false);
            $("#itemNm").attr("disabled", false);

            $("#oldRplcItemCd").attr("disabled", false);
            $("#oldRplcParCmptYn").attr("disabled", false);
            $("#newRplcItemCd").attr("disabled", false);
            $("#newRplcParCmptYn").attr("disabled", false);

            $("#lastCmptItemCd").attr("disabled", false);

            gCrud = 'C';
        }

        function fnChkDateValue(e){
            var  elmt  = e.sender.element[0],
                 id    = elmt.id;

            id = '"#' + id +'"';

            if(this.value() == null){
                $(id).data("kendoExtMaskedDatePicker").value('');
            }
        }

        function comCarlinePopup() {
            selectCarlinePopupWindow = dms.window.popup({
                windowId:"selectCarlinePopupWindow"
                ,title:"<spring:message code='par.title.carlineSearch'/>"   // 차종 조회
                ,content:{
                    url:"<c:url value='/par/cmm/selectComCarlineListPopup.do'/>"
                    , data:{
                        "autoBind":false
                        ,"comCarlineNm":$("#comCarlineNm").val()
                        ,"callbackFunc":function(data){
                            if(data.length > 0){
                                var carNm;
                                for(var i = 0,dlen = data.length; i < dlen; i = i + 1){
                                    if(i === 0){
                                        carNm = data[i].carlineNm;
                                    }else{
                                        carNm = carNm + '|' + data[i].carlineNm;
                                    }

                                }
                                $("#comCarlineNm").val(carNm);
                            }
                           selectCarlinePopupWindow.close();
                        }
                    }
                }

            });
        }

        initPage();

    });
</script>
<!-- //script -->

