<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 마감시간통계 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.lbl.deadlineControll" /></h1><!-- 마감시간통제관리 -->
        <div class="btn_right">
		<dms:access viewId="VIEW-I-12055" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_m btn_search" id="btnSearchGroup"><spring:message code="global.btn.search" /></button>
		</dms:access>
        </div>
    </div>
    <div class="table_form form_width_70per" role="search" data-btnid="btnSearchGroup">
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
                    <th scope="row"><spring:message code='sal.lbl.controllYyMm' /></th><!-- 통제년월 -->
                    <td>
                        <input id="sCtrlYyMmDt" type="text" class="form_datepicker" />
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.controllGroup' /></th><!-- 통제그룹 -->
                    <td>
                        <input id="sCtrlGrpCd" type="text" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.controllTarget' /></th><!-- 통제대상 -->
                    <td>
                        <input id="sCtrlTargCd" type="text" class="form_comboBox" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- 마감시간통제 정보 그리드 기능버튼 -->
    <div class="header_area">
        <h2 class="title_basic"><spring:message code='sal.lbl.deadlineCtrlInfo' /></h2><!-- 마감시간통제정보 -->
        <div class="btn_right">
        <dms:access viewId="VIEW-I-12054" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_s btn_save" id="btnSave"><spring:message code='global.btn.save' /></button><!-- 저장 -->
        </dms:access>
        <dms:access viewId="VIEW-I-12053" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_s btn_add" id="btnAdd"><spring:message code='global.btn.rowAdd' /></button><!-- 행추가 -->
        </dms:access>
        <dms:access viewId="VIEW-I-12052" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_s btn_cancel" id="btnCancel"><spring:message code='global.btn.cancel' /></button><!-- 취소 -->
        </dms:access>
        </div>
    </div>
    <!-- //마감시간통제 정보 그리드 기능버튼 -->

    <!-- 마감시간통제 정보 그리드 -->
    <div class="table_grid">
        <div id="grid"></div>
    </div>
    <!-- //마감시간통제 정보 그리드 -->

    <!-- 마감대상 딜러 정보 그리드 기능버튼 -->
    <div class="header_area">
        <h2 class="title_basic"><spring:message code='sal.lbl.deadlineTartgetDealerInfo' /></h2><!-- 마감대상 딜러 정보 -->
        <div class="btn_right">
        <dms:access viewId="VIEW-I-12051" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_s btn_save" id="btnSaveDetail"><spring:message code='global.btn.save' /></button><!-- 저장 -->
        </dms:access>
        <dms:access viewId="VIEW-I-12050" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_s btn_add" id="btnAddDetail"><spring:message code='global.btn.rowAdd' /></button><!-- 행추가 -->
        </dms:access>
        <dms:access viewId="VIEW-I-12049" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_s btn_delete" id="btnDelDetail"><spring:message code='global.btn.rowDel' /></button><!-- 행삭제 -->
        </dms:access>
        <dms:access viewId="VIEW-I-12048" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_s btn_cancel" id="btnCancelDetail"><spring:message code='global.btn.cancel' /></button><!-- 취소 -->
        </dms:access>
        </div>
    </div>
    <!-- //마감대상 딜러 정보 그리드 기능버튼 -->

    <!-- 마감대상 딜러 정보 그리드 -->
    <div class="table_grid">
        <div id="detailGrid"></div>
    </div>
    <!-- //마감대상 딜러 정보 그리드 -->
</section>




<script type="text/javascript">
var toDay = "${toDay}";   // 해당일


//통제그룹
var ctrlGrpCdDs = [];
var ctrlGrpObj  = {};
<c:forEach var="obj" items="${ctrlGrpCdList}">
    ctrlGrpCdDs.push({"parentId":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ctrlGrpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//통제대상 Array
var sCtrlTargCdDs = [];
var ctrlTargCdDs = [];
var ctrlTargObj  = {};
<c:forEach var="obj" items="${ctrlTargCdList}">
    sCtrlTargCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}", "parentId":"${obj.remark1}"});
    ctrlTargCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}", "parentId":"${obj.remark1}"});

    ctrlTargObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//통제범위  Array
