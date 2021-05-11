<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 공개재고설정 팝업 -->
<section id="windows" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <!-- 조회 버튼 -->
            <button id="btnSearch" class="btn_m btn_Search"><spring:message code="global.btn.search" /><!-- 조회 --></button>
            <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /><!-- 선택 --></button>
        </div>
    </div>
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col style="width:23%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.division" /><!-- 사업부 --></th>
                    <td>
                        <input id="sSdptCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.officeNm" /><!-- 사무소 --></th>
                    <td>
                        <input id="sDistOfficeCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.sung" /><!-- 성 --></th>
                    <td>
                        <input id="sSungCd" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="sal.lbl.city" /><!-- 도시 --></th>
                    <td>
                        <input id="sCityCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.dealer" /><!-- 딜러 --></th>
                    <td>
                        <input id="sDlrCd"  class="form_input" />
                    </td>
                    <th scope="bor_none"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="clfix">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code="sal.title.searchList" /><!-- 조회내역 --></h2>
            <div class="btn_right">
                <button id="btnAdd" class="btn_s btn_Select btn_s_min5"><spring:message code="global.btn.add" /><!-- 추가 --></button>
            </div>
        </div>
        <div class="table_grid">
        <!-- 그리드1 -->
            <div id="searchGrid" class="grid"></div>
        <!-- 그리드1 -->
        </div>
    </div>

    <div id="dataForm" class="mt10">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code="sal.title.selectList" /><!-- 선택리스트 --></h2>
            <div class="btn_right">
                <button id="btnDelete" class="btn_s btn_s_min5"><spring:message code="global.btn.del" /><!-- 삭제 --></button>
            </div>
        </div>
        <div class="table_grid">
        <!-- 그리드1 -->
            <div id="selectGrid" class="grid"></div>
        <!-- 그리드1 -->
        </div>
    </div>
</section>
<!-- //공개재고설정 팝업 -->

<script type="text/javascript">
var loginDlrCd  = "${dlrCd}";

var sdptDs = [];
<c:forEach var="obj" items="${sdptList}">
    sdptDs.push({"sdptCd":"${obj.sdptCd}", "sdptNm":"${obj.sdptNm}"});
</c:forEach>

var sungCdDs = [];
<c:forEach var="obj" items="${sungList}">
    sungCdDs.push({"saleDlrSungCd":"${obj.saleDlrSungCd}", "saleDlrSungNm":"${obj.saleDlrSungNm}"});
</c:forEach>

var popSelectObj = {}
 
