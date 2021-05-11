<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 공개재고딜러조회 -->
<section id="windows" class="pop_wrap">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <div class="btn_right">
            <!-- 조회 버튼 -->
            <%-- <button id="btnSearch" class="btn_m btn_Search"><spring:message code="global.btn.search" /></button> --%><!-- 조회 -->
            <button id="btnCancel" class="btn_m"><spring:message code="sal.btn.openCancel" /><!-- 공개취소 --></button>
        </div>
    </div>
    
    <%-- 
    <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
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
                    <th scope="row"><spring:message code="global.lbl.sung" /><!-- 성 --></th>
                    <td>
                        <input id="sSungCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.city" /><!-- 도시 --></th>
                    <td >
                        <input id="sCityCd" class="form_comboBox" />
                    </td>
                    <th class="bor_none"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    --%>
    
    <!-- 조회 조건 타이틀 끝 -->
    <div class="table_form">
        <div class="table_grid">
        <!-- 그리드1 -->
            <div id="grid" class="grid"></div>
        <!-- 그리드1 -->
    </div>

    <!-- hidden값 -->
    <span style="display:none">
        <input type="hidden" id="carId" />
    </span>
</section>
<!-- //공개재고딜러조회 팝업 -->

<script type="text/javascript">

//성
var sungCdDs = [];
<c:forEach var="obj" items="${sungList}">
    sungCdDs.push({"saleDlrSungCd":"${obj.saleDlrSungCd}", "saleDlrSungNm":"${obj.saleDlrSungNm}"});
</c:forEach>

$(document).ready(function() {

    var options = parent.popupWindow.options.content.data;

    // 조회 버튼.
    /*
    $("#btnSearch").kendoButton({
        click:function(e){
            $("#grid").data("kendoExtGrid").dataSource.page(1);
        }
    });
    */

    // 개별 공개취소 버튼
    $("#btnCancel").kendoButton({
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            if(rows.length == 0){
                dms.notification.info("<spring:message code='global.info.required.select' />"); // 목록을 선택해주세요.
                return false;
            }

            var saveList = [];

            rows.each(function(index, row) {
                var dataItem = grid.dataItem(row);
                saveList.push(dataItem);
             });
             var param = {"deleteList":saveList};

             $.ajax({
                 url:"<c:url value='/sal/inv/stockOpen/cancelStockOpenDlr.do' />"
                 ,data:JSON.stringify(param)
                 ,type:'POST'
                 ,dataType:'json'
                 ,contentType:'application/json'
                 ,error:function(jqXHR,status,error) {
                     if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                         dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                     }else{
                         dms.notification.error(error);
                     }
                 }
                 ,success:function(jqXHR, textStatus) {
                     grid.dataSource._destroyed = [];
                     grid.dataSource.page(1);

                     parent.grid_search();

                     //정상적으로 반영 되었습니다.
                     dms.notification.success("<spring:message code='global.info.success'/>");
                 }
             });
        }
    });

    /************************************************************
                조회조건 설정
    *************************************************************/
    $("#carId").val(options.sCarId);

    //성
    /*
    $("#sSungCd").kendoExtDropDownList({
       dataTextField:"saleDlrSungNm"
      ,dataValueField:"saleDlrSungCd"
      ,optionLabel:" "
      ,dataSource:sungCdDs
      ,select :function(e){
          $("#sCityCd").data("kendoExtDropDownList").setDataSource([]);
          $("#sCityCd").data("kendoExtDropDownList").enable(true);

          var dataItem = this.dataItem(e.item);
          if(dataItem.saleDlrSungCd == ""){
              $("#sCityCd").data("kendoExtDropDownList").setDataSource([]);
              $("#sCityCd").data("kendoExtDropDownList").enable(false);
              return false;
          }

          var responseJson = dms.ajax.getJson({
              url :"<c:url value='/sal/inv/stockMnt/selectCity.do' />"
              ,data :JSON.stringify({"sSaleDlrSungCd":dataItem.saleDlrSungCd})
              ,async :false
          });

          if(responseJson == null || responseJson.data == null){
              responseJson.data = [];
          }
          $("#sCityCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
      }
   });

   //도시
   $("#sCityCd").kendoExtDropDownList({
       dataTextField:"saleDlrCityNm"
       ,dataValueField:"saleDlrCityCd"
   });
   $("#sCityCd").data("kendoExtDropDownList").enable(false);
   */
   
    /************************************************************
                조회 그리드 설정
    *************************************************************/
        $("#grid").kendoExtGrid({
            gridId:"G-SAL-1203-153001"
           ,height:420
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/sal/inv/stockOpen/selectStockOpenDlrPopupSearch.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sCarId"] = $("#carId").val();
                            //params["sSungCd"] = $("#sSungCd").data("kendoExtDropDownList").value();
                            //params["sCityCd"] = $("#sCityCd").data("kendoExtDropDownList").value();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    errors:"error"
                    , model:{
                        id:"rnum"
                        , fields:{
                              rnum   :{type:"number"}
                            , carId  :{ type:"string" }
                            , vinNo  :{ type:"string" }
                            , dlrCd  :{ type:"string" }
                            , dlrNm  :{ type:"string" }
                        }
                    }
                }
            }
            ,editable:false
            ,autoBind:false
            ,filterable:false
            ,indvColumnVisible:false
            ,indvColumnReorderable:false
            //,appendEmptyColumn:false
            ,multiSelectWithCheckbox:true
            ,columns:[
                {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:40, sortable:false, attributes:{"class":"ac"}}
                ,{field:"carId", hidden:true}
                ,{field:"vinNo", title:"<spring:message code='global.lbl.vinNo' />", width:150, attributes:{"class":"ac"}}   //vin no
                ,{field:"dlrCd",title:"<spring:message code='global.lbl.dlrCd' />",attributes:{ "class":"ac"}, width:80 }    //딜러코드
                ,{field:"dlrNm" ,title:"<spring:message code='global.lbl.dlrNm' />" ,attributes:{"class":"al"}, width:120}   //딜러명
            ]
        });

        if (options.autoBind) {
            if(dms.string.isNotEmpty($("#carId").val())){
                $("#grid").data("kendoExtGrid").dataSource.page(1);
            }
        }
    });
 </script>