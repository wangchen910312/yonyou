<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- content -->
<section id="window" class="pop_wrap"  >
    <div class="header_area" >
        <div class="btn_right">
            <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /><!-- 선택 --></button>
        </div>
    </div>

    <div class="table_grid mt10">
        <!-- 그리드1 -->
         <div id="pointCutGrid" class="grid"></div>
        <!-- 그리드1 -->
    </div>
</section>

<script type="text/javascript">

var parentJsonData = parent.pointCutPopup.options.content.data;
var callback = parentJsonData.callbackFunc;

var rowData = parentJsonData.rowData;
var demicalPoint = parentJsonData.demicalPoint;
var demicalPointCutCdNm = parentJsonData.demicalPointCutCdNm;

$(document).ready(function(){

    // 선택 버튼.
    $("#btnSelect").kendoButton({
        click:function(e){
            var grid = $("#pointCutGrid").data("kendoExtGrid");
            var data = grid.dataItem("tr:eq(0)");
            if(data.demicPointCutAmt > demicalPoint){
                dms.notification.info("<spring:message code='ser.lbl.settClZero' var='settClZero' /><spring:message code='global.info.validation.max' arguments='${settClZero}," + demicalPointCutCdNm + ", ${finalCalcAmt}' />");
            } else {
                var preDemicPointCutAmt = rowData.demicPointCutAmt;
                if(dms.string.isEmpty(preDemicPointCutAmt) || Number(preDemicPointCutAmt) === 'NaN'){
                    preDemicPointCutAmt = 0;
                }
                data.set("paymAmt", (Number(data.paymAmt) + Number(preDemicPointCutAmt) - Number(data.demicPointCutAmt)).toFixed(2));

                parentJsonData.callbackFunc(data);
            }
        }
    });

    //정산제로 그리드
    $("#pointCutGrid").kendoExtGrid({
        dataSource:[
            {
                calcAmt:rowData.calcAmt
                ,wonUnitCutAmt:rowData.wonUnitCutAmt
                ,demicPointCutAmt:rowData.demicPointCutAmt
                ,paymAmt:rowData.paymAmt
            }
        ]
        ,pageable:false
        ,height: (parent.isTablet=="true")? 60 : 50
        ,selectable:"row"
        ,filterable:false                 // 필터링 기능 사용안함
        ,resizable:false
        ,scrollable:false
        ,sortable:false
        ,edit:function(e){
           var fieldName = $(e.container.find("input")[1]).attr("name");

            if(fieldName == "calcAmt" || fieldName == "wonUnitCutAmt" || fieldName == "paymAmt") {
                this.closeCell();
            }
            // fieldName 값이 undifined로 나와서 아래처럼 처리
            if(fieldName != "demicPointCutAmt"){
                this.closeCell();
            }
        }
        ,columns:[
            {field:"calcAmt", title:"<spring:message code='ser.lbl.finalCalcAmt' />", width:90, attributes:{"class":"ar"} , format:"{0:n2}"}            // 최종정산금액
            ,{field:"wonUnitCutAmt", title:"<spring:message code='ser.lbl.interSett' />", width:80, attributes:{"class":"ar"} , format:"{0:n2}"}        //정산절사
            ,{field:"demicPointCutAmt", title:"<spring:message code='ser.lbl.settClZero' />", width:80, attributes:{"class":"ar"} , format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input name="demicPointCutAmt" data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        min:0
                        ,max:demicalPoint
                        ,decimals:2
                        ,spinners:false
                        ,restrictDecimals: true
                    })
                    .focus(function(){
                        if(parent.isTablet=="true") {
                            this.select();
                        }
                    });
                }
            }    //정산제로
            ,{field:"paymAmt", title:"<spring:message code='ser.lbl.arCd' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}    //수납금액
        ]
    });
});
</script>
<!-- //content -->