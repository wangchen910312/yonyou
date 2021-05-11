<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- NC 코드마스터-->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="ser.title.phenCdMng" /></h1>
        <div class="btn_right">
		<dms:access viewId="VIEW-I-12421" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
		</dms:access>
		<dms:access viewId="VIEW-I-12420" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button>
		</dms:access>
        </div>
    </div>
    <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table  >
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
                    <th scope="row" ><spring:message code="ser.lbl.phenDstinCd" /></th>
                    <td>
                        <input id="sPhenDstinCd" type="text" class="form_comboBox" />
                    </td>
                    <th scope="row" id="txtPhenCd"><spring:message code="ser.lbl.phenLclsCd" /></th>
                    <td>
                        <input id="sPhenCd" type="text" class="form_input" />
                    </td>
                    <th scope="row" id="txtPhenNm"><spring:message code="ser.lbl.phenLclsNm" /></th>
                    <td>
                        <input id="sPhenNm" type="text" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.delYn"/></th>
                    <td>
                        <input id="sDelYn" type="text" class="form_comboBox" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

   <!-- 그리드 기능 버튼 시작 -->
    <div class="header_area">
        <div class="btn_right">
        </div>
    </div>
     <!-- Grid 시작 -->
    <div class="table_grid">
        <div id="grid"></div>
    </div>


    <!-- Grid 종료-->

</section>
<!-- //CS 코드마스터 -->


<script type="text/javascript">
//사용여부 Array
var useYnList = [];
<c:forEach var="obj" items="${useYnList}">
useYnList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>

//사용여부 Map
var useYnMap = dms.data.arrayToMap(useYnList, function(obj){ return obj.cmmCd; });

//현상분류 Array
var levelList = [];
<c:forEach var="obj" items="${levelList}">
levelList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>

//현상분류 Map
var levelMap = dms.data.arrayToMap(levelList, function(obj){ return obj.cmmCd; });

var ncCcCodeWin;
function selectNcdCcdCodepupWindow(){

    ncCcCodeWin = dms.window.popup({
        windowId:"ncdCcdCodepupWindow"
        , title:"<spring:message code = 'par.title.venderSelect'/>"   // 거래처 조회
        , content:{
            url:"<c:url value='/ser/cmm/popup/selectNcdCcdCodePopup.do'/>"
            , data:{
              //  "type":"custom1"
                 "autoBind":false
                ,"itemCd":$("#sItemCd").val()
                , "callbackFunc":function(data){
                    $("#cauCd").val(data[0].causeCd);
                    $("#cauNm").val(data[0].causeNm);
                    $("#phenCd").val(data[0].natrueCd);
                    $("#phenNm").val(data[0].natrueNm);
                }
            }
        }
    });
}


