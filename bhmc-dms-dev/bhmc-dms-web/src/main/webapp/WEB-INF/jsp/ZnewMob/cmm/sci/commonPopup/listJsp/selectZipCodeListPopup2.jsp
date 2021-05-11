<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />
<div>
    <div id="listView2" style="width:30%; height:300; overflow:scroll; float:left;"></div>
</div>

<script type="text/x-kendo-template" id="template2">
<div class="dlistitem bgNone" id="listContentRow" onclick="listViewClick2(listData2._view[#:rnum-1 #]);">
    <span style="width:100%">#:cityNm #</span>
    <span style="width:50%; display:none;">#:cityCd #</span>
</div>
</script>

<script>
//시스템 날짜 정보 가져오기.

var listData2 = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/sal/cnt/contractMnt/selectCity.do' />"
            ,type:"POST"
            ,dataType:"json"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation){
            var params = {};
            params["sungCd"] = sungCd;
            return kendo.stringify(params);
        }
    }
    ,change:function(e){
        $.each(e.items, function(idx,obj){
            obj.rnum = idx+1;
        });
    }
    ,batch:true
    ,schema:{
        data:"data"
        ,total:"total"
        ,model:{
            id:"seq"
             ,fields:{
                rnum:{type:"number"}
            }
        }
    }
});

function listViewClick2(dataItem)
{
    /* $(e.item[0]).siblings().children(".dlistitem").attr('style', 'background-color: white !important');
    $(e.item[0]).children(".dlistitem").attr('style', 'background-color: #1b8deb !important'); */
    contentCommonDetail(2,dataItem);
    cityCd = dataItem.cityCd;
    listData3.read();

    var curRow = dataItem.rnum-1;
    $('#listView2 .dlistitem').each(function(i){
        if(i == curRow){
            $(this).addClass("liston"); // 리스트 선택시 class추가
        } else {
            $(this).removeClass("liston"); // 리스트  해제시 class제거
        }
    });
}

$(document).ready(function(){
    $("#listView2").kendoListView({
        dataSource:listData2
        ,template:kendo.template($("#template2").html())
        ,autoBind:false
        ,dataBinding: function(e) {
            if(e.items.length == 0){
                $("#listView2").css(
                        {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                            ,"background-repeat":"no-repeat"
                            ,"background-position":"center"});
            }else{
                $("#listView2").css({"background-image":"none"});
            }
        }
    });

    $("#listView2").height($(window).height() - ($("#header").outerHeight() + $(".content_title").outerHeight() + $(".btnfixed").outerHeight()));
});

</script>
