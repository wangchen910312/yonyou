<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <button id="btnApply" class="btn_m"><spring:message code='global.btn.fix' /></button> <!-- 적용 -->
            <button id="btnAdd" class="btn_m btn_add"><spring:message code='global.btn.add' /></button> <!-- 추가 -->
            <button id="btnDel" class="btn_m btn_delete"><spring:message code='global.btn.del' /></button> <!-- 삭제 -->
            <%-- <button id="btnClose" class="btn_m"><spring:message code='global.btn.close' /></button> --%> <!-- 닫기 -->
        </div>
    </div>
    <div class="table_grid">
        <div id="grid" class="grid"></div>
    </div>
</section>

<script type="text/javascript">
    /**
     * 팝업 옵션
     */
     var options = parent.popupWindow.options.content.data;

    $(document).ready(function() {
        /************************************************************
                    팝업옵션 설정
        *************************************************************/

        /************************************************************
                    조회조건 설정
        *************************************************************/

        // 추가 버튼
        $("#btnAdd").kendoButton({
             click:function(e){
                 $('#grid').data('kendoExtGrid').dataSource.insert(0, {
                       carlineCd:options.params[0].carlineCd
                      ,carlineNm:options.params[0].carlineNm
                      ,modelCd:options.params[0].modelCd
                      ,modelNm:options.params[0].modelNm
                      ,ocnCd:options.params[0].ocnCd
                      ,ocnNm:options.params[0].ocnNm
                      ,extColorCd:options.params[0].extColorCd
                      ,extColorNm:options.params[0].extColorNm
                      ,intColorCd:options.params[0].intColorCd
                      ,intColorNm:options.params[0].intColorNm
                      ,reqQty:1
                      ,vinNo:""
                      ,enginNo:""
                  });

                 var grid = $("#grid").data("kendoExtGrid");
                 var rows = grid.tbody.find("tr:eq(0)").closest('tr');
                 rows.addClass("k-state-selected");
             }
        });

        // 삭제 버튼
        $("#btnDel").kendoButton({
             click:function(e){

                 var grid = $("#grid").data("kendoExtGrid");
                 var rows = grid.select();

                 rows.each(function(index, row) {
                     grid.removeRow($(this).closest('tr'));
                 });
             }
        });


        // 적용 버튼
        $("#btnApply").kendoButton({
            click:function(e){

                var arrApply = [];

                var grid = $("#grid").data("kendoExtGrid");
                var rows = grid.select();

                if(rows.length  == 0 ){
                    dms.notification.info("<spring:message code='global.lbl.car' var='car' /><spring:message code='global.info.chkSelectItemMsg' arguments='${car},' />"); // 차량을 선택해주세요.
                    return false;
                }else{
                    var check = true;
                    rows.each(function(index, row) {
                        var dataItem = grid.dataItem(row);
                        // 체크여부
                        //var check = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");

                        if( dataItem.vinNo == null || dataItem.vinNo == "" ){
                            dms.notification.info("<spring:message code='sal.lbl.vinNo' var='vinNo' /><spring:message code='global.info.emptyCheckParam' arguments='${vinNo},' />"); // VIN NO
                            check = false;
                            return false;
                        }

                        if( dataItem.enginNo == null || dataItem.enginNo == "" ){
                            dms.notification.info("<spring:message code='sal.lbl.engineNo' var='engineNo' /><spring:message code='global.info.emptyCheckParam' arguments='${engineNo},' />"); //ENGINE NO
                            check = false;
                            return false;
                        }

                        //dataItem.set("reqQty", rows.length);

                        arrApply.push(dataItem);
                    });
                    if( !check ){
                        return;
                    }
                }
                var saveData = { "applyList":arrApply};

                $.ajax({
                    url:"<c:url value='/sal/svo/groupSalesApplication/applyGroupSalesApplicationPopup.do' />",
                    data:JSON.stringify(saveData),
                    type:'POST',
                    async:false,
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    },
                    success:function(jqXHR, textStatus) {
                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");

                         var data = [];
                         data.result = arrApply;
                         data.msg = 'save';
                         data.reqQty = arrApply.length;

                         options.callbackFunc(data);
                         parent.popupWindow.close();
                    }
                });
            }
        });

        // 닫기 버튼
        $("#btnClose").kendoButton({
            click:function(e){
                var data = [];
                data.msg = 'close';
                options.callbackFunc(data);
                parent.popupWindow.close();

            }
        });

        /************************************************************
                    그리드 설정
        *************************************************************/
        //그리드 설정
        $("#grid").kendoExtGrid({ //SA_0121
            dataSource:{
                 transport:{
                    read:{

                    }
                    ,parameterMap:function(options, operation) {

                    }
                }
                ,navigatable:false
                ,serverPaging:false
                ,pageSize:0
                ,schema:{
                    model:{
                        id:"vinNo"
                        ,fields:{
                            carlineCd:{type:"number", editable:false, hidden:true}
                            ,carlineNm:{type:"number", editable:false, hidden:true}
                            ,modelCd:{type:"string", editable:false, hidden:true}
                            ,modelNm:{type:"string", editable:false, hidden:true}
                            ,ocnCd:{type:"string", editable:false, hidden:true}
                            ,ocnNm:{type:"string", editable:false, hidden:true}
                            ,extColorCd:{type:"string", editable:false, hidden:true}
                            ,extColorNm:{type:"string", editable:false, hidden:true}
                            ,intColorCd:{type:"string", editable:false, hidden:true}
                            ,intColorNm:{type:"string", editable:false, hidden:true}
                            ,reqQty:{type:"number", editable:false, hidden:true}
                            ,vinNo:{type:"string", validation:{required:true}}
                            ,enginNo:{type:"string", validation:{required:true}}

                        }
                    }
                }
            }
            ,multiSelectWithCheckbox:true
            ,autoBind:false
            ,pageable:false
            ,height:233
            ,columns:[
               {   field:"carlineCd", hidden:true }  // 차종
              ,{   field:"carlineNm", hidden:true }  // 차종
              ,{   field:"modelCd", hidden:true }  // 모델
              ,{   field:"modelNm", hidden:true }  // 모델
              ,{   field:"ocnCd", hidden:true }  // OCN
              ,{   field:"ocnNm", hidden:true }  // OCN
              ,{   field:"extColorCd", hidden:true }  // 외장색
              ,{   field:"extColorNm", hidden:true }  // 외장색
              ,{   field:"intColorCd", hidden:true }  // 내장색
              ,{   field:"intColorNm", hidden:true }  // 내장색
              ,{   field:"reqQty", hidden:true }  // 수량
              ,{
                   title:"<spring:message code='global.lbl.vinNo' />"
                  ,field:"vinNo", width:120
                  ,headerAttributes:{style:"text-align:center;"}
                  ,attributes:{ "style":"text-align:center"}
               }  // VIN NO
              ,{
                   title:"<spring:message code='sal.lbl.engineNo' />"
                  ,field:"enginNo", width:120
                  ,headerAttributes:{style:"text-align:center;"}
                  ,attributes:{ "style":"text-align:center"}
               }  // ENGINE NO
            ]
        });


    if( options.params[0].vinNo != null && options.params[0].vinNo != "" ){

        var grid = $("#grid").data("kendoExtGrid");

        for( var i = 0; i < options.params.length; i++ ){
            grid.dataSource.insert(0, {
                carlineCd:options.params[i].carlineCd
               ,carlineNm:options.params[i].carlineNm
               ,modelCd:options.params[i].modelCd
               ,modelNm:options.params[i].modelNm
               ,ocnCd:options.params[i].ocnCd
               ,ocnNm:options.params[i].ocnNm
               ,extColorCd:options.params[i].extColorCd
               ,extColorNm:options.params[i].extColorNm
               ,intColorCd:options.params[i].intColorCd
               ,intColorNm:options.params[i].intColorNm
               ,reqQty:options.params.length
               ,vinNo:options.params[i].vinNo
               ,enginNo:options.params[i].enginNo
            });

        }

        var rows = grid.tbody.find("tr:eq(0)").closest('tr');
        rows.addClass("k-state-selected");
    }


    });
</script>









