<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

            <!-- 판매기회 실패관리 -->
        <div id="resizableContainer">
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code='crm.title.saleOpptFailCarLineMgmt' /><!-- 판매기회 실패관리 --></h1>
                    <div class="btn_right">
					<dms:access viewId="VIEW-I-12525" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_assignment" id="btnDist"><spring:message code='crm.lbl.distribute' /></button><!-- 배포 -->
					</dms:access>
					<dms:access viewId="VIEW-I-12524" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_save" id="btnSave"><spring:message code='global.btn.save' /></button><!-- 저장 -->
					</dms:access>
					<dms:access viewId="VIEW-I-12523" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code='global.btn.search' /></button><!-- 조회 -->
					</dms:access>
                    </div>
                </div>
                <div class="table_form form_width_70per">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:23%;">
                            <col style="width:10%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='crm.lbl.intentionCarline' /></th> <!-- 의향차종 -->
                                <td>
                                    <input type="text" id="sIntrCarlineCd" value="" class="form_comboBox" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- 그리드 기능 버튼 시작 -->
                <div class="header_area">
                    <div class="btn_right">
					<dms:access viewId="VIEW-I-12522" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_s" id="btnAdd"><spring:message code="global.btn.rowAdd" /></button><!-- 행추가 -->
					</dms:access>
					<dms:access viewId="VIEW-I-12521" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_s" id="btnCancel"><spring:message code="global.btn.cancel" /></button><!-- 취소 -->
					</dms:access>
                    </div>
                </div>
                <!-- 그리드 기능 버튼 종료 -->
                <div class="table_grid">
                    <div id="salesOpptFailGrid"  class="resizable_grid"></div>
                </div>
                <!-- <input type="hidden" name="saleOpptNo" id="saleOpptNo" /> -->
            </section>
        </div>

