<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 사용자 관리 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="cmm.title.userMng" /></h1>
        <div class="btn_right">
	        <dms:access viewId="VIEW-D-11394" hasPermission="${dms:getPermissionMask('READ')}">
	            <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
	        </dms:access>
	        <dms:access viewId="VIEW-D-11395" hasPermission="${dms:getPermissionMask('READ')}">
	            <button type="button" class="btn_m btn_modifi" id="btnDetail"><spring:message code='global.btn.detail' /><!-- 상세 --></button>
	        </dms:access>
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
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.searchText" /></th>
                    <td>
                        <div class="form_float">
                            <div class="form_left"><input id="sFields" type="text" class="form_comboBox"></div>
                            <div class="form_right"><input id="sText" type="text" class="form_input"></div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.dept' /><!-- 부서 --></th>
                    <td>
                        <input id="sDeptCd" type="text" value="" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.task' /><!-- 직무 --></th>
                    <td>
                        <input id="sTskCd" type="text" value="" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="com.lbl.claimReqPermYn" /></th>
                    <td>
                        <input id="sClaimReqPermYn" type="text" class="form_comboBox">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.enabledYn" /></th>
                    <td>
                        <input id="sEnabledYn" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.delYn" /></th>
                    <td>
                        <input id="sDelYn" type="text" class="form_comboBox">
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>
    <!-- 그리드 종료 -->

    <!-- 사용자 기본정보 시작 -->
    <section id="detailPopup" class="pop_wrap">
        <div class="table_form mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:9%;">
                <col style="width:24%;">
                <col style="width:11%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.dlrCd" /></th>
                    <td>
                        <input id="dlrCd" name="dlrCd" type="text" class="form_input form_disabled" disabled />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.usrId" /></th>
                    <td>
                        <input id="usrId" name="usrId" type="text" class="form_input form_disabled" disabled />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.usrNm" /></th>
                    <td>
                        <input id="usrNm" name="usrNm" type="text" class="form_input form_disabled" disabled />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.deptCd" /></th>
                    <td>
                        <input id="deptCd" name="deptCd" type="text" class="form_input form_disabled" disabled />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.deptNm" /></th>
                    <td>
                        <input id="deptNm" name="deptNm" type="text" class="form_input form_disabled" disabled />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.servYn" /></th>
                    <td>
                        <input id="servYn" name="servYn" type="text" class="form_input form_disabled" disabled />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.tskCd" /></th>
                    <td>
                        <input id="tskCd" name="tskCd" type="text" class="form_input form_disabled" disabled />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.tskNm" /></th>
                    <td>
                        <input id="tskNm" name="tskNm" type="text" class="form_input form_disabled" disabled />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.saleYn" /></th>
                    <td>
                        <input id="saleYn" name="saleYn" type="text" class="form_input form_disabled" disabled />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.usrIdNo" /></th>
                    <td>
                        <input id="usrIdNo" name="usrIdNo" type="text" class="form_input form_disabled" disabled />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.emailNm" /></th>
                    <td>
                        <input id="email" name="email" type="text" class="form_input form_disabled" disabled />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.cellphone" /></th>
                    <td>
                        <input id="hpNo" name="hpNO" type="text" class="form_input form_disabled" disabled />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.telNo" />1</th>
                    <td>
                        <input id="telNo1" name="telNo1" type="text" class="form_input form_disabled" disabled />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.telNo" />2</th>
                    <td>
                        <input id="telNo2" name="telNo2" type="text" class="form_input form_disabled" disabled />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.usrPwdChgDt" /></th>
                    <td>
                        <input id="usrPwdChgDt" name="usrPwdChgDt" type="text" class="form_input form_disabled" disabled />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.joinDt" /></th>
                    <td>
                        <input id="joinDt" name="joinDt" type="text" class="form_input form_disabled" disabled />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.retireDt" /></th>
                    <td>
                        <input id="retireDt" name="retireDt" type="text" class="form_input form_disabled" disabled  />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.zipCd" /></th>
                    <td>
                        <input id="zipNo" name="zipNo" type="text" class="form_input form_disabled" disabled />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.bizCd" /></th>
                    <td>
                        <input id="bizCd" name="bizCd" type="text" class="form_input form_disabled" disabled />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.addr" />1</th>
                    <td colspan="3">
                        <input id="addr1" name="addr1" type="text" class="form_input form_disabled" disabled />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.empNo" /></th>
                    <td>
                        <input id="empNo" name="empNo" type="text" class="form_input form_disabled" disabled />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.addr" />2</th>
                    <td colspan="3">
                        <input id="addr2" name="addr2" type="text" class="form_input form_disabled" disabled />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.langCd" /></th>
                    <td>
                        <input id="langCd" name="langCd" type="text" class="form_input form_disabled" disabled />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.addr" />3</th>
                    <td colspan="3">
                        <input id="addr3" name="addr3" type="text" class="form_input form_disabled" disabled />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.enabledYn" /></th>
                    <td>
                        <input id="enabledYn" name="enabledYn" type="text" class="form_input form_disabled" disabled />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.delYn" /></th>
                    <td>
                        <input id="delYn" name="delYn" type="text" class="form_input form_disabled" disabled />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.claimReqPermYn" /></th>
                    <td>
                        <input id="claimReqPermYn" name="claimReqPermYn" type="text" class="form_input form_disabled" disabled />
                    </td>
                </tr>
            </tbody>
        </table>
        </div>
    </section>
