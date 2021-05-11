<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

   <!-- 창고목록 -->
   <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><%-- <spring:message code="cmm.title.strgeInfoMng" /> --%></h1>
            <div class="btn_right">
                <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
                <button type="button" class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button>
                <button type="button" class="btn_m btn_cancel" id="btnCancel"><spring:message code="global.btn.cancel" /></button>
            </div>
        </div>

        <!-- 창고조회 -->
        <div class="table_form" role="search" data-btnid="btnSearch">
            <input id="sDlrCd" type="hidden" value="${dlrCd}" />
            <input id="sPltCd" type="hidden" value="${pltCd}" />
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
                        <th scope="row"><spring:message code='global.lbl.strgeCd' /></th>
                        <td>
                            <input id="sStrgeCd" type="text" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.strgeNm' /></th>
                        <td>
                            <input id="sStrgeNm" type="text" class="form_input" />
                        </td>
                        <th scope="row"><%-- <spring:message code='global.lbl.locMngYn' /> --%></th>
                        <td>
                            <input id="sLocMngYn" type="text" class="form_comboBox hidden" />
                        </td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- //창고조회 -->

        <!-- 그리드기능버튼 -->
        <div class="header_area">
            <div class="btn_right">
                <button type="button" class="btn_s" id="btnAdd"><spring:message code="global.btn.rowAdd" /></button>
                <button type="button" class="btn_s" id="btnDel"><spring:message code="global.btn.rowDel" /></button>
            </div>
        </div>
        <!-- //그리드기능버튼 -->


        <div class="table_grid">
            <div id="grid" class="grid"></div>
        </div>
    </section>

<!-- script -->
<script type="text/javascript">

    //창고유형
    var strgeTpList = [];
    <c:forEach var="obj" items="${strgeTpList}">
    strgeTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>

    //창고유형 Map
    var strgeTpMap = dms.data.arrayToMap(strgeTpList, function(obj){ return obj.cmmCd; });

    $(document).ready(function() {

        //조회조건 - 로케이션관리여부
        $("#sLocMngYn").kendoExtDropDownList({
            dataSource:["","Y","N"]
            ,index:0
        });

        // 창고 조회
        $("#btnSearch").kendoButton({
            click:function(e){
                $("#grid").data("kendoExtGrid").dataSource.read();
            }
        });

        //버튼 - 추가
        $("#btnAdd").kendoButton({
            click:function(e) {
                $('#grid').data('kendoExtGrid').dataSource.insert(0, {
                    "dlrCd":$("#sDlrCd").val()
                    ,"pltCd":$("#sPltCd").val()
                    ,"netingUseYn":"N"
                    ,"locMngYn":"N"
                    ,"strgeTp":""
                });
            }
        });

        //버튼 - 삭제
        $("#btnDel").kendoButton({
            click:function(e) {
                var grid = $("#grid").data("kendoExtGrid");
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

                var grid = $("#grid").data("kendoExtGrid");

                var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
                if (grid.cudDataLength == 0) {
                    //변경된 정보가 없습니다.
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return;
                }

                if (grid.gridValidation()) {
                    $.ajax({
                        url:"<c:url value='/cmm/cmp/storage/multiStorages.do' />",
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
                $('#grid').data('kendoExtGrid').cancelChanges();
            }
        });

        $("#grid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                         url:"<c:url value='/cmm/cmp/storage/selectStorages.do' />"
                    }
                    ,parameterMap:function(options, operation)
                    {
                        if (operation === "read") {

                            var params = {};

                            params["sDlrCd"] = $("#sDlrCd").val();
                            params["sPltCd"] = $("#sPltCd").val();
                            params["sStrgeCd"] = $("#sStrgeCd").val();
                            params["sStrgeNm"] = $("#sStrgeNm").val();

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
                            rnum:{type:"number", editable:false}
                            ,dlrCd:{type:"string", validation:{required:true}}
                            ,pltCd:{type:"string", validation:{required:true}}
                            ,pltNm:{type:"string", validation:{required:true}, editable:false}
                            ,strgeCd:{type:"string", validation:{required:true}}
                            ,strgeNm:{type:"string", validation:{required:true}}
                            ,netingUseYn:{type:"string", validation:{required:true}}
                            ,locMngYn:{type:"string", validation:{required:true}}
                        }
                    }
                }
            }
            ,pageable:false
            ,autoBind:false
            ,multiSelectWithCheckbox:true
            ,editableOnlyNew:true
            ,editableOnlyNewExcludeColumns:["strgeNm","netingUseYn","locMngYn"]
            ,columns:[
                {field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:120
                    ,attributes:{"class":"ac"}
                }
                ,{field:"strgeCd", title:"<spring:message code='global.lbl.strgeCd' />", width:120
                    ,attributes:{"class":"ac"}
                }
                ,{field:"strgeNm", title:"<spring:message code='global.lbl.strgeNm' />", width:250}
                ,{field:"strgeTp", title:"<spring:message code='global.lbl.strgeTp' />", width:120
                    ,attributes:{"class":"ac"}
                    ,template:"# if(strgeTpMap[strgeTp] != null) { # #= strgeTpMap[strgeTp].cmmCdNm# # }#"
                    ,editor:function(container, options) {
                        $('<input required name="strgeTp" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtDropDownList({
                            autoBind:false
                            ,dataSource:strgeTpList
                            ,dataValueField:"cmmCd"
                            ,dataTextField:"cmmCdNm"
                        });
                        $('<span class="k-invalid-msg" data-for="strgeTp"></span>').appendTo(container);
                    }
                }
                ,{field:"netingUseYn", title:"<spring:message code='global.lbl.netingUseYn' />", width:150
                    , attributes:{"class":"ac"}
                    ,editor:function(container, options) {
                        $('<input required name="netingUseYn" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtDropDownList({
                            autoBind:false
                            ,dataSource:["Y","N"]
                        });
                        $('<span class="k-invalid-msg" data-for="netingUseYn"></span>').appendTo(container);
                    }
                }
                ,{title:""}
            ]
        });
    });

</script>