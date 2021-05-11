<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 보험관리 마스터 -->
<section class="group">
    <div class="header_area">
    <h1 class="title_basic"><spring:message code="ser.title.incMng" /></h1>
        <div class="btn_right">
            <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
            <button type="button" class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button>
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
                    <th scope="row"><spring:message code='ser.lbl.incCmpNm' /></th>
                    <td>
                        <input id="sIncCmpNm" type="text" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.incUsrNm' /></th>
                    <td>
                        <input id="sIncUsrNm" type="text" class="form_input">
                        <input id="sDlrCd" value="${dlrCd}" type="hidden" class="form_input">
                    </td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <div class="header_area">
        <div class="btn_right">
            <button type="button" class="btn_s btn_add" id="btnAdd"><spring:message code="global.btn.rowAdd" /></button>
            <button type="button" class="btn_s btn_del" id="btnDel"><spring:message code="global.btn.rowDel" /></button>
            <button type="button" class="btn_s btn_cancel" id="btnCancel"><spring:message code="global.btn.cancel" /></button>
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



var insurancePopup;
function selectInsurancePopupWindow(){

    insurancePopup = dms.window.popup({
            windowId:"insurancePopupWindow"
            , title:"<spring:message code = 'ser.title.venderSelect'/>"   // 거래처 조회
           //,width:"548px"
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectInsurancePopup.do'/>"
                , data:{
                  //  "type":"custom1"
                     "autoBind":false
                    , "callbackFunc":function(data){
                        var grid = $("#grid").data("kendoExtGrid").dataSource;
                         grid.insert(0,{
                             "incCmpCd"   :data[0].custNo
                            ,"incCmpNm"   :data[0].custNm
                            ,"incCmpTelNo":data[0].hpNo
                        });
                    }
                }
            }
        });
}


$(document).ready(function(){
  //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
           // $('#grid').data('kendoExtGrid').dataSource.page(1);
            $('#grid').data('kendoExtGrid').dataSource.read();
        }
    });

  //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e) {

            var grid = $("#grid").data("kendoExtGrid");
            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

            if (grid.cudDataLength == 0) {

                dms.notification.info( "<spring:message code='global.info.required.change' />");
                return;
            }

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/ser/svi/insurance/multiInsuranceMangages.do' />",
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

            selectInsurancePopupWindow();
        }
    });



  //버튼 - 삭제
    $("#btnDel").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
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

  // Grid 더블클릭 이벤트
  $("#grid").on("dblclick","tr.k-state-selected", function(e){

      var grid = $("#grid").data("kendoExtGrid");
      var rows = grid.select();
      var selectedVal = grid.dataItem(rows);

  });

  //그리드 설정
  $("#grid").kendoExtGrid({
      dataSource:{
          transport:{
              read:{
                  url:"<c:url value='/ser/svi/insurance/selectInsuranceManages.do' />"
              }
              ,parameterMap:function(options , operation){
                  if(operation == "read"){

                      var params = {};

                      params["recordCountPerPage"] = options.pageSize;
                      params["pageIndex"]          = options.page;
                      params["firstIndex"]         = options.skip;
                      params["lastIndex"]          = options.skip + options.take;
                      params["sort"]               = options.sort;

                      params["sIncCmpNm"]          = $("#sIncCmpNm").val();
                      params["sIncUsrNm"]          = $("#sIncUsrNm").val();
                      params["sDlrCd"]             = $("#sDlrCd").val();

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
                    rnum        :{type:"number" ,editable:false}
                   ,dlrCd       :{type:"string" , validation:{required:false}}
                   ,incCmpNm    :{type:"string" ,editable:false , validation:{required:true}}
                   ,incCmpCd    :{type:"string" ,editable:false , validation:{required:true}}
                   ,incCmpTelNo :{type:"string" ,editable:false , validation:{required:true}}
                   ,incDeptNm   :{type:"string" , validation:{required:true}}
                   ,incUsrNm    :{type:"string" , validation:{required:true}}
                   ,incRespTelNo:{type:"string" }
                   ,incRespHpNo :{type:"string" }
                 }
             }
         }
      }
     ,multiSelectWithCheckbox:true
     ,navigatable:true
     ,columns:[
              {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:60, sortable:false, attributes:{"class":"ac"}}
             ,{field:"dlrCd", title:"<spring:message code='ser.lbl.dlrCd' />", width:60, sortable:false, attributes:{"class":"ac"}}
             ,{field:"incCmpNm", title:"<spring:message code='ser.lbl.incCmpNm' />", width:120, sortable:false, attributes:{"class":"ac"}}
             ,{field:"incCmpCd", title:"<spring:message code='ser.lbl.incCmpCd' />", width:100, sortable:false, attributes:{"class":"ac"}}
             ,{field:"incCmpTelNo", title:"<spring:message code='ser.lbl.incCmpTelNo' />", width:100, sortable:false, attributes:{"class":"ac"}}
             ,{field:"incDeptNm", title:"<spring:message code='ser.lbl.incDeptNm' />", width:160, sortable:false, attributes:{"class":"ac"}}
             ,{field:"incUsrNm", title:"<spring:message code='ser.lbl.incUsrNm' />", width:100, sortable:false, attributes:{"class":"ac"}}
             ,{field:"incRespTelNo", title:"<spring:message code='ser.lbl.incRespTelNo' />", width:100, sortable:false, attributes:{"class":"ac"}}
             ,{field:"incRespHpNo", title:"<spring:message code='ser.lbl.incRespHpNo' />", width:100, sortable:false, attributes:{"class":"ac"}}
             ]
  });




});


</script>


