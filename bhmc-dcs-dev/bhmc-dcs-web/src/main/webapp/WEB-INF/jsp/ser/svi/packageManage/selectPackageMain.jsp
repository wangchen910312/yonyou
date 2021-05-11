<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- content -->
<section class="group">
        <!-- 부품 조회 -->
        <section class="group">
            <div class="header_area">
                <h1 class="title_basic"><spring:message code="ser.title.packageMng" /><!-- 작업Package구성 --></h1>
                    <div class="btn_right">
                        <!-- 조회 버튼 -->
                        <button type="button" id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /><!-- 조회 --></button>
                        <button type="button" class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button>
                        <button type="button" class="btn_m " id="packageReg"><spring:message code="global.btn.packageReg" /></button>
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
                        <%-- <tr class="hidden">
                            <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.dlrCd" /><!-- 딜러코드 --></span></th>
                            <td>
                                <input id="dlrCd" name="dlrCd" value="" class="form_input" style="width:100%">
                                <input type="hidden" id="InsertUpdateFlag" value="INSERT" />
                                <input id="itemCd" name="itemCd" value="" class="form_input form_readonly" style="width:100%">
                            </td>
                        </tr> --%>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.itemGubun" /><!-- 부품유형 --></th>
                            <td>
                                <input id="sItemDstinCd" name="sItemDstinCd" style="width:100%" class="form_comboBox">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.packageCd" /><!-- Package번호 --></th>
                            <td>
                                <input id="sItemCd" name="sItemCd" class="form_input" style="width:100%">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.packageNm" /><!-- Package명 --></th>
                            <td>
                                <input id="sItemNm" name="sItemNm" class="form_input" style="width:100%" />
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
            <h2 class="title_basic"><spring:message code="ser.title.lbrInfo" /></h2><!-- 공임정보 -->
            <div class="btn_right">
                <button class="btn_s btn_add" id="lbrBtnAdd"><spring:message code="global.btn.rowAdd" /></button>
                <button class="btn_s btn_add" id="lbrBtnDel"><spring:message code="global.btn.rowDel" /></button>
                <button class="btn_s btn_cancel" id="lbrBtnCancel"><spring:message code="global.btn.cancel" /></button>
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
                <button class="btn_s btn_add" id="parBtnAdd"><spring:message code="global.btn.rowAdd" /></button>
                <button class="btn_s btn_add" id="parBtnDel"><spring:message code="global.btn.rowDel" /></button>
                <button class="btn_s btn_cancel" id="parBtnCancel"><spring:message code="global.btn.cancel" /></button>
            </div>
        </div>
        <!-- 그리드 시작 -->
        <div class="table_grid">
            <div id="parGrid"></div>
        </div>
</section>

<form id="packageForm">
    <input type="hidden" id="pkgItemCd" name="pkgItemCd" />
    <input type="hidden" id="pkgItemNm" name="pkgItemNm" />
    <!-- <input type="hidden" id="dlrCd" name="dlrCd" /> -->
</form>
<!-- content -->


<script type="text/javascript">

var gVatCd = Number("${vatCd}");

if(dms.string.isEmpty(gVatCd)){
    console.log('gVatCd 값 없음!');
    gVatCd = .16;
}
console.log('gVatCd:',gVatCd);

//지점
/* var loginDlrCd      = "${dlrCd}";
$("#bpTp").kendoExtDropDownList({

}); */

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




var laborSearchPopup;
var itemSalePrcPopupWindow;

