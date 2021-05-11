<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div id="resizableContainer">
<!-- content -->
<!-- <section id="content"> -->

    <!-- 기술자문 영역 -->
    <section class="group">
        <div class="header_area">
            <div class="btn_left">
			<dms:access viewId="VIEW-D-11986" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnInit" class="btn_m btn_reset" type="button"><spring:message code="par.btn.init" /></button><!--btnInit  -->
			</dms:access>
            </div>
            <div class="btn_right">
			<dms:access viewId="VIEW-D-11985" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnQnaRequest" name="btnQnaRequest" class="btn_m"><spring:message code="par.btn.skillQnaRequest" /><!-- 问题申请 --></button>
			</dms:access>
			<dms:access viewId="VIEW-D-11984" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnSearch" name="btnSearch" class="btn_m btn_search"><spring:message code="par.btn.search" /><!-- btnSearch --></button>
			</dms:access>
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
                    <col style="width:10%;">
                    <col style="width:15%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.dlrCd" /></th>
                        <td class="required_area">
                            <input id="sDlrCd" class="form_input form_readonly" readonly="readonly" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.titleNm" /><!-- 문제제목 --></span></th>
                        <td>
                            <input id="sTitleNm" name="sTitleNm" class="form_input form_required" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.pblmItemDstin" /><!-- 기술자문부품분류 --></th>
                        <td>
                            <input id="sDlrPblmCd" name="sDlrPblmCd" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.pblmStatCd" /><!-- 문제상태 --></th>
                        <td>
                            <input id="sPblmStatCd" name="sPblmStatCd" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.pblmNo" /><!-- 문제번호 --></th>
                        <td>
                            <input id="sPblmNo" name="sPblmNo" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.pblmCont" /><!-- 문제내용 --></th>
                        <td>
                            <input id="sPblmCont" name="sPblmCont" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부품번호 --></th>
                        <td>
                            <input id="sItemCd" name="sItemCd" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.pblmSendDt" /><!-- 제출일시 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sPblmStartSendDt" name="sPblmStartSendDt" class="form_datepicker" />
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sPblmEndSendDt" name="sPblmEndSendDt" class="form_datepicker" />
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.carLine" /><!-- 기술자문차종 --></th>
                        <td>
                            <input id="sModelCd" name="sModelCd" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.vin" /><!-- VIN--></th>
                        <td>
                            <input id="sVin" name="sVin" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.pblmTotDt" /><!-- 총시간 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sPblmTotStartDt" name="sPblmTotStartDt" class="form_datepicker" />
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sPblmTotEndDt" name="sPblmTotEndDt"  class="form_datepicker" />
                                </div>
                            </div>
                        </td>
                        <th/>
                        <td/>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid mt10">
            <div id="gridSkillQna" class="resizable_grid" />
        </div>

    </section>
    <!-- // 기술자문 영역 -->