</section>
</div>

<script type="text/javascript">
//부서목록
var deptCdList = [{"deptCd":"", "deptNm":"", "useYn":"Y", "cmpTp":""}];
<c:forEach var="obj" items="${deptCdList}">
deptCdList.push({"deptCd":"${obj.deptCd}", "deptNm":"${obj.deptNm}", "useYn":"${obj.useYn}", "cmpTp":"${obj.cmpTp}"});
</c:forEach>
//부서 Map
var deptCdMap = dms.data.arrayToMap(deptCdList, function(obj){ return obj.deptCd; });

//직무목록
var tskCdList = [{"tskCd":"", "tskNm":"", "deptCd":"", "cmpTp":""}];
<c:forEach var="obj" items="${taskList}">
tskCdList.push({"tskCd":"${obj.tskCd}", "tskNm":"${obj.tskNm}", "deptCd":"${obj.deptCd}", "cmpTp":"${obj.cmpTp}"});
</c:forEach>
//직무 Map
var tskCdMap = dms.data.arrayToMap(tskCdList, function(obj){ return obj.tskCd; });

//지원언어 목록
var supportedLangs = [""];
<c:forEach var="obj" items="${supportedLangs}">
supportedLangs.push("${obj}");
</c:forEach>

//테마 목록
var themeNames = [""];
<c:forEach var="obj" items="${themeNames}">
themeNames.push("${obj}");
</c:forEach>

//그리드 목록 더블클릭 사용자 정보 팝업
$("#grid").on("dblclick", "tr.k-state-selected", function(e){
    var grid = $(e.delegateTarget).data("kendoExtGrid");

    if(grid.select().length > 0){
        var dataItem = grid.dataItem(grid.select());
        popupUserDetail(dataItem.usrId);
    }
});

//사용자 상세정보 팝업
function popupUserDetail(usrId){
    $.ajax({
        url:"<c:url value='/cmm/sci/user/selectUser.do' />",
        data:JSON.stringify({sUsrId:usrId}),
        type:"POST",
        dataType:"json",
        contentType:"application/json",
        error:function(jqXHR,status,error){
            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
        }
    }).done(function(result) {
        var user = result["user"];
        setUserData(user);
        $("#detailPopup").data("kendoWindow").center().open();
    });
}

