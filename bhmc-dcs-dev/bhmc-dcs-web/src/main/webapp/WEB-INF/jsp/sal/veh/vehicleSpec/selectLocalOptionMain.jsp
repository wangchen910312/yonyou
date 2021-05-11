<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />
<%-- <dms:configValue code='defaultCurrency' var="_defaultCurrency" /> --%>


<script type="text/javascript">
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";

//yyyy-MM-dd HH:mm:ss
var vDtyyyyMMddHHmmss = vDateTimeFormat;

//yyyy-MM-dd HH:mm
var vDtyyyyMMddHHmm = vDateTimeFormat.substring(0,16);
// yyyy-MM-dd
//var vDtyyyyMMdd = vDateTimeFormat.substring(0,10);
var vDtyyyyMMdd = "${_dateFormat}";

// HH:mm
var vDtHHmm = vDateTimeFormat.substring(11,16);

//현재일자
var toDay = "${toDay}";
// 해당월 1일
var oneDay = "${oneDay}";

var selectOptionDSList = [];
    <c:forEach var="obj" items="${salesOptionList}">
        var bnDS = {};
        bnDS["userCd"]    = "${obj.optionCd}";
        bnDS["userCdNm"]  = "${obj.optionNm}";
        selectOptionDSList.push(bnDS);
    </c:forEach>
</script>


<!-- Vehicle Local Option -->
<section class="group">

    <!-- 타이틀 시작 -->
	<div class="header_area">
		<h1 class="title_basic">Vehicle Local Option</h1>
		<div class="btn_right">
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>  <!-- 조회 -->
			<button class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button>  <!-- 저장 -->
		</div>
	</div>
    <!-- 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <!--  해당 table_form div중 엔터이벤트 시 btnSearch 버튼 실행  -->
	<div class="table_form" role="search" data-btnid="btnSearch">
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
					<th scope="row"><span class="bu_required"><spring:message code="global.lbl.option" /></span></th>    <!-- 옵션 -->
					<td class="required_area">
                        <input id="sOption" class="form_comboBox">
                    </td>
					<th scope="row"><spring:message code="global.lbl.applyDt" /></th>      <!-- 적용일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartDt" class="datepicker form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndDt" class="datepicker form_datepicker">
                            </div>
                        </div>
                    </td>
                    <th scope="row"></th>
                    <td></td>
				</tr>
			</tbody>
		</table>
	</div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 기능 버튼 시작 -->
    <div class="header_area">
        <div class="btn_right">
            <button class="btn_s btn_add" id="btnAdd"><spring:message code="global.btn.rowAdd" /></button> <!-- 행추가 -->
            <button class="btn_s btn_delete" id="btnDel"><spring:message code="global.btn.rowDel" /></button>    <!-- 행삭제 -->
        </div>
    </div>
    <!-- 그리드 기능 버튼 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid">
        <div id="grid"></div>
    </div>
    <!-- 그리드 종료 -->

</section>
<!-- //Vehicle Local Option -->


<!-- #스크립트 영역# -->
<script type="text/javascript">
<!--

/**
 * 그리드 목록의 체크박스 체크 여부에 따라 해당 목록을 선택하거나 선택/취소 한다.
 * kendoGrid -> kendoExtGrid로 변경되면서, check도 kendo.grid.ext로 변경

 $(document).on("click", ".grid-checkbox-item", function(e){

     var grid = $("#grid").data("kendoExtGrid");
     var row = $("#grid").data("kendoExtGrid").tbody.find("tr[data-uid='" + $(this).attr("data-uid") + "']");

     if($(this).is(":checked")){
         grid.select(row);
     }else{
         $(e.currentTarget).closest("tr").removeClass("k-state-selected");
         $(row).removeClass("k-state-selected");
     }
 });
*/

 /**
  * 그리드 목록 헤더의 체크박스 체크 여부에 따라 목록을 전체선택/취소 한다.
  * kendoGrid -> kendoExtGrid로 변경되면서, checkAll도 kendo.grid.ext로 변경

  $("#checkAll").click(function(){

      var grid = $("#grid").data("kendoGrid");
      var checked = $(this).is(":checked");

      if(checked){
          grid.select(grid.tbody.find(">tr"));
      }else{
          grid.clearSelection();
      }
  });
*/

