<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- PIO 부품관리 마스터 -->
<section class="group">
    <div class="header_area">
    <h1 class="title_basic"><spring:message code="ser.menu.pioPartMng" /></h1>
        <div class="btn_right">
		<dms:access viewId="VIEW-I-12428" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
		</dms:access>
		<dms:access viewId="VIEW-I-12427" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button>
		</dms:access>
        </div>
    </div>
    <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='ser.lbl.itemCd' /></th>
                    <td>
                        <input id="sItemCd" name="sItemCd" type="text" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.itemNm' /></th>
                    <td>
                        <input id="sItemNm" name="sItemNm" type="text" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.useYn' /></th>
                    <td>
                        <input id="sUseYn" name="sUseYn" type="text" class="form_comboBox" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <div class="header_area">
        <div class="btn_right">
        <dms:access viewId="VIEW-I-12426" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" class="btn_s btn_add" id="btnAdd"><spring:message code="global.btn.rowAdd" /></button>
        </dms:access>
        <dms:access viewId="VIEW-I-12425" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" class="btn_s btn_del" id="btnDel"><spring:message code="global.btn.rowDel" /></button>
        </dms:access>
        <dms:access viewId="VIEW-I-12424" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" class="btn_s btn_cancel" id="btnCancel"><spring:message code="global.btn.cancel" /></button>
        </dms:access>
        </div>
    </div>
    <!-- 그리드 시작 -->
    <div class="table_grid">
        <div id="grid"></div>
    </div>
    <!-- 그리드 종료 -->
</section>
<!-- //보험관리 마스터 -->

<script type="text/javascript">


/** 부품 조회 팝업 **/
var itemSalePrcPopupWindow;

