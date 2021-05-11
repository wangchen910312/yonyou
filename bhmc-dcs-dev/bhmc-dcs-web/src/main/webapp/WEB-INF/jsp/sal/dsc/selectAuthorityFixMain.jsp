<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 권한설정 -->
<section class="group">
	<div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.title.authorityFix'/></h1>   <!-- 권한설정 -->
		<div class="btn_right">
        <dms:access viewId="VIEW-I-12369" hasPermission="${dms:getPermissionMask('READ')}">
			<button id="btnSearch" type="button" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>   <!-- 조회 -->
        </dms:access>
        <dms:access viewId="VIEW-I-12368" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnSave" type="button" class="btn_m btn_save"><spring:message code='global.btn.save' /></button>    <!-- 저장 -->
        </dms:access>
		</div>
	</div>
	<div class="table_form">
		<table>
			<caption></caption>
    		<colgroup>
    			<col style="width:7%;">
    			<col style="width:12%;">
    			<col style="width:7%;">
    			<col style="width:12%;">
    			<col style="width:7%;">
    			<col style="width:12%;">
    			<col>
    		</colgroup>
    		<tbody>
    			<tr>
    				<th scope="row"><spring:message code='global.lbl.deptNm' /></th>  <!-- 부서 -->
    				<td>
                        <input id="sPstnCd" class="form_input">
                    </td>
    				<th scope="row"><spring:message code='global.lbl.name' /></th> <!-- 이름 -->
    				<td>
                        <input id="sUsrNm" class="form_input">
                    </td>
    				<th scope="row"><spring:message code='sal.lbl.id' /></th> <!-- ID -->
    				<td>
                        <input id="sUsrId" class="form_input">
                    </td>
                    <td>&nbsp;</td>
    			</tr>
    		</tbody>
        </table>
    </div>

    <div class="clfix">
        <section class="left_areaStyle">
            <div class="table_grid mt35">
                <div id="mainGrid"></div>
            </div>
        </section>
        <section class="right_areaStyle">
            <div class="header_area">
                <div class="right_area">
                    <ul class="txt_input">
                        <li>
                            <span class="span_bg"><spring:message code='sal.lbl.usrNm' /></span> <!-- 성명 -->
                            <input id="tUsrNm" class="form_input" style="width:80px">
                        </li>
                        <li>
                            <span class="span_bg"><spring:message code='sal.lbl.deptCd' /></span>   <!-- 담당업무 -->
                            <input id="tDeptCd" class="form_input" style="width:80px">
                        </li>
                        <li>
                            <span class="span_bg"><spring:message code='sal.lbl.authorityCopy' /></span>   <!-- 권한복사 -->
                            <input id="copyUsrId" class="form_comboBox" style="width:100px" />
                        </li>
                    </ul>
                </div>
            </div>
            <div id="subGrid"></div>
        </section>
    </div>
</section>
<!-- //권한설정 -->

<script>
// 딜러코드 , 사용자
var dlrCd  = "${dlrCd}";
var userId = "${userId}";
var userNm = "${userNm}";

//서브 Grid 조회 param
var subParam = {};


//권한복사
var userList = [];
<c:forEach var="obj" items="${usrDSList}">
  userList.push({cmmCdNm:"${obj.usrNm}", cmmCd:"${obj.usrId}"});
</c:forEach>


// 심사등급:SAL005
var evalGradeList = [];
var evalGradeObj = {};
<c:forEach var="obj" items="${evalGradeDS}">
    evalGradeList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    evalGradeObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

