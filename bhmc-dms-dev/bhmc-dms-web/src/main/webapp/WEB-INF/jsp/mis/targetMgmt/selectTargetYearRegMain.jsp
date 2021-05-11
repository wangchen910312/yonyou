<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 년간 목표 등록 -->
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="mis.title.targetYearReg" /></h1>
        <div class="btn_right">
            <!-- <button class="btn_m" id="btnApply"><spring:message code="mis.btn.apply" /></button>  -->
            <!-- <button class="btn_m btn_reset" id="btnInit"><spring:message code="mis.btn.init" /></button>  -->
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
            <button class="btn_m btn_tempSave" id="btnTempSave"><spring:message code="mis.btn.tempSave" /></button>
            <button class="btn_m btn_save" id="btnSetComplete"><spring:message code="mis.btn.setComplete" /></button>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
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
                <col style="width:15%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="mis.lbl.targetYear" /></span><!-- 목표년도 --></th>
                    <td><input type="text" id="sGoalYy" name="sGoalYy" class="form_datepicker" maxlength="4"></td>
                    <th scope="row"><spring:message code="mis.lbl.division" /><!-- 사업부 --></th>
                    <td><input type="text" id="sSdptCd" name="sSdptCd" class="form_comboBox"></td>
                    <th scope="row"><spring:message code="mis.lbl.officeNm" /><!-- 사무소 --></th>
                    <td><input type="text" id="sOfficeCd" name="sOfficeCd" class="form_comboBox"></td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="header_area">
        <div class="left_area left_area_v1 ml0">
            <!-- <input type="text" id="sSdptCd" name="sSdptCd" class="form_comboBox" style="width:120px;">
            <input type="text" id="sOfficeCd" name="sOfficeCd" class="form_comboBox" style="width:120px;">  -->
        </div>
        <div class="btn_right">
            <!-- <button type="button" class="btn_s" id="btnAdd"><spring:message code="global.btn.rowAdd" /></button> -->
            <button type="button" class="btn_s" id="btnDel"><spring:message code="global.btn.rowDel" /></button>
            <!-- <button type="button" class="btn_s" id="btnExcelExport"><spring:message code="global.btn.excelExport" /></button> -->
            <button type="button" class="btn_s" id="btnExcelAllImport"><spring:message code="mis.btn.allInputTarget" /></button>
            <!-- <button type="button" class="btn_s" id="btnExcelPartImport"><spring:message code="mis.btn.partInputTarget" /></button> -->
            <button type="button" class="btn_s" id="btnAllInputFormat"><spring:message code="mis.btn.allInputFormat" /></button>
            <button type="button" class="btn_s" id="btnYearTargetReport"><spring:message code="mis.lbl.reporttitle" /></button>
        </div>
    </div>
    <!-- 조회 조건 종료 -->

<div class="table_info table_info_v2 mt10">
    <!-- 그리드 시작 -->
    <div class="table_grid">
        <div id="grid"></div>
    </div>
    <!-- 그리드 종료 -->
</div>
</section>

