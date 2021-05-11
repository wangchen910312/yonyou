<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>


<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- content -->

    <!--  알림팝업  -->
    <section class="lay_pop" id="lay_01" style="display:block;left:25px;top:40px">
        <div class="lay_title">
            <h1>알림</h1>
        </div>
        <div class="lay_cont2" id="lay_content">
                    홍길동  010-1010-1111 <input type="button" id="" name="" value="선택" />
                    홍길동  010-1010-1111 <input type="button" id="" name="" value="선택" />
                    홍길동  010-1010-1111 <input type="button" id="" name="" value="선택" />
        </div>
        <div class="btnarea">
            <span class="btnd1t2">확인</span>
            <span class="btnd1" onclick="layerClose('.lay_pop')">취소</span>
        </div>
    </section>
    <!--  // 알림팝업  -->







<!-- script -->
<script>
var dateFormat =  '<dms:configValue code="dateFormat" />';
var toDate,
    gCrud;

var html = "";
<c:forEach var="obj" items="${dataList}">

html += "   <input type=\'text\' id=\'custNo\' name=\'custNo\' value=\'${obj.custNm}\' />  \t";
html += "   <input type=\'button\' id=\'btnSearch\' name=\'btnSearch\' value=\'선택\' onclick=\'javascript:searchDetail(\"${obj.custNo}\")\'/>";

/*
html = "<div>";
html += "   <input type=\'text\' id=\'custNo\' name=\'custNo\' value=\'${obj.custNo}\' />  \t";
html += "   <input type=\'text\' id=\'custNo\' name=\'custNo\' value=\'${obj.custNm}\' />  \t";
html += "   <input type=\'text\' id=\'custNo\' name=\'custNo\' value=\'${obj.custTp}\' />  \t";
html += "   <input type=\'text\' id=\'custNo\' name=\'custNo\' value=\'${obj.custCd}\' />  \n";
html += "   <input type=\'text\' id=\'custNo\' name=\'custNo\' value=\'${obj.hpNo}\' />  \t";
html += "   <input type=\'text\' id=\'custNo\' name=\'custNo\' value=\'${obj.telNo}\' />  \n";
html += "   <input type=\'button\' id=\'btnSearch\' name=\'btnSearch\' value=\'선택\' />";
html += "</div>"
 */

</c:forEach>
$("#lay_content").html(html);


// 그리드에서 목록 선택시 선택값 세팅
var setDataItem;

$(document).ready(function() {
    var sHpNo = '${sHpNo}';

    console.log(sHpNo);


    var param = {};
    param["sHpNo"] = sHpNo;//$("#custNo").val();


    $.ajax({
        url:"<c:url value='/mob/crm/cif/customerInfo/customerPopupListSearch.do' />"
        ,data:JSON.stringify(param)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR,status,error){
            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
        }
    }).done(function(result) {

        console.log(result);
        var data = result.data;
        var html = "";

        $.each(result.data, function(index,data){

            html += "   <input type=\'text\' id=\'custNo\' name=\'custNo\' value=\'"+data.custNm+" \' />  \t";
            html += "   <input type=\'button\' id=\'btnSearch\' name=\'btnSearch\' value=\'선택\' onclick=\'javascript:searchDetail(\""+data.custNo+"\")\'/>";
        })


        $("#lay_content").html(html);
    });



});

function searchDetail(custNo){
    var sCustNo = custNo;
    var url = "/bhmc-dms-web/mob/crm/cif/customerInfo/customerPopupInfoMain.do?sCustNo="+sCustNo;
    window.open(url, "_self");
}
</script>