$(document).ready(function() {

    // 권한복사
    $("#copyUsrId").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:userList
       ,optionLabel:" "   // 전체
    });

    $("#btnSearch").kendoButton({ // 조회
        enable:true,
        click:function(e){

            $('#mainGrid').data('kendoExtGrid').dataSource.read();

            $("#tUsrNm").val('');       //성명
            $("#tDeptCd").val('');     //담당업무
            $("#copyUsrId").data("kendoExtDropDownList").value('');        // 권한복사
            subParam = {};

            $("#subGrid").data('kendoExtGrid').dataSource.data([]);
        }
    });

    $("#btnSave").kendoButton({ // 저장
        enable:true,
        click:function(e){
            var grid = $("#subGrid").data("kendoExtGrid");

            if( $("#copyUsrId").data("kendoExtDropDownList").value() != ""){
                var rows = grid.tbody.find("tr");
                rows.each(function(index, row) {
                   var data = grid.dataItem(row);
                   data.dirty = true;
                });
            }

            var param = {   "subGridVO":grid.getCUDData("insertList", "updateList", "deleteList")
                          , "copyUsrId":$("#copyUsrId").data("kendoExtDropDownList").value()
                        };

            if(grid.cudDataLength == 0){
                // 변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            $.ajax({
                url:"<c:url value='/sal/dsc/authorityFix/multiAuthorityFixs.do' />",
                data:JSON.stringify(param),
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

        }
    });


    $("#mainGrid").kendoExtGrid({
        gridId:"G-SAL-0721-113331"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/dsc/authorityFix/selectAuthorityFixMains.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sUsrId"] = $("#sUsrId").val();
                        params["sUsrNm"] = $("#sUsrNm").val();
                        params["sPstnCd"] = $("#sPstnCd").val();

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"usrId",
                    fields:{
                         dlrCd  :{type:"string"}
                        ,usrId  :{type:"string"}
                        ,usrNm  :{type:"string"}
                        ,deptCd :{type:"string"}
                        ,pstnCd :{type:"string"}
                    }
                }
            }
        }
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,multiSelectWithCheckbox:false
       ,appendEmptyColumn:false          //빈컬럼 적용. default:false
       ,enableTooltip:true               //Tooltip 적용, default:false
       ,autoBind:false
       ,editable:false
       ,height:400
       ,selectable :"row"
       ,change:function(e) {
           if(!e.sender.dataItem(e.sender.select()).isNew()){
               var selectedItem = this.dataItem(this.select());

               $("#tUsrNm").val(selectedItem.usrNm);       //성명
               $("#tDeptCd").val(selectedItem.deptCd);     //담당업무

               subParam = {
                       "sDlrCd":selectedItem.dlrCd
                      ,"sUsrId":selectedItem.usrId
               };
               $('#subGrid').data('kendoExtGrid').dataSource.read();
           }
       }
       ,columns:[
            {field:"usrId", title:"<spring:message code='sal.lbl.id' />", width:90, attributes:{"class":"al"} }              // ID
          , {field:"usrNm", title:"<spring:message code='global.lbl.name' />", width:120, attributes:{"class":"al"}}         // 이름
          , {field:"deptCd", title:"<spring:message code='sal.lbl.deptCd' />", width:100, attributes:{"class":"al"}}         // 담당업무
          , {field:"pstnCd", title:"<spring:message code='global.lbl.deptNm' />", width:150, attributes:{"class":"al"}}      // 부서
       ]
   });


   $("#subGrid").kendoExtGrid({
       gridId:"G-SAL-0721-113332"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/dsc/authorityFix/selectAuthorityFixSub.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        subParam["recordCountPerPage"] = options.pageSize;
                        subParam["pageIndex"] = options.page;
                        subParam["firstIndex"] = options.skip;
                        subParam["lastIndex"] = options.skip + options.take;
                        subParam["sort"] = options.sort;

                        return kendo.stringify(subParam);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"wrkDstinCd",
                    fields:{
                         dlrCd  :{type:"string", editable:false}
                        ,usrId  :{type:"string", editable:false}
                        ,wrkDstinCd  :{type:"string", editable:false}
                        ,wrkDstinNm  :{type:"string", editable:false}
                        ,evalGradeCd :{type:"string", validation:{required:true}}
                    }
                }
            }
        }
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
       ,appendEmptyColumn:false           //빈컬럼 적용. default:false
       ,enableTooltip:true               //Tooltip 적용, default:false
       ,autoBind:false
       ,height:400
       ,selectable :"row"
       //,sortable:false
       ,columns:[
            {field:"wrkDstinCd", hidden:true}
          , {field:"wrkDstinNm", title:"<spring:message code='sal.lbl.wrkDstinAth' />", width:160, attributes:{"class":"al"} }       // 권한설정업무
          , {   // 심사등급
                field:"evalGradeCd", title:"<spring:message code='sal.lbl.evalGrade' />", width:150
              , attributes:{"class":"ac"}
              , template:"#=dms.string.strNvl(evalGradeObj[evalGradeCd])#"
              , editor:function(container, options) {
                  $('<input required name="evalGradeCd" data-bind="value:' + options.field + '"/>')
                  .appendTo(container)
                  .kendoExtDropDownList({
                      autoBind:false
                      ,dataTextField :"cmmCdNm"
                      ,dataValueField:"cmmCd"
                      ,dataSource:evalGradeList
                      ,valuePrimitive:true
                  });
                  $('<span class="k-invalid-msg" data-for="evalGradeCd"></span>').appendTo(container);
              }
          }
       ]
   });


});
</script>