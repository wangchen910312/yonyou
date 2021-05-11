<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 금융상품관리 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="sal.title.fincProductMngt" /></h1> <!-- 금융상품 관리 -->
            <div class="btn_right">
                <dms:access viewId="VIEW-D-11289" hasPermission="${dms:getPermissionMask('READ')}">
                    <button id="btnViewDetail" class="btn_m"><spring:message code='global.btn.detail' /></button>        <!-- 상세 -->
                </dms:access>
                <dms:access viewId="VIEW-D-11290" hasPermission="${dms:getPermissionMask('READ')}">
                    <button id="btnReset" class="btn_m btn_new"><spring:message code='global.btn.new' /></button>        <!-- 신규 -->
                </dms:access>
                <dms:access viewId="VIEW-D-11291" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                </dms:access>
            </div>
        </div>
        <!-- 조회 조건 시작 -->
        <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:14%;">
                    <col style="width:10%;">
                    <col style="width:14%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.fincCmp" /></th> <!-- 금융사 -->
                        <td>
                            <input name="sFincCmpCd" id="sFincCmpCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"></th>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- 금융정보 -->
    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>
</div>

    <!-- 금융정보상세 -->
    <section id="callFinProductMntWindow" class="pop_wrap">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code="sal.title.fincInfoDetail" /></h2> <!-- 금융정보상세 -->
            <div class="btn_right">
                <dms:access viewId="VIEW-D-11292" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button> <!-- 저장 -->
                </dms:access>
            </div>
        </div>
        <div class="table_form form_width_100per">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:30%;">
                    <col style="width:70%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.fincCmp" /></span></th> <!-- 금융사 -->
                        <td>
                            <input name="fincCmpCd" id="fincCmpCd" type="text" class="form_comboBox">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.productCd" /></span></th> <!-- 상품코드 -->
                        <td>
                            <input name="fincItemCd" id="fincItemCd" type="text" value="" class="form_input" maxlength="10">
                        </td>
                   </tr>
                   <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.fincItem" /></span></th> <!-- 금융상품 -->
                        <td>
                            <input name="fincItemNm" id="fincItemNm" type="text" value="" class="form_input" maxlength="80">
                        </td>
                   </tr>
                   <tr>
                        <th scope="row"><spring:message code="global.lbl.useYn" /></th> <!-- 사용여부 -->
                        <td>
                            <input name="useYn" id="useYn" type="text" class="form_comboBox">
                        </td>
                   </tr>
                </tbody>
            </table>
        </div>

        <span style="display:none">
            <!-- 저장된 금융회사, 금융상품 -->
            <input type="hidden" id="savedFincCmp" value="" />
            <input type="hidden" id="savedFincItem" value="" />
        </span>
    </section>
    <!-- //금융정보상세 -->

<script  type="text/javascript">

// 금융사
var fincCmpCdList = [];
<c:forEach var="obj" items="${fincCmpCdInfo}">
fincCmpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

var fincCmpCdArr = dms.data.arrayToMap(fincCmpCdList, function(obj){return obj.cmmCd});

// 여부(Y/N) COM020
var ynList = [];
var ynObj = {};
<c:forEach var="obj" items="${ynDs}">
    ynList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ynObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>


