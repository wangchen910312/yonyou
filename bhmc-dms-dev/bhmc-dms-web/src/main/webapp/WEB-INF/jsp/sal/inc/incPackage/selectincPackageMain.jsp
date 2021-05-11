<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 보험패키지관리 -->
<div id="resizableContainer">
<section class="group">
    <div class="header_area">
        <div class="btn_left">
            <dms:access viewId="VIEW-D-13075" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnInit" name="btnInit" class="btn_m btn_reset ar"><spring:message code="global.btn.init" /></button>
            </dms:access>
        </div>
        <div class="btn_right">
            <dms:access viewId="VIEW-D-13074" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnMainAad" class="btn_m"><spring:message code='sal.lbl.new' /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-13073" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /></button>
            </dms:access>
        </div>
    </div>
    <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
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
                    <th scope="row"><spring:message code='sal.lbl.packageNo' /></th>       <!-- 패키지번호 -->
                    <td>
                        <input id="sPackageNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.packageNm' /></th>       <!-- 패키지명 -->
                    <td>
                        <input id="sPackageNm" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.incTps' /></th>       <!-- 보험종류 -->
                    <td>
                        <input id="sIncTp" class="form_comboBox" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <div id="mainGrid"></div>
    </div>

    <div class="header_area">
        <div class="btn_right">
            <dms:access viewId="VIEW-D-13072" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnSave" type="button" class="btn_s"><spring:message code='global.btn.save' /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-13071" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnAdd" type="button" class="btn_s"><spring:message code='global.btn.rowAdd' /></button>          <!-- 행추가 -->
            </dms:access>
            <dms:access viewId="VIEW-D-13070" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnDel" type="button" class="btn_s"><spring:message code='global.btn.rowDel' /></button>          <!-- 행삭제 -->
            </dms:access>
            <dms:access viewId="VIEW-D-13069" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnCancel" type="button" class="btn_s"><spring:message code='global.btn.cancel' /></button>
            </dms:access>
        </div>
    </div>
    <div class="table_grid">
        <div id="subGrid" class="resizable_grid"></div>
    </div>

    <span style="display:none">
        <!-- 딜러코드 -->
        <input id="dlrCd" type="hidden"/>

        <!-- 패키지번호 -->
        <input id="packageNo" type="hidden"/>
        <input id="packageNm" type="hidden"/>
    </span>
</section>
</div>
<!-- //보험패키지 -->

<!-- script -->
<script>
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
//yyyy-MM-dd HH:mm:ss
var vDtyyyyMMddHHmmss = vDateTimeFormat;
//yyyy-MM-dd HH:mm
var vDtyyyyMMddHHmm = vDateTimeFormat.substring(0,16);
// yyyy-MM-dd
//var vDtyyyyMMdd = vDateTimeFormat.substring(0,10);
var vDtyyyyMMdd = "${_dateFormat}";
// HH:mm
var vDtHHmm = vDateTimeFormat.substring(11,16);

//딜러코드
var dlrCd  = "${dlrCd}";

//보험유형 Array
var incTpDs = [];
<c:forEach var="obj" items="${incTpList}">
    incTpDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//보험유형 Map
var incTpMap = dms.data.arrayToMap(incTpDs, function(obj){ return obj.cmmCd; });

//3자보험유형
var threeIncTpAmtDs = [];
var threeIncTpAmtObj = {};
<c:forEach var="obj" items="${threeIncTpAmtList}">
    threeIncTpAmtDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    threeIncTpAmtObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

var subParam = {};

var popupWindow;