var dlrCtrlRangeCdDs = [];
var dlrCtrlRangeObj  = {};
<c:forEach var="obj" items="${dlrCtrlRangeCdList}">
    dlrCtrlRangeCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    dlrCtrlRangeObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//통제여부  Array
var ctrlYnDs = [];
<c:forEach var="obj" items="${ctrlYnList}">
    ctrlYnDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//요청상태 Map
var ctrlYnMap = dms.data.arrayToMap(ctrlYnDs, function(obj){ return obj.cmmCd; });


//조회조건 - 통제년월
$("#sCtrlYyMmDt").kendoExtMaskedDatePicker({
    value:toDay.substring(0, 8)
    ,start:"year"
    ,depth:"year"
    ,format:"yyyy-MM"
});


//통제그룹
$("#sCtrlGrpCd").kendoExtDropDownList({
     dataTextField: "cmmCdNm"
    ,dataValueField:"parentId"
    ,dataSource:ctrlGrpCdDs
    ,optionLabel:" "   // 전체
});

//통제대상
$("#sCtrlTargCd").kendoExtDropDownList({
     cascadeFrom: "sCtrlGrpCd"
    ,dataTextField: "cmmCdNm"
    ,dataValueField:"cmmCd"
    ,dataSource:sCtrlTargCdDs
    ,optionLabel:" "   // 전체
});


/****************************** 검색조건  ***************************************/