<script type="text/javascript">
    var carlineCdList = [];
    var carlineCdMap = [];

    //차종조회
    <c:forEach var="obj" items="${carlineCdList}">
        carlineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
        carlineCdMap["${obj.carlineCd}"] = "${obj.carlineNm}";
    </c:forEach>

    // prepare carlineNmList paras for grid template
    carlineNmList = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = carlineCdMap[val];
        }
        return returnVal;
    };

    $(document).ready(function() {

            /**
             * 차종 콤보박스
             */
            $("#sIntrCarlineCd").kendoExtDropDownList({
                dataTextField:"carlineNm"
               ,dataValueField:"carlineCd"
               ,dataSource:carlineCdList
               ,optionLabel: " "
               ,filter:"contains"
               ,filtering:function(e){
                   var filter = e.filter;
               }
            });

          //버튼 - 배포
            $("#btnDist").kendoButton({
                click:function(e) {

                   /*  var grid = $("#masterGrid").data("kendoExtGrid")
                    , dataItem = grid.dataItem(grid.select())
                    ;

                    if ( dms.string.isNotEmpty(dataItem.distDt)){
                        dms.notification.info("<spring:message code='crm.lbl.distribute' var='returnMsg' /><spring:message code='global.info.usedMsg' arguments='${returnMsg}' />");
                        return false;
                    }
ㅜ
                    var saveData = {};

                    saveData["seq"] = dataItem.seq;
                    saveData["distDt"] = new Date();

                    if ( dms.string.isEmpty(dataItem.seq)){
                        dms.notification.info("<spring:message code='global.lbl.item' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                        return false;
                    }
*/
                    $.ajax({
                        url:"<c:url value='/crm/cso/salesOpptFailOtherBrandMgmt/updateDistOpptFailOtherBrand.do' />"
                        //,data:JSON.stringify()
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,success:function(jqXHR, textStatus) {
                            //grid.dataSource._destroyed = [];
                            //grid.dataSource.page(1);

                            //정상적으로 반영 되었습니다.
                            dms.notification.success("<spring:message code='global.info.success'/>");
                        }
                    });
                }
            });

            //버튼 - 조회
            $("#btnSearch").kendoButton({
                click:function(e) {
                  $('#salesOpptFailGrid').data('kendoExtGrid').dataSource.page(1);
                }
            });

            //버튼 - 그리드- 행추가
            $("#btnAdd").kendoButton({
                click:function(e) {
                    $('#salesOpptFailGrid').data('kendoExtGrid').dataSource.insert(0);
                }
            });

            // 그리드- 취소버튼
            $("#btnCancel").kendoButton({
                click:function(e) {
                    $('#salesOpptFailGrid').data('kendoExtGrid').cancelChanges();
                }
            });

          //버튼 - 저장
            $("#btnSave").kendoButton({
                click:function(e) {
                    var grid = $("#salesOpptFailGrid").data("kendoExtGrid");
                    var saveData = grid.getCUDData("insertList", "updateList","deleteList");
                    if (grid.cudDataLength == 0) {
                        //변경된 정보가 없습니다.
                        dms.notification.info("<spring:message code='global.info.required.change'/>");
                        return;
                    }
                    
                    //$.each(saveData.insertList,function(key,val) {
//                         if (dms.string.isEmpty(val.intrCarlineCd)) {
//                             dms.notification.info("<spring:message code='crm.Info.selectCarLine'/>");
//                           return false;
//                        }else if(dms.string.isEmpty(val.otherBrandCarlineNm)){
//                            dms.notification.info("<spring:message code='crm.Info.otherBrandCarlineNm'/>");
//                            return false;
//                        }else if(dms.string.isEmpty(val.useYn)){
//                            dms.notification.info("<spring:message code='crm.info.selectUseYn'/>");
//                            return false;
//                        }
//                        else {
                           console.log(">>>>>>>>>>>>>>");
                           console.log(kendo.stringify(saveData));
                           if (grid.gridValidation()){
                               $.ajax({
                                  url:"<c:url value='/crm/cso/salesOpptFailOtherBrandMgmt/multiSalesOpptFailOtherBrandMgmtMain.do'/>",
                                   data:JSON.stringify(saveData),
                                   type:'POST',
                                   dataType:'json',
                                   contentType:'application/json',
                                   error:function(jqXHR,status,error) {
                                       dms.notification.error(jqXHR.responseJSON.errors);
                                   },
                                   success:function(jqXHR, textStatus) {
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
                       //}
                    //});
                }
            });

            //그리드 설정
            $("#salesOpptFailGrid").kendoExtGrid({
               dataSource:{
                    transport:{
                       read:{
                           url:"<c:url value='/crm/cso/salesOpptFailOtherBrandMgmt/selectSalesOpptFailOtherBrandMgmts.do' />"
                       }
                       ,parameterMap:function(options, operation) {
                           if (operation === "read") {
                               var params = {};
                               params["recordCountPerPage"] = options.pageSize;
                               params["pageIndex"] = options.page;
                               params["firstIndex"] = options.skip;
                               params["lastIndex"] = options.skip + options.take;
                               params["sort"] = options.sort;

                               params["sIntrCarlineCd"] = $("#sIntrCarlineCd").data("kendoExtDropDownList").value();
                               return kendo.stringify(params);
                           } else if (operation !== "read" && options.models) {
                               return kendo.stringify(options.models);
                           }
                       }
                   }
                   ,schema:{
                       model:{
                           id:"seq"
                           ,fields:{
                               seq:{type:"int", validation:{required:true}}
                               ,intrCarlineCd:{type:"string"}
                               ,otherBrandCarlineNm:{type:"string", editable:true}
                               ,useYn:{type:"string"}
                               ,updtDt:{type:"date"}
                               ,regDt:{type:"date"}
                           }
                       }
                   }
               }
               , multiSelectWithCheckbox:false
               , appendEmptyColumn:true
               ,columns:[
                   {field:"intrCarlineCd", title:"<spring:message code='crm.lbl.intentionCarline' />", width:150 ,attributes:{"class":"ac"}
                       ,editor:function(container, options) {
                           $('<input required name="intrCarlineCd" data-bind="value:' + options.field + '"/>')
                           .appendTo(container)
                           .kendoExtDropDownList({
                               autoBind:false
                               ,dataSource:carlineCdList
                               ,dataTextField:"carlineNm"
                               ,dataValueField:"carlineCd"
                           })
                           $('<span class="k-invalid-msg" data-for="intrCarlineCd"></span>').appendTo(container);
                       }
                   ,template:'#=carlineNmList(intrCarlineCd)#'
                   }
                   ,{field:"otherBrandCarlineNm", title:"<spring:message code='crm.lbl.failedCar' />", width:150 ,attributes:{"class":"ac"}}
                   ,{field:"useYn", title:"<spring:message code='crm.lbl.useYn' />", width:100 ,attributes:{"class":"ac"}
                       ,editor:function(container, options) {
                           $('<input required name="useYn" data-bind="value:' + options.field + '"/>')
                           .appendTo(container)
                           .kendoExtDropDownList({
                               autoBind:false,
                               dataSource:['Y','N'],
                               index:0
                           });
                           $('<span class="k-invalid-msg" data-for="useYn"></span>').appendTo(container);
                       }
                   }
               ]
            });
        });//end document.ready
</script>