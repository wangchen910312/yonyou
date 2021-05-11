<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

   <!--  -->
   <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code='cmm.title.centList' /></h1>
            <div class="btn_right">
                <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code='global.btn.search' /></button>
                <button type="button" class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button>
                <button type="button" class="btn_m btn_cancel" id="btnCancel"><spring:message code="global.btn.cancel" /></button>
            </div>
        </div>

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
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.pltCd' /></th>
                        <td>
                            <input id="sDlrCd" type="hidden" value="${dlrCd}" />
                            <input id="sPltCd" type="text" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.pltNm' /></th>
                        <td>
                            <input id="sPltNm" type="text" class="form_input" />
                        </td>
                        <th scope="row"></th>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- 그리드 기능 버튼 시작 -->
        <div class="header_area">
            <div class="btn_right">
                <button type="button" class="btn_s" id="btnAdd"><spring:message code="global.btn.rowAdd" /></button>
                <button type="button" class="btn_s" id="btnDel"><spring:message code="global.btn.rowDel" /></button>
            </div>
        </div>
        <!-- 그리드 기능 버튼 종료 -->

        <div class="table_grid">
            <div id="plantGrid" class="grid"></div>
        </div>
    </section>

<!-- script -->
<script type="text/javascript">
    // 달력목록
    var calendarList = [{"calendarId":"", "calendarNm":""}];
    <c:forEach var="obj" items="${calendarList}">
    calendarList.push({"calendarId":"${obj.calendarId}", "calendarNm":"${obj.calendarNm}"});
    </c:forEach>

    //달력정보 Map
    var calendarMap = dms.data.arrayToMap(calendarList, function(obj){ return obj.calendarId; });

    $(document).ready(function() {

        //센터조회
        $("#btnSearch").kendoButton({
            click:function(e) {
                $("#plantGrid").data("kendoExtGrid").dataSource.read();
            }
        });

        //버튼 - 추가
        $("#btnAdd").kendoButton({
            click:function(e) {
                $('#plantGrid').data('kendoExtGrid').dataSource.insert(0, {
                    "dlrCd":$("#sDlrCd").val()
                    ,"calendarId":""
                });
            }
        });

        //버튼 - 삭제
        $("#btnDel").kendoButton({
            click:function(e) {
                var grid = $("#plantGrid").data("kendoExtGrid");
                var rows = grid.select();

                if (rows.length < 1) {
                    //목록을 선택하여 주십시오.
                    dms.notification.info("<spring:message code='global.info.required.select'/>");
                    return;
                }

                rows.each(function(index, row) {
                    grid.removeRow(row);
                });
            }
        });

        //버튼 - 저장
        $("#btnSave").kendoButton({
            click:function(e) {

                var grid = $("#plantGrid").data("kendoExtGrid");

                var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
                if (grid.cudDataLength == 0) {
                    //변경된 정보가 없습니다.
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return;
                }

                if (grid.gridValidation()) {
                    $.ajax({
                        url:"<c:url value='/cmm/cmp/plant/multiPlants.do' />",
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



            }
        });

        //취소
        $("#btnCancel").kendoButton({
            click:function(e) {
                $('#plantGrid').data('kendoExtGrid').cancelChanges();
            }
        });


        //센터 그리드
        $("#plantGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                         url:"<c:url value='/cmm/cmp/plant/selectPlants.do' />"
                    }
                    ,parameterMap:function(options, operation)
                    {
                        if (operation === "read") {

                            var params = {};

                            params["sDlrCd"] = $("#sDlrCd").val();
                            params["sPltCd"] = $("#sPltCd").val();
                            params["sPltNm"] = $("#sPltNm").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                       id:"rnum"
                       ,fields:{
                           rnum:{type:"number"}
                           ,dlrCd:{ type:"string", validation:{required:true}}
                           ,pltCd:{ type:"string", validation:{required:true} }
                           ,pltNm:{ type:"string", validation:{required:true} }
                           ,fstStartDt:{ type:"date", validation:{required:true}}
                           ,endDdlnDt:{ type:"date", validation:{required:true}}
                           ,calendarId:{ type:"string", validation:{required:true}}
                      }
                   }
                }
            }
            ,height:250
            ,pageable:false
            ,multiSelectWithCheckbox:true
            ,editableOnlyNew:true
            ,editableOnlyNewExcludeColumns:["pltNm","fstStartDt","endDdlnDt","calendarId"]
            ,columns:[
                {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                    ,attributes:{"class":"ac"}
                }
                ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:80
                    ,attributes:{"class":"ac"}
                }
                ,{field:"pltCd", title:"<spring:message code='global.lbl.pltCd' />", width:80
                    ,attributes:{"class":"ac"}
                }
                ,{field:"pltNm", title:"<spring:message code='global.lbl.pltNm' />", width:250}
                ,{field:"fstStartDt", title:"<spring:message code='global.lbl.fstStartDt' />", width:100
                    ,attributes:{"class":"ac"}
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                    ,editor:function(container, options) {
                        $('<input required name="fstStartDt" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtMaskedDatePicker({
                            format:"<dms:configValue code='dateFormat' />"
                            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                            ,value:""
                        });
                        $('<span class="k-invalid-msg" data-for="fstStartDt"></span>').appendTo(container);
                    }
                }
                ,{field:"endDdlnDt", title:"<spring:message code='global.lbl.endDdlnDt' />", width:100
                    ,attributes:{"class":"ac"}
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                    ,editor:function(container, options) {
                        $('<input required name="endDdlnDt" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtMaskedDatePicker({
                            format:"<dms:configValue code='dateFormat' />"
                            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                            ,value:""
                        });
                        $('<span class="k-invalid-msg" data-for="endDdlnDt"></span>').appendTo(container);
                    }
                }
                ,{field:"calendarId", title:"<spring:message code='global.lbl.calendar' />", width:100
                    ,template:"# if(calendarMap[calendarId] != null) { # #= calendarMap[calendarId].calendarNm# # }#"
                    ,editor:function(container, options) {
                        $('<input required name="calendarId" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtDropDownList({
                            dataTextField:"calendarNm"
                            ,dataValueField:"calendarId"
                            ,dataSource:calendarList
                        });
                        $('<span class="k-invalid-msg" data-for="calendarId"></span>').appendTo(container);
                    }
                }
                ,{title:""}
            ]
        });
    });

</script>