$(document).ready(function() {

    $("#btnInit").kendoButton({ // 초기화
        click:function(e){
            $("#sPackageNo").val("");
            $("#sPackageNm").val("");
            $("#sIncTp").val("");
            $('#mainGrid').data('kendoExtGrid').dataSource.data([]);
            $('#subGrid').data('kendoExtGrid').dataSource.data([]);
        }
    });

    $("#btnSearch").kendoButton({ // 조회
        enable:true,
        click:function(e){
            $('#mainGrid').data('kendoExtGrid').dataSource.page(1);
            $('#subGrid').data('kendoExtGrid').dataSource.data([]);
            subParam = {};
        }
    });

    $("#btnMainAad").kendoButton({ // 메인 행추가
        click:function(e){
            popupWindow = dms.window.popup({
                windowId:"incPackageCreatePopup"
                ,title:"<spring:message code='sal.lbl.new' />"   // 新件
                ,width:350
                ,height:123
                , modal:true
                ,content:{
                    url:"<c:url value='/sal/inc/incPackage/selectIncPackageHeaderCreatePopup.do'/>"
                    ,data:{
                        "autoBind":false
                        ,"callbackFunc":function(){
                            $('#mainGrid').data('kendoExtGrid').dataSource.page(1);
                            $('#subGrid').data('kendoExtGrid').dataSource.data([]);
                            //정상적으로 반영 되었습니다.
                            dms.notification.success("<spring:message code='global.info.success'/>");

                            popupWindow.close();
                        }
                    }
                }
            });

        }
    });

    $("#btnAdd").kendoButton({ // Detail 행추가
        click:function(e){
            var mGrid = $("#mainGrid").data("kendoExtGrid");
            var grid = $("#subGrid").data("kendoExtGrid");
            var rows = mGrid.select();

            if(rows.length >= 1){
                popupWindow = dms.window.popup({
                    windowId:"selectIncItemPopupWindow"
                    , title:"<spring:message code='global.btn.rowAdd' />"   // 행추가
                    , width:350
                    , height:400
                    , content:{
                        url:"<c:url value='/sal/inc/incJoinInfo/selectIncItemPopup.do' />"
                        , data:{
                            "autoBind":true
                            , "onlyItemTab":"Y"
                            , "callbackFunc":function(data){
                                if (data.length >= 1) {

                                    var tData = {};
                                    for(var i=0; i<data.length; i++){
                                        tData = data[i];
                                        if(!isincDtlItem(tData.cmmCd)){
                                            grid.dataSource.insert(i, {
                                                "dlrCd":dlrCd
                                               ,"packageNo":dms.string.strNvl($("#packageNo").val())
                                               ,"packageNm":dms.string.strNvl($("#packageNm").val())
                                               ,"incTp":tData.cmmCd
                                           }).set("dirty", true);
                                        }
                                    }

                                    popupWindow.close();
                                }
                            }
                        }
                    }
                });
            }else{
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
            }
        }
    });

    $("#btnDel").kendoButton({ // Detail 행삭제
        click:function(e){
            var grid = $("#subGrid").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    $("#btnCancel").kendoButton({ // 초기화
        click:function(e){
            $('#subGrid').data('kendoExtGrid').cancelChanges();
        }
    });

    $("#btnSave").kendoButton({ // 저장
        click:function(e){
            var grid = $("#subGrid").data("kendoExtGrid");
            var rows = grid.tbody.find("tr");
            //var items = grid.dataSource.data();

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            var insertList = [];
            $.each(rows, function(idx, row){
                var dataItem = grid.dataItem(row);
                insertList.push(dataItem);
            });

            var saveVO = {"packageNo":$("#packageNo").val(), "dlrCd":$("#dlrCd").val()
                            , "insertList":insertList
                         };

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/sal/inc/incPackage/multiIncPackageDetail.do' />"
                    ,data:JSON.stringify(saveVO)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                    ,success:function(jqXHR, textStatus) {
                        grid.dataSource._destroyed = [];
                        grid.dataSource.page(1);

                        $('#mainGrid').data('kendoExtGrid').dataSource.page(1);

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

    // 보험종류
    $("#sIncTp").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(incTpDs)
       ,optionLabel:" "           //선택
    });

    // 그리드
    $("#mainGrid").kendoExtGrid({
        gridId:"G-SAL-0211-160017"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/inc/incPackage/selectIncPackage.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};        // 재 조회시때 초기화
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        //패키지번호
                        params["sPackageNo"] = $("#sPackageNo").val();
                        //패키지명
                        params["sPackageNm"] = $("#sPackageNm").val();
                        // 보험종류
                        params["sIncTp"] = $("#sIncTp").data("kendoExtDropDownList").value();

                        //console.log('params:',kendo.stringify(params) );
                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"packageNo",
                    fields:{
                         dlrCd:{type:"string"}
                        ,packageNo:{type:"string"}
                        ,packageNm:{type:"string"}
                        ,totValRecAmt:{type:"number"}
                    }
                }
            }
        }
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
       ,appendEmptyColumn:true           //빈컬럼 적용. default:false
       ,enableTooltip:false               //Tooltip 적용, default:false
       ,height:210
       ,editable:false
       ,autoBind:false
       //,pageable:false
       ,navigatable:true
       ,selectable:"row"
       ,change:function(e){
           var selectedItem = this.dataItem(this.select());

           if(selectedItem != null){
               subParam = {};
               subParam = {
                       "sDlrCd":selectedItem.dlrCd
                     , "sPackageNo":selectedItem.packageNo
                };
               $("#dlrCd").val(selectedItem.dlrCd);
               $("#packageNo").val(selectedItem.packageNo);
               $("#packageNm").val(selectedItem.packageNm);

               // 상세정보 Grid 조회
               $('#subGrid').data('kendoExtGrid').dataSource.read();
           }
       }
       ,columns:[
           {field:"dlrCd",  hidden:true}
          ,{field:"rnum", title:"<spring:message code='global.lbl.no' />", width:80, sortable:false, attributes:{"class":"ac"}}
          ,{field:"packageNo", title:"<spring:message code='sal.lbl.packageNo' />", width:170, attributes:{"class":"al"}}    // 패키지번호
          ,{field:"packageNm", title:"<spring:message code='sal.lbl.packageNm' />", width:380, attributes:{"class":"al"}}    // 패키지명
          ,{field:"totValRecAmt", title:"<spring:message code='sal.lbl.price' />", width:150, attributes:{"class":"ar"}, format:"{0:n2}"}    // 가격
       ]
   });

   // 그리드 더블클릭
   /*
   $("#mainGrid").on("dblclick", "tr.k-state-selected", function (e) {
       var grid = $("#mainGrid").data("kendoExtGrid");
       var selectedItem = grid.dataItem(grid.select());

       if(selectedItem != null){
           subParam = {};
           subParam = {
                   "sDlrCd":selectedItem.dlrCd
                 , "packageNo":selectedItem.packageNo
            };
           $("#dlrCd").val(selectedItem.dlrCd);
           $("#packageNo").val(selectedItem.packageNo);
           $("#packageNm").val(selectedItem.packageNm);

           // 상세정보 Grid 조회
           $('#subGrid').data('kendoExtGrid').dataSource.read();
       }
   });
   */

   // 상세 그리드
   $("#subGrid").kendoExtGrid({
       gridId:"G-SAL-0211-183905"
       ,dataSource:{
           transport:{
               read:{
                   url:"<c:url value='/sal/inc/incPackage/selectIncDetailPackage.do' />"
               },
               parameterMap:function(options, operation) {
                   if (operation === "read") {
                       subParam["sort"] = options.sort;
                       return kendo.stringify(subParam);
                   }else if (operation !== "read" && options.models) {
                       return kendo.stringify(options.models);
                   }
               }
           }
           ,schema:{
               model:{
                   id:"incTp",
                   fields:{
                        dlrCd :{type:"string", editable:false} // 딜러코드
                       ,packageNo:{type:"string", editable:false} // 패키지번호
                       ,packageNm:{type:"string", editable:false} // 패키지명
                       ,incTp:{type:"string"}                  // 보험유형
                       ,valRecAmt:{type:"number"}             // 가격
                   }
               }
           }
       }
      ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
      ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
      ,multiSelectWithCheckbox:true     //멀티선택 적용. default:false
      ,appendEmptyColumn:true          //빈컬럼 적용. default:false
      ,enableTooltip:true               //Tooltip 적용, default:false
      ,height:300
      ,autoBind:false
      ,pageable:false
      ,columns:[
          {dlrCd:"dlrCd", hidden:true}
         ,{field:"packageNo", title:"<spring:message code='sal.lbl.packageNo' />", width:150, attributes:{"class":"al"}}   //패키지번호
         ,{field:"packageNm", title:"<spring:message code='sal.lbl.packageNm' />", width:350, attributes:{"class":"al"}}   //패키지명
         ,{field:"incTp",title:"<spring:message code = 'sal.lbl.incTp'/>", width:200,attributes:{"class":"al"}
               ,template:"# if(incTpMap[incTp] != null) { # #= incTpMap[incTp].cmmCdNm# # }#"
               ,editor:function(container, options) {
                  $('<input required name="incTp" data-bind="value:' + options.field + '"/>')
                  .appendTo(container)
                  .kendoExtDropDownList({
                       autoBind:false
                      ,dataTextField:"cmmCdNm"
                      ,dataValueField:"cmmCd"
                      ,dataSource:incTpDs
                   });
                   $('<span class="k-invalid-msg" data-for="incTp"></span>').appendTo(container);
               }
           }//보험유형
         ,{field:"valRecAmt", title:"<spring:message code='sal.lbl.price' />", width:150, attributes:{"class":"ar"}, format:"{0:n2}"}    // 가격
      ]
  });

});

// item grid 보험유형 중복체크
function isincDtlItem(iTp){
    var flag = false;
    var grid = $('#subGrid').data('kendoExtGrid');
    var rows = grid.tbody.find("tr");

    rows.each(function(index, row){
        var data = grid.dataItem(row);
        if(iTp == data.incTp){
            flag = true;
        }
    });
    return flag;
}

</script>


