<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!--  팝업 -->
<section id="window" class="pop_wrap">

    <div id="tabstrip" class="tab_area">
        <!-- 탭메뉴 -->
        <ul>
            <li id="incTab" class="k-state-active"><spring:message code='sal.lbl.incproduct' /></li> <!-- 보험상품 -->
            <li id="packageTab"><spring:message code='sal.lbl.incPackage' /></li> <!-- 보험패키지 -->
        </ul>
        <span class="btn_right_absolute2">
            <button id="btnSearch" class="btn_m"><spring:message code='global.btn.search' /></button>  <!-- 조회 -->
            <button id="btnSelect" class="btn_m"><spring:message code='global.btn.select' /></button>  <!-- 선택 -->
            <button id="btnPackageSearch" class="btn_m" style="display:none;"><spring:message code='global.btn.search' /></button>  <!-- 조회 -->
            <button id="btnPackageSelect" class="btn_m" style="display:none;"><spring:message code='global.btn.select' /></button>  <!-- 선택 -->
        </span>

        <!-- 보험종류 TAB -->
        <div id="incTabDiv" class="mt0">
            <div class="table_grid mt10">
                <div id="grid"></div>
            </div>
        </div>
        <!-- 보험패키지 TAB -->
        <div id="packageTabDiv" class="mt0">
            <div class="clfix">
                <div class="left_areaStyle" style="width:49%">
                    <div class="table_grid">
                        <div id="packGrid" class="grid"></div>
                    </div>
                </div>
                <div class="right_areaStyle" style="width:50%;">
                    <div class="table_grid">
                        <div class="table_grid">
                            <div id="itemGrid" class="grid"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</section>
<!-- // 팝업 -->

<script>

var subParam = {};

