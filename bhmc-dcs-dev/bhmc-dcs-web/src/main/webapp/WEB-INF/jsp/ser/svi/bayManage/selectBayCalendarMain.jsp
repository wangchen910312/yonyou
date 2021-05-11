<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <!-- bay Calendar 관리 -->
    <section class="group">
        <div class="header_area">
          <h1 class="title_basic"><spring:message code="ser.title.bayCalenderMng" /></h1>
            <div class="btn_right">
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
                <button class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button>
            </div>
        </div>

        <!-- 조회조건 -->
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
                        <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.year" /></span></th>
                        <td>
                            <input id="sYear" name="sYear" maxlength="4" class="form_datepicker">
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.bayNo" /></th>
                        <td>
                            <input id="sBayNo" type="text" value="" class="form_input" maxlength="10">
                            <input id="sDlrCd" type="hidden" value="${dlrCd}" class="form_input">
                        </td>
                        <th scope="row"></th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- //조회조건 -->
  <div id="kendoBayCalendarForm">
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code="ser.title.campaign.masterInfo" /></h2>
            <div class="btn_right">
                <button class="btn_s btn_add"   id="btnAdd" ><spring:message code="global.btn.rowAdd" /></button>
                <button class="btn_s btn_del" id="btnDel"><spring:message code="global.btn.rowDel" /></button>
                <button class="btn_s btn_cancel" id="btnCancel"><spring:message code="global.btn.cancel" /></button>
            </div>
        </div>

        <!-- //bay Calendar 정보 목록  -->
        <div class="table_grid">
            <div id="grid" class="grid"></div>
        </div>
    </section>
   </div>
        <!-- //bay Calendar 정보 목록 -->


</section>
<!-- //content -->

<script type="text/javascript">

var bayManagePopup;
function bayCalendarWindow(){

    bayManagePopup = dms.window.popup({
        windowId:"teckManFnSearchWin"
            , title:"<spring:message code='ser.title.baySearch' />"   // BAY 조회
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectBayManagePopup.do'/>"
                , data:{
                    "autoBind":true
                    , "callbackFunc":function(jsonObj) {

                        if(jsonObj.length > 0) {

                            var rows = $("#grid").data("kendoExtGrid").tbody.find("tr");
                            rows.each(function(index, row) {
                                var dataItem = $("#grid").data("kendoExtGrid").dataSource._data;
                                if($(this).hasClass("k-state-selected")){
                                    dataItem[index].bayNo = jsonObj[0].bayNo;
                                    dataItem[index].bayNm = jsonObj[0].bayNm;
                                    dataItem[index].dirty = true;
                                }
                            });

                            $("#grid").data("kendoExtGrid").refresh();
                        }
                    }
                }
            }

    });
}