<!-- </section> -->
<!-- //content -->
</div>
<!-- script -->
<script>
//plbmModelCdList
var plbmModelCdList = [];
<c:forEach var="obj" items="${plbmModelCdList}">
plbmModelCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var plbmModelCdMap = {};
$.each(plbmModelCdList, function(idx, obj){
    plbmModelCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//dlrPblmCdList
var dlrPblmCdList = [];
<c:forEach var="obj" items="${dlrPblmCdList}">
dlrPblmCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var dlrPblmCdMap = {};
$.each(dlrPblmCdList, function(idx, obj){
    dlrPblmCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//pblmStatCdList
var pblmStatCdList = [];
<c:forEach var="obj" items="${pblmStatCdList}">
pblmStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var pblmStatCdMap = {};
$.each(pblmStatCdList, function(idx, obj){
    pblmStatCdMap[obj.cmmCd] = obj.cmmCdNm;
});

//skillAndQna Popup Func
var selectSkillAndQnaPopupWin;
function selectSkillAndQnaPopupWindow(){
    selectSkillAndQnaPopupWin = dms.window.popup({
        windowId:"selectSkillAndQnaPopupWin"
        ,title:"<spring:message code = 'par.title.skillAndQna'/>"//skillAndQna select
        ,width:1000
        ,height:540
        ,content:{
            url:"<c:url value='/par/cmm/selectSkillAndQnaPopup.do'/>"
            ,data:{
                "type":"custom1"
                ,"autoBind":false
                ,"selectedRowItem":selectedRowItem
                ,"selectable":"row"
                ,"callbackFunc":function(data){
                    if(data){
                        selectSkillAndQnaPopupWin.close();
                        $("#gridSkillQna").data("kendoExtGrid").dataSource.read();
                    }
                }
            }
        }
    });
}

function pageInit(){
    var minDate = new Date('1999-12-31'),
        maxDate = new Date('9999-12-31'),
        toYY,
        toMM,
        toDD,
        frYY,
        frMM,
        frDD;

    frYY = minDate.getFullYear();
    frMM = minDate.getMonth();
    frDD = minDate.getDate();

    toYY = maxDate.getFullYear();
    toMM = maxDate.getMonth();
    toDD = maxDate.getDate();
    selectedRowItem = [];

    $("#sDlrCd").val("${dlrCd}");
    $("#sTitleNm").val("");

    $("#sDlrPblmCd").data("kendoExtDropDownList").select(0);
    $("#sPblmStatCd").data("kendoExtDropDownList").select(0);
    $("#sModelCd").data("kendoExtDropDownList").select(0);

    $("#sPblmNo").val("");
    $("#sPblmCont").val("");
    $("#sItemCd").val("");

    $("#sPblmStartSendDt").data("kendoExtMaskedDatePicker").value('');
    $("#sPblmEndSendDt").data("kendoExtMaskedDatePicker").value('');
    $("#sPblmTotStartDt").data("kendoExtMaskedDatePicker").value('');
    $("#sPblmTotEndDt").data("kendoExtMaskedDatePicker").value('');

    $("#sPblmStartSendDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
    $("#sPblmEndSendDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));

    $("#sPblmTotStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
    $("#sPblmTotEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));

    $("#gridSkillQna").data("kendoExtGrid").dataSource.data([]);
}

//grid row item.
var selectedRowItem = [];

    $(document).ready(function() {

        $("#sDlrCd").val("${dlrCd}");

        //btnQnaRequest
        $("#btnQnaRequest").kendoButton({
            click:function(e){
                //skillAndQna popup Func call.
                selectSkillAndQnaPopupWindow(selectedRowItem);
            }
        });
        //btnSearch
        $("#btnSearch").kendoButton({
            click:function(e){
                $("#gridSkillQna").data("kendoExtGrid").dataSource.read();
            }
        });
        //btnInit
        $("#btnInit").kendoButton({
            click:function(e){
                pageInit();
            }
        });
        //sPblmStartSendDt
        $("#sPblmStartSendDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        //sPblmEndSendDt
        $("#sPblmEndSendDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        //sPblmTotStartDt
        $("#sPblmTotStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        //sPblmTotEndDt
        $("#sPblmTotEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        //sModelCd
        $("#sModelCd").kendoExtDropDownList({
            dataSource:plbmModelCdList
            ,dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,optionLabel:" "
            ,autoBind:true
            ,index:0
        });
        //sDlrPblmCd
        $("#sDlrPblmCd").kendoExtDropDownList({
            dataSource:dlrPblmCdList
            ,dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,optionLabel:" "
            ,autoBind:true
            ,index:0
        });
        //sPblmStatCd
        $("#sPblmStatCd").kendoExtDropDownList({
            dataSource:pblmStatCdList
            ,dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,optionLabel:" "
            ,autoBind:true
            ,index:0
        });

        //gridSkillQna
        $("#gridSkillQna").kendoExtGrid({
            gridId:"G-PAR-0824-132701"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/cpm/skillQna/selectSkillQnaHeaders.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            //search input parameter
                            params["sItemCd"] = $("#sItemCd").val();
                            params["sPblmNo"] = $("#sPblmNo").val();
                            params["sCarlineCd"] = $("#sModelCd").data("kendoExtDropDownList").value();
                            params["sVinNo"] = $("#sVin").val();
                            params["sTitleNm"] = $("#sTitleNm").val();
                            params["sDlrPblmCd"] = $("#sDlrPblmCd").data("kendoExtDropDownList").value();
                            params["sPblmStatCd"] = $("#sPblmStatCd").data("kendoExtDropDownList").value();
                            params["sPblmCont"] = $("#sPblmCont").val();
                            params["sPblmStartSendDt"] = $("#sPblmStartSendDt").data("kendoExtMaskedDatePicker").value();
                            params["sPblmEndSendDt"] = $("#sPblmEndSendDt").data("kendoExtMaskedDatePicker").value();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,serverPaging:true
                ,schema:{
                    model:{
                        id:"itemCd"
                        ,fields:{
                            dlrCd:{ type:"string" , validation:{required:true} }
                            ,pblmNo:{ type:"string" }
                            ,modelCd:{ type:"string" }
                            ,vinNo:{ type:"string" }
                            ,titleNm:{ type:"string" }
                            ,itemMainGrpCd:{ type:"string" }
                            ,itemCd:{ type:"string" }
                            ,pblmCont:{ type:"string" }
                            ,pblmStatCd:{ type:"string" }
                            ,dlrCdPblmStatCd:{ type:"string" }
                            ,qestId:{ type:"string" }
                            ,dlrCmpCd:{ type:"string" }
                            ,fileNo:{ type:"string" }
                            ,fileNm:{ type:"string" }
                            ,fileSizeVal:{ type:"number" }
                            ,addQestCont:{ type:"string" }
                            ,dlrPblmCd:{ type:"string" }
                            ,answPblmNo:{ type:"string" }
                            ,regUsrId:{ type:"string" }
                            ,regDt:{ type:"date" }
                            ,updtUsrId:{ type:"string" }
                            ,updtDt:{ type:"date" }
                        }
                    }
                }
            }
            ,selectable:"row"
            ,editable:false
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true           //empty column. default:false
            ,multiSelectWithCheckbox:false
            ,change:function(e){
                var selectedItem = this.dataItem(this.select());

                if( selectedItem != null && selectedItem != 'undefined'){
                    selectedRowItem = selectedItem;
                }
            }
            ,dataBound:function(e){
                var grid = this;

                grid.tbody.find("tr").dblclick(function(e){
                    var dataItem = grid.dataItem(this);
                    //skillAndQna popup Func call.
                    selectSkillAndQnaPopupWindow(dataItem);
                });
            }
            ,columns:[
                {field:"pblmNo", title:"<spring:message code='par.lbl.pblmNo' />", width:120}
                ,{field:"answPblmNo", title:"<spring:message code='par.lbl.answPblmNo' />", width:120}
                ,{field:"titleNm", title:"<spring:message code='par.lbl.titleNm' />", width:250}
                ,{field:"updtDt", title:"<spring:message code='par.lbl.pblmSendDt' />", width:100, format:"{0:<dms:configValue code='dateFormat' />}"}
                ,{field:"vinNo", title:"<spring:message code='par.lbl.vin' />", width:120}
                ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd' />", width:120}
                ,{field:"modelCd", title:"<spring:message code='par.lbl.carLine' />", width:200
                    ,template:'#if(plbmModelCdMap[modelCd] !== undefined ){# #= plbmModelCdMap[modelCd]# #}#'
                }
                ,{field:"dlrPblmCd", title:"<spring:message code='par.lbl.itemMainGrpCd' />", width:150
                    ,template:'#if(dlrPblmCdMap[dlrPblmCd] !== undefined ){# #= dlrPblmCdMap[dlrPblmCd]# #}#'
                }
                ,{field:"qestId", title:"<spring:message code='par.lbl.qestId' />", width:80}
                ,{field:"pblmStatCd", title:"<spring:message code='par.lbl.pblmStatCd' />", width:80
                    ,attributes:{"class":"ac"}
                    ,template:'#if(pblmStatCdMap[pblmStatCd] !== undefined ){# #= pblmStatCdMap[pblmStatCd]# #}#'
                }
            ]
        });
    });

</script>
<!-- //script -->