$(document).ready(function() {



    //버튼 - 마감시간통제 정보조회
    $("#btnSearchGroup").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });


    //마감시간통제정보  - 추가
    $("#btnAdd").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.insert(0, {
                "ctrlStartYyMmDt":""                                  //통제년월
                ,"ctrlGrpCd":""                                       //통제그룹
                ,"ctrlTargCd":""                                       //통제대상
                ,"dlrCtrlRangeCd":""                                  //딜러통제범위
                ,"ctrlYn"   :"Y"                                      //통제여부
                ,"remark"   :""                                       //비고
            });
        }
    });


    //마감시간통제정보  - 저장
    $("#btnSave").kendoButton({
        click:function(e) {

            var grid = $("#grid").data("kendoExtGrid");

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/sal/ctl/ddlCtrl/multiDeadlineCtrlMng.do' />"
                    ,data:JSON.stringify(saveData)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(request,status,error){
                        dms.notification.error(request.responseJSON.errors[0].errorMessage);
                     }
                    ,success:function(jqXHR, textStatus) {

                        grid.dataSource._destroyed = [];
                        grid.dataSource.page(1);

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

    //마감시간통제정보 - 취소
    $("#btnCancel").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').cancelChanges();
        }
    });


    //마감대상딜러정보  - 추가
    $("#btnAddDetail").kendoButton({
        click:function(e) {

          var grid = $('#grid').data('kendoExtGrid');
          var selectedItem = grid.dataItem(grid.select());
          if(selectedItem!=null) {
              var ctrlSeq = dms.string.strNvl(selectedItem.ctrlSeq);
              var ctrlDlrCd = dms.string.strNvl(selectedItem.ctrlDlrCd);
              var ctrlGrpCd = dms.string.strNvl(selectedItem.ctrlGrpCd);
              var ctrlTargCd = dms.string.strNvl(selectedItem.ctrlTargCd);
              var dlrCtrlRangeCd = dms.string.strNvl(selectedItem.dlrCtrlRangeCd);
              var ctrlStartYyMmDt = dms.string.strNvl(selectedItem.ctrlStartYyMmDt);
              var ctrlEndYyMmDt = dms.string.strNvl(selectedItem.ctrlEndYyMmDt);
              if(ctrlSeq!="") {
                  if(dlrCtrlRangeCd == '01'){
                      //딜러통제범위는 전체입니다.개별범위 선택시에만 추가할 수 있습니다.
                      dms.notification.warning("<spring:message code='sal.info.chk.ctrlRangeIsAll'/>");
                      return false;
                  }else {
                      $('#detailGrid').data('kendoExtGrid').dataSource.insert(0, {
                          "ctrlSeq":ctrlSeq
                          ,"ctrlStartYyMmDt":ctrlStartYyMmDt
                          ,"ctrlEndYyMmDt":ctrlEndYyMmDt
                          ,"ctrlGrpCd":ctrlGrpCd                              //통제그룹
                          ,"ctrlTargCd":ctrlTargCd                             //통제대상
                          ,"ctrlDlrCd":""                                     //딜러코드
                          ,"ctrlDlrNm":""                                     //딜러명
                          ,"remark"   :""                                     //비고
                      });
                  }
              }else{
                  // 마감시간통제정보를 먼저 진행해 주십시오.
                  dms.notification.success("<spring:message code='sal.lbl.deadlineCtrlInfo' var='deadlineCtrlInfo' /><spring:message code='global.info.required.preprocess' arguments='${deadlineCtrlInfo}' />");
              }
          } else {
              //마감시간통제정보를 먼저 선택해 주십시오.
              dms.notification.success("<spring:message code='sal.lbl.deadlineCtrlInfo' var='deadlineCtrlInfo' /><spring:message code='global.info.chkSelectItemMsg' arguments='${deadlineCtrlInfo}' />");
          }


        }
    });

    //마감대상딜러정보  - 삭제
    $("#btnDelDetail").kendoButton({
        click:function(e) {
            var grid = $("#detailGrid").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    //마감대상딜러정보  - 저장
    $("#btnSaveDetail").kendoButton({
        click:function(e) {

            var grid = $("#detailGrid").data("kendoExtGrid");

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/sal/ctl/ddlCtrl/multiTargetDealer.do' />"
                    ,data:JSON.stringify(saveData)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error) {

                    }
                    ,success:function(jqXHR, textStatus) {

                        grid.dataSource._destroyed = [];
                        grid.dataSource.page(1);

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

    //마감대상딜러정보  - 취소
    $("#btnCancelDetail").kendoButton({
        click:function(e) {
            $('#detailGrid').data('kendoExtGrid').cancelChanges();
        }
    });

    //마감시간통제 그리드
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0721-113323"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/ctl/ddlCtrl/selectDeadlineCtrlMng.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sCtrlYyMmDt"] = $("#sCtrlYyMmDt").val();                                    //통제년월
                        params["sCtrlGrpCd"] = $("#sCtrlGrpCd").data("kendoExtDropDownList").value();          //통제그룹
                        params["sCtrlTargCd"] = $("#sCtrlTargCd").data("kendoExtDropDownList").value();        //통제대상

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"ctrlSeq"
                    ,fields:{
                        ctrlSeq    :{type:"string"}
                        ,ctrlStartYyMmDt:{type:"date",validation:{required:true}}
                        ,ctrlEndYyMmDt:{type:"date",validation:{required:true}}
                        ,ctrlGrpCd :{type:"string",validation:{required:true}}
                        ,ctrlTargCd:{type:"string",validation:{required:true}}
                        ,dlrCtrlRangeCd:{type:"string",validation:{required:true}}
                        ,ctrlYn    :{type:"string",validation:{required:true}}
                        ,remark    :{type:"string"}
                        ,regUsrId  :{type:"string"}
                        ,regDt     :{type:"date"}
                        ,updtUsrId :{type:"string"}
                        ,updtDt    :{type:"date"}
                    }
                }
            }
        }
        ,dataBinding:function(e) {
            $("#detailGrid").data("kendoExtGrid").dataSource.data([]);
        }
        ,edit:function(e){
            var eles = e.container.find("input");
            var fieldName;
            if(eles.length > 1){
                fieldName = eles[eles.length-1].getAttribute("name");
            }else{
                fieldName = eles.attr("name");
            }

            var input = e.container.find(".k-input");
            var selectedItem = e.sender.dataItem(e.sender.select()[0]);

            if(fieldName == "ctrlTargCd"){
                if(dms.string.isEmpty(selectedItem.ctrlGrpCd)){
                    this.closeCell();
                }
            }

        }
        ,height:242
        ,selectable:"row"
        ,autoBind:true
        ,editableOnlyNew:true
        ,editableOnlyNewExcludeColumns:["ctrlYn","remark"]
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,columns:[
             {field:"ctrlStartYyMmDt"
                  ,title:"<spring:message code = 'sal.lbl.controllYyMm'/>"
                  ,width:100
                  ,attributes:{"class":"ac"}
                  ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
                  ,editor:function (container, options){
                     $('<input required name="ctrlfrStartYyMmDt" id="ctrlfrStartYyMmDt" data-name="<spring:message code='sal.lbl.controllYyMm' />" data-bind="value:' + options.field + '"/>')
                     .appendTo(container)
                     .kendoDateTimePicker({
                         format:"<dms:configValue code='dateFormat' /> HH:mm"
                        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                     });
                     $('<span class="k-invalid-msg" data-for="ctrlfrStartYyMmDt"></span>').appendTo(container);
                 }
             }//통제일자 - START
            ,{field:"ctrlEndYyMmDt"
                ,title:"<spring:message code = 'sal.lbl.controllYyMm'/>"
                    ,width:100
                    ,attributes:{"class":"ac"}
                    ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
                    ,editor:function (container, options){
                       $('<input required name="ctrlEndYyMmDt" id="ctrlEndYyMmDt" data-name="<spring:message code='sal.lbl.controllYyMm' />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoDateTimePicker({
                           format:"<dms:configValue code='dateFormat' /> HH:mm"
                          ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                       });
                       $('<span class="k-invalid-msg" data-for="ctrlEndYyMmDt"></span>').appendTo(container);
                   }
             }//통제일자 - END
            ,{field:"ctrlGrpCd"
                 ,title:"<spring:message code='sal.lbl.controllGroup' />"
                 , width:70
                 ,attributes:{"class":"ac"}
                 ,template:"#= dms.string.strNvl(ctrlGrpObj[ctrlGrpCd]) #"
                 ,editor:function(container, options) {
                     $('<input required name="ctrlGrpCd" data-bind="value:' + options.field + '"/>')
                     .appendTo(container)
                     .kendoExtDropDownList({
                         autoBind:true
                         ,dataTextField: "cmmCdNm"
                         ,dataValueField:"parentId"
                         ,dataSource:ctrlGrpCdDs
                         ,select:function(e){
                             var dataItem = this.dataItem(e.item);
                             ctrlTargCdDs = [];
                             $.each(sCtrlTargCdDs, function(idx, obj){
                                 if(obj["parentId"] == dataItem.parentId){
                                     ctrlTargCdDs.push(obj);
                                 }
                             });
                         }
                     });
                     $('<span class="k-invalid-msg" data-for="ctrlGrpCd"></span>').appendTo(container);
                 }
             }//통제그룹
            ,{field:"ctrlTargCd"
                 ,title:"<spring:message code='sal.lbl.controllTarget' />"
                 ,width:200
                 ,attributes:{"class":"al"}
                 ,template:"#= dms.string.strNvl(ctrlTargObj[ctrlTargCd]) #"
                 ,editor:function(container, options) {
                     $('<input required name="ctrlTargCd" data-bind="value:' + options.field + '"/>')
                     .appendTo(container)
                     .kendoExtDropDownList({
                         autoBind:true
                         ,dataTextField: "cmmCdNm"
                         ,dataValueField:"cmmCd"
                         ,dataSource:ctrlTargCdDs
                     });
                     $('<span class="k-invalid-msg" data-for="ctrlTargCd"></span>').appendTo(container);
                 }
             }//통제대상
            ,{field:"dlrCtrlRangeCd"
                 ,title:"<spring:message code='sal.lbl.dealerCtrlRange' />"
                 ,width:100
                 ,attributes:{"class":"ac"},template:"#= dms.string.strNvl(dlrCtrlRangeObj[dlrCtrlRangeCd]) #"
                 ,editor:function(container, options) {
                     $('<input required name="dlrCtrlRangeCd" data-bind="value:' + options.field + '"/>')
                     .appendTo(container)
                     .kendoExtDropDownList({
                         autoBind:true
                         ,dataTextField: "cmmCdNm"
                         ,dataValueField:"cmmCd"
                         ,dataSource:dlrCtrlRangeCdDs
                         ,index:0
                     });
                     $('<span class="k-invalid-msg" data-for="dlrCtrlRangeCd"></span>').appendTo(container);
                 }
             }//딜러통제범위
            ,{field:"ctrlYn"
                 ,title:"<spring:message code='sal.lbl.ctrlYn' />"
                 ,width:80
                 ,attributes:{"class":"ac"}
                 ,template:"# if(ctrlYnMap[ctrlYn] != null) { # #= ctrlYnMap[ctrlYn].cmmCdNm# # }#"
                 ,editor:function(container, options) {
                     $('<input required name="ctrlYn" data-bind="value:' + options.field + '"/>')
                     .appendTo(container)
                     .kendoExtDropDownList({
                         autoBind:true
                         ,dataTextField: "cmmCdNm"
                         ,dataValueField:"cmmCd"
                         ,dataSource:ctrlYnDs
                         ,index:0
                     });
                     $('<span class="k-invalid-msg" data-for="ctrlYn"></span>').appendTo(container);
                 }
             }//통제여부
            ,{field:"remark"
                 ,title:"<spring:message code='global.lbl.remark' />"
                 ,width:200
             }//비고
            ,{field:"updtUsrId"
                 ,title:"<spring:message code='sal.lbl.lastUpdtUser' />"
                 ,width:80 ,attributes:{"class":"ac"}
             }//최종수정자
            ,{field:"updtDt"
                 ,title:"<spring:message code = 'sal.lbl.lastUpdtDt'/>"
                 ,width:80
                 ,attributes:{"class":"ac"}
                 ,format:"{0:<dms:configValue code='dateFormat' />}"
             }//최종수정일자
        ]
        ,change:function(e){
            if(!e.sender.dataItem(e.sender.select()).isNew()){};
            $('#detailGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //공통코드 그리드
    $("#detailGrid").kendoExtGrid({
      gridId:"G-SAL-0721-113324"
      ,dataSource:{
           transport:{
              read:{
                  url:"<c:url value='/sal/ctl/ddlCtrl/selectTargetDealer.do' />"
              }
              ,parameterMap:function(options, operation) {
                  if (operation === "read") {

                      var params = {};

                      params["recordCountPerPage"] = options.pageSize;
                      params["pageIndex"] = options.page;
                      params["firstIndex"] = options.skip;
                      params["lastIndex"] = options.skip + options.take;
                      params["sort"] = options.sort;

                      var grid = $('#grid').data('kendoExtGrid');
                      var selectedItem = grid.dataItem(grid.select());
                      var ctrlSeq = selectedItem.ctrlSeq;

                      if(selectedItem!=null)  {
                          var ctrlSeq  = selectedItem.ctrlSeq;
                      }

                      params["sCtrlSeq"]  = ctrlSeq;

                      return kendo.stringify(params);

                  } else if (operation !== "read" && options.models) {
                      return kendo.stringify(options.models);
                  }
              }
          }
          ,schema:{
              model:{
                  id:"ctrlPk"
                  ,fields:{
                       ctrlSeq:{type:"number", editable:false}
                      ,ctrlStartYyMmDt:{type:"date", editable:false}
                      ,ctrlEndYyMmDt:{type:"date", editable:false}
                      ,ctrlGrpCd:{type:"string", editable:false}
                      ,ctrlTargCd:{type:"string", editable:false}
                      ,ctrlDlrCd:{type:"string" ,validation:{required:true}}
                      ,ctrlDlrNm:{type:"string" ,editable:false}
                      ,remark   :{type:"string" }
                      ,regUsrId :{type:"string", editable:false}
                      ,regDt    :{type:"date", editable:false}
                      ,updtUsrId:{type:"string", editable:false}
                      ,updtDt   :{type:"date", editable:false}
                  }
              }
          }
      }
      ,autoBind:false
      ,multiSelectWithCheckbox:true
      ,height:288
      ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
      ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
      ,enableTooltip:true               //Tooltip 적용, default:false
      ,columns:[
            {field:"ctrlDlrCd"
                ,title:"*<spring:message code='global.lbl.dlrCd' />", width:80, sortable:false, attributes:{"class":"al"}
                ,editor:function(container, options) {
                   $('<div class="form_search"><input type="text" name="ctrlDlrCd" data-name="<spring:message code='global.lbl.dlrCd' />" class="form_input" readonly="true" /><a href="#" onclick="dealerSearchPopup()" >&nbsp;</a></div>')
                   .appendTo(container);
                   $('<span class="k-invalid-msg" data-for="ctrlDlrCd"></span>')
                   .appendTo(container);
                }
            }//딜러코드
           ,{field:"ctrlDlrNm"
                ,title:"<spring:message code='global.lbl.dlrNm' />"
                ,width:130
                ,attributes:{"class":"al"}
                ,sortable:false
            }//딜러명
           ,{field:"remark"
                ,title:"*<spring:message code='global.lbl.remark' />"
                ,width:120
                ,attributes:{"class":"al"}
            }//비고
           ,{field:"ctrlStartYyMmDt"
               ,title:"<spring:message code='sal.lbl.controllYyMm' />"
               ,width:100
               ,attributes:{"class":"ac"}
               ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
           }//통제년월
          ,{field:"ctrlEndYyMmDt"
               ,title:"<spring:message code='sal.lbl.controllYyMm' />"
               ,width:100
               ,attributes:{"class":"ac"}
               ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
           }//통제년월
          ,{field:"ctrlGrpCd"
               ,title:"<spring:message code='sal.lbl.controllGroup' />"
               ,width:100
               ,attributes:{"class":"ac"}
               ,template:"#= dms.string.strNvl(ctrlGrpObj[ctrlGrpCd]) #"
           }//통제그룹
          ,{field:"ctrlTargCd"
               ,title:"<spring:message code='sal.lbl.controllTarget' />"
               ,width:120
               ,attributes:{"class":"al"}
               ,template:"#= dms.string.strNvl(ctrlTargObj[ctrlTargCd]) #"
           }//통제대상
          ,{field:"updtUsrId"
               ,title:"<spring:message code='sal.lbl.lastUpdtUser' />"
               ,width:80
               ,attributes:{"class":"ac"}
           }//최종수정자
          ,{field:"updtDt"
               ,title:"<spring:message code = 'sal.lbl.lastUpdtDt'/>"
               ,width:90
               ,attributes:{"class":"ac"}  //최종수정일자
               ,format:"{0:<dms:configValue code='dateFormat' />}"
           }
      ]

    });
});


var dealerSearchPopupWin;
function dealerSearchPopup() {
    dealerSearchPopupWin = dms.window.popup({
        windowId:"dealerSearchPopupWin"
        ,title:"<spring:message code='cmm.title.dlrSearch'/>"   // 딜러 조회
        ,content:{
            url:"<c:url value='/cmm/sci/commonPopup/selectDealerPopup.do'/>"
            , data:{
                "autoBind":false
                ,"usrNm":""
                ,"closeAfterSelect":true
                ,"callbackFunc":function(jsonObj){
                    if(jsonObj.length > 0) {

                        var rows = $("#detailGrid").data("kendoExtGrid").tbody.find("tr");
                        rows.each(function(index, row) {
                            var dataItem = $("#detailGrid").data("kendoExtGrid").dataSource._data;
                            if($(this).hasClass("k-state-selected")){
                                dataItem[index].ctrlDlrCd = jsonObj[0].dlrCd;
                                dataItem[index].ctrlDlrNm = jsonObj[0].dlrNm;
                            }
                        });

                        $("#detailGrid").data("kendoExtGrid").refresh();
                    }
                }
            }
        }

    });
}





</script>