$("#lbrBtnAdd").kendoButton({
    click:function(e){
        if($("#pkgItemCd").val()==""){
            dms.notification.warning("<spring:message code='ser.lbl.packageCd' var='pkgItemCd' /><spring:message code='global.info.check.field' arguments='${pkgItemCd}'/>");
            return;
        }
        laborSearchPopup = dms.window.popup({
        windowId:"lbrSearchPopup"
        ,title:"<spring:message code='ser.title.lbrCdSearch' />"   // 공임조회
        ,content:{
            url:"<c:url value='/ser/cmm/popup/selectLaborCodePopup.do'/>"
            , data:{
                "autoBind":false
                ,"selectable":"multiple"
                //,"sDlrCd":"${dlrCd}"
                ,"sLtsModelCd":"HP**A"
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
                                var lbrPrc = (data.dstinCd == "H") ? data.lbrRate02:data.lbrRate01;
                                var copyData ={
                                          dlrCd    :data.dlrCd
                                        , pkgItemCd:$("#pkgItemCd").val()
                                        , lbrCd    :data.lbrCd
                                        , lbrNm    :data.lbrNm
                                        , lbrQty   :data.lbrQty
                                        , lineNo   :$('#ltsGrid').data('kendoExtGrid').dataSource.data().length+1
                                        , lbrHm    :data.lbrHm
                                        , lbrPrc   :lbrPrc
                                        , lbrAmt   :Number( ( data.lbrQty * data.lbrHm  * lbrPrc  ).toFixed(2))          // 공임금액

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

$("#parBtnAdd").kendoButton({
    click:function(e){
        if($("#pkgItemCd").val()==""){
            dms.notification.warning("<spring:message code='ser.lbl.packageCd' var='pkgItemCd' /><spring:message code='global.info.check.field' arguments='${pkgItemCd}'/>");
            return;
        }
        itemSalePrcPopupWindow = dms.window.popup({
        windowId:"parSearchPopup"
        ,title:"<spring:message code='par.title.partSearch' />"   // 부품조회
        ,content:{
            url:"<c:url value='/par/cmm/selectItemSalePrcPopup.do'/>"
            , data:{
                "autoBind":true
                ,"selectable":"multiple"
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
                                      dlrCd     :data.dlrCd
                                    , pkgItemCd :$("#pkgItemCd").val()
                                    , itemCd    :data.itemCd
                                    , itemNm    :data.itemNm
                                    , itemQty   :1
                                    , lineNo    :$('#parGrid').data('kendoExtGrid').dataSource.data().length+1
                                    , itemUnitCd:data.stockUnitCd
                                    , itemPrc   :data.salePrcAmt
                                    , itemAmt   :Number(  ( ( (1 * data.salePrcAmt * ( 1 + gVatCd )).toFixed(2) ) * ( 1 + gVatCd )  ).toFixed(2) )
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

$(document).ready(function() {





  //조회조건 - 품목구분선택
  $("#sItemDstinCd").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
      ,dataValueField:"cmmCd"
      ,dataSource:itemDstinCdList
      ,index:4
  });

  // 페키지 등록
  $("#packageReg").kendoButton({
      click:function(e) {
          parent._createOrReloadTabMenu('<spring:message code="par.menu.partMaster" />'
                  ,"<c:url value='/par/pmm/itemMaster/selectItemMasterMain.do'/>", "VIEW-I-10200");
      }
  });

  //버튼 - 저장
  $("#btnSave").kendoButton({
    click:function(e) {


        var ltsGrid = $("#ltsGrid").data("kendoExtGrid");
        var parGrid = $("#parGrid").data("kendoExtGrid");


        var formSaveData = $("#packageForm").serializeObject();
        var ltsGridData = ltsGrid.getCUDData("insertList", "updateList", "deleteList");
        var parGridData = parGrid.getCUDData("insertList", "updateList", "deleteList");



       var params =  $.extend(
               {"packageMasterVO":formSaveData}
               ,{"packageLtsVO":ltsGridData}
               ,{"packageParVO":parGridData}
        );

        if (ltsGrid.cudDataLength == 0 && parGrid.cudDataLength == 0 ) {
            dms.notification.info("<spring:message code = 'global.info.required.change'/>");
            return;
        }

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
                success:function(jqXHR, textStatus) {

                    //ltsGrid.dataSource._destroyed = [];
                    //parGrid.dataSource._destroyed = [];
                    ltsGrid.dataSource.data([]);
                    parGrid.dataSource.data([]);
                    ltsGrid.dataSource.page(1);
                    parGrid.dataSource.page(1);
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

   $("#btnSearch").kendoButton({
        click:function(){

            $("#itemGrid").data("kendoExtGrid").dataSource.data([]);
            $("#ltsGrid").data("kendoExtGrid").dataSource.data([]);
            $("#parGrid").data("kendoExtGrid").dataSource.data([]);
            $("#itemGrid").data("kendoExtGrid").dataSource.read();
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
      //  var itemTax = Number(selectedVal.itemTax);
      //  var itemMarkup = Number(selectedVal.itemMarkup);
        var itemTax = ( 1 + gVatCd );
        var itemMarkup = ( 1 + gVatCd );
        var itemPrc = Number(selectedVal.itemPrc); //단가
        var itemAmt = Number( ( (itemPrc * itemMarkup * itemQty).toFixed(2) * itemTax).toFixed(2)  );

        selectedVal.set("itemAmt",itemAmt);


    };

    $("#itemGrid").kendoExtGrid({
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
                       // params["sDlrCd"] = loginDlrCd;
                        params["sPackage"] = "Y";
                        params["sItemCd"] = $("#sItemCd").val();
                        params["sItemNm"] = $("#sItemNm").val();
                        params["sItemDstinCd"] = $("#sItemDstinCd").val();
                       // params["sItemDstinCd"] = "04";

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
        ,autoBind:false
        ,selectable:"row"
        ,change:function(e){
            var selectedItem = this.dataItem(this.select());
            if( selectedItem != null && selectedItem != 'undefined'){


                $("#pkgItemCd").val(selectedItem.itemCd);
                $("#pkgItemNm").val(selectedItem.itemNm);
                //$("#dlrCd").val(selectedItem.dlrCd);

               /*  $.ajax({
                    url:"<c:url value='/par/pmm/itemMaster/selectItemMasterByKey.do' />",
                    data:JSON.stringify({ sDlrCd:selectedItem.dlrCd, sItemCd:selectedItem.itemCd}),
                    type:"POST",
                    dataType:"json",
                    contentType:"application/json",
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                }).done(function(result) {

                    //$("#itemCd").val(result.itemCd);
                    //$("#itemNm").val(result.itemNm);

                    $("#ltsGrid").data("kendoExtGrid").dataSource.data([]);
                    $("#parGrid").data("kendoExtGrid").dataSource.data([]);
                    $("#ltsGrid").data("kendoExtGrid").dataSource.read();
                    $("#parGrid").data("kendoExtGrid").dataSource.read();

                }); */
                $("#ltsGrid").data("kendoExtGrid").dataSource.data([]);
                $("#parGrid").data("kendoExtGrid").dataSource.data([]);
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
        ,height:300
        ,columns:[
             {field:"rnum",   title:"<spring:message code='ser.lbl.no' />", width:30, sortable:false, attributes:{"class":"ac"}}
            ,{field:"itemDstinCd", title:"<spring:message code='ser.lbl.gubun' />", width:75, attributes:{"class":"ac"},template :"#= itemDstinCdGrid(itemDstinCd) #"}        //품목구분
            ,{field:"itemCd", title:"<spring:message code='ser.lbl.packageCd' />", width:100, attributes:{"class":"ac"}}                 //품목 코드
            ,{field:"itemNm", title:"<spring:message code='ser.lbl.packageNm' />", width:140, attributes:{"class":"ac"}}                //품목명
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

                  //  params["sDlrCd"] = loginDlrCd;
                    params["sPkgItemCd"] = $("#pkgItemCd").val();
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
                   ,lineNo:{ type:"string"}
                   ,lbrCd:{ type:"string",editable:false}
                   ,lbrNm:{ type:"string",editable:false}
                   ,lbrQty:{ type:"number" }
                   ,lbrHm:{ type:"number",editable:false}
                   ,lbrPrc:{ type:"number",editable:true}
                   ,lbrAmt:{ type:"number",editable:true}
                }
            }
        }
      }
    ,pageable:false
    ,height:120
    ,autoBind:false
    ,change:function(e){
    }
    ,edit:function(e){
        var fieldName = $(e.container.find("input")[1]).attr("name");
         if(fieldName=="lbrAmt"){
             this.closeCell();
         }
     }
    ,columns:[
         {field:"rnum",   title:"<spring:message code='ser.lbl.no' />", width:30, sortable:false, attributes:{"class":"ac"},hidden:true}
        ,{field:"lineNo", title:"<spring:message code='ser.lbl.no' />", width:30, sortable:false, attributes:{"class":"ac"}}
        ,{field:"lbrCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:50//공임코드
            ,attributes:{"class":"ac"}
        }
        ,{field:"lbrNm", title:"<spring:message code='ser.lbl.lbrNm' />", width:150//공임명
            ,attributes:{"class":"ac"}
        }
        ,{field:"lbrQty", title:"<spring:message code='ser.lbl.qty' />", width:40, attributes :{"class":"ar"}
               , editor:function(container, options){
                    $('<input required name="lbrQty" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n0"                // n0:###,###, n2:###,###.##
                       ,decimals:0                // 소숫점
                       ,min:1
                       ,value:0
                       ,spinners:true
                       ,change:calLaborAmt
                });
                $('<span class="k-invalid-msg" data-for="lbrQty"></span>').appendTo(container);
             }
        }//수량
        ,{field:"lbrHm", title:"<spring:message code='ser.lbl.lbrTime' />", width:40, attributes:{"class":"ar"}}//
        ,{field:"lbrPrc", title:"<spring:message code='ser.lbl.prc' />", width:40, attributes:{"class":"ar"}}//단가
        ,{field:"lbrAmt", title:"<spring:message code='ser.lbl.amt' />", attributes:{"class":"ar"}, width:40}//금액
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

                   // params["sDlrCd"] = loginDlrCd;
                    params["sPkgItemCd"] = $("#pkgItemCd").val();
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
                   ,pkgItemCd:{ type:"string"}
                   ,lineNo:{ type:"string"}
                   ,itemQty:{ type:"number"}
                   ,itemUnitCd:{ type:"string",editable:false}
                   ,itemPrc:{ type:"number",editable:false}
                   ,itemAmt:{ type:"number",editable:true}
                }
            }
        }
      }
    ,height:120
    ,pageable:false
    ,autoBind:false
    ,edit:function(e){
        var fieldName = $(e.container.find("input")[1]).attr("name");
         if(fieldName=="itemAmt"){
             this.closeCell();
         }
     }
    ,change:function(e){
    }
    ,columns:[
         {field:"rnum",   title:"<spring:message code='ser.lbl.no' />", width:30, sortable:false, attributes:{"class":"ac"},hidden:true}
        ,{field:"lineNo", title:"<spring:message code='ser.lbl.no' />", width:30, sortable:false, attributes:{"class":"ac"}}
        ,{field:"itemCd", title:"<spring:message code='ser.lbl.itemCd' />", width:50//부품번호
            ,attributes:{"class":"ac"}
         }
        ,{field:"itemNm", title:"<spring:message code='ser.lbl.itemNm' />", width:150//부품명
            ,attributes:{"class":"ac"}
         }
        ,{field:"itemQty", title:"<spring:message code='ser.lbl.qty' />", width:40, attributes:{"class":"ar"}
            , editor:function(container, options){
                    $('<input required name="itemQty" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n0"                // n0:###,###, n2:###,###.##
                       ,decimals:0                // 소숫점
                       ,min:1
                       ,value:0
                       ,spinners:true
                       ,change:calPartAmt
                });
                $('<span class="k-invalid-msg" data-for="itemQty"></span>').appendTo(container);
             }

        }//수량
        ,{field:"itemUnitCd", title:"<spring:message code='ser.lbl.unitCd' />", width:40, attributes:{"class":"ac"}}//수량단위
        ,{field:"itemPrc", title:"<spring:message code='ser.lbl.prc' />", width:40,attributes:{"class":"ar"}}//단가
        ,{field:"itemAmt", title:"<spring:message code='ser.lbl.amt' />", attributes:{"class":"ar"}, width:40}//금액
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
