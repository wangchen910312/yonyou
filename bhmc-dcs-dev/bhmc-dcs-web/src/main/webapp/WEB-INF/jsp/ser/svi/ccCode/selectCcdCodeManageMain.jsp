<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- cause 코드마스터-->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="ser.title.cauCdMng" /></h1>
        <div class="btn_right">
		<dms:access viewId="VIEW-I-12419" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
		</dms:access>
		<dms:access viewId="VIEW-I-12418" hasPermission="${dms:getPermissionMask('READ')}">
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
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.cauCd" /></th>
                    <td>
                        <input id="sCauCd" type="text" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.cauNm" /></th>
                    <td>
                        <input id="sCauNm" type="text" class="form_input" />
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
    </div>
     <!-- Grid 시작 -->
    <div class="table_grid">
        <div id="grid"></div>
    </div>
    <!-- Grid 종료-->

</section>
<!-- //원인 코드마스터 -->


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

$(document).ready(function (){

    $("#sCauCd").bind("keyup",function(){
       $(this).val($(this).val().toUpperCase());
    });

     // 조회조건 - 삭제유무
    $("#sDelYn").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:useYnList
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
                        url:"<c:url value='/ser/svi/ccCode/updateCcdCodeManages.do' />",
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
                     url:"<c:url value='/ser/svi/ccCode/selectCcdCodeManages.do' />"
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

                         params["sCauCd"] = $("#sCauCd").val();
                         params["sDelYn"] = $("#sDelYn").val();
                         params["sCauNm"] = $("#sCauNm").val();

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
                         , cauCd:{type:"string" , editable:false}
                         , cauNm:{type:"string" , editable:false}
                         , cauCont:{type:"string" , editable:false}
                         , delYn:{type:"string" , validation:{required:true}}
                         , updtDt:{type:"date"   , editable:false}
                     }
                 }
             }
         }
        ,reorderable:false
        ,columns:[
                {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:30, sortable:false, attributes:{"class":"ac"}}
               ,{field:"cauCd", title:"<spring:message code='ser.lbl.cauCd' />", width:40, sortable:false, attributes:{"class":"ac"}}
               ,{field:"cauNm", title:"<spring:message code='ser.lbl.cauNm' />", width:150, sortable:false, attributes:{"class":"al"}}
               ,{field:"cauCont", title:"<spring:message code='ser.lbl.cauCont' />", width:350, sortable:false, attributes:{"class":"al"}}
               ,{field:"delYn", title:"<spring:message code='ser.lbl.delYn' />", width:50, sortable:false, attributes:{"class":"ac"}
                    ,template:"#=useYnGrid(delYn)#"
                    ,editor:function(container, options) {
                        $('<input required name="ccdUseYn" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                            ,dataValueField:"cmmCd"
                            ,dataSource:useYnList
                        });
                        $('<span class="k-invalid-msg" data-for="delYn"></span>').appendTo(container);
                    }
                }
                ,{field:"updtDt", title:"<spring:message code='ser.lbl.updtDt' />", width:80, sortable:false, attributes:{"class":"ac"}
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

</script>

