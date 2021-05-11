<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>

<section id="window" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <button type="button" class="btn_m btn_search" id="btnSearch" style="display:none"><spring:message code="global.btn.search" /></button><!-- 조회 -->
            <button type="button" class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button>
            <button type="button" class="btn_m " id="packageReg"><spring:message code="global.btn.new" /></button>
        </div>
    </div>
    <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:22%;">
                <col style="width:22%;">
                <col style="width:22%;">
                <col style="width:31%;">
            </colgroup>
            <tbody>
                <tr>
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
    </div>
    <div class="table_grid mt10">
        <!-- 그리드1 -->
        <div id="pkgRegGrid" class="grid"></div>
        <!-- 그리드1 -->
    </div>
    <div class="header_area">
        <div class="left_areaStyle mt10">
            <li>
                <input type="input" id="sLtsModelCd" name="sLtsModelCd" style="width:60%" class="form_comboBox" />
            </li>
        </div>
        <div class="btn_right">
            <button type="button" class="btn_s btn_add btn_s_min5" id="btnDel" ><spring:message code="global.btn.rowDel" /></button>
            <button type="button" class="btn_s btn_cancel btn_s_min5" id="btnCancel" ><spring:message code="global.btn.cancel" /></button>
        </div>
    </div>
    <div class="table_grid mt10">
        <!-- 그리드1 -->
        <div id="pkgGrid" class="grid"></div>
        <!-- 그리드1 -->
    </div>

</section>

<script type="text/javascript">

var partsPackageRegPopupWindow;

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

var parentJsonData = parent.packageRegPopupWin.options.content.data;