$(document).ready(function(){


     // 공통코드:사용 여부
     var useYnList = [];
     <c:forEach var ="obj" items="${useYnList}">
       useYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:forEach>
     var useYnMap = dms.data.arrayToMap(useYnList , function(obj){return obj.cmmCd;});

     setUseYnMap = function(value){
         var resultVal = "";
         if( dms.string.strNvl(value) != ""){
             if(useYnMap[value] != undefined)
             resultVal =  useYnMap[value].cmmCdNm;
         }
         return resultVal;
     };


  //부품조회팝업
    partSearchPopupWindow = function (){

        if($("#ltsModelCd").val() == ""){
            return dms.notification.warning("<spring:message code='global.info.preInquire' />");
        }

        itemSalePrcPopupWindow = dms.window.popup({
            windowId:"partsMasterPopup"
            ,title:"<spring:message code='par.title.itemInfo' />"   // 품목정보
            ,content:{
                url:"<c:url value='/par/cmm/selectItemSalePrcPopup.do'/>"
                ,data:{
                     "autoBind":false
                    ,"selectable":"multiple"
                    ,"callbackFunc":function(jsonObj){
                        if(jsonObj.length > 0) {

                            var grid = $('#grid').data('kendoExtGrid');

                            $.each(jsonObj, function(idx, data){

                                var copyData = {};
                                var result = true;
                                $.each(grid.dataSource._data , function(i , partData){
                                    if(partData.itemCd == data.itemCd){
                                        result = false;
                                    }
                                });
                                if(result){
                                    copyData = {
                                              itemCd:data.itemCd
                                            , itemNm:data.itemNm
                                            , useYn:"Y"
                                    };
                                    grid.dataSource.add(copyData);
                                }

                            });
                        }
                    }
                }
            }
        });
    };

    /** PWA 상태코드  콤보박스 **/
    $("#sUseYn").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:useYnList
        ,optionLabel:" "  // 선택
        ,index:0
        ,valuePrimitive:true
    });

  //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.read();
        }
    });

  //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e) {

            var grid = $("#grid").data("kendoExtGrid");
            var saveData = grid.getCUDData("insertList", "updateList", "deleteList", ["updtDt","updtUsrId"]);

            if (grid.cudDataLength == 0) {

                dms.notification.info( "<spring:message code='global.info.required.change' />");
                return;
            }

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/ser/svi/pioItem/multiClaimPioItemManage.do' />",
                    data:JSON.stringify(saveData),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    },
                    success:function(jqXHR, textStatus) {

                        grid.dataSource._destroyed = [];
                        grid.dataSource.page(1);

                        dms.notification.success("<spring:message code='global.info.success' />");
                    }
                });
            }else{
                dms.notification.warning("<spring:message code='global.info.check.input' />");
            }
        }
    });

  //버튼 - 추가
    $("#btnAdd").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid").dataSource;
            grid.insert(0,{
                "itemCd":""
               ,"itemNm":""
               ,"useYn":""
               ,"updtUsrId":""
               ,"updtDt":""
            });
            //partSearchPopupWindow();
        }
    });



  //버튼 - 삭제
    $("#btnDel").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                var dataItem = grid.dataItem(row);
                if( dataItem.isNew() ){
                    grid.removeRow(row);
                }else{
                    // 저장된 내역은 삭제가 불가 합니다.
                    dms.notification.info("<spring:message code='sal.info.positionsDiscountDel' />");
                }
            });
            $("#checkAll").prop("checked",false);
        }
    });

  //취소
    $("#btnCancel").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').cancelChanges();
            $("#checkAll").prop("checked",false);
        }
    });


  //그리드 설정
  $("#grid").kendoExtGrid({
      gridId:"G-SER-0901-163701"
      ,dataSource:{
          transport:{
              read:{
                  url:"<c:url value='/ser/svi/pioItem/selectClaimPioItemManageMains.do' />"
              }
              ,parameterMap:function(options , operation){
                  if(operation == "read"){

                      var params = {};

                      params["recordCountPerPage"] = options.pageSize;
                      params["pageIndex"]          = options.page;
                      params["firstIndex"]         = options.skip;
                      params["lastIndex"]          = options.skip + options.take;
                      params["sort"]               = options.sort;

                      params["sItemCd"]          = $("#sItemCd").val();
                      params["sItemNm"]          = $("#sItemNm").val();
                      params["sUseYn"]           = $("#sUseYn").val();

                      return kendo.stringify(params);

                  }else if (operation !== "read" && options.models) {
                      return kendo.stringify(options.models);
                  }
              }
          }
         ,schema:{
             model:{
                 id:"rnum"
                ,fields:{
                    rnum:{type:"number" ,editable:false}
                   ,itemCd:{type:"string" ,editable:true ,validation:{required:true}}
                   ,itemNm:{type:"string" ,editable:true ,validation:{required:true}}
                   ,useYn:{type:"string" ,editable:true ,validation:{required:true}}
                   ,updtUsrId:{type:"string" ,editable:false}
                   ,updtDt:{type:"date" ,editable:false}
                 }
             }
         }
      }
     ,multiSelectWithCheckbox:true
     ,navigatable:true
     ,appendEmptyColumn:true
     ,filterable:false                 // 필터링 기능 사용안함
     ,sortable:false
     ,columns:[
              {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:60, attributes:{"class":"ac"}}
             ,{field:"itemCd", title:"<spring:message code='ser.lbl.itemCd' />", width:150
                 ,attributes:{"class":"al"}
                 ,editor:function(container, options){
                     $('<input id="itemCd" data-bind="value:' + options.field + '" style="text-transform: uppercase"  />')
                     .appendTo(container)
                     .kendoMaskedTextBox({
                         mask:"AAAAAAAAAAAAAAAAAAAA"
                         ,promptChar:""
                     })
                     .bind("keyup", function(){
                         var that = $(this).data("kendoMaskedTextBox");
                         this.value = that.raw().toUpperCase();
                     })
                     ;
                 }
             }
             ,{field:"itemNm", title:"<spring:message code='ser.lbl.itemNm' />", width:300, attributes:{"class":"al"}}
             ,{field:"useYn", title:"<spring:message code='ser.lbl.useYn' />", width:100
                 ,attributes:{"class":"ac"}
                 ,template:"#=setUseYnMap(useYn)#"
                     ,editor:function(container, options){
                         $('<input required name="useYn" data-bind="value:' + options.field + '"/>')
                         .appendTo(container)
                         .kendoExtDropDownList({
                              dataTextField:"cmmCdNm"
                             ,dataValueField:"cmmCd"
                             ,dataSource:useYnList
                             ,valuePrimitive:true
                         });
                         $('<span class="k-invalid-msg" data-for="useYn"></span>').appendTo(container);
                        }

             }
             ,{field:"updtUsrId", title:"<spring:message code='ser.lbl.updtUserId' />", width:100, attributes:{"class":"ac"}}
             ,{field:"updtDt", title:"<spring:message code='ser.lbl.updtDt' />", width:160
                 ,attributes:{"class":"ac"}
                 ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
             }
      ]
     ,edit:function(e){
          var fieldName = e.container.find("input").attr("name");

          if(!e.model.isNew()) {
              if(e.sender.columns[e.container.index()].field == "itemCd"){
                  this.closeCell();
              }
              if(e.sender.columns[e.container.index()].field == "itemNm"){
                  this.closeCell();
              }
          }
     }
  });




});


</script>

