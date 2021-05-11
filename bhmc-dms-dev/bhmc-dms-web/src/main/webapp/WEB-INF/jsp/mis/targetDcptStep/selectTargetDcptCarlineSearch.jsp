<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<%--
    JSP Name:selectTargetDcptCarlineSearch.jsp
    Description:목표 차종 설정 탭 화면
    author chibeom.song
    since 2016. 9. 20.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2016. 9. 20.   chibeom.song     최초 생성
--%>
<!-- 목표 차종 설정 -->
<div id="resizableContainer">
<section class="group">
    <div class="header_area">
        <div class="left_area ml0">
            <span class="span_txt"><spring:message code="mis.lbl.targetyearmonth" /></span>
            <input type="text" id="sTargetCarlineYyMm" name="sTargetCarlineYyMm" class="form_datepicker" maxlength="6" style="width:150px;">
            <dms:access viewId="VIEW-D-10801" hasPermission="${dms:getPermissionMask('READ')}">
            	<button type="button" class="btn_s" id="btnTargetCarlineSearch" name="btnTargetCarlineSearch"><spring:message code="global.btn.search" /></button>
            </dms:access>
        </div>
        <div class="btn_right">
        	<dms:access viewId="VIEW-D-10802" hasPermission="${dms:getPermissionMask('READ')}">
            	<button type="button" class="btn_s" id="btnSave"><spring:message code="global.btn.save" /></button>
            </dms:access>
        </div>
    </div>
    <div class="header_area"></div>
    <!-- 그리드 시작 -->
    <div class="table_grid table_info_v2">
        <div class="table_grid">
            <div id="grid"></div>
        </div>
    </div>
    <!-- 그리드 종료 -->
</section>
</div>
<script>

    var carlineCdList = [{"carlineCd":"", "carlineNm":""}];
    <c:forEach var="obj" items="${carlineCdList}">
    carlineCdList.push({"carlineCd":"${obj.carlineCd}", "carlineNm":"${obj.carlineNm}"});
    carlineCdMap["${obj.carlineCd}"] = "${obj.carlineNm}";
    </c:forEach>

    $(document).ready(function() {

        $("#sTargetCarlineYyMm").kendoDatePicker({
            value:"${sysdate}"
           ,start:"year"
           ,depth:"year"
           ,format:"yyyyMM"
        });

        $("#sTargetCarlineYyMm").kendoMaskedTextBox({
            mask:"######"
        });

        var now = new Date();

        function leadingZeros(n, digits) {
            var zero = '';
            n = n.toString();
            if (n.length < digits) {
                for (i = 0; i < digits - n.length; i++)
                    zero += '0';
            }
            return zero + n;
        }

        $("#sTargetCarlineYyMm").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2));

        //버튼 - 조회
        $("#btnTargetCarlineSearch").kendoButton({
            click:function(e) {
                $('#grid').data('kendoExtGrid').dataSource.page(1);
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
                        url:"<c:url value='/mis/tds/multiTargetDcptCarlineGrid.do' />"
                        ,data:JSON.stringify(saveData)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR, status, error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
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

        $("#grid").on("click", "input.carlineConfig", function(e){

            var grid = $("#grid").data("kendoExtGrid");
            var uid = $(this).data("uid");

            console.log("this prop checked :" +$(this).prop("checked"));
            if ($(this).prop("checked")) {
                $(this).prop("checked", true);
                grid.dataSource.getByUid(uid)["carlineConfig"]= "Y";
            } else {
                $(this).prop("checked", false);
                grid.dataSource.getByUid(uid)["carlineConfig"]= "N";
            }
            grid.dataSource.getByUid(uid)["dirty"]= true;
        });

        $(document).on("click", "input.carlineConfigAll", function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var checked = $(this).is(":checked");
            var uid = $(this).data("uid");
            var rows = grid.tbody.find("tr");

            if(checked){
                rows.each(function(index, row) {
                    $(".carlineConfig[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", true);
                    grid.dataSource.getByUid($(this).attr("data-uid"))["carlineConfig"]= "Y";
                    grid.dataSource.getByUid($(this).attr("data-uid"))["dirty"]= true;
                });

            }else{
                rows.each(function(index, row) {
                    $(".carlineConfig[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);
                    grid.dataSource.getByUid($(this).attr("data-uid"))["carlineConfig"]= "N";
                    grid.dataSource.getByUid($(this).attr("data-uid"))["dirty"]= true;
                });

            }

        });

        //그리드 설정
        $("#grid").kendoExtGrid({
            //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
            gridId:"G-MIS-0920-123333"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/mis/tds/selectTargetDcptCarlineGrid.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sTargetCarlineYyMm"] = $("#sTargetCarlineYyMm").val();

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
                            ,goalYy:{type:"string", editable:false}
                            ,goalMm:{type:"string", editable:false}
                            ,carlineCd:{type:"string", editable:false}
                            ,carlineNm:{type:"string", editable:false}
                            ,carlineConfig:{type:"string", editable:false}
                        }
                    }
                }
            }
            ,height:700
            ,filterable:false
            ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
            ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
            ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:false               //Tooltip 적용, default:false
            ,sortable:false
            ,navigatable:false
            ,selectable:false
            ,columns:[
                 {field:"goalYy", title:"<spring:message code='mis.lbl.goalYy' />", width:150, attributes:{"class":"ac"}}
                ,{field:"goalMm", title:"<spring:message code='mis.lbl.goalMm' />", width:150, attributes:{"class":"ac"}}
                ,{field:"carlineCd", title:"<spring:message code='mis.lbl.carlineCd' />", width:150, attributes:{"class":"ac"}}
                ,{field:"carlineNm", title:"<spring:message code='mis.lbl.carlineNm' />", width:150, attributes:{"class":"al"}}
                ,{field:"carlineConfig", title:"<spring:message code='mis.lbl.carlineconfig' />&nbsp;<input type='checkbox' class='carlineConfigAll' />", width:100, attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        if (dataItem.carlineConfig == 'Y') {
                            spanObj = "<input type='checkbox' checked='checked' class='carlineConfig' data-uid="+dataItem.uid+" />";
                        } else if (dataItem.carlineConfig == 'N') {
                            spanObj = "<input type='checkbox' class='carlineConfig' data-uid="+dataItem.uid+" />";
                        } else {
                            spanObj = "<input type='checkbox' class='carlineConfig' data-uid="+dataItem.uid+" />";
                        }
                        return spanObj;
                    }
                    , editor:function(container, options){
                        $('<input type="checkbox" class="carlineConfig" />')
                    }
                }
            ]
        });

    });
</script>
<!-- 목표 차종 설정 -->