$(document).ready(function(e){

    //년도
    $("#sYear").kendoDatePicker({
        value:"${sysdate}"
        ,start:"decade"
        ,depth:"decade"
        ,format:"yyyy"
        ,parseFormats:["yyyy"]
    });

    $("#sYear").kendoMaskedTextBox({
        mask:"####"
    });

    //조회버튼
    $("#btnSearch").kendoButton({
        click:function (e){

            var str = "<spring:message code='ser.lbl.year' var='global_lbl_year' />"+
                      "<spring:message code='global.info.chkSelectItemMsg' arguments='${global_lbl_year}' />";


            if(dms.string.strNvl($("#sYear").val()) == ""  ){

                $("#sYear").focus();
                return dms.notification.info( str);

            }
            $("#grid").data("kendoExtGrid").dataSource.read();


        }

    });

    //추가 버튼
    $("#btnAdd").kendoButton({
        click:function (e){

            var grid = $("#grid").data("kendoExtGrid").dataSource;

            grid.insert(0,{
                mngDt:new Date("${sysdate}")
                ,"dlrCd":$("#sDlrCd").val()
                ,"bayNo":""
            });
        }
    });

    //버튼 - 삭제
    $("#btnDel").kendoButton({
        click:function(e) {

            if(!confirm("<spring:message code='ser.lbl.del' var='global_lbl_del' />"+
               "<spring:message code='global.info.cnfrmMsg' arguments='${global_lbl_del}' />")){
                return;
            }
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
            $("#checkAll").prop("checked",false);
        }
    });

    //취소버튼
    $("#btnCancel").kendoButton({

        click:function (e){
            var grid = $("#grid").data("kendoExtGrid");
            grid.cancelChanges();
            $("#checkAll").prop("checked",false);
        }

    });

   // var validator = $("#kendoBayCalendarForm").kendoExtValidator().data("kendoExtValidator");

    //저장버튼
    $("#btnSave").kendoButton({

        click:function(e){

            //if(validator.validate()){
                var grid = $("#grid").data("kendoExtGrid");

               // grid.


                var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

                if (grid.cudDataLength == 0) {
                    dms.notification.info( "<spring:message code='global.info.required.change' />");
                    return;
                }



                if (grid.gridValidation()) {
                    $.ajax({
                        url:"<c:url value='/ser/svi/bayManage/multiBayCalendars.do' />",
                        data:JSON.stringify(saveData),
                        type:'POST',
                        dataType:'json',
                        contentType:'application/json',
                        error:function(jqXHR,status,error) {
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        },
                        success:function(jqXHR, textStatus) {

                            grid.dataSource.read();
                            dms.notification.success("<spring:message code='global.info.success' />");
                        }
                    });
                }else{
                    dms.notification.warning("<spring:message code='global.info.check.input' />");
                }
         //   }


        }
    });

     getCheckTime = function(e){
        var grid = $("#grid").data("kendoExtGrid");
        var selectedVal = grid.dataItem(grid.select());
        var excpStartDt = kendo.parseDate(selectedVal.excpStartDt);
        var excpEndDt = kendo.parseDate(selectedVal.excpEndDt);
        var selectId = e.sender.element[0].id;
        if(excpStartDt > excpEndDt ){
           dms.notification.info( "<spring:message code='ser.lbl.excpStartHm' var='excpStart' />"+
                                     "<spring:message code='ser.lbl.excpEndHm' var='excpEnd' />"+
                      "<spring:message code='par.info.itemReqZeroCntMsg' arguments='${excpEnd},${excpStart}' />");
           if(selectId == "excpStartDt") selectedVal.set("excpStartDt","");
           else selectedVal.set("excpEndDt","");
           return;
        }

    };

    $("#grid").kendoExtGrid({
         dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/svi/bayManage/selectBayCalendarMains.do' />"
                }//read
                ,parameterMap:function(options , operation){

                    if(operation == "read"){

                     // 검색 조건을 파라미터로 담는다.
                        var params = {};

                        params["sYear"]      = $("#sYear").data("kendoDatePicker").value();
                        params["sBayNo"]     = $("#sBayNo").val();
                        params["sDlrCd"]     = $("#sDlrCd").val();

                        return kendo.stringify(params);

                    }else if(operation != "read" && options.models){
                        return kendo.stringify(options.models);
                    }
                } //parameterMap
            }//transport
            ,schema:{
                model:{
                    id:"bayNo"
                   ,fields:{
                      seq:{type:"number"}
                      ,mngDt:{type:"date", validation:{required:true}}
                      ,dlrCd:{type:"string"}
                      ,bayNo:{type:"string" , validation:{required:true}}
                      ,bayNm:{type:"string", editable:false}
                      ,excpStartDt:{type:"date" , validation:{required:true}}
                      ,excpEndDt:{type:"date" , validation:{required:true}}
                      ,remark:{type:"string"}
                   } //fields
                }//model
            }//schema
        }//dataSource
       ,multiSelectWithCheckbox:true
       ,height:300
       ,editable:true
       ,scrollable:true
       ,sortable:false
       ,resizable:true
       ,columns:[
                   {field:"seq", title:"<spring:message code='ser.lbl.no' />", width:60, hidden:true}
                  ,{field:"mngDt", title:"<spring:message code='ser.lbl.mngDt' />", width:60, sortable:false, attributes:{"class":"ac"}
                      ,format:"{0:<dms:configValue code='dateFormat' />}"
                      ,editor:function (container, options){
                          $('<input required name="mngDt" id="mngDt" data-name="<spring:message code='ser.lbl.mngDt' />" data-bind="value:' + options.field + '"/>')
                          .appendTo(container)
                          .kendoExtMaskedDatePicker({
                              format:"<dms:configValue code='dateFormat' />"
                             ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                          });
                          $('<span class="k-invalid-msg" data-for="mngDt"></span>').appendTo(container);
                      }
                   }
                  ,{field:"dlrCd", title:"<spring:message code='ser.lbl.dlrCd' />", width:60, sortable:false, hidden:true, attributes:{"class":"ac"}}
                  ,{field:"bayNo", title:"<spring:message code='ser.lbl.bayNo' />", width:80, sortable:false, attributes:{"class":"al"}
                      ,editor:function(container, options) {
                        $('<div class="form_search"><input type="text" name="bayNo" data-name="<spring:message code='ser.lbl.bayNo' />" class="form_input" readonly="true" /><a href="#" onclick="bayCalendarWindow()" >&nbsp;</a></div>')
                        .appendTo(container);
                        $('<span class="k-invalid-msg" data-for="bayNo"></span>')
                        .appendTo(container);
                     }
                   }
                  ,{field:"bayNm", title:"<spring:message code='ser.lbl.bayNm' />", width:150, sortable:false, attributes:{"class":"al"}}
                  ,{field:"excpStartDt", title:"<spring:message code='ser.lbl.excpStartHm' />", width:60, sortable:false, attributes:{"class":"ac"}
                      ,format:"{0:HH:mm}"
                      ,editor:function (container, options){
                          $('<input required name="excpStartDt" id="excpStartDt" data-name="<spring:message code='ser.lbl.excpStartHm' />"  maxlength="4" data-bind="value:' + options.field + '"/>')
                          .appendTo(container)
                          .kendoTimePicker({
                              format:"HH:mm"
                             ,change:getCheckTime
                          })
                          .kendoMaskedTextBox({
                              mask:"##:##"
                          });
                          $('<span class="k-invalid-msg" data-for="excpStartDt"></span>').appendTo(container);
                      }
                   }
                  ,{field:"excpEndDt", title:"<spring:message code='ser.lbl.excpEndHm' />", width:60, sortable:false, attributes:{"class":"ac"}
                      ,format:"{0:HH:mm}"
                      ,editor:function (container, options){
                          $('<input required name="excpEndDt" id="excpEndDt" maxlength="4" data-name="<spring:message code='ser.lbl.excpEndHm' />" data-bind="value:' + options.field + '"/>')
                          .appendTo(container)
                          .kendoTimePicker({
                              format:"HH:mm"
                              ,change:getCheckTime
                           })
                          .kendoMaskedTextBox({
                              mask:"##:##"
                          });
                          $('<span class="k-invalid-msg" data-for="excpEndDt"></span>').appendTo(container);
                         }
                   }
                  ,{field:"remark", title:"<spring:message code='ser.lbl.remark' />", width:200, sortable:false, attributes:{"class":"al"}}
                 ]

    });

});

</script>