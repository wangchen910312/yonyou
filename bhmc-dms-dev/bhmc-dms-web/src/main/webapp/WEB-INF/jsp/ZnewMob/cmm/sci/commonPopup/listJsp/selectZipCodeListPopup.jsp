<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />
<div>
    <div id="listView" style="width:30%; height:300; overflow:scroll; float:left;"></div>
</div>

<script type="text/x-kendo-template" id="template">
<div class="dlistitem bgNone" id="listContentRow" onclick="listViewClick(listData._view[#:rnum-1 #],this);">
    <span style="width:100%">#:sungNm #</span>
    <span style="width:100%; display:none;">#:sungCd #</span>
</div>
</script>

<script>
//시스템 날짜 정보 가져오기.
var _data = [];

var listData = new kendo.data.DataSource({});

function listViewClick(dataItem, e)
{
    /* $(e.item[0]).siblings().children(".dlistitem").attr('style', 'background-color: white !important');
    $(e.item[0]).children(".dlistitem").attr('style', 'background-color: #1b8deb !important'); */
    contentCommonDetail(1,dataItem);
    sungCd = dataItem.sungCd;
    listData2.read();

    //listView3에 데이터가 있다면 listView3을 초기화한다.
    if(cityCd !=""){
        cityCd = "";
        listData3.read();
    }
    /* $("#comonPopupList2").attr("src", "<c:url value='/mob/cmm/sci/commonPopup/selectZipCodeListPopup2.do?sungCd="+dataItem.sungCd+"' />");
    $("#comonPopupList3").attr("src", ""); */
    var curRow = dataItem.rnum -1;
    $('#listView .dlistitem').each(function(i){
        if(i == curRow){
            $(this).addClass("liston"); // 리스트 선택시 class추가
        } else {
            $(this).removeClass("liston"); // 리스트  해제시 class제거
        }
    });
}

$(document).ready(function(){
    $.each(sungCdDs , function(i , row){
        _data.push({
            sungNm:sungCdDs[i].sungNm,
            sungCd:sungCdDs[i].sungCd,
            rnum:i+1
          });
    });

    listData = new kendo.data.DataSource({data:_data});

    $("#listView").kendoListView({
        dataSource:listData
        ,template:kendo.template($("#template").html())
        ,autoBind:true
        ,dataBinding: function(e) {
            if(e.items.length == 0){
                $("#listView").css(
                        {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                            ,"background-repeat":"no-repeat"
                            ,"background-position":"center"});
            }else{
                $("#listView").css({"background-image":"none"});
            }
        }
    });

    $("#listView").height($(window).height() - ($("#header").outerHeight() + $(".content_title").outerHeight() + $(".btnfixed").outerHeight()));
});

</script>