//사용자 상세정보 설정
function setUserData(user) {
    $("#usrId").val(user.usrId);
    $("#usrNm").val(user.usrNm);
    $("#usrPw").val(user.usrPw);
    $("#enabledYn").val(user.enabledYn);
    $("#langCd").val(user.langCd);
    $("#empNo").val(user.empNo);
    $("#delYn").val(user.delYn);
    $("#themeId").val(user.themeId);
    $("#cmpnId").val(user.cmpnId);
    $("#dlrCd").val(user.dlrCd);
    $("#deptCd").val(user.deptCd);
    $("#deptNm").val(user.deptNm);
    $("#pstnCd").val(user.pstnCd);
    $("#dutyCd").val(user.dutyCd);
    $("#email").val(user.email);
    $("#hpNo").val(user.hpNo);
    $("#telNo1").val(user.telNo1);
    $("#telNo2").val(user.telNo2);
    $("#usrPwdChgDt").val(user.usrPwdChgDt);
    $("#usrIdNo").val(user.usrIdNo);
    $("#joinDt").val(kendo.toString(kendo.parseDate(user.joinDt, "yyyyMMdd"), "<dms:configValue code='dateFormat' />"));
    $("#retireDt").val(user.retireDt);
    $("#zipNo").val(user.zipNo);
    $("#addr1").val(user.addr1);
    $("#addr2").val(user.addr2);
    $("#addr3").val(user.addr3);
    $("#bizCd").val(user.bizCd);
    $("#servYn").val(user.servYn);
    $("#saleYn").val(user.saleYn);
    $("#corpCd").val(user.corpCd);
    $("#tskCd").val(user.tskCd);
    $("#tskNm").val(user.tskNm);
    $("#claimReqPermYn").val(user.claimReqPermYn);
}

