<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="dlistitem" id="listContentRow">

    <span style="width:50%">#:zipCd #</span>
    <span style="width:50%">#:extZipCd #</span>
    <span style="width:50%" class="clboth">#:sungCd #</span>
    <span style="width:50%">#:sungNm #</span>
    <span style="width:50%" class="clboth">#:cityCd #</span>
    <span style="width:50%"">#:cityNm #</span>
    <span style="width:50%" class="clboth">#:distCd #</span>
    <span style="width:50%">#:distNm #</span>
</div>
</script>

<script>
//시스템 날짜 정보 가져오기.
var pageIndex = 0, pageSize = 100;
var rowIndex = 0, rowTotal = 1000;

// datasource below is customized for demo purposes.
var listData = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/cmm/sci/zipCode/selectZipCodes.do' />"
            ,dataType:"json"
            ,type:"POST"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {

                var params = {};

                params["recordCountPerPage"] = options.pageSize;
                params["pageIndex"] = options.page;
                params["firstIndex"] = options.skip;
                params["lastIndex"] = options.skip + options.take;
                params["sort"] = options.sort;

                params["sGubun"] = parent.$("#sGubun").val();
                params["sValue"] = parent.$("#sValue").val();

                params["sSungNm"] = parent.$("#sSungNm").val();
                params["sCityNm"] = parent.$("#sCityNm").val();
                params["sDistNm"] = parent.$("#sDistNm").val();
                params["sZipCd"] = parent.$("#sZipCd").val();

                return kendo.stringify(params);

            }
        }
    }
    ,batch:true
    ,pageSize:pageSize
    ,serverPaging:true
    ,schema:{
        data:"data"
        ,total:"total"
        ,model:{
            id:"zipCd"
            ,fields:{
                rnum:{type:"string", editable:false}
                ,sungCd:{type:"string", validation:{required:true}, editable:false}
                ,sungNm:{type:"string", validation:{required:true}, editable:false}
                ,cityCd:{type:"string", validation:{required:true}, editable:false}
                ,cityNm:{type:"string", validation:{required:true}, editable:false}
                ,distCd:{type:"string", validation:{required:true}, editable:false}
                ,distNm:{type:"string", validation:{required:true}, editable:false}
                ,zipCd:{type:"string", validation:{required:true}, editable:false}
                ,extZipCd:{type:"string", editable:true, editable:false}
            }
        }
    }


});

function listViewClick(e)
{
    var dataItem = e.dataItem;
    parent.contentCommonDetail(e.dataItem);

    var curRow = e.dataItem.rowIdx - 1;
    $('.dlistitem').each(function(i){
        if(i == curRow){
            $(this).addClass("liston"); // 리스트 선택시 class추가
        } else {
            $(this).removeClass("liston"); // 리스트  해제시 class제거
        }
    });
}

var app = setKendoMobApp();

</script>
