<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>

    <!-- 부품 조회 -->
<div id="resizableContainer">
    <div class="content">
        <section class="group">
            <div class="header_area">
                <h1 class="title_basic"><spring:message code="ser.title.packageMng" /><!-- 작업Package구성 --></h1>
                    <div class="btn_right">
                        <!-- 조회 버튼 -->
                        <button type="button" class="btn_m btn_search" id="btnSearch" ><spring:message code="global.btn.search" /><!-- 조회 --></button>
                        <button type="button" class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button>
                        <button type="button" class="btn_m " id="packageReg"><spring:message code="global.btn.packageReg" /></button>
                    </div>
            </div>
            <div id="tabstrip" class="tab_area mt0">
                <ul>
                    <li id="I"><spring:message code="ser.lbl.pakageReg" /></li>
                    <li id="M" class ="k-state-active"><spring:message code="ser.lbl.pakageMgn" /></li>
                </ul>
                <div class="table_form" role="search" data-btnid="btnSearch">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:12%;">
                            <col style="width:22%;">
                            <col style="width:12%;">
                            <col style="width:21%;">
                            <col style="width:12%;">
                            <col style="width:21%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.itemGubun" /></th><!-- 부품유형 -->
                                <td class="readonly_area">
                                    <input type="input" id="sItemDstinCd" name="sItemDstinCd" readonly style="width:100%" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.packageCd" /></th><!-- Package번호 -->
                                <td>
                                    <input type="input" id="sPkgRegItemCd" name="sPkgRegItemCd" class="form_input" style="width:100%" />
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.packageNm" /></th><!-- Package명 -->
                                <td>
                                    <input type="input" id="sPkgRegItemNm" name="sPkgRegItemNm" class="form_input" style="width:100%" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="table_grid mt10">
                        <!-- 그리드1 -->
                        <div id="pkgRegGrid" class="grid"></div>
                        <!-- 그리드1 -->
                    </div>
                </div>
                <div class="table_form" role="search" data-btnid="btnSearch">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:12%;">
                            <col style="width:22%;">
                            <col style="width:12%;">
                            <col style="width:21%;">
                            <col style="width:12%;">
                            <col style="width:21%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.ltsModelCd" /></th><!-- LTS MODEL CD -->
                                <td>
                                    <input type="input" id="sLtsModelCd" name="sLtsModelCd" style="width:100%" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.packageCd" /></th><!-- Package번호 -->
                                <td>
                                    <input type="input" id="sPkgMngItemCd" name="sPkgMngItemCd" class="form_input" style="width:100%">
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.packageNm" /></th><!-- Package명 -->
                                <td>
                                    <input type="input" id="sPkgMngItemNm" name="sPkgMngItemNm" class="form_input" style="width:100%" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="table_grid mt10">
                        <!-- 그리드1 -->
                        <div id="pkgMngGrid" class="grid"></div>
                        <!-- 그리드1 -->
                    </div>
                </div>
            </div>
        </section>
        <!-- // 부품 조회 -->
         <form id="packageForm">
             <div class="table_form mt10">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:12%;">
                        <col style="width:22%;">
                        <col style="width:12%;">
                        <col style="width:21%;">
                        <col style="width:12%;">
                        <col style="width:21%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code='ser.lbl.ltsModelCd' /></span></th>
                            <td >
                                <input type="input" id="ltsModelCd" name="ltsModelCd" required data-name="<spring:message code='ser.lbl.ltsModelCd' />" class="form_comboBox" data-json-obj="true" /> <!-- LTS MODEL CD -->
                            </td>
                            <th scope="row"></th>
                            <td></td>
                            <th scope="row"></th>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
             <!-- 그리드 시작 -->
            <div class="header_area">
                <h2 class="title_basic"><spring:message code="ser.title.lbrInfo" /></h2><!-- 공임정보 -->
                <div class="btn_right">
                    <button type="button" class="btn_s btn_add btn_s_min5" id="lbrBtnAdd" disabled><spring:message code="global.btn.add" /></button>
                    <button type="button" class="btn_s btn_add btn_s_min5" id="lbrBtnDel" disabled><spring:message code="global.btn.rowDel" /></button>
                    <button type="button" class="btn_s btn_cancel btn_s_min5" id="lbrBtnCancel" disabled><spring:message code="global.btn.cancel" /></button>
                </div>
            </div>
            <!-- 그리드 시작 -->
            <div class="table_grid">
                <div id="ltsGrid"></div>
            </div>

             <!-- 그리드 시작 -->
            <div class="header_area">
                <h2 class="title_basic"><spring:message code="ser.title.itemInfo" /></h2><!-- 부품정보 -->
                <div class="btn_right">
                    <button type="button" class="btn_s btn_add btn_s_min5" id="parBtnAdd" disabled><spring:message code="global.btn.add" /></button>
                    <button type="button" class="btn_s btn_add btn_s_min5" id="parBtnDel" disabled><spring:message code="global.btn.rowDel" /></button>
                    <button type="button" class="btn_s btn_cancel btn_s_min5" id="parBtnCancel" disabled><spring:message code="global.btn.cancel" /></button>
                </div>
            </div>
            <!-- 그리드 시작 -->
            <div class="table_grid">
                <div id="parGrid"></div>
            </div>
            <input type="hidden" id="pkgItemCd" name="pkgItemCd" data-json-obj="true" />
            <input type="hidden" id="pkgItemNm" name="pkgItemNm" data-json-obj="true" />
            <input type="hidden" id="pkgDocNo" name="pkgDocNo" data-json-obj="true" />
         </form>
    </div>
