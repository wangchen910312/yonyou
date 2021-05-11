<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 주행거리 수정  마스터 -->
<section class="group">
    <div class="header_area">
        <div class="btn_right">
        <dms:access viewId="VIEW-I-12953" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
        </dms:access>
        <dms:access viewId="VIEW-I-12954" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" class="btn_m btn_save" id="btnUpdateRunDistVal"><spring:message code="ser.btn.runDistValModify" /></button>
        </dms:access>
        </div>
    </div>
    <!-- 조회 조건 시작 -->
    <form id="form">
        <div class="table_form" role="search" data-btnid="btnSearch">
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
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='ser.lbl.vinNo' /></span></th><!-- 차대번호 -->
                        <td>
                            <input required type="text" id="sVinNo" name="sVinNo" class="form_input" data-name="<spring:message code='ser.lbl.vinNo' />" />
                        </td>
                        <th scope="row"><spring:message code='ser.lbl.roDocNo' /></th> <!-- RO 번호 -->
                        <td>
                            <input id="sRoDocNo" name="sRoDocNo" type="text" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code='ser.lbl.dlrCd' /></th> <!-- 딜러번호 -->
                        <td>
                            <input id="sDlrCd" name="sDlrCd" type="text" class="form_input" />
                        </td>
                        <th scope="row"></th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
    </div>
    </form>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid"></div>
    </div>
    <!-- 그리드 종료 -->
</section>
<!-- //주행거리 수정  -->

<script type="text/javascript">


/** 주행거리 수정  팝업 **/
var runDistValPopupWindow;

$(document).ready(function(){



  //주행거리팝업
    runDistValModifyPopupWindow = function(data){

        if($("#ltsModelCd").val() == ""){
            return dms.notification.warning("<spring:message code='global.info.preInquire' />");
        }

        runDistValPopupWindow = dms.window.popup({
            windowId:"runDistValPopupWindow"
            ,title:"<spring:message code='ser.menu.runDistValModify' />"   // 품목정보
            ,height:150
            ,width:550
            ,content:{
                url:"<c:url value='/ser/svi/runDistValManage/selectRunDistValPopup.do'/>"
                ,data:{
                     "autoBind":false
                    ,"selectable"     : "multiple"
                    ,"data"           : data
                    ,"callbackFunc":function(saveData){

                        if(saveData.vinNo != null) {
                            modifyRunDistVal(saveData);
                        }
                    }
                }
            }
        });
    };


  //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {

            var validator = $("#form").kendoExtValidator().data("kendoExtValidator");
            if (validator.validate()) { //validation check
                $('#grid').data('kendoExtGrid').dataSource.page(1);
            }

        }
    });

    //버튼 - 저장
    $("#btnUpdateRunDistVal").kendoButton({
        click:function(e) {

            var grid = $("#grid").data("kendoExtGrid");
            var selectedVal = grid.dataItem(grid.select());

            if(selectedVal != null){

                var saveData = {
                        dlrCd          : selectedVal.dlrCd
                       ,roDocNo        : selectedVal.roDocNo
                       ,vinNo          : selectedVal.vinNo
                       ,roTp           : selectedVal.roTp
                       ,runDistVal     : selectedVal.runDistVal
                       ,lastRunDistVal : selectedVal.lastRunDistVal
                };

                //주행거리 팝업
                runDistValModifyPopupWindow(saveData);

            }else{
                dms.notification.info("<spring:message code='global.info.selectEmptyRowMsg'/>");
                return;
            }
        }
    });


    //주행거리 수정
    modifyRunDistVal = function(saveData){

        var grid = $("#grid").data("kendoExtGrid");
        $.ajax({
            url:"<c:url value='/ser/svi/runDistValManage/updateVinRunDistVal.do' />",
            data:JSON.stringify(saveData),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR,status,error) {
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            },
            success:function(result, textStatus) {
                grid.dataSource.page(1);

                dms.notification.success("<spring:message code='global.info.success' />");
            }
        });
    }

    //그리드 설정
    $("#grid").kendoExtGrid({
      gridId:"G-SER-0314-000001"
      ,dataSource:{
          transport:{
              read:{
                  url:"<c:url value='/ser/svi/runDistValManage/selectRunDistValManage.do' />"
              }
              ,parameterMap:function(options , operation){
                  if(operation == "read"){

                      var params = {};

                      params["recordCountPerPage"] = options.pageSize;
                      params["pageIndex"]          = options.page;
                      params["firstIndex"]         = options.skip;
                      params["lastIndex"]          = options.skip + options.take;
                      params["sort"]               = options.sort;

                      params["sVinNo"]          = $("#sVinNo").val();
                      params["sDlrCd"]          = $("#sDlrCd").val();
                      params["sRoDocNo"]        = $("#sRoDocNo").val();

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
                   ,vinNo:{type:"string"}
                   ,dlrCd:{type:"string"}
                   ,carRegNo:{type:"string"}
                   ,roDt:{type:"date"}
                   ,runDistVal:{type:"number"}
                   ,lastRunDistVal:{type:"number"}
                 }
             }
         }
      }
     ,navigatable:true
     ,editable : false
     ,selectable:"row"
     ,appendEmptyColumn:true
     ,filterable:false                 // 필터링 기능 사용안함
     ,autoBind:false
     ,columns:[
          {field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:200, sortable:false, attributes:{"class":"al"}}
         ,{field:"dlrCd", title:"<spring:message code='ser.lbl.dlrCd' />", width:100, sortable:false, attributes:{"class":"al"}}
         ,{field:"carRegNo", title:"<spring:message code='ser.lbl.carNo' />", width:150}                             //차량번호
         ,{field:"driverNm", title:"<spring:message code='ser.lbl.vsitr' />", width:150}                             //방문자
         ,{field:"runDistVal", title:"<spring:message code='ser.lbl.nowRunDist' />", width:120, attributes :{"class":"ar"}, format:"{0:n0}"}      // 현주행거리
         ,{field:"lastRunDistVal", title:"<spring:message code='ser.lbl.accuDrivDis' />", width:120, attributes :{"class":"ar"}, width:100 , format:"{0:n0}"} // 누적주행거리
         ,{field:"roDocNo", title:"<spring:message code='ser.lbl.roDocNo' />", width:120}                            //RO번호
         ,{field:"roTpNm", title:"<spring:message code='ser.lbl.roTp' />", width:100, attributes:{"class":"ac"}}     // RO유형
         ,{field:"roTp", hidden:true}     // RO유형
         ,{field:"roDt", title:"<spring:message code='ser.lbl.roDt' />", width:160, sortable:false                 //ro확인일자
             ,attributes:{"class":"ac"}
             ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
         }
     ]
    });




});


</script>