$(document).ready(function() {
    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 상세
    $("#btnDetail").kendoButton({
        click:function(e) {
            var grid = $('#grid').data('kendoExtGrid');
            var rows = grid.select();

            if (rows.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            var dataItem = grid.dataItem(rows);
            popupUserDetail(dataItem.usrId);
        }
    });

    //조회조건 - 검색구분
    $("#sFields").kendoExtMultiSelectDropDownList({
        dataSource:[
            {"field":"USRID", "fieldNm":"<spring:message code='global.lbl.usrId'/>"}
            ,{"field":"USRNM", "fieldNm":"<spring:message code='global.lbl.usrNm'/>"}
            ,{"field":"EMPNO", "fieldNm":"<spring:message code='global.lbl.empNo'/>"}
        ]
        ,dataValueField:"field"
        ,dataTextField:"fieldNm"
        ,selectedAllText:"<spring:message code='global.lbl.all'/>"
    });
    //조회조건 - 검색구분 초기값 설정
    $("#sFields").data("kendoExtMultiSelectDropDownList").value(["USRID"]);

    //조회조건 - 부서
    $("#sDeptCd").kendoExtDropDownList({
        dataSource:deptCdList
        ,dataValueField:"deptCd"
        ,dataTextField:"deptNm"
        ,change:function(e){
            var deptCd = this.value();
            var cmpTp = deptCdMap[deptCd].cmpTp;
            var tskCdListDatasource = [{"tskCd":"", "tskNm":"", "deptCd":"", "cmpTp":""}];

            if(dms.string.isNotEmpty(deptCd)){
                $.each(tskCdList, function(idx, obj){

                    if(cmpTp == "${cmpTpCorp}"){
                        if(obj.cmpTp == "${cmpTpCorp}"){
                            tskCdListDatasource.push(obj);
                        }
                    }else{
                        if(deptCd == obj.deptCd){
                            tskCdListDatasource.push(obj);
                        }
                    }
                });
            }

            $("#sTskCd").data("kendoExtDropDownList").setDataSource(tskCdListDatasource);
        }
    });

    //조회조건 - 직무
    $("#sTskCd").kendoExtDropDownList({
        dataSource:[]
        ,dataValueField:"tskCd"
        ,dataTextField:"tskNm"
    });

    //조회조건 - 활성여부
    $("#sEnabledYn").kendoExtDropDownList({
        dataSource:["","Y","N"]
        ,index:0
    });

    //조회조건 - 삭제여부
    $("#sDelYn").kendoExtDropDownList({
        dataSource:["","Y","N"]
        ,value:"N"
        ,index:0
    });

    //조회조건 - 클레인신청 권한 여부
    $("#sClaimReqPermYn").kendoExtDropDownList({
        dataSource:["","Y","N"]
        ,index:0
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/sci/user/selectUsersForDealer.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sFields"] = $("#sFields").data("kendoExtMultiSelectDropDownList").value();
                        params["sText"] = $("#sText").val();
                        params["sDeptCd"] = $("#sDeptCd").data("kendoExtDropDownList").value();
                        params["sTskCd"] = $("#sTskCd").data("kendoExtDropDownList").value();
                        params["sEnabledYn"] = $("#sEnabledYn").data("kendoExtDropDownList").value();
                        params["sDelYn"] = $("#sDelYn").data("kendoExtDropDownList").value();
                        params["sClaimReqPermYn"] = $("#sClaimReqPermYn").data("kendoExtDropDownList").value();

                        return kendo.stringify(params);
                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"usrId"
                    ,fields:{
                        rnum:{type:"number", editable:false}
                        ,dlrCd:{type:"string", editable:false}
                        ,usrId:{type:"string", editable:false}
                        ,usrNm:{type:"string", editable:false}
                        ,empNo:{type:"string", editable:false}
                        ,deptCd:{type:"string", editable:false}
                        ,deptNm:{type:"string", editable:false}
                        ,tskCd:{type:"string", editable:false}
                        ,tskNm:{type:"string", editable:false}
                        ,langCd:{type:"string", editable:false}
                        ,enabledYn:{type:"string", editable:false}
                        ,delYn:{type:"string", editable:false}
                        ,claimReqPermYn:{type:"string", editable:false}
                    }
                }
            }
        }
        ,appendEmptyColumn:true
        ,editable:false
        ,selectable:"row"
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, filterable:false, attributes:{"class":"ac"}}
            ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:100, attributes:{"class":"ac"}}
            ,{field:"usrId", title:"<spring:message code='global.lbl.usrId' />", width:150, attributes:{"class":"ac"}}
            ,{field:"usrNm", title:"<spring:message code='global.lbl.usrNm' />", width:150}
            ,{field:"empNo", title:"<spring:message code='global.lbl.empNo' />", width:150, attributes:{"class":"ac"}}
            ,{field:"deptCd", title:"<spring:message code='global.lbl.deptCd' />", width:80, attributes:{"class":"ac"}}
            ,{field:"deptNm", title:"<spring:message code='global.lbl.deptNm' />", width:150}
            ,{field:"tskCd", title:"<spring:message code='global.lbl.tskCd' />", width:80, attributes:{"class":"ac"}}
            ,{field:"tskNm", title:"<spring:message code='global.lbl.tskNm' />", width:150}
            ,{field:"langCd", title:"<spring:message code='global.lbl.langCd' />", width:80, attributes:{"class":"ac"}
	            ,filterable:{
	                cell:{
	                    showOperators:false
	                    ,template: function (e) {
	                        e.element.kendoExtDropDownList({
	                            dataSource:supportedLangs
	                            ,valuePrimitive:true
	                        });
	                    }
	                }
	        	}
            }
            ,{field:"enabledYn", title:"<spring:message code='global.lbl.enabledYn' />", width:80, attributes:{"class":"ac"}
	            ,filterable:{
	                cell:{
	                    showOperators:false
	                    ,template: function (e) {
	                        e.element.kendoExtDropDownList({
	                            dataSource:['','Y','N']
	                            ,valuePrimitive:true
	                        });
	                    }
	                }
	        	}
            }
            ,{field:"delYn", title:"<spring:message code='global.lbl.delYn' />", width:80, attributes:{"class":"ac"}
	            ,filterable:{
	                cell:{
	                    showOperators:false
	                    ,template: function (e) {
	                        e.element.kendoExtDropDownList({
	                            dataSource:['','Y','N']
	                            ,valuePrimitive:true
	                        });
	                    }
	                }
	        	}
            }
            ,{field:"claimReqPermYn", title:"<spring:message code='global.lbl.claimReqPermYn' />", width:150, attributes:{"class":"ac"}
	            ,filterable:{
	                cell:{
	                    showOperators:false
	                    ,template: function (e) {
	                        e.element.kendoExtDropDownList({
	                            dataSource:['','Y','N']
	                            ,valuePrimitive:true
	                        });
	                    }
	                }
	        	}
            }
        ]
    });

    //사용자상세정보 팝업
    $("#detailPopup").kendoWindow({
        animation:false
        ,draggable:true
        ,modal:false
        ,pinned:true
        ,resizable:false
        ,visible:false
        ,title:"<spring:message code='cmm.title.userInfo' />"
        ,width:"900px"
        ,height:"262px"
    });
});
</script>