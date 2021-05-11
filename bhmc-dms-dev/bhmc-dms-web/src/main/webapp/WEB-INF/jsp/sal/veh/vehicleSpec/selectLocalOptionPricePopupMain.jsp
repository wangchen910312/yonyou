<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- Vehicle Spec-로컬옵션 팝업 -->
<section id="window" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>     <!-- 조회 -->
            <button id="btnSelect" class="btn_m"><spring:message code='global.btn.select' /></button>                <!-- 선택 -->
            <button id="btnClose" class="btn_m"><spring:message code='global.btn.close' /></button>                  <!-- 닫기 -->
        </div>
    </div>
    <div class="table_form form_width_100per">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:18%;">
                <col style="width:32%;">
                <col style="width:18%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.optionNm' /></th>  <!-- 옵션명 -->
                    <td colspan="3">
                        <input id="sOptionNm" class="form_input" />
                        <input type="hidden" id="sDlrCd" />
                        <input type="hidden" id="sModelCd" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="table_grid mt10">
        <div id="grid"></div>
    </div>
</section>
<!-- //Vehicle Spec-로컬옵션 팝업 -->

<!-- script -->
<script>
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



$(document).ready(function() {
    // 팝업 설정값
    var options = parent.popupWindow.options.content.data;

    $("#sDlrCd").val(options.dlrCd);
    $("#sModelCd").val(options.modelCd);

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            $('#grid').data('kendoExtGrid').dataSource.read;
        }
    });

    // 버튼 - 선택
    $("#btnSelect").kendoButton({
        click:function(e){
            var grid = $('#grid').data('kendoExtGrid');
            //var selectedItem = grid.dataItem(grid.select());
            var rows = grid.select();

            if (rows.length >= 1){
                var data = [];
                $.each(rows, function(idx, row){
                    data.push(grid.dataItem(row));
                })
                options.callbackFunc(data);
                parent.popupWindow.close();
            } else {
                // 선택값이 없습니다.
                dms.notification.info("<spring:message code='global.info.unselected' />");
            }
        }
    });

    // 버튼 - 닫기
    $("#btnClose").kendoButton({
        click:function(e){
            parent.popupWindow.close();
        }
    });

    // 그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/veh/localOptionPrice/selectLocalOptionPricePopupLists.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};
                        params["dlrCd"] = $("#sDlrCd").val();
                        params["modelCd"] = $("#sModelCd").val();
                        params["optionNm"] = $("#sOptionNm").val();
                        console.log('params:',kendo.stringify(params) );
                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"optionCd",
                    fields :{
                         optionCd   :{type:"string"}
                        ,optionNm   :{type:"string"}
                        ,salePrc    :{type:"number"}

                        ,startDt    :{type:"date"}
                        ,endDt      :{type:"date"}
                        ,updtUsrId  :{type:"string"}
                        ,updtDt     :{type:"date"}
                    }
                }
            }
        }
       ,multiSelectWithCheckbox:false
       ,height:300
       //,autoBind:false
       //,navigatable:true
       ,selectable:"single, row"
       ,sortable:false
       ,editable:false
       ,pageable:false
       ,columns:[
          {field:"optionCd",  title:"<spring:message code='global.lbl.option' />", width:90, headerAttributes:{"class":"ac"}, attributes:{"class":"al"} }     // 옵션
          ,{field:"optionNm", title:"<spring:message code='global.lbl.optionNm' />", width:350, headerAttributes:{"class":"ac"}, attributes:{"class":"al"}}   // 옵션명
          ,{field:"salePrc",  title:"<spring:message code='global.lbl.retailPrice' />" ,width:100,attributes:{"validate-role":true,style:"text-align:right;"}  ,format:"{0:n2}"}
          ,{field:"startDt",  title:"<spring:message code='sal.lbl.startDt' />", attributes:{"class":"ac"}, width:100, format:"{0:"+vDtyyyyMMdd+"}" }   // 적용시작일
          ,{field:"endDt",    title:"<spring:message code='sal.lbl.endDt' />", attributes:{"class":"ac"}, width:100, format:"{0:"+vDtyyyyMMdd+"}"}      // 적용종료일
          ,{field:"updtUsrId",  title:"<spring:message code='global.lbl.updtUsrId' />", hidden:true, width:100}   //수정자
          ,{field:"updtDt",     title:"<spring:message code='global.lbl.updtDt' />", hidden:true, width:100, format:"{0:<dms:configValue code='dateTimeFormat' />}" } //수정일
       ]
   });



});




</script>