$(document).ready(function() {
    // 옵션
    $("#sOption").kendoExtDropDownList({
        dataTextField:"userCdNm",
        dataValueField:"userCd",
        dataSource:selectOptionDSList
        ,optionLabel:" "   // 전체
    });

    // 검색 일자
   $("#sStartDt").kendoExtMaskedDatePicker({
       format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
       ,value:oneDay
   });
   $("#sEndDt").kendoExtMaskedDatePicker({
       format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
       ,value:toDay
   });

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e){

            var grid = $("#grid").data("kendoExtGrid");

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
            if(grid.cudDataLength == 0){
                dms.notification.show("<spring:message code='global.btn.save' var='globalBtnSave' /><spring:message code='global.info.valNoMsg' arguments='${globalBtnSave}' />", "info");
                return;
            }

            if(grid.gridValidation()){
                $.ajax({
                    url:"<c:url value='/sal/veh/vehicleSpec/multiLocalOptions.do' />",
                    data:JSON.stringify(saveData),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error){
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    },
                    success:function(jqXHR, textStatus){

                        grid.dataSource._destroyed = [];
                        grid.dataSource.page(1);

                        dms.notification.success("<spring:message code='global.lbl.proce' var='globalLblProce' /><spring:message code='global.info.successMsg' arguments='${globalLblProce}' />", "info");
                    }
                });
            }else{
                dms.notification.show("<spring:message code='global.info.check.input' />", "error");
            }
        }
    });

    //버튼 - 추가
    $("#btnAdd").kendoButton({
        click:function(e){
            $('#grid').data('kendoExtGrid').dataSource.insert(0,{
//                "optionTp":"L"
             });
        }
    });

    //버튼 - 삭제
    $("#btnDel").kendoButton({
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
         dataSource:{
             transport:{
                 read:{
                     url:"<c:url value='/sal/veh/vehicleSpec/selectLocalOptions.do' />"
                 },
                 parameterMap:function(options, operation) {
                     if (operation === "read") {

                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["optionCd"] = $("#sOption").data("kendoExtDropDownList").value();
                         params["startDt"]  = $("#sStartDt").data("kendoExtMaskedDatePicker").value();
                         params["endDt"]    = $("#sEndDt").data("kendoExtMaskedDatePicker").value();

                         //params["optionTp"] = "L";   // 로컬옵션

                         console.log('params:',kendo.stringify(params) );
                         return kendo.stringify(params);

                     }else if (operation !== "read" && options.models) {
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,batch:false
             ,schema:{
                 model:{
                     id:"dlrCd",
                     fields:{
                          id                :{type:"number", editable:false}
                         ,dlrCd             :{type:"string", editable:false}
                         ,optionCd          :{type:"string", editable:false}
                         ,optionNm          :{type:"string", validation:{required:true}}
                         ,optionEnNm        :{type:"string"}
                         ,startDt           :{type:"date", validation:{required:true}}
                         ,endDt             :{type:"date", validation:{required:true}}
                         //,optionTp          :{type:"string", editable:false}
                         ,regUsrId          :{type:"string", editable:false}
                         ,regDt             :{type:"date",   editable:false}
                         ,updtUsrId         :{type:"string", editable:false}
                         ,updtDt            :{type:"date",   editable:false}
                     }
                 }
             }
         }
        ,multiSelectWithCheckbox:true
        ,height:500
        ,resizable:true
        ,autoBind:true
        ,selectable:"multiple, row"
        ,navigatable:true
        ,sortable:true
        ,editable:{
            mode:"incell"
            ,confirmation:false
        }
        ,columns:[
           {field:"dlrCd",      title:"<spring:message code='global.lbl.dlrCd' />", hidden:true, width:10}       // 딜러코드
           ,{field:"optionCd",   title:"<spring:message code='global.lbl.option' />", headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}, width:100} // 옵션
           ,{field:"optionNm",   title:"<spring:message code='global.lbl.optionNm' />", width:170}    // 옵션명
           ,{field:"optionEnNm", title:"<spring:message code='global.lbl.optionEnNm' />", width:200}  //옵션영문명
           ,{field:"startDt",    title:"<spring:message code='sal.lbl.startDt' />", attributes:{"class":"ac"}, width:100, format:"{0:"+vDtyyyyMMdd+"}"}        // 적용시작일
           ,{field:"endDt",      title:"<spring:message code='sal.lbl.endDt' />", attributes:{"class":"ac"}, width:100, format:"{0:"+vDtyyyyMMdd+"}"}       // 적용종료일
           //,{field:"optionTp",   title:"<spring:message code='global.lbl.gubun' />", attributes:{"class":"ac"}, hidden:true, width:10}   //구분
           ,{field:"regUsrId",   title:"<spring:message code='global.lbl.regUsrId' />", attributes:{"class":"ac"}, width:100}             // 등록자
           ,{field:"regDt",      title:"<spring:message code='global.lbl.regDt' />", attributes:{"class":"ac"}, width:100, format:"{0:"+vDtyyyyMMdd+"}"}    // 등록일
           ,{field:"updtUsrId",  title:"<spring:message code='global.lbl.updtUsrId' />", hidden:true, width:100}   //수정자
           ,{field:"updtDt",     title:"<spring:message code='global.lbl.updtDt' />", hidden:true, width:100, format:"{0:"+vDtyyyyMMdd+"}"}   //수정일
        ]
    });

});



//-->
</script>