</div>
<!-- content -->


<script type="text/javascript">

    //품목구분 Array
    var itemDstinCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${itemDstinCdList}">
    itemDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    //품목구분 Map
    var itemDstinCdMap = dms.data.arrayToMap(itemDstinCdList, function(obj){ return obj.cmmCd; });

    //LTS MODEL 코드
    var ltsModelCdList =[];
    <c:forEach var="obj" items="${ltsModelDs}">
     ltsModelCdList.push({
         cmmCdNm:"${obj.ltsModelNm}"
         , cmmCd:"${obj.ltsModelCd}"});
    </c:forEach>
    var ltsMap = dms.data.arrayToMap(ltsModelCdList, function(obj){return obj.cmmCd;});



    var laborSearchPopup;
    var selectShareStockGiItemPopupWindow;
    var partsPackageRegPopupWindow;

    var pkgMngUrl = "<c:url value='/par/pmm/itemMaster/selectItemMasters.do' />";
    var pkgRegUrl = "<c:url value='/ser/svi/package/selectPackages.do' />";

    var pkgUrl =  "<c:url value='/par/pmm/itemMaster/selectItemMasters.do' />";
    var selectTabId = "M";
    var gridRow = 0;
    var selectedYn = false;

  //공통코드:임률정보
    var rateList = [];
    <c:forEach var ="obj" items="${rateDs}">
      rateList.push({
            rpirTp:"${obj.rpirTp}"
            , rpir01:"${obj.gnlRteRate}"
            , rpir02:"${obj.wartRteRate}"
            , rpir03:"${obj.incRteRate}"
            , rpir04:"${obj.intRteRate}"
            , rpir05:"${obj.rwrkRteRate}"
        });
    </c:forEach>


  //공통코드:정비유형(수리유형)
  var lbrTpCdList  = []; //기본 수리유형
  <c:forEach var="obj" items="${lbrTpCdList}">
      lbrTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
  </c:forEach>
  var lbrTpCdArr = dms.data.arrayToMap(lbrTpCdList, function(obj){return obj.cmmCd});



    $(document).ready(function() {


        //공임 팝업
        $("#lbrBtnAdd").kendoButton({
            click:function(e){
                if( dms.string.isEmpty($("#ltsModelCd").val())){
                    dms.notification.warning("<spring:message code='ser.lbl.ltsModelCd' var='ltsModelCd' /><spring:message code='global.info.check.field' arguments='${ltsModelCd}'/>");
                    return;
                }
                if( dms.string.isEmpty($("#pkgItemCd").val() ) ){
                    dms.notification.warning("<spring:message code='ser.lbl.packageCd' var='pkgItemCd' /><spring:message code='global.info.check.field' arguments='${pkgItemCd}'/>");
                    return;
                }


                laborSearchPopup = dms.window.popup({
                windowId:"lbrSearchPopup"
                ,height:400
                ,title:"<spring:message code='ser.title.lbrCdSearch' />"   // 공임조회
                ,content:{
                    url:"<c:url value='/ser/cmm/popup/selectLaborCodePopup.do'/>"
                    , data:{
                        "autoBind":false
                        ,"selectable":"multiple"
                        //,"sDlrCd":"${dlrCd}"
                        ,"sLtsModelCd":$("#ltsModelCd").val()
                        ,"callbackFunc":function(jsonObj){
                            if(jsonObj.length == 0){
                                return;
                            }else{
                                var grid = $('#ltsGrid').data('kendoExtGrid');
                                var dataItem = grid.dataSource._data;

                                $.each(jsonObj, function(idx, data){
                                    var checkVal = true;

                                    // 중복값 체크
                                    $.each(dataItem, function(idx, obj){
                                        if(data.lbrCd == obj.lbrCd){
                                            checkVal = false;
                                        }
                                    });

                                    if(checkVal){
                                        var copyData ={
                                                  dlrCd    :data.dlrCd
                                                , pkgItemCd:$("#pkgItemCd").val()
                                                , lbrCd    :data.lbrCd
                                                , lbrNm    :data.lbrNm
                                                , lbrQty   :data.lbrQty
                                                , lbrHm    :data.lbrHm
                                                , lbrPrc   :Number(serviceJs.setRpirRate(rateList, "01", data.lbrTp))
                                                , lbrTp   :data.lbrTp
                                                , lbrAmt   :Number( ( data.lbrQty * data.lbrHm  * data.lbrRate  ).toFixed(2))          // 공임금액
                                                , dstinCd : data.dstinCd

                                        };

                                        $('#ltsGrid').data('kendoExtGrid').dataSource.insert(copyData);
                                    }

                                });

                            }
                        }
                    }
                }

              });
            }
        });

        //부품팝업
        $("#parBtnAdd").kendoButton({
            click:function(e){
                if($("#pkgItemCd").val()==""){
                    dms.notification.warning("<spring:message code='ser.lbl.packageCd' var='pkgItemCd' /><spring:message code='global.info.check.field' arguments='${pkgItemCd}'/>");
                    return;
                }
                selectShareStockGiItemPopupWindow = dms.window.popup({
                windowId:"selectShareStockGiItemPopupWindow"
                ,title:"<spring:message code='par.title.itemInfo' />"   // 부품조회
                ,content:{
                    url:"<c:url value='/ser/cmm/popup/selectShareStockGiItemPopup.do'/>"
                    , data:{
                        "autoBind":true
                        ,"selectable":"multiple"
                        ,"sPrcTpYn" : "Y"
                        ,"callbackFunc":function(jsonObj){
                            if(jsonObj.length == 0){
                                return;
                            }else{
                                 var grid = $('#parGrid').data('kendoExtGrid');
                                 var dataItem = grid.dataSource._data;

                                $.each(jsonObj, function(idx, data){

                                    var checkVal = true;

                                    // 중복값 체크
                                    $.each(dataItem, function(idx, obj){
                                        if(data.itemCd == obj.pkgItemCd){
                                            checkVal = false;
                                        }
                                    });
                                    if(checkVal){

                                    var copyData ={
                                              dlrCd     : data.dlrCd
                                            , pkgItemCd : $("#pkgItemCd").val()
                                            , itemCd    : data.itemCd
                                            , itemNm    : data.itemNm
                                            , itemQty   : data.giQty
                                            , itemUnitCd: data.stockUnitCd
                                            , itemPrc   : data.salePrcAmt
                                            , itemAmt   : Number(  ( ( (data.giQty * data.salePrcAmt) )  ).toFixed(2) )
                                    };

                                    $('#parGrid').data('kendoExtGrid').dataSource.insert(copyData);
                                    }

                                });

                            }
                        }
                    }
                }

              });
            }
        });


      //부품 팝업 열기 함수.
      function selectPartsPackageRegPopupWindow(){

          partsPackageRegPopupWindow = dms.window.popup({
              windowId:"PackageRegPopup"
              , width:340
              , height:150
              , title:"<spring:message code='ser.lbl.pakageReg' />"   // 패키지 등록
              , content:{
                    url:"<c:url value='/par/cmm/selectPartsPackageRegPopup.do'/>"
                  , data:{
                      "type":""
                      , "autoBind"    :true
                      , "itemDstinCd" :'04'
                      , "selectable"  :"multiple"
                      , "callbackFunc":function(data){

                          $("#itemGrid").data("kendoExtGrid").dataSource.read()

                          partsPackageRegPopupWindow.close();
                      }
                  }
              }
          });
      }


       // 정비유형(수리유형)
       lbrTpCdGrid = function(val){
           var returnVal = "";
           if(val != null && val != ""){
               if(lbrTpCdArr[val] != undefined)
               returnVal = lbrTpCdArr[val].cmmCdNm;
           }
           return returnVal;
       }
         // 부품 구분
        itemDstinCdGrid = function(value){
            var returnVal = "";
            if( dms.string.strNvl(value) != ""){
                if(itemDstinCdMap[value] != undefined)
                    returnVal =  itemDstinCdMap[value].cmmCdNm;
            }
            return returnVal;
         };


         //LTSMODEL
         setLtsMap = function(value){
             var resultVal = "";
             if( dms.string.strNvl(value) != ""){
                 if(ltsMap[value] != undefined)
                 resultVal =  ltsMap[value].cmmCdNm;
             }
             return resultVal;
         };


      //조회조건 - 품목구분선택
        $("#sItemDstinCd").kendoExtDropDownList({
           dataTextField:"cmmCdNm"
          ,dataValueField:"cmmCd"
          ,dataSource:itemDstinCdList
          ,value:"04"
          //,index:2
        });

      //조회조건 - LTS MODEL CD
        $("#sLtsModelCd").kendoExtDropDownList({
           dataTextField:"cmmCdNm"
          ,dataValueField:"cmmCd"
          ,dataSource:ltsModelCdList
          ,template:"[#:cmmCd#]#:cmmCdNm#"
          ,valueTemplate:"[#:cmmCd#]#:cmmCdNm#"
          ,optionLabel:" "
        });

        $("#ltsModelCd").kendoExtDropDownList({
           dataTextField:"cmmCdNm"
          ,dataValueField:"cmmCd"
          ,dataSource:ltsModelCdList
          ,template:"[#:cmmCd#]#:cmmCdNm#"
          ,valueTemplate:"[#:cmmCd#]#:cmmCdNm#"
          ,optionLabel:" "
        });

      // 페키지 등록
        $("#packageReg").kendoButton({
          click:function(e) {
              //parent._createOrReloadTabMenu('<spring:message code="par.menu.partMaster" />'
              //        ,"<c:url value='/par/pmm/itemMaster/selectItemMasterMain.do'/>", "VIEW-D-10238");

              selectPartsPackageRegPopupWindow();
          }
        });

        initAll = function(e){

            $("#pkgItemCd").val("");
            $("#pkgItemNm").val("");
            $("#pkgDocNo").val("");
            $("#ltsModelCd").data("kendoExtDropDownList").value("");
            $("#ltsGrid").data("kendoExtGrid").dataSource.data([]);
            $("#parGrid").data("kendoExtGrid").dataSource.data([]);


        };


      //버튼 - 조회
        $("#btnSearch").kendoButton({

            click:function(e){

                if(selectTabId == "I"){
                    $("#pkgRegGrid").data("kendoExtGrid").dataSource.data([]);
                    $("#pkgRegGrid").data("kendoExtGrid").dataSource.page(1);

                }else{
                    $("#pkgMngGrid").data("kendoExtGrid").dataSource.data([]);
                    $("#pkgMngGrid").data("kendoExtGrid").dataSource.page(1);
                }

            }
        });

        //버튼 - 저장
        $("#btnSave").kendoButton({

            click:function(e) {


                var ltsGrid = $("#ltsGrid").data("kendoExtGrid");
                var parGrid = $("#parGrid").data("kendoExtGrid");

                var formSaveData = $("#packageForm").serializeObject( $("#packageForm").serializeArrayInSelector("[data-json-obj='true']") );
                var ltsGridData = ltsGrid.getCUDData("insertList", "updateList", "deleteList");
                var parGridData = parGrid.getCUDData("insertList", "updateList", "deleteList");

                if (ltsGrid.cudDataLength == 0 && parGrid.cudDataLength == 0 ) {
                    dms.notification.info("<spring:message code = 'global.info.required.change'/>");
                    return;
                }


                var params =  $.extend(
                       {"packageMasterVO":formSaveData}
                       ,{"packageLtsVO":ltsGridData}
                       ,{"packageParVO":parGridData}
                );


                if (ltsGrid.gridValidation() && parGrid.gridValidation()) {
                    $.ajax({
                        url:"<c:url value='/ser/svi/package/multiPackages.do' />",
                        data:JSON.stringify(params),
                        type:'POST',
                        dataType:'json',
                        contentType:'application/json',
                        error:function(jqXHR,status,error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
                        },
                        success:function(result, textStatus) {

                            $("#pkgDocNo").val(result);

                            $("#pkgMngGrid").data("kendoExtGrid").dataSource.data([]);
                            $("#pkgMngGrid").data("kendoExtGrid").dataSource.read();
                            ltsGrid.dataSource.data([]);
                            parGrid.dataSource.data([]);
                            ltsGrid.dataSource.page(1);
                            parGrid.dataSource.page(1);

                            //정상적으로 반영 되었습니다.
                            dms.notification.success("<spring:message code='global.info.success'/>");
                        }
                        ,beforeSend:function(xhr){
                            dms.loading.show($("#resizableContainer"));
                        }
                        ,complete:function(xhr,status){
                            dms.loading.hide($("#resizableContainer"));
                        }
                    });
                }else{
                    //입력값을 확인하여 주십시오.
                    dms.notification.warning("<spring:message code='global.info.check.input'/>");
                }
            }

        });

        //취소
        $("#lbrBtnCancel").kendoButton({
          click:function(e) {
              $('#ltsGrid').data('kendoExtGrid').cancelChanges();
          }
        });

        //취소
        $("#parBtnCancel").kendoButton({
          click:function(e) {
              $('#parGrid').data('kendoExtGrid').cancelChanges();
          }
        });

        /** 공임삭제  **/
        $("#lbrBtnDel").kendoButton({

          click:function (e){

              var grid = $("#ltsGrid").data("kendoExtGrid");
              var rows = grid.select();

              rows.each(function(index, row) {
                  grid.removeRow(row);
              });
          }

        });

        /** 부품삭제  **/
        $("#parBtnDel").kendoButton({

            click:function (e){

                var grid = $("#parGrid").data("kendoExtGrid");
                var rows = grid.select();

                rows.each(function(index, row) {
                    grid.removeRow(row);
                });
            }

        });


        /** 공임 계산**/
        calLaborAmt = function(e){
            // 공임 금액:수량 * 시간당 금액 * 단가
            var grid = $("#ltsGrid").data("kendoExtGrid");
            var gridData = grid.dataSource._data;

            var selectedVal = grid.dataItem(grid.select());


            var lbrQty = Number(selectedVal.lbrQty);
            var lbrHm  = Number(selectedVal.lbrHm);
            var lbrPrc = Number(selectedVal.lbrPrc);

            var lbrAmt = Number((lbrQty * lbrHm * lbrPrc ).toFixed(2));

            selectedVal.set("lbrAmt",lbrAmt);

        };

        /** 부품 계산**/
        calPartAmt = function(e){

            var grid = $("#parGrid").data("kendoExtGrid");
            var gridData = grid.dataSource._data;

            var selectedVal = grid.dataItem(grid.select());

            // ROUND ( ROUND ( 부품단가 * MARK UP * 수량  , 2) * TAX , 2)

            var itemQty  = Number(selectedVal.itemQty); //수량
            var itemPrc = Number(selectedVal.itemPrc); //단가
            var itemAmt = Number( ( itemPrc * itemQty ).toFixed(2)  );

            selectedVal.set("itemAmt",itemAmt);


        };

      //버튼설정
        setButtonEnable = function (sFlag){

            switch(sFlag){
                case "Y" :
                    $("#lbrBtnAdd").data("kendoButton").enable(true);
                    $("#lbrBtnDel").data("kendoButton").enable(true);
                    $("#lbrBtnCancel").data("kendoButton").enable(true);
                    $("#parBtnAdd").data("kendoButton").enable(true);
                    $("#parBtnDel").data("kendoButton").enable(true);
                    $("#parBtnCancel").data("kendoButton").enable(true);
                    break;
                case "N" :
                    $("#lbrBtnAdd").data("kendoButton").enable(false);
                    $("#lbrBtnDel").data("kendoButton").enable(false);
                    $("#lbrBtnCancel").data("kendoButton").enable(false);
                    $("#parBtnAdd").data("kendoButton").enable(false);
                    $("#parBtnDel").data("kendoButton").enable(false);
                    $("#parBtnCancel").data("kendoButton").enable(false);
                          break;
                default :
                    $("#lbrBtnAdd").data("kendoButton").enable(false);
                    $("#lbrBtnDel").data("kendoButton").enable(false);
                    $("#lbrBtnCancel").data("kendoButton").enable(false);
                    $("#parBtnAdd").data("kendoButton").enable(false);
                    $("#parBtnDel").data("kendoButton").enable(false);
                    $("#parBtnCancel").data("kendoButton").enable(false);

                    break;
            }
        };

        $("#pkgRegGrid").kendoExtGrid({
            gridId:"G-SER-1011-000125"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/ser/svi/package/selectPackageParSummary.do' />"
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
                            params["sPkgItemCd"] = $("#sPkgRegItemCd").val();
                            params["sPkgItemNm"] = $("#sPkgRegItemNm").val();
                            params["sItemDstinCd"] = $("#sItemDstinCd").data("kendoExtDropDownList").value();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,serverPaging:true
                ,schema:{
                     model:{
                        id:"itemCd"
                       ,fields:{
                            dlrCd :{ type:"string" , validation:{required:true} }
                           ,itemDstinCd:{ type:"string" , validation:{required:true} }
                           ,itemCd:{ type:"string" , validation:{required:true} }
                           ,itemNm:{ type:"string" , validation:{required:true} }
                        }
                    }
                }
              }
            ,editable:false
            ,autoBind:true
            ,selectable:"row"
            ,filterable:false                 // 필터링 기능 사용안함
            ,appendEmptyColumn:true
            ,change:function(e){
                var selectedItem = this.dataItem(this.select());
                if( selectedItem != null && selectedItem != 'undefined'){


                    setButtonEnable("Y"); //BUTTON 세팅
                    initAll();

                    $("#pkgItemCd").val(selectedItem.itemCd);
                    $("#pkgItemNm").val(selectedItem.itemNm);
                }


             }
            ,pageable:true
            ,scrollable:true
            ,sortable:false
            ,resizable:true
            ,height:170
            ,columns:[
                 {field:"rnum",   title:"<spring:message code='ser.lbl.no' />", width:70, sortable:false, attributes:{"class":"ac"}}
                ,{field:"itemDstinCd", title:"<spring:message code='ser.lbl.gubun' />", width:120, attributes:{"class":"ac"},template :"#= itemDstinCdGrid(itemDstinCd) #"}        //품목구분
                ,{field:"itemCd", title:"<spring:message code='ser.lbl.packageCd' />", width:200, attributes:{"class":"al"}}                 //품목 코드
                ,{field:"itemNm", title:"<spring:message code='ser.lbl.packageNm' />", width:350, attributes:{"class":"al"}}                //품목명
            ]
        });

        $("#pkgMngGrid").kendoExtGrid({
            gridId:"G-SER-0519-174417"
            ,dataSource:{
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
                            params["sLtsModelCd"] = $("#sLtsModelCd").data("kendoExtDropDownList").value();
                            params["sPkgItemCd"] = $("#sPkgMngItemCd").val();
                            params["sPkgItemNm"] = $("#sPkgMngItemNm").val();
                            params["sServPkgYn"] = "Y"

                            return kendo.stringify(params);
                        }
                    }
                }
                ,serverPaging:true
                ,schema:{
                     model:{
                        id:"rnum"
                       ,fields:{
                            rnum:{ type:"int"  }
                           ,dlrCd :{ type:"string" , validation:{required:true} }
                           ,pkgDocNo:{ type:"int"  }
                           ,ltsModelCd:{ type:"string"  }
                           ,itemDstinCd:{ type:"string" , validation:{required:true} }
                           ,pkgItemCd:{ type:"string" , validation:{required:true} }
                           ,pkgItemNm:{ type:"string" , validation:{required:true} }
                        }
                    }
                }
              }
            ,editable:false
            ,autoBind:false
            ,selectable:"row"
            ,filterable:false                 // 필터링 기능 사용안함
            ,appendEmptyColumn:true
            ,multiSelectWithCheckbox:true
            ,change:function(e){
                var selectedItem = this.dataItem(this.select());
                if( selectedItem != null && selectedItem != 'undefined'){

                    initAll();

                    $("#pkgItemCd").val(selectedItem.pkgItemCd);
                    $("#pkgItemNm").val(selectedItem.pkgItemNm);
                    $("#pkgDocNo").val(selectedItem.pkgDocNo);
                    $("#ltsModelCd").data("kendoExtDropDownList").value(selectedItem.ltsModelCd);

                    var params = {
                            "sPkgItemCd":$("#pkgItemCd").val()
                           ,"sPkgDocNo":$("#pkgDocNo").val()
                           ,"sLtsModelCd":$("#ltsModelCd").data("kendoExtDropDownList").value()
                    };

                     $.ajax({
                         url:"<c:url value='/ser/svi/package/selectPackagePars.do' />"
                        ,data:JSON.stringify(params)
                        ,type:"POST"
                        ,dataType:"json"
                        ,contentType:"application/json"
                        ,error:function(jqXHR,status,error) {
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                    }).done(function(result) {

                        $("#ltsGrid").data("kendoExtGrid").dataSource.data([]);
                        $("#parGrid").data("kendoExtGrid").dataSource.data([]);
                        $("#ltsGrid").data("kendoExtGrid").dataSource.read();
                        $("#parGrid").data("kendoExtGrid").dataSource.read();

                        setButtonEnable("Y");

                    });

                }


             }
            ,pageable:true
            ,scrollable:true
            ,sortable:false
            ,resizable:true
            ,height:170
            ,columns:[
                 {field:"rnum",   title:"<spring:message code='ser.lbl.no' />", width:70, sortable:false, attributes:{"class":"ac"}}
                ,{field:"ltsModelCd", title:"<spring:message code='ser.lbl.ltsModelCd' />", width:300, attributes:{"class":"al"}
                        ,template :"[#:ltsModelCd#]#= setLtsMap(ltsModelCd) #"
                  }        //품목구분
                ,{field:"pkgItemCd", title:"<spring:message code='ser.lbl.packageCd' />", width:200, attributes:{"class":"al"}}                 //품목 코드
                ,{field:"pkgItemNm", title:"<spring:message code='ser.lbl.packageNm' />", width:350, attributes:{"class":"al"}}                //품목명
            ]
        });


        //공임 설정
        $("#ltsGrid").kendoExtGrid({
            gridId:"G-SER-0519-174452"
            ,dataSource:{
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
                            params["sPkgDocNo"] = $("#pkgDocNo").val();
                            params["sLtsModelCd"] = $("#ltsModelCd").data("kendoExtDropDownList").value();
                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                     model:{
                        id:"rnum"
                       ,fields:{
                            rnum :{ type:"number" }
                           ,dlrCd :{ type:"string" }
                           ,pkgItemCd:{ type:"string"}
                           ,pkgDocNo:{ type:"int"}
                           ,lineNo:{ type:"string"}
                           ,lbrCd:{ type:"string",editable:false}
                           ,lbrNm:{ type:"string",editable:false}
                           ,lbrTp:{ type:"string",editable:false}
                           ,lbrQty:{ type:"number" }
                           ,lbrHm:{ type:"number",editable:false}
                           ,lbrPrc:{ type:"number",editable:false}
                           ,lbrRate:{ type:"number",editable:false}
                           ,lbrAmt:{ type:"number",editable:false}
                        }
                    }
                }
              }
            ,pageable:false
            ,height:100
            ,autoBind:false
            ,filterable:false                 // 필터링 기능 사용안함
            ,appendEmptyColumn:true
            ,multiSelectWithCheckbox:true
            ,edit:function(e){
                 var fieldName = $(e.container.find("input")[1]).attr("name");
                 if(fieldName=="lbrAmt"){
                     this.closeCell();
                 }
             }
            ,columns:[
                 {field:"rnum",   title:"<spring:message code='ser.lbl.no' />", width:70, sortable:false, attributes:{"class":"ac"}}
                ,{field:"lineNo", title:"<spring:message code='ser.lbl.no' />", width:70, sortable:false, attributes:{"class":"ac"},hidden:true}
                ,{field:"lbrCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:150,attributes:{"class":"al"}}//공임코드
                ,{field:"lbrTp", title:"<spring:message code='ser.lbl.lbrTp' />", width:150, attributes:{"class":"ac"}
                     ,template:"#=lbrTpCdGrid(lbrTp)#"
                }//공임유형
                ,{field:"lbrNm", title:"<spring:message code='ser.lbl.lbrNm' />", width:300,attributes:{"class":"al"}}//공임명
                ,{field:"lbrQty", title:"<spring:message code='ser.lbl.qty' />", width:120, attributes :{"class":"ar"}
                       ,format:"{0:n0}"
                       , editor:function(container, options){
                            $('<input required name="lbrQty" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                format:"n0"                // n0:###,###, n2:###,###.##
                               ,decimals:0                // 소숫점
                               ,min:1
                               ,value:0
                               ,spinners:false
                               ,change:calLaborAmt
                        });
                        $('<span class="k-invalid-msg" data-for="lbrQty"></span>').appendTo(container);
                     }
                }//수량
                ,{field:"lbrHm", title:"<spring:message code='ser.lbl.lbrTime' />", width:100, attributes:{"class":"ar"}
                      ,format:"{0:n2}"
                      ,editor:function(container, options){
                            $('<input required name="lbrHm" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                format:"{0:n2}"                // n0:###,###, n2:###,###.##
                               ,decimals:0.00                // 소숫점
                               ,min:0.00
                               ,spinners:false
                               ,change:calLaborAmt
                        });
                        $('<span class="k-invalid-msg" data-for="lbrHm"></span>').appendTo(container);
                     }
                }//
                ,{field:"lbrPrc", title:"<spring:message code='ser.lbl.prc' />", width:120, attributes:{"class":"ar"}
                        , format:"{0:n2}"
                        , editor:function(container, options){
                            $('<input required name="lbrPrc" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                format:"n2"                // n0:###,###, n2:###,###.##
                               ,decimals:0.00                // 소숫점
                               ,min:0.00
                               ,spinners:false
                               ,change:calLaborAmt
                        });
                        $('<span class="k-invalid-msg" data-for="lbrPrc"></span>').appendTo(container);
                     }
                }//단가
                ,{field:"lbrAmt", title:"<spring:message code='ser.lbl.amt' />", attributes:{"class":"ar"}, width:120,format:"{0:n2}"}//금액
                ,{field:"dstinCd" ,hidden : true}
            ]

        });


        //부품 설정
        $("#parGrid").kendoExtGrid({
            gridId:"G-SER-0519-174512"
            ,dataSource:{
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
                            params["sPkgDocNo"] = $("#pkgDocNo").val();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                     model:{
                        id:"rnum"
                       ,fields:{
                            rnum :{ type:"number" }
                           ,dlrCd :{ type:"string" }
                           ,itemCd:{ type:"string" , validation:{required:true} ,editable:false}
                           ,itemNm:{ type:"string" , validation:{required:true} ,editable:false}
                           ,pkgDocNo:{ type:"int"}
                           ,pkgItemCd:{ type:"string"}
                           ,lineNo:{ type:"string",editable:false}
                           ,itemQty:{ type:"number" }
                           ,itemUnitCd:{ type:"string",editable:false}
                           ,itemPrc:{ type:"number",editable:false}
                           ,itemAmt:{ type:"number",editable:true}
                        }
                    }
                }
              }
            ,height:100
            ,pageable:false
            ,autoBind:false
            ,filterable:false                 // 필터링 기능 사용안함
            ,appendEmptyColumn:true
            ,multiSelectWithCheckbox:true
            ,edit:function(e){
                var fieldName = $(e.container.find("input")[1]).attr("name");
                 if(fieldName=="itemAmt"){
                     this.closeCell();
                 }
             }
            ,columns:[
                 {field:"rnum",   title:"<spring:message code='ser.lbl.no' />", width:70, sortable:false, attributes:{"class":"ac"},hidden:false}
                ,{field:"lineNo", title:"<spring:message code='ser.lbl.no' />", width:70, sortable:false, attributes:{"class":"ac"}, hidden : true}
                ,{field:"itemCd", title:"<spring:message code='ser.lbl.itemCd' />", width:150 ,attributes:{"class":"al"} }//부품번호
                ,{field:"itemNm", title:"<spring:message code='ser.lbl.itemNm' />", width:300 ,attributes:{"class":"al"} }//부품명
                ,{field:"itemQty", title:"<spring:message code='ser.lbl.qty' />", width:120, attributes:{"class":"ar"}
                    , format:"{0:n0}"
                    , editor:function(container, options){
                            $('<input required name="itemQty" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                format:"n0"                // n0:###,###, n2:###,###.##
                               ,decimals:0                // 소숫점
                               ,min:1
                               ,value:0
                               ,spinners:false
                               ,change:calPartAmt
                        });
                        $('<span class="k-invalid-msg" data-for="itemQty"></span>').appendTo(container);
                     }

                }//수량
                ,{field:"itemUnitCd", title:"<spring:message code='ser.lbl.unitCd' />", width:120, attributes:{"class":"ac"}}//수량단위
                ,{field:"itemPrc", title:"<spring:message code='ser.lbl.prc' />", width:120,attributes:{"class":"ar"} ,format:"{0:n2}"}//단가
                ,{field:"itemAmt", title:"<spring:message code='ser.lbl.amt' />", attributes:{"class":"ar"}, width:120,format:"{0:n2}"}//금액
            ]

        });

        $("#tabstrip").kendoExtTabStrip({
            animation:false
            ,select:function(e) {
                selectTabId = e.item.id;
                var kendoTab = $("#tabstrip1").kendoExtTabStrip().data("kendoExtTabStrip");
            }
        });


    });


</script>