<script>

    var sdptList = [{"sdptCd":"", "sdptNm":""}];
    <c:forEach var="obj" items="${sdptList}">
    sdptList.push({"sdptCd":"${obj.sdptCd}", "sdptNm":"${obj.sdptNm}"});
    </c:forEach>

    var officeList = [{"officeCd":"", "officeNm":""}];
    <c:forEach var="obj" items="${officeList}">
    officeList.push({"officeCd":"${obj.officeCd}", "officeNm":"${obj.officeNm}"});
    </c:forEach>

    $(document).ready(function() {

        //목표년도
        $("#sGoalYy").kendoDatePicker({
            value:"${sysdate}"
            ,start:"decade"
            ,depth:"decade"
            ,format:"yyyy"
            ,parseFormats:["yyyy"]
        });

        $("#sGoalYy").kendoMaskedTextBox({
            mask:"####"
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

        $("#sGoalYy").val(leadingZeros(now.getFullYear(), 4));


        $("#sSdptCd").kendoExtDropDownList({
            dataSource:sdptList
            ,dataTextField:"sdptNm"
            ,dataValueField:"sdptCd"
            ,index:0
            ,select:function(e){

                var dataItem = this.dataItem(e.item);
                var responseJson = dms.ajax.getJson({
                    url:"<c:url value='/mis/tmp/selectTargetYearRegOfficeCd.do' />"
                    ,data:JSON.stringify({"sSdptCd":dataItem.sdptCd})
                    ,async:false
                });

                $("#sOfficeCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
            }
        });

        $("#sOfficeCd").kendoExtDropDownList({
            dataSource:officeList
            ,dataTextField:"officeNm"
            ,dataValueField:"officeCd"
            ,index:0
            ,optionLabel:" "
        });

        //버튼 - 조회
        $("#btnSearch").kendoButton({
            click:function(e) {

                if($("#sGoalYy").val() == ''){
                    alert("<spring:message code='global.info.required.select'/>");
                    return;
                }

                $('#grid').data('kendoExtGrid').dataSource.page(1);
            }
        });

        //버튼 - 추가
        $("#btnAdd").kendoButton({
            click:function(e) {
                $('#grid').data('kendoExtGrid').dataSource.insert(0, {
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

        // 전체포맷다운로드
        $("#btnAllInputFormat").kendoButton({
            click:function(e) {
                location.href = "<c:url value='/cmm/sci/selectExcelTemplateDownload.do' />" + "?fileNm=YearAllInputFormat.xlsx";
            }
        });

        // 년간 목표 등록 레포트
        $("#btnYearTargetReport").kendoButton({
            click:function(e) {
                window.open('<c:url value="/mis/tmp/selectTargetYearRegReport.do" />', 'pop_new', 'width=870px, height=850px, top=0, left=0, resizable=no, scrollbars=yes, location=no,  toolbar=no, status=no, menubar=no');

                return false;
            }
        });

        // 버튼 - 엑셀 일괄등록
        $("#btnExcelAllImport").kendoButton({
            click:function(e) {

                if($("#sGoalYy").val() == ''){
                    alert("<spring:message code='mis.info.targetYearInfo'/>");
                    return;
                }

                targetYearAllRegUploadPopupWin = dms.window.popup({
                    title:"<spring:message code='mis.title.targetallyearreg'/>"
                    ,windowId:"targetYearAllRegUploadPopupWin"
                    ,content:{
                         url:"<c:url value='/mis/tmp/selectTargetAllYearRegPopup.do?goalYy=' />"+$("#sGoalYy").val()
                        ,data:{
                            "callbackFunc":function(){
                                $('#grid').data('kendoExtGrid').dataSource.read();
                            }
                        }
                    }
                });
            }
        });

       // 버튼 - 엑셀 부분등록
        $("#btnExcelPartImport").kendoButton({
            click:function(e) {
                targetYearPartRegUploadPopupWin = dms.window.popup({
                    title:"<spring:message code='mis.title.targetpartyearreg'/>"
                    ,windowId:"targetYearPartRegUploadPopupWin"
                    ,content:{
                         url:"<c:url value='/mis/tmp/selectTargetPartYearRegPopup.do'/>"
                        ,data:{
                            "callbackFunc":function(){
                                $('#grid').data('kendoExtGrid').dataSource.read();
                            }
                        }
                    }
                });
            }
        });

        //버튼 - 임시저장
        $("#btnTempSave").kendoButton({
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
                        url:"<c:url value='/mis/tmp/multiTargetYearRegTempSave.do' />"
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

      //버튼 - 설정완료
        $("#btnSetComplete").kendoButton({
            click:function(e) {

                if($("#sGoalYy").val() == ''){
                    alert("<spring:message code='mis.info.targetYearInfo'/>");
                    return;
                }

                if (!confirm($("#sGoalYy").val() + "<spring:message code='mis.info.targetyearconfirmyn'/>")) return;

                $.ajax({
                    type     :'post',
                    dataType :'json',
                    url      :'<c:url value="/mis/tmp/multiTargetYearRegCompleteSave.do?sGoalYy=" />'+$("#sGoalYy").val(),
                    cache    :false,
                    async    :false,
                    data     :$('#frm').serialize(),
                    success:function(data) {

                    },
                    error:function(xhr, textStatus) {

                    },
                    complete:function() {
                        alert($("#sGoalYy").val() + "<spring:message code='mis.info.targetyearconfirm'/>");
                        $('#grid').data('kendoExtGrid').dataSource.page(1);
                    }
                });
            }
        });

        //그리드 설정
        $("#grid").kendoExtGrid({
            //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
            gridId:"G-MIS-0728-144300"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/mis/tmp/selectTargetYearRegMainSearch.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sGoalYy"] = $("#sGoalYy").val();
                            params["sSdptCd"] = $("#sSdptCd").val();
                            params["sOfficeCd"] = $("#sOfficeCd").val();

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
                            ,goalYy:{type:"string", validation:{required:true}, editable:false}
                            ,sdptCd:{type:"string", validation:{required:true}, editable:false}
                            ,sdptNm:{type:"string", validation:{required:true}, editable:false}
                            ,officeCd:{type:"string", validation:{required:true}, editable:false}
                            ,officeNm:{type:"string", validation:{required:true}, editable:false}
                            ,dlrCd:{type:"string", validation:{required:true}, editable:false}
                            ,dlrNm:{type:"string", validation:{required:true}, editable:false}
                            ,carLineCd:{type:"string", validation:{required:true}, editable:false}
                            ,carLineNm:{type:"string", validation:{required:true}, editable:false}
                            ,goalPrefVal:{type:"number", validation:{required:true}}
                            ,prefTp:{type:"string", validation:{required:true}, editable:false, hidden:true}
                            ,prefTpNm:{type:"string", validation:{required:true}, editable:false}
                        }
                    }
                }
            }
            ,height:650
            ,filterable:{
                mode:"row"
            }
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
            ,multiSelectWithCheckbox:true     //멀티선택 적용. default:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:false               //Tooltip 적용, default:false
            ,sortable:false
            ,edit:function(e){
                var grid = this,
                fieldName = grid.columns[e.container.index()].field;

                if (e.model.prefTp == "2") {
                    if(fieldName=="goalPrefVal"){
                        this.closeCell();
                    }
                }


            }
            ,columns:[
                {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, attributes:{"class":"ac"}

                }
                ,{field:"goalYy", title:"<spring:message code='mis.lbl.goalYy' />", width:100, attributes:{"class":"ac"}

                }
                ,{field:"sdptNm", title:"<spring:message code='mis.lbl.division' />", width:150

                }
                ,{field:"officeNm", title:"<spring:message code='mis.lbl.officeNm' />", width:150

                }
                ,{field:"dlrCd", title:"<spring:message code='mis.lbl.dlrCd' />", width:100, attributes:{"class":"ac"}

                }
                ,{field:"dlrNm", title:"<spring:message code='mis.lbl.dealerNm' />", width:250

                }
                ,{field:"carLineCd", title:"<spring:message code='mis.lbl.carlineCd' />", width:100, attributes:{"class":"ac"}

                }
                ,{field:"carLineNm", title:"<spring:message code='mis.lbl.carlineNm' />", width:150

                }
                ,{field:"goalPrefVal", title:"<spring:message code='mis.lbl.targetvalue' />", width:150, format:"{0:n0}", attributes:{"class":"ar"}

                }
                ,{field:"prefTpNm", title:"<spring:message code='mis.lbl.config' />", width:100, attributes:{"class":"ac"}

                }
            ]
        });
    });
</script>