$(document).ready(function () {

    // 본문 팝업 설정
    $("#callFinProductMntWindow").kendoWindow({
        animation:false
        ,draggable:false
        ,modal:true
        ,resizable:false
        ,visible:false
        ,title:"<spring:message code='sal.title.fincProductMngt' />"      // 금융상품관리
        ,width:"350px"
        ,height:"350px"
    }).data("kendoWindow");

    $("#btnViewDetail").kendoButton({    // 상세조회.
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());

            if ( dms.string.isNotEmpty(selectedItem) ){
                setSearch(selectedItem);
                viewDetailPopup();
            } else {
                // {상세정보}을(를) 확인하여 주세요.
                dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                return;
            }
        }
    });

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
            refreshAll();
        }
    });

    //버튼 - 초기화
    $("#btnReset").kendoButton({
        click:function(e) {
            refreshAll();
            viewDetailPopup();  // 상세팝업.
        }
    });

    $("#btnSave").kendoButton({
        //icon:"plus",
        click:function(e){
            save();
        }
    });


    // 금융사
    $("#sFincCmpCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:fincCmpCdList
       ,optionLabel:" "   //전체
   });

    // 금융사
   $("#fincCmpCd").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
      ,dataValueField:"cmmCd"
      ,dataSource:fincCmpCdList
      ,index:0
      ,optionLabel:" "  // 선택
   });

    /**
     * 사용여부
     */
     $("#useYn").kendoExtDropDownList({
          dataTextField  :"cmmCdNm"
         ,dataValueField :"cmmCd"
         ,dataSource:ynList
         ,index:0
     });

    //그리드 1번
	$("#grid").kendoExtGrid({
	    gridId:"G-SAL-0123-113905"
       	,dataSource:{
       	 transport:{
             read:{
                 url:"<c:url value='/sal/bsc/financialProductMng/selectFinancialProductMng.do' />"
             }
            ,parameterMap:function(options, operation) {
                 if (operation === "read") {

                     var params = {};
                     params["recordCountPerPage"] = options.pageSize;
                     params["pageIndex"] = options.page;
                     params["firstIndex"] = options.skip;
                     params["lastIndex"] = options.skip + options.take;
                     params["sort"] = options.sort;

                     params["sFincCmpCd"] = $("#sFincCmpCd").data('kendoExtDropDownList').value();

                     return kendo.stringify(params);
                 }else if (operation !== "read" && options.models) {
                     return kendo.stringify(options.models);
                 }
             }
         }
	     ,batch :false
         ,schema:{
              model:{
                  id:"fincItemCd"
                 ,fields:{
                     fincCmpCd:{type:"string"} //
                     ,fincItemCd:{type:"string"} //
                     ,fincItemNm:{type:"string"} //
                     ,useYn:{type:"string"} //

                 }
             }
         }
       }
	   ,dataBound:function(e) {
           var savedCmp = $("#savedFincCmp").val();
           var savedItem = $("#savedFincItem").val();

           if(dms.string.isNotEmpty(savedCmp)){
               var selectRow
                 , grid = $("#grid").data("kendoExtGrid")
                 , rows = grid.tbody.find("tr");

               rows.each(function(index, row) {
                   var dataItem = grid.dataSource.at(index);

                   if(dataItem.fincCmpCd == savedCmp
                           && dataItem.fincItemCd == savedItem){
                        selectRow = grid.tbody.find(">tr:not(.k-grouping-row)").eq(index);
                        grid.select(selectRow);
                   }
               });
           }
           $("#savedFincCmp").val("");
           $("#savedFincItem").val("");
	   }
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,multiSelectWithCheckbox :false    //멀티선택 적용. default :false
       ,appendEmptyColumn:false          //빈컬럼 적용. default:false
       ,enableTooltip:false               //Tooltip 적용, default:false
	   ,height:434
	   ,selectable :"row"
	   ,editable:false
	   ,autoBind:true
       ,navigatable :true
	   ,columns:[
               {
                   title:"<spring:message code='global.lbl.fincCmp' />"
                  ,field:"fincCmpCd"
                  ,width:55
                  ,headerAttributes:{style:"text-align:center;"}
                  ,attributes:{"class":"al"}
                  ,editor:function (container, options){
                      $('<input required name="fincCmpCd" data-bind="value:' + options.field + '"/>')
                      .appendTo(container)
                      .kendoExtDropDownList({
                            autoBind:false
                          , dataTextField: "cmmCdNm"
                          , dataValueField:"cmmCd"
                          , dataSource:fincCmpCdList
                      });
                      $('<span class="k-invalid-msg" data-for="fincCmpCd"></span>').appendTo(container);
                  }
                  ,template:"#=changeFincCmpCdReason(fincCmpCd)#"
               }  // 금융사
               ,{
                   title:"<spring:message code='sal.lbl.fincPrdtCd' />"
                  ,field:"fincItemCd", width:75
                  ,headerAttributes:{style:"text-align:center;"}
                  ,attributes:{"class":"al"}
               }  // 금융상품코드
               ,{
                   title:"<spring:message code='global.lbl.fincItem' />"
                  ,field:"fincItemNm", width:75
                  ,headerAttributes:{style:"text-align:center;"}
                  ,attributes:{"class":"al"}
               }  // 금융상품명
               ,{
                   title:"<spring:message code='global.lbl.useYn' />"
                  ,field:"useYn", width:75
                  ,headerAttributes:{style:"text-align:center;"}
                  ,attributes:{"class":"al"}
               }  // 사용여부
          ]
	});

    // 그리드 더블클릭.
    $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
        var grid = $("#grid").data("kendoExtGrid");
        var selectedItem = grid.dataItem(grid.select());
        setSearch(selectedItem);
        viewDetailPopup();
    });

    //금융사
    changeFincCmpCdReason = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = fincCmpCdArr[val].cmmCdNm;
        }
        return returnVal;
    }

});