$(document).ready(function() {

    // 팝업 설정값
    var options = parent.popupWindow.options.content.data;

    // 탭
    selectTabId = "incTab";       // 초기값:용품
    $("#tabstrip").kendoExtTabStrip({
        animation:false
       ,select:function(e) {
            selectTabId = e.item.id;
            selectTab(selectTabId);
        }
    });

    $("#tabstrip").data("kendoExtTabStrip").select(0);
    if(dms.string.strNvl(options.onlyItemTab) == "Y" ){
        $("#tabstrip").data("kendoExtTabStrip").select(0);
        $("#packageTab").attr("disabled", true);
        $("#packageTab").hide();
        $("#packageTabDiv").hide();
    }

    // 보험조회
    $("#btnSearch").kendoButton({
        click:function(e){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }
    });

    // 보험선택
    $("#btnSelect").kendoButton({
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());
            var rows = grid.select();
            if (rows.length >= 1){
                var data = [];
                $.each(rows, function(idx, row){
                    data.push(grid.dataItem(row));
                });
                options.callbackFunc(data);
            }else{
                dms.notification.info("<spring:message code='global.info.required.select'/>");
            }
        }
    });

    // 패키지탭 조회
    $("#btnPackageSearch").kendoButton({
        click:function(){
            $("#packGrid").data("kendoExtGrid").dataSource.read();
            $('#itemGrid').data('kendoExtGrid').dataSource.data([]);
        }
    });

    // 패키지탭 선택
    $("#btnPackageSelect").kendoButton({
        click:function(e){
            var grid = $('#packGrid').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());
            var rows = grid.select();
            if (rows.length >= 1){
                var itemGrid = $("#itemGrid").data("kendoExtGrid");
                var itemData = itemGrid.dataSource.data();

                var useNon = false;
                $.each(itemData, function(idx, row){
                    if(row.useYn == "N"){useNon = true;}
                });
                if(useNon){
                    // 삭제된 보험유형으로인해, 해당 패키지는 사용이 불가능합니다.
                    dms.notification.warning("<spring:message code='sal.info.incNoPackageCheckMsg' />");
                    return false;
                }

                options.callbackFunc(itemData, "01");
            } else {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
            }
        }
    });

    // 보험유형 Grid
    $("#grid").kendoExtGrid({
        dataSource :{
            transport :{
                read :{
                    url :"<c:url value='/sal/inc/incJoinInfo/selectIncItemSearch.do' />"
                },
                parameterMap :function(options, operation) {
                    if (operation == "read") {
                        //var params = [];
                        //params["sDlrCd"] = "";
                        //return kendo.stringify(params);
                        return;
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema :{
                model :{
                    id :"cmmCd",
                    fields :{
                         cmmCd      :{type :"string", editable:false} //코드
                        ,cmmCdNm    :{type :"string"}                   //명칭
                    }
                }
            }
        }
       ,multiSelectWithCheckbox:true
       ,pageable :false
       ,height :280
       ,editable  :false
       ,resizable :true
       ,autoBind :true
       ,sortable:false
       ,editable:false
       ,columns :[
          {field:"cmmCd",    title:"<spring:message code='sal.lbl.incTp' />", hidden:true, width:100}
          ,{field:"cmmCdNm", title:"<spring:message code='sal.lbl.incTp' />", attributes:{"class":"al"}, width:100}  //保险类型
       ]
   });


   // 패키지 그리드
   $("#packGrid").kendoExtGrid({
       dataSource :{
           transport :{
               read :{
                   url :"<c:url value='/sal/inc/incJoinInfo/selectIncPackage.do' />"
               },
               parameterMap :function(options, operation) {
                   if (operation == "read") {
                       var params = {};
                       params["sort"] = options.sort;
                       params["sDlrCd"] = "";

                       //console.log(params);
                       return kendo.stringify(params);
                   }else if (operation !== "read" && options.models) {
                       return kendo.stringify(options.models);
                   }
               }
           }
           ,schema :{
               model :{
                   id :"packageNo",
                   fields :{
                       packageNo     :{type :"string"} //코드
                       ,packageNm    :{type :"string"} //명칭
                   }
               }
           }
       }
      ,multiSelectWithCheckbox:true
      ,pageable:false
      ,height:280
      ,editable:false
      ,resizable:true
      ,autoBind:true
      ,sortable:true
      ,editable:false
      ,change:function(e){
          var dataItem = this.dataItem(this.select());
          //$('#itemGrid').data('kendoExtGrid').dataSource.data([]);
          subParam["sPackageNo"] = dataItem.packageNo;
          $('#itemGrid').data('kendoExtGrid').dataSource.read();
      }
      ,columns :[
         {field:"packageNo", title:"<spring:message code='sal.lbl.packageNo' />", attributes:{"class":"al"}, width:80} //패키지번호
         ,{field:"packageNm", title:"<spring:message code='sal.lbl.packageNm' />", attributes:{"class":"al"}, width:120}  //패키지명
      ]
   });

   // 패키지 item그리드
   $("#itemGrid").kendoExtGrid({
       dataSource :{
           transport :{
               read :{
                   url :"<c:url value='/sal/inc/incJoinInfo/selectIncDetailPackage.do' />"
               },
               parameterMap :function(options, operation) {
                   if (operation == "read") {
                       subParam["sort"] = options.sort;

                       return kendo.stringify(subParam);
                       return;
                   }else if (operation !== "read" && options.models) {
                       return kendo.stringify(options.models);
                   }
               }
           }
           ,schema :{
               model :{
                   id :"incTp",
                   fields :{
                        incTp      :{type :"string"} //코드
                       ,incTpNm    :{type :"string"}                   //명칭
                   }
               }
           }
       }
      ,multiSelectWithCheckbox:false
      ,pageable:false
      ,height:280
      ,editable:false
      ,resizable:true
      ,autoBind:false
      ,sortable:false
      ,editable:false
      ,columns :[
          {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:80, sortable:false, attributes:{"class":"ac"}}
         ,{field:"incTp",    title:"<spring:message code='sal.lbl.incTp' />", hidden:true, width:100}
         ,{field:"incTpNm", title:"<spring:message code='sal.lbl.incTp' />", attributes:{"class":"al"}, width:100}  //保险类型
      ]
  });



});

function selectTab(tabId){
    switch (tabId){
        case 'incTab':       // 보험유형
            $("#btnSearch").show();
            $("#btnSelect").show();
            $("#btnPackageSearch").hide();
            $("#btnPackageSelect").hide();
            break;
        case 'packageTab':   // 보험패키지
            $("#btnSearch").hide();
            $("#btnSelect").hide();
            $("#btnPackageSearch").show();
            $("#btnPackageSelect").show();
            break;
        default :
            break;
    }
}

</script>