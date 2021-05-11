<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">

    <div class="header_area">
        <div class="btn_right">
            <button class="btn_m btn_add" id="btnAdd"><spring:message code="global.btn.add" /></button>
            <button class="btn_m btn_del" id="btnDel"><spring:message code="global.btn.del" /></button>
            <button class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button>
            <button class="btn_m btn_cancel" id="btnCancel"><spring:message code="global.btn.cancel" /></button>
        </div>
    </div>

    <div class="table_grid">
        <div id="grid" class="grid"></div>
    </div>

</section>

<script type="text/javascript">

    var supportedLangs = [""];
    <c:forEach var="obj" items="${supportedLangs}">
    supportedLangs.push("${obj}");
    </c:forEach>

    $(document).ready(function() {

        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         var options = parent.cmmCdTextPopupWin.options.content.data;

         var sCmmGrpCd = options.cmmGrpCd;
         var sCmmCd = options.cmmCd;


        /************************************************************
                    기능버튼 설정
        *************************************************************/



        // 닫기 버튼.
        $("#btnCancel").kendoButton({
            click:function(e){
                parent.cmmGrpTextPopupWin.close();
            }
        });

        //버튼 - 추가
        $("#btnAdd").kendoButton({
            click:function(e) {
                $('#grid').data('kendoExtGrid').dataSource.insert(0, {"cmmGrpCd":sCmmGrpCd, "cmmCd":sCmmCd});
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
                        url:"<c:url value='/cmm/sci/commonCode/multiCommonCodeTxts.do' />",
                        data:JSON.stringify(saveData),
                        type:'POST',
                        dataType:'json',
                        contentType:'application/json',
                        error:function(jqXHR,status,error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
                        },
                        success:function(jqXHR, textStatus) {

                            grid.dataSource._destroyed = [];
                            grid.dataSource.read();

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



        /************************************************************
                    그리드 설정
        *************************************************************/
        //그리드 설정
        $("#grid").kendoExtGrid({
            dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/cmm/sci/commonCode/selectCommonCodeTxts.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sCmmGrpCd"] = sCmmGrpCd;
                            params["sCmmCd"] = sCmmCd;

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,navigatable:false
                ,serverPaging:false
                ,pageSize:0
                ,schema:{
                    model:{
                        id:"rnum"
                        ,fields:{
                            rnum:{type:"number", editable:false}
                            ,cmmGrpCd:{type:"string", validation:{required:true}, editable :false}
                            ,cmmCd:{type:"string", validation:{required:true}, editable :false}
                            ,langCd:{type:"string", validation:{required:true}, editable:true}
                            ,cmmCdTxt:{type:"string", validation:{required:true}, editable:true}
                        }
                    }
                }
            }
            ,multiSelectWithCheckbox:true
            ,selectable:options.selectable === "multiple"? "multiple,row":"row"
            ,editableOnlyNew:true
            ,editableOnlyNewExcludeColumns:["langCd","cmmCdTxt"]
            ,autoBind:true
            ,pageable:false
            ,height:449
            ,columns:[
                {field:"cmmGrpCd", title:"<spring:message code='global.lbl.cmmGrpCd' />", width:120
                    ,attributes:{"class":"ac"}
                }
                ,{field:"cmmCd", title:"<spring:message code='global.lbl.cmmCd' />", width:120
                    ,attributes:{"class":"ac"}
                }
                ,{field:"langCd", title:"<spring:message code='global.lbl.langCd' />", width:80
                    ,attributes:{"class":"ac"}
                    ,editor:function(container, options) {
                        $('<input required name="langCd" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtDropDownList({
                            autoBind:false
                            ,dataSource:supportedLangs
                        });
                        $('<span class="k-invalid-msg" data-for="langCd"></span>').appendTo(container);
                    }
                }
                ,{field:"cmmCdTxt", title:"<spring:message code='global.lbl.cmmCdTxt' />"}
            ]

        });
    });
</script>









