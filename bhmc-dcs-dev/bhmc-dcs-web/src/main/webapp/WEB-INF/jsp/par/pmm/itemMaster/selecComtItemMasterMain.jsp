<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 일반부품설정 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><%-- <spring:message code="par.title.itemList" /> --%><!-- 품목리스트 --></h1>
            <div class="btn_right">
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
               <button class="btn_m btn_save" id="btnSave"><spring:message code="par.btn.save" /><!-- 저장 --></button>
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
            <!-- 그리드1 -->
            <div id="grid" class="grid"></div>
            <!-- 그리드1 -->
        </div>
    </section>

    <div class="header_area">
        <h2 class="title_basic"><spring:message code="par.title.comItemList" /><!-- 공용부품리스트 --></h2>
        <div class="btn_right">
            <button class="btn_s" id="itemPop"><spring:message code="par.btn.itemPop" /></button><!-- 부품팝업 -->
            <button class="btn_s" id="btnCopyFromExcel"><spring:message code="par.btn.copyFromExcel" /></button><!-- btnCopyFromExcel -->
            <button class="btn_s" id="btnExcelUpload"><spring:message code="par.btn.uploadExcel" /></button><!-- 파일업로드 -->
            <button type="button" class="btn_s btn_add" id="btnAdd"><spring:message code="global.btn.rowAdd" /></button><!-- 행추가 添加行 -->
            <button type="button" class="btn_s btn_del" id="btnDel"><spring:message code="global.btn.rowDel" /></button><!-- 행삭제?除行  -->
            </div>
        </div>
    <div class="table_grid mt10">
    <!-- 그리드2 -->
    <div id="gridItem" class="grid"></div>
    <!-- 그리드2 -->
    </div>
    <!-- //일반부품설정 -->
    <!-- script -->
    <script>

        var spyrCdList             = []
           ,itemDstinCdList        = []
           ,itemDstinCdObj         = {}
           ,carlineCdList          = []
           ,carlineCdObj           = {}
           ,comCarlineCdList       = []
           ,abcIndObj              = {}
           ,brandCdList            = []
           ,brandCdObj             = {}
           ,popItemObj             = {}
           ,searchItemPopupWindow
           ,itemKey;


        spyrCdList.push({cmmCd:"", cmmCdNm:" "});
        <c:forEach var="obj" items="${spyrCdList}" varStatus="status">
            spyrCdList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
        </c:forEach>

        itemDstinCdList.push({cmmCd:"", cmmCdNm:" "});
        <c:forEach var="obj" items="${itemDstinCdList}" varStatus="status">
            itemDstinCdList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
            itemDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        carlineCdList.push({cmmCd:"", cmmCdNm:" "});
        <c:forEach var="obj" items="${carlineCdList}" varStatus="status">
            carlineCdList.push({cmmCd:"${obj.carlineCd}", cmmCdNm:"${obj.carlineNm}"});
            comCarlineCdList.push({cmmCd:"${obj.carlineCd}", cmmCdNm:"${obj.carlineNm}"});
            carlineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
        </c:forEach>

        <c:forEach var="obj" items="${abcIndList}" varStatus="status">
            abcIndObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        brandCdList.push({cmmCd:"", cmmCdNm:" "});
        <c:forEach var="obj" items="${brandCdList}" varStatus="status">
            brandCdList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
            brandCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>


    $(document).ready(function() {

        //조회조건 - 품목구분선택
        $("#sItemDstinCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:itemDstinCdList
            ,index:0
        });


        //조회조건 - 로컬여부선택
        $("#sSpyrCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:spyrCdList
            ,index:0
        });

        //차종
        $("#carlineCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:carlineCdList
            ,index:0
        });


        //브랜드
        $("#brandCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:brandCdList
            ,index:0
        });

        //부품팝업
        $("#itemPop").kendoButton({

            click:function(e){

                var grid = $("#grid").data("kendoExtGrid")
                ,rows = grid.select();

                if(rows !== null){
                    if(rows.length < 1){
                        // 선택값이 없습니다.
                        dms.notification.warning("<spring:message code='global.info.unselected' />");
                        return false;
                    }
                }

                selectPartsMasterPopupWindow();
            }
        });

        // copyFromExcel 버튼.
        $("#btnCopyFromExcel").kendoButton({
            click:function(e){
                dms.notification.warning("<spring:message code='global.info.ready' />");
            }
        });

        // Excel upload 버튼.
        $("#btnExcelUpload").kendoButton({
            click:function(e){
                dms.notification.warning("<spring:message code='global.info.ready' />");
            }
        });

        //초기화버튼
        $("#btnInit").kendoButton({
            click:function(e){
                initPage();
            }
        });

        // 조회 버튼.
        $("#btnSearch").kendoButton({
            click:function(e){

                $("#grid").data("kendoExtGrid").dataSource.read();

            }
        });

         //버튼 - 추가
        $("#btnAdd").on('click', function(){
            var grid = $("#grid").data("kendoExtGrid")
               ,rows = grid.select();


            if(rows !== null){
                if(rows.length < 1){
                    // 선택값이 없습니다.
                    dms.notification.warning("<spring:message code='global.info.unselected' />");
                    return false;
                }
            }

            $('#gridItem').data('kendoExtGrid').dataSource.insert(0, {
                "itemCd"      :itemKey           //부품
               ,"comItemCd"   :''                //공용부품
               ,"comItemNm"   :''                //공용품목명
               ,"avlbStockQty":0                 //가용재고
               ,"carlineCd"   :''                //차종
               ,"itemDstinCd" :''                //품목구분
               ,"remark"      :''                //비고
            });
        });


        //버튼 - 삭제
        $("#btnDel").kendoButton({
          click:function(e){
              var grid = $("#gridItem").data("kendoExtGrid")
                 ,rows = grid.select();

              if(rows.length == 0){
                  dms.notification.warning("<spring:message code='global.info.unselected' />");
                  return false;
              }
              console.log("popItemObj",popItemObj);
              rows.each(function(index, row) {
                  var l_rowData = grid.dataItem(row);
                  delete popItemObj[l_rowData.comItemCd];
              });

              rows.each(function(index, row) {
                  grid.removeRow(row);
              });

           }
        });


        //버튼 - 저장
        $("#btnSave").kendoButton({
            click:function(e) {

                var grid = $("#gridItem").data("kendoExtGrid");
                var rows = grid.tbody.find("tr");
                var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

                if (grid.cudDataLength == 0) {
                    //변경된 정보가 없습니다.
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return;
                }

                rows.each(function(index, row) {
                    var gridData = grid.dataSource.at(index);

                    if(dms.string.isEmpty(gridData.comItemCd)){
                      //공용부품은 필수 입력 사항입니다.
                        dms.notification.warning("<spring:message code='par.lbl.comItemCd' var='comItemCd' /><spring:message code='global.info.required.field' arguments='${comItemCd}'/>");
                        return false;
                    }
                });


                console.log("saveData:",JSON.stringify(saveData));
                if (grid.gridValidation()) {
                    $.ajax({
                        url:"<c:url value='/par/pmm/multiUpdateComItemCd.do' />"
                        ,data:JSON.stringify(saveData)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,success:function() {
                            console.log("arguments:",arguments);

                            grid.dataSource._destroyed = [];
                            grid.dataSource.page(1);

                            //정상적으로 반영 되었습니다.
                            dms.notification.success("<spring:message code='global.info.success'/>");
                        }
                        ,error:function(jqXHR, status, error) {
                            console.log("error");
                            //dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                    });
                }else{
                    //입력값을 확인하여 주십시오.
                    dms.notification.warning("<spring:message code='global.info.check.input'/>");
                }



            }
        });


        $("#grid").kendoExtGrid({
            dataSource:{
               transport:{
                    read:{
                        url:"<c:url value='/par/pmm/comItemMastersList.do' />"
                    }
                    , parameterMap:function(options, operation) {
                      if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;


                        params["sItemCd"]       = $("#sItemCd").val();
                        params["sItemNm"]       = $("#sItemNm").val();
                        params["sSpyrCd"]       = $("#sSpyrCd").data("kendoExtDropDownList").value();;
                        params["sItemDstinCd"]  = $("#sItemDstinCd").data("kendoExtDropDownList").value();;

                        console.log('param:', kendo.stringify(params));
                        return kendo.stringify(params);
                    }
                }
                }
                ,serverPaging:true
                ,schema:{
                    data:function (result){
                        if(result.total === 0){
                            dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                        }
                        return result.data;
                    }
                    ,model:{
                       id:"itemMasterList"
                      ,fields:{
                           dlrCd        :{ type:"string" }
                          ,rnum         :{ type:"number" }
                          ,itemCd       :{ type:"string" }
                          ,itemNm       :{ type:"string" }
                          ,itemDstinCd  :{ type:"string" }
                          ,brandCd      :{ type:"string" }
                          ,abcInd       :{ type:"string" }
                          ,carlineCd    :{ type:"string" }
                        }
                    }
                }
            }
            , editable   :false
            , selectable :"row"
            , change     :function(e){
                //gridItem Data Set
                var selectedItem = this.dataItem(this.select());
                itemKey = '';
                itemKey = selectedItem.itemCd;
                popItemObj = {};

                $("#gridItem").data("kendoExtGrid").dataSource.read();
            }
            , pageable   :{
                            refresh:false
                           ,pageSize:30
                           ,pageSizes:[10, 20, 30, 50, 100]
                           ,buttonCount:1
                           ,input:false
             }
            , scrollable :true
            , sortable   :false
            , resizable  :true
            , height     :196
            , dataBinding:function(e){
                            rowNumber = 0;
            }
            , columns:[
                  {   //No
                      field     :"rnum"
                     ,title     :"<spring:message code='par.lbl.no'  />"
                     ,attributes:{"class":"ac"}
                     ,sortable  :false
                     ,width     :30}
                 ,{   //딜러코드
                      field     :"dlrCd"
                     ,title     :"<spring:message code='par.lbl.dlrCd' />"
                     ,hidden    :true
                     ,width     :100}
                 ,{   //품목코드
                      field    :"itemCd"
                     ,title    :"<spring:message code='par.lbl.itemCd' />"
                     ,width    :100 }
                 ,{   //품목명
                      field    :"itemNm"
                     ,title    :"<spring:message code='par.lbl.itemNm' />"
                     ,width    :140 }
                 ,{   //브랜드
                      field     :"brandCd"
                     ,title     :"<spring:message code='par.lbl.brand' />"
                     ,template:'#= changeBrandCd(brandCd)#'
                     ,attributes:{"class":"ac"}
                     ,width     :80}
                 ,{   //차종
                      field     :"carlineCd"
                     ,title     :"<spring:message code='par.lbl.carLine' />"
                     ,attributes:{"class":"ac"}
                     ,template:'#= changeCarlineCd(carlineCd)#'
                     ,width     :100}
                 ,{   //품목구분
                      field    :"itemDstinCd"
                     ,title    :"<spring:message code='par.lbl.itemDstinCd' />"
                     ,attributes:{"class":"ac"}
                     ,template:'#= changeItemDstinCd(itemDstinCd)#'
                     ,width    :80 }
                 ,{   //ABC CLASS
                      field     :"abcInd"
                     ,title     :"<spring:message code='par.lbl.abcInd' />"
                     ,attributes:{"class":"ac"}
                     ,template:'#= changeAbcInd(abcInd)#'
                     ,width     :60}
                , { field:"" }
            ]
        });

     // 품목 그리드
        $("#gridItem").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/comItemMaster.do' />"
                    }
                  , parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["sort"]                 = options.sort;
                        params["sItemCd"]              = itemKey;

                        console.log("params :", JSON.stringify(params));
                        return kendo.stringify(params);
                    }
                }
                }
                ,schema:{
                    data:function (result){
                        if(result.total === 0 ){
                            dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                        }else{
                            var dataLen = result.data.length;
                            for(var i = 0; i < dataLen; i = i + 1){
                                popItemObj[result.data[i].comItemCd] = result.data[i].comItemNm;;
                        }
                        return result.data;
                        }
                    }
                    ,model:{
                         id:"comItemCd"
                        ,fields:{
                             itemCd         :{ type:"string" }  //부품번호
                            ,comItemCd      :{ type:"string" }  //공용품목코드
                            ,comItemNm      :{ type:"string" }  //공용품목명
                            ,avlbStockQty   :{ type:"number" }  //가용재고
                            ,carlineCd      :{ type:"string" }  //차종
                            ,itemDstinCd    :{ type:"string" }  //품목구분
                            ,remark         :{ type:"string" }  //비고
                        }
                    }
                }
            }
            , multiSelectWithCheckbox:true
            , scrollable :true
            , autoBind   :false
            , pageable   :false
            , edit       :function(e){
                var pVal
                ,orgVal
                ,grid         = this
                ,rows         = e.sender.select()
                ,selectedItem = e.sender.dataItem(rows[0])
                ,eles         = e.container.find("input")
                ,input        = e.container.find(".k-input")
                ,fieldName    = grid.columns[e.container.index()].field;

                if( fieldName ===  "comItemNm" || fieldName === "avlbStockQty" || fieldName === "carlineCd" || fieldName === "itemDstinCd" ){
                    this.closeCell();
                }else if(fieldName === "remark"){
                    console.log('fieldName~:',fieldName);
                    $(".grid-checkbox-item[data-uid=" + e.model.uid + "]").prop("checked", true);
                }else if(fieldName  === "comItemCd"){

                    pVal   = input.val(); //기존 입력값
                    orgVal = input.val(); //새로 입력값

                    //사용자 입력 값
                    input.keyup(function(){
                        pVal = input.val();
                    });

                    //포커스 사라질 때
                    input.blur(function(){

                        console.log('a:',pVal, orgVal);
                        console.log('a:',popItemObj);

                        if(orgVal !== pVal){

                            if(popItemObj.hasOwnProperty(pVal)){
                            //(1)이미 등록되어있는 부품입니다.
                                var itemInfo = pVal;
                                dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                                e.model.set('comItemCd', orgVal);

                                return false;


                            }else if(pVal === itemKey){
                              //(2) itemCd와 comItemcd가 동일한 부품입니다.

                                dms.notification.warning("<spring:message code='par.info.duplicateSelection' />");
                                e.model.set('comItemCd', orgVal);

                                return false;
                            }
                             //(3)부품 정보 가져오기
                            $.ajax({
                                url:"<c:url value='/par/pmm/itemMaster/selectSalePrcItemrcByKey.do'/>"
                               ,data:kendo.stringify({sItemCd:pVal})
                               ,type:'POST'
                               ,dataType:'json'
                               ,contentType:'application/json'
                               ,async:false
                               ,success:function(result) {

                                   console.log('result:',result);
                                   if (result.total === 1) {

                                       e.model.set('comItemCd', result.data[0].itemCd);           //부품코드
                                       e.model.set('comItemNm', result.data[0].itemNm);           //부품명

                                       delete popItemObj[orgVal];
                                       popItemObj[pVal] = pVal;

                                   } else {
                                       dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                                       e.model.set('comItemCd', orgVal);
                                   }
                               }
                               ,error:function(jqXHR,status,error) {
                                   dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                   e.model.set('comItemCd', orgVal);
                               }

                           });
                        };
                    });
                }


            }
            , columns:[

                  {   //품목코드
                      field    :"itemCd"
                     ,hidden    :true
                     ,title    :"<spring:message code='par.lbl.itemCd' />"
                     ,width    :100 }
                 ,{   //공용부품
                      field    :"comItemCd"
                     ,title    :"<spring:message code='par.lbl.comItemCd' />"
                     ,width    :100 }
                 ,{   //공용품목명
                      field    :"comItemNm"
                     ,title    :"<spring:message code='par.lbl.comItemNm' />"
                     ,width    :140 }
                 ,{   //가용재고
                      field     :"avlbStockQty"
                     ,title     :"<spring:message code='par.lbl.avlbStockQty' />"
                     ,attributes:{"class":"ar"}
                     ,format    :"{0:n2}"
                     ,width     :80 }
                 ,{   //차종
                      field     :"carlineCd"
                     ,title     :"<spring:message code='par.lbl.carLine' />"
                     ,template:'#= changeCarlineCd(carlineCd)#'
                     ,width     :100}
                 ,{   //품목구분
                      field    :"itemDstinCd"
                     ,title    :"<spring:message code='par.lbl.itemDstinCd' />"
                     ,template:'#= changeItemDstinCd(itemDstinCd)#'
                     ,width    :80 }
                 ,{   //비고
                      field    :"remark"
                     ,title    :"<spring:message code='global.lbl.remark' />"
                     ,width    :250 }
                , { field:"" }
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

        initPage();

    });

    function initPage(){
        //그리드 reset
        $("#grid").data("kendoExtGrid").dataSource.data([]);
        $("#gridItem").data("kendoExtGrid").dataSource.data([]);
        //그리드 reset
        $("#sItemCd").val("");
        $("#sItemNm").val("");
        $("#sItemDstinCd").data("kendoExtDropDownList").value('');
        $("#sSpyrCd").data("kendoExtDropDownList").value('');
        popItemObj = {};
    }

    //부품 팝업 열기 함수
    function selectPartsMasterPopupWindow(){

        searchItemPopupWindow = dms.window.popup({
           windowId:"ItemMasterPopup"
           ,title  :"<spring:message code='par.title.partSearch' />" // 부품 조회
           ,content:{
               url :"<c:url value='/par/cmm/selectSearchItemPopup.do' />"
              ,data:{
                  "type"        :""
                 ,"autoBind"    :true
                 ,"selectable"  :"multiple"
                 ,"callbackFunc":function(data){

                     var dataLen      = data.length
                        ,gridData     = $("#gridItem").data("kendoExtGrid")
                        //,data         = gridData.dataSource.at()
                        ,dataItem
                        ,popItemData  = {}
                        ,itemList     = []
                        ,tDate
                        ,rows;


                     for(var i = 0; i < dataLen; i = i + 1){

                         popItemData.itemCd          = itemKey;
                         popItemData.comItemCd       = data[i].itemCd;
                         popItemData.comItemNm       = data[i].itemNm;
                         popItemData.carlineCd       = data[i].carlineCd;
                         popItemData.itemDstinCd     = data[i].itemDstinCd;
                         popItemData.avlbStockQty    = data[i].avlbStockQty;
                         popItemData.remark          = '';

                         if(popItemObj.hasOwnProperty(data[i].itemCd)){
                             //(1) 중복 체크
                             var itemInfo = data[i].itemCd + '[' + data[i].itemNm + ']';
                             dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                         }else if([data[i].itemCd] == itemKey){
                             //(2) itemCd와 comItemcd가 동일한 부품입니다.
                             dms.notification.warning("<spring:message code='par.info.duplicateSelection' />");
                         }else{
                             popItemObj[data[i].itemCd] = data[i].itemNm;

                             gridData.dataSource.insert(0, {});

                             dataItem = $("#gridItem").data("kendoExtGrid").dataSource.data()[0];
                             console.log("dataItem BEFOR",dataItem);
                             dataItem.set('itemCd', itemKey);
                             dataItem.set('comItemCd', data[i].itemCd);
                             dataItem.set('comItemNm', data[i].itemNm);
                             dataItem.set('carlineCd', data[i].carlineCd);
                             dataItem.set('itemDstinCd', data[i].itemDstinCd);
                             dataItem.set('itemDstinCd', data[i].itemDstinCd);
                             dataItem.set('remark','');

                             console.log("dataItem:",dataItem);

                         }

                             console.log("popItemObj",popItemObj);
                         }

                        searchItemPopupWindow.close();
                 }

              }
           }
        });
    }

</script>
<!-- //script -->