$(document).ready(function() {
    var options = parent.popupWindow.options.content.data;
    
    // 그리드 더블 클릭 이벤트.
    $("#searchGrid").on("dblclick", "tr.k-state-selected", function (e) {
        $("#btnAdd").click();
    });
    
    // 그리드 더블 클릭 이벤트.
    $("#selectGrid").on("dblclick", "tr.k-state-selected", function (e) {
        //$("button[name=btnDelete]").click();
    });
    
    /************************************************************
                기능버튼 설정
    *************************************************************/

    // 조회 버튼.
    $("#btnSearch").kendoButton({
        click:function(e){
            $("#searchGrid").data("kendoExtGrid").dataSource.page(1);
        }
    });

    // 선택 버튼.
    $("#btnSelect").kendoButton({
        click:function(e){
            var grid = $("#selectGrid").data("kendoExtGrid");
            var rows = grid.tbody.find("tr");
            
            if(rows.length <= 0){
                // 목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select' />");
                return false;                
            }
            
            if(rows !== null){
                var data = [];
                $.each(rows, function(idx, row){
                    data.push(grid.dataItem(row));
                });
                options.callbackFunc(data);
            }
        }
    });

    // 추가 버튼
    $("#btnAdd").kendoButton({
        click:function(e){
            var frGrid   = $("#searchGrid").data("kendoExtGrid"),
                toGrid   = $("#selectGrid").data("kendoExtGrid"),
                rows     = frGrid.select(),
                toRows,
                rowObj   = {};

            if(rows !== null){
                if(rows.length < 1){
                    // 선택값이 없습니다.
                    dms.notification.warning("<spring:message code='global.info.unselected' />");
                    return false;
                }
                
                var isLoginDlrCd = false;
                $.each(rows, function(idx, row){
                    if(loginDlrCd === frGrid.dataItem(row).dlrCd){
                        isLoginDlrCd = true;
                    }
                });
                if(isLoginDlrCd){
                    // 본 딜러는 선택할 수 없습니다.
                    dms.notification.warning("<spring:message code='sal.info.salfDlrCdCheckMsg' />");
                    return false;
                }
                
                
                $.each(rows, function(idx, row){
                    
                    rowObj.sdptNm          = frGrid.dataItem(row).sdptNm;
                    rowObj.distOfficeNm    = frGrid.dataItem(row).distOfficeNm;
                    rowObj.sungNm          = frGrid.dataItem(row).sungNm;
                    rowObj.cityNm          = frGrid.dataItem(row).cityNm;
                    rowObj.dlrCd           = frGrid.dataItem(row).dlrCd;
                    rowObj.dlrNm           = frGrid.dataItem(row).dlrNm;

                    if(!popSelectObj.hasOwnProperty(frGrid.dataItem(row).dlrCd)){
                        popSelectObj[frGrid.dataItem(row).dlrCd] = frGrid.dataItem(row).dlrCd;
                        toGrid.dataSource.add(rowObj);

                        toGrid.select($(this));
                        $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);
                    }
                });

                toRows = toGrid.tbody.find("tr");

                toRows.each(function(index, row) {
                    toGrid.select($(this));
                    $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", true);
                });

                frGrid.clearSelection();
            }
        }
    });

    // 삭제 버튼
    $("#btnDelete").kendoButton({
        click:function(e){
            var fromGrid   = $("#selectGrid").data("kendoExtGrid"),
                toGrid     = $("#searchGrid").data("kendoExtGrid"),
                rows       = fromGrid.select();

            rows.each(function(index, row) {
                delete popSelectObj[fromGrid.dataItem(row).dlrCd];
            });
            rows.each(function(index, row) {
                fromGrid.removeRow(row);
            });
        }
    });

    // 사업부
    $("#sSdptCd").kendoExtDropDownList({
        dataTextField:"sdptNm"
       ,dataValueField:"sdptCd"
       ,dataSource:sdptDs
       ,optionLabel:" "
       ,index:0
       ,select :function(e){
           $("#sDistOfficeCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sDistOfficeCd").data("kendoExtDropDownList").enable(true);

           var dataItem = this.dataItem(e.item);
           if(dataItem.sdptCd == ""){
               $("#sDistOfficeCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sDistOfficeCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url :"<c:url value='/sal/inv/stockMnt/selectOffice.do' />"
               ,data :JSON.stringify({"sSdptCd":dataItem.sdptCd})
               ,async :false
           });

           if(responseJson == null || responseJson.data == null){
               responseJson.data = [];
           }
           
           $("#sDistOfficeCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });
    //사무소
    $("#sDistOfficeCd").kendoExtDropDownList({
        dataTextField:"distOfficeNm"
        ,dataValueField:"distOfficeCd"
        ,optionLabel:" "
    });
    $("#sDistOfficeCd").data("kendoExtDropDownList").enable(false);
    //성
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

    
    /************************************************************
                조회조건 설정
    *************************************************************/


    /************************************************************
                조회 그리드 설정
    *************************************************************/
        $("#searchGrid").kendoExtGrid({
            gridId:"G-SAL-1202-123011"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/sal/inv/stockOpen/selectStockOpenDlrSearch.do' />"
                        , dataType:"json"
                        , type:"POST"
                        , contentType:"application/json;"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            // 조회조건
                            params["sDlrCd"] = $("#sDlrCd").val();
                            params["sSdptCd"] = $("#sSdptCd").data("kendoExtDropDownList").value();
                            params["sDistOfficeCd"] = $("#sDistOfficeCd").data("kendoExtDropDownList").value();
                            params["sSungCd"] = $("#sSungCd").data("kendoExtDropDownList").value();
                            params["sCityCd"] = $("#sCityCd").data("kendoExtDropDownList").value();
                            
                            return kendo.stringify(params);
                        }
                    }
                }
                ,navigatable:false
                ,serverPaging:true
                ,schema:{
                    data:"data"
                    , total:"total"
                    , model:{
                        id:"dlrCd"
                        , fields:{
                              sdptNm       :{ type:"string" }
                            , distOfficeNm :{ type:"string" }
                            , sungNm       :{ type:"string" }
                            , cityNm       :{ type:"string" }
                            , dlrCd        :{ type:"string" }
                            , dlrNm        :{ type:"string" }
                        }
                    }
                }
            }
            ,height:175
            ,selectable :"multiple, row"
            ,editable:false
            ,autoBind:false
            ,sortable:false
            ,filterable:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,multiSelectWithCheckbox:true
            ,columns:[
                {field:"sdptNm",title:"<spring:message code='global.lbl.division' />", attributes:{"class":"al"}, width:120} //사업부
                ,{field:"distOfficeNm",title:"<spring:message code='sal.lbl.officeNm' />", attributes:{"class":"al"}, width:120 } //사무소
                ,{field:"sungNm",title:"<spring:message code='global.lbl.sung' />", attributes:{"class":"al"}, width:120 } //성
                ,{field:"cityNm" ,title:"<spring:message code='sal.lbl.city' />", attributes:{"class":"al"}, width:120}  //도시
                ,{field:"dlrCd",title:"<spring:message code='global.lbl.dlrCd' />", attributes:{ "class":"al"}, width:80 }    //딜러코드
                ,{field:"dlrNm" ,title:"<spring:message code='global.lbl.dlrNm' />", attributes:{"class":"al"}, width:120}      //딜러명
            ]
        });

        /************************************************************
                    선택그리드 설정
        *************************************************************/
        $("#selectGrid").kendoExtGrid({
            gridId:"G-SAL-1202-130511"
           ,dataSource:{
                schema:{
                     model:{
                        id:"dlrCd"
                        , fields:{
                              sdptNm       :{ type:"string" }
                            , distOfficeNm :{ type:"string" }
                            , sungNm       :{ type:"string" }
                            , cityNm       :{ type:"string" }
                            , dlrCd        :{ type:"string" }
                            , dlrNm        :{ type:"string" }
                        }
                    }
                }
            }
            //,selectable :"multiple, row"
            ,editable:false
            ,pageable:false
            ,autoBind:false
            ,filterable:false
            ,height:137
            ,indvColumnVisible :false         //컬럼 보이기/감추기 개인화 적용. default :true
            ,indvColumnReorderable :false     //컬럼순서 변경 개인화 적용. default :true
            ,appendEmptyColumn:false          //빈컬럼 적용. default:false
            ,multiSelectWithCheckbox:true
            ,columns:[
                {field:"sdptNm",title:"<spring:message code='global.lbl.division' />", attributes:{"class":"al"}, width:120} //사업부
                ,{field:"distOfficeNm",title:"<spring:message code='sal.lbl.officeNm' />", attributes:{"class":"al"}, width:120 } //사무소
                ,{field:"sungNm",title:"<spring:message code='global.lbl.sung' />", attributes:{"class":"al"}, width:120 } //성
                ,{field:"cityNm" ,title:"<spring:message code='sal.lbl.city' />", attributes:{"class":"al"}, width:120}  //도시
                ,{field:"dlrCd",title:"<spring:message code='global.lbl.dlrCd' />", attributes:{ "class":"al"}, width:80 }    //딜러코드
                ,{field:"dlrNm" ,title:"<spring:message code='global.lbl.dlrNm' />", attributes:{"class":"al"}, width:120}      //딜러명
            ]
        });
        
        $("#searchGrid").data("kendoExtGrid").dataSource.page(1);

    });
 </script>