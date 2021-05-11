<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 운송내역 상세조회 팝업 -->
<section id="window" class="pop_wrap">
    <div class="table_grid mt10">
        <div id="grid"></div>
    </div>
    <span style="display:none">
        <input type="hidden" id="sVinNo" />
    </span>
</section>
<!-- // 운송내역 상세조회 팝업 -->


<script type="text/javascript">

//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

$(document).ready(function() {

    // 팝업 설정값
    var options = parent.popupWindow.options.content.data;
    $("#sVinNo").val(options.sVinNo);

    // grid
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0729-090101"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/lom/tpVehicleMonitoringDlr/selectTpMonitoringDlrDetailSearch.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sVinNo"] = $("#sVinNo").val();
                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,requestEnd:function(e) {
                if (e.type == "read") {
                    //조회가 완료 되였습니다.
                    //dms.notification.info("<spring:message code='global.info.searchSuccess' />");
                }
            }
            ,schema:{
                model:{
                    id:"vinNo"
                    ,fields:{
                        vinNo           :{type:"string"}
                        ,uploadDt       :{type:"date"}
                        ,uploadHm       :{type:"string"}
                        ,trsfLocCd      :{type:"string"}
                        ,trsfStatCd     :{type:"string"}
                        ,preAlrtNtceCont:{type:"string"}
                    }
                }
            }
        }
        ,editable:false
        ,autoBind:false
        ,columns:[
            {field:"vinNo",        title:"<spring:message code='global.lbl.vinNum' />",   width:150, attributes:{"class":"ac"}} //vin no
            ,{field:"uploadDt",    title:"<spring:message code='sal.lbl.uploadDt' />", width:100, attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' />}"}  //업로드일자
            ,{field:"uploadHm",    title:"<spring:message code='sal.lbl.uploadHm' />", width:90, attributes:{"class":"ac"}, template:"#= bf_subStrTime(dms.string.strNvl(uploadHm)) #" }         //업로드시간
            ,{field:"trsfLocCd",   title:"<spring:message code='sal.lbl.trsfLocCd' />", width:130, attributes:{"class":"al"} } //운송위치
            ,{field:"trsfStatCd",  title:"<spring:message code='sal.lbl.trsfStatCd' />", width:130, attributes:{"class":"al"} } //운송상태
            ,{field:"preAlrtNtceCont", title:"<spring:message code='sal.lbl.preAlrtNtceCont' />", width:130, attributes:{"class":"al"}} //조기경보통지내용
        ]
    });

    $('#grid').data('kendoExtGrid').dataSource.read();
});

// 업로드 시간 값 변환
function bf_subStrTime(str){
    if(str.length >= 4){
        var hh = str.substring(0,2);
        var mm = str.substring(2,4);
        return hh+":"+mm;
    }else{
        return str;
    }
}

</script>
<!-- //script -->
</body>
</html>