$(document).ready(function (){


    $("#sPhenCd").bind("keyup",function(){
       $(this).val($(this).val().toUpperCase());
    });

     // 조회조건 - 사용유무
    $("#sDelYn").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:useYnList
        ,index:0
    });
     // 조회조건 - 구분코드
    $("#sPhenDstinCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:levelList
        ,index:0
    });


    // 버튼  - 조회
     $("#btnSearch").kendoButton({
         click:function(e){
             $('#grid').data('kendoExtGrid').dataSource.page(1);
         }
     });

      /**
       * 버튼 - 취소
       */
       $("#btnCancel").kendoButton({
           click:function(e){

               var grid = $("#grid").data("kendoExtGrid");
               grid.cancelChanges();
           }
       });

       /**
        * 버튼 - 저장
        */

        $("#btnSave").kendoButton({
            click:function(e) {

                var grid = $("#grid").data("kendoExtGrid");

                var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

                if (grid.cudDataLength == 0) {
                    dms.notification.info("<spring:message code = 'global.info.required.change'/>");
                    return;
                }

                if (grid.gridValidation()) {
                    $.ajax({
                        url:"<c:url value='/ser/svi/ncCode/updateNcdCodeManages.do' />",
                        data:JSON.stringify(saveData),
                        type:'POST',
                        dataType:'json',
                        contentType:'application/json',
                        error:function(jqXHR,status,error) {
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        },
                        success:function(jqXHR, textStatus) {

                            grid.dataSource._destroyed = [];
                            grid.dataSource.page(1);

                            dms.notification.success("<spring:message code = 'global.info.success'/>");
                        }
                    });
                }else{
                    dms.notification.warning("<spring:message code = 'global.info.check.input'/>");
                }

            }
        });



    $("#grid").kendoExtGrid({
          dataSource:{
             transport:{
                 read:{
                     url:"<c:url value='/ser/svi/ncCode/selectNcdCodeManageMains.do' />"
                 }
                 ,parameterMap:function(options, operation) {
                     if(operation == "read"){

                         // 검색 조건을 파라미터로 담는다.
                         var params = {};

                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sPhenDstinCd"] = $("#sPhenDstinCd").val();
                         params["sPhenLclsCd"] = $("#sPhenLclsCd").val();
                         params["sPhenMclsCd"] = $("#sPhenMclsCd").val();
                         params["sPhenCd"] = $("#sPhenCd").val();
                         params["sPhenNm"] = $("#sPhenNm").val();
                         params["sDelYn"] = $("#sDelYn").val();


                         return kendo.stringify(params);

                     }else if( operation != "read" && options.models ){
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,schema:{
                  model:{
                     id:"rnum"
                    ,fields:{
                           rnum:{type:"number" , editable:false}
                         , phenDstinCd:{type:"string" , editable:false}
                         , phenCd:{type:"string" , editable:false}
                         , phenNm:{type:"string" , editable:false}
                         , delYn:{type:"string" , validation:{required:true}}
                         , updtDt:{type:"date"   , editable:false}
                     }
                 }
             }
         }
        ,dataBinding:function(e){
            var lvlCd = $("#sPhenDstinCd").val();
            var phenCdTile = "";
            var phenNmTile = "";
            if(lvlCd == "L"){
                phenCdTile = "<spring:message code='ser.lbl.phenLclsCd' />";
                phenNmTile = "<spring:message code='ser.lbl.phenLclsNm' />";
            }else if(lvlCd == "M"){
                phenCdTile = "<spring:message code='ser.lbl.phenMclsCd' />";
                phenNmTile = "<spring:message code='ser.lbl.phenMclsNm' />";
            }else if(lvlCd == "S"){
                phenCdTile = "<spring:message code='ser.lbl.phenCd' />";
                phenNmTile = "<spring:message code='ser.lbl.phenNm' />";
            }
           $("#grid th[data-field=phenCd]").html("TEST TILE").contents().last().replaceWith(phenCdTile);
           $("#grid th[data-field=phenNm]").html("TEST TILE").contents().last().replaceWith(phenNmTile);

           $("#txtPhenCd").text(phenCdTile);
           $("#txtPhenNm").text(phenNmTile);


        }
        ,dataBound:false
        ,reorderable:false
        ,columns:[
               {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:30, sortable:false, attributes:{"class":"ac"}}
              ,{field:"phenDstinCd", title:"<spring:message code='ser.lbl.phenDstinCd' />", width:40, sortable:false, attributes:{"class":"ac"}
                  ,template:"#=levelGrid(phenDstinCd)#"
                  ,editor:function(container, options) {
                      $('<input required name="phenDstinCd" data-bind="value:' + options.field + '"/>')
                      .appendTo(container)
                      .kendoExtDropDownList({
                           dataTextField:"cmmCdNm"
                          ,dataValueField:"cmmCd"
                          ,dataSource:levelList
                      });
                      $('<span class="k-invalid-msg" data-for="phenDstinCd"></span>').appendTo(container);
                  }
               }
            ,{field:"phenCd", title:"<spring:message code='ser.lbl.phenLclsCd' />", width:60, sortable:false, attributes:{"class":"ac"}}
            ,{field:"phenNm", title:"<spring:message code='ser.lbl.phenLclsNm' />", width:200, sortable:false, attributes:{"class":"al"}}
            ,{field:"delYn", title:"<spring:message code='ser.lbl.delYn' />", width:60, sortable:false, attributes:{"class":"ac"}
                ,template:"#=useYnGrid(delYn)#"
                ,editor:function(container, options) {
                    $('<input required name="delYn" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                         dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:useYnList
                    });
                    $('<span class="k-invalid-msg" data-for="delYn"></span>').appendTo(container);
                }
            }
           ,{field:"updtDt", title:"<spring:message code='ser.lbl.updtDt' />", width:100, sortable:false
               , attributes:{"class":"ac"}
               , format:"{0:<dms:configValue code='dateFormat' />}"
           }
        ]
    });



});
// 사용여부
useYnGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = useYnMap[val].cmmCdNm;
    }
    return returnVal;
}

// 현상분류
levelGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = levelMap[val].cmmCdNm;
    }
    return returnVal;
}

</script>