//상세내용 팝업 호출
viewDetailPopup = function(){
    var win = $("#callFinProductMntWindow").data("kendoWindow").center().open();
}

setSearch = function(jsonObj) {
    if( jsonObj == null || jsonObj == 'undefined')
        return;

   refreshAll();

   $("#fincCmpCd").data("kendoExtDropDownList").value(jsonObj.fincCmpCd);
   $("#fincItemNm").val(jsonObj.fincItemNm);
   $("#fincItemCd").val(jsonObj.fincItemCd);
   $("#useYn").data("kendoExtDropDownList").value(jsonObj.useYn);
}

refreshAll = function() {
    $("#fincCmpCd").data("kendoExtDropDownList").value("");
    $("#fincItemCd").val("");
    $("#fincItemNm").val("");
    $("#useYn").data("kendoExtDropDownList").value("");
}

validator = function() {

    if($("#fincCmpCd").val() == "") {
        dms.notification.info("<spring:message code='global.lbl.fincCmp' var='fincCmp' /><spring:message code='global.info.chkSelectItemMsg' arguments='${fincCmp},' />"); // 금융사
        $("#fincCmpCd").focus();
        return false;
    }

    if($("#fincItemCd").val() == "") {
        dms.notification.info("<spring:message code='global.lbl.productCd' var='globalLblProductCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblProductCd},' />"); // 금융상품코드
        $("#fincItemCd").focus();
        return false;
    }

    if($("#fincItemNm").val() == "") {
        dms.notification.info("<spring:message code='global.lbl.productTp' var='globalLblProductTp' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblProductTp},' />"); // 금융상품명
        $("#fincItemNm").focus();
        return false;
    }

    if($("#useYn").val() == "") {
        dms.notification.info("<spring:message code='global.lbl.useYn' var='useYn' /><spring:message code='global.info.chkSelectItemMsg' arguments='${useYn},' />"); // 사용여부
        $("#useYn").focus();
        return false;
    }

    return true;
}

save = function() {
    var saveData;

    if(validator()) {
        saveData = {
             fincCmpCd:$("#fincCmpCd").val()
            ,fincItemNm:$("#fincItemNm").val()
            ,fincItemCd:$("#fincItemCd").val()
            ,useYn:$("#useYn").data("kendoExtDropDownList").value()
        };

        $.ajax({
            url:"<c:url value='/sal/bsc/financialProductMng/saveFinancialProductMng.do' />",
            data:JSON.stringify(saveData),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            },
            success:function(jqXHR, textStatus){
                $("#savedFincCmp").val($("#fincCmpCd").val());
                $("#savedFincItem").val($("#fincItemNm").val());

                $('#grid').data('kendoExtGrid').dataSource._destroyed = [];
                $('#grid').data('kendoExtGrid').dataSource.page(1);

                $("#callFinProductMntWindow").data("kendoWindow").close();
                refreshAll();

                //정상적으로 반영 되었습니다.
                dms.notification.success("<spring:message code='global.info.success'/>");
            }
        });
    }
}

fnOnfocus = function(id){
    $("#"+ id +" ").select();
}

</script>