$(document).ready(function(e){

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
    setLtsModelMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
            if(ltsMap[value] != undefined)
            resultVal =  ltsMap[value].cmmCdNm;
        }
        return resultVal;
    };


    //조회조건 - LTS MODEL CD
    $("#sLtsModelCd").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
      ,dataValueField:"cmmCd"
      ,dataSource:ltsModelCdList
      ,template:"[#:cmmCd#]#:cmmCdNm#"
      ,valueTemplate:"[#:cmmCd#]#:cmmCdNm#"
      ,height:5
      ,index :0
    });

    /** 삭제  **/
    $("#btnDel").kendoButton({

        click:function (e){

            var grid = $("#pkgGrid").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }

    });

  //취소
    $("#btnCancel").kendoButton({
        click:function(e) {
            $('#pkgGrid').data('kendoExtGrid').cancelChanges();
        }
    });


    var dupChkYn = true;
    $("#pkgRegGrid").on("dblclick", "tr.k-state-selected", function (e) {

        var grid = $("#pkgRegGrid").data("kendoExtGrid");
        var pkgGrid = $("#pkgGrid").data("kendoExtGrid");
        var rows = grid.select();

        var selectedVal = grid.dataItem(rows);
        if(selectedVal != null){
            copyData = {
                    ltsModelCd :  $("#sLtsModelCd").data("kendoExtDropDownList").value()
                  , pkgItemCd:selectedVal.itemCd
                  , pkgItemNm:selectedVal.itemNm
            };

            setGridDupChek(copyData);
            if(dupChkYn){
                pkgGrid.dataSource.add(copyData);
            }
        }

    });

    //중복 체크 로직
    setGridDupChek = function(selectedVal){

        var pkgGrid = $("#pkgGrid").data("kendoExtGrid");
        var selectedGridVal = pkgGrid.dataItem(pkgGrid.select());
        dupChkYn = true;


        $.each(pkgGrid.dataSource._data , function(i , data){
            var gridIndex = pkgGrid.select().index();
            if(dupChkYn){
                if((gridIndex != i )){
                    if( (selectedVal.pkgItemCd == data.pkgItemCd) && (selectedVal.ltsModelCd == data.ltsModelCd) ){
                        dms.notification.warning("<spring:message code='global.err.duplicate' />");
                        dupChkYn = false;
                        return;
                    }
                }

            }
        });
    };


    //버튼 - 조회
    $("#btnSearch").kendoButton({

        click:function(e){
            $("#pkgRegGrid").data("kendoExtGrid").dataSource.data([]);
            $("#pkgRegGrid").data("kendoExtGrid").dataSource.page(1);
        }
    });


    //버튼 - 저장
    $("#btnSave").kendoButton({

        click:function(e) {


            var pkgGrid = $("#pkgGrid").data("kendoExtGrid");
            var pkgGridData = pkgGrid.getCUDData("insertList", "updateList", "deleteList");

            if (pkgGrid.cudDataLength == 0 ) {
                dms.notification.info("<spring:message code = 'global.info.required.change'/>");
                return;
            }
            var result = true;
            $.each(pkgGrid.dataSource._data , function(i , gridData){

                if( dms.string.isEmpty(gridData.ltsModelCd) ){ //global.info.validation.pattern
                    dms.notification.warning( "<spring:message code='ser.lbl.ltsModelCd' var='ltsModelCd' />"+
                                              "<spring:message code='global.info.required.field' arguments='${ltsModelCd}' />");

                    result = false;
                    return;
                }

            });

            if(!result) return;

            if (pkgGrid.gridValidation() ) {
                $.ajax({
                    url:"<c:url value='/ser/svi/package/insertPackages.do' />",
                    data:JSON.stringify(pkgGridData),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    },
                    success:function(result, textStatus) {

                        parentJsonData.callbackFunc();
                    }
                    ,beforeSend:function(xhr){
                        //parent.dms.loading.show($("#resizableContainer"));
                    }
                    ,complete:function(xhr,status){
                       // parent.dms.loading.hide($("#resizableContainer"));
                    }
                });
            }else{
                //입력값을 확인하여 주십시오.
                dms.notification.warning("<spring:message code='global.info.check.input'/>");
            }
        }
    });

    $("#packageReg").kendoButton({
        click:function(e) {

            selectPartsPackageRegPopupWindow();
        }
    });


    $("#pkgRegGrid").kendoExtGrid({
        gridId:"G-SER-0519-174337"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/svi/package/selectPackageParSummary.do' />"
                    //url:null
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
                        //params["sPackage"] = "Y";
                        params["sPkgItemCd"] = $("#sPkgRegItemCd").val();
                        params["sPkgItemNm"] = $("#sPkgRegItemNm").val();
                        params["sItemDstinCd"] = "04";

                        return kendo.stringify(params);
                    }
                }
            }
            //,serverPaging:true
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
        //,appendEmptyColumn:true
        ,pageable:true
        ,selectable:"multiple, row"
        //,multiSelectWithCheckbox:true
        ,scrollable:true
        ,sortable:false
        ,resizable:true
        ,height:170
        ,columns:[
             {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:70, sortable:false, attributes:{"class":"ac"}}
            ,{field:"itemDstinCd", title:"<spring:message code='ser.lbl.gubun' />", width:120, attributes:{"class":"ac"} , hidden:true
                ,template :"#= itemDstinCdGrid(itemDstinCd) #"
            }        //품목구분
            ,{field:"itemCd", title:"<spring:message code='ser.lbl.packageCd' />", width:150, attributes:{"class":"al"}}                 //품목 코드
            ,{field:"itemNm", title:"<spring:message code='ser.lbl.packageNm' />", width:200, attributes:{"class":"al"}}                //품목명
        ]
    });

    $("#pkgGrid").kendoExtGrid({
        gridId:"G-SER-1028-000001"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/svi/package/selectPackageParSummary.do' />"
                    //url:null
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
                        params["sPkgTp"] = "01";

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                 model:{
                    id:"rnum"
                   ,fields:{
                        rnum:{ type:"int"  }
                       ,pkgDocNo:{ type:"int"  }
                       ,ltsModelCd:{ type:"string" ,validation:{required:true}  }
                       ,itemDstinCd:{ type:"string" ,editable:false}
                       ,pkgItemCd:{ type:"string" , editable:false }
                       ,pkgItemNm:{ type:"string" , editable:false }
                    }
                }
            }
           }
           ,editable:true
           ,autoBind:false
           ,selectable:"multiple, row"
           ,filterable:false                 // 필터링 기능 사용안함
           //,appendEmptyColumn:true
           ,multiSelectWithCheckbox:true
           ,pageable:false
           ,scrollable:true
           ,sortable:false
           ,resizable:true
           ,height:170
           ,columns:[
             {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, sortable:false, attributes:{"class":"ac"}}
            ,{field:"ltsModelCd", title:"<spring:message code='ser.lbl.ltsModelCd' />", width:120, sortable:true
                 ,attributes:{"class":"al"}
                 ,template:"[#:ltsModelCd#] #= setLtsModelMap(ltsModelCd) #"
                 ,editor:function(container, options) {
                       $('<input required name="ltsModelCd" data-name="<spring:message code="ser.lbl.ltsModelCd" />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtDropDownList({
                           valuePrimitive:true
                          ,dataValueField:"cmmCd"
                          ,dataTextField: "cmmCd"
                          ,template:"[#:cmmCd#] #= cmmCdNm #"
                          ,dataSource:ltsModelCdList
                          ,change:function(e){

                              var grid = $("#pkgRegGrid").data("kendoExtGrid");
                              var pkgGrid = $("#pkgGrid").data("kendoExtGrid");
                              var rows = pkgGrid.select();
                              var selectedVal = pkgGrid.dataItem(rows);

                              if(selectedVal != null){
                                  copyData = {
                                          ltsModelCd :selectedVal.ltsModelCd
                                        , pkgItemCd:selectedVal.pkgItemCd
                                        , index : rows.index()
                                  };
                                  setGridDupChek(selectedVal);
                                  if(!dupChkYn){
                                      selectedVal.set("ltsModelCd","");
                                  }
                              }
                            }
                      });
                       $('<span class="k-invalid-msg" data-for="ltsModelCd"></span>').appendTo(container);
                   }
              }     //품목구분
            ,{field:"pkgItemCd", title:"<spring:message code='ser.lbl.packageCd' />", width:130, attributes:{"class":"al"}}                 //품목 코드
            ,{field:"pkgItemNm", title:"<spring:message code='ser.lbl.packageNm' />", width:200, attributes:{"class":"al"}}                //품목명
           ]
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

                        $("#pkgRegGrid").data("kendoExtGrid").dataSource.read()

                        partsPackageRegPopupWindow.close();
                    }
                }
            }
        });
    }


});

</script>