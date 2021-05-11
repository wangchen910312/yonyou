<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>



<!-- 날짜 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<script type="text/javascript">
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


// 현재일자
var toDay = "${toDay}";
// 해당월 1일
//var oneDay = toDay.substring(0, 8) + "01";
var oneDay = "${oneDay}";

</script>


<section id="windows" class="pop_wrap">

    <div class="table_grid mt10">
        <div id="grid" class="grid"></div>
    </div>

</section>

<script type="text/javascript">

var winOptions = null;

$(document).ready(function() {

    /************************************************************
                팝업옵션 설정
    *************************************************************/
    /**
     * 팝업 옵션
     */
     winOptions = parent.searchDMSMobileUserStatusPopupWin.options.content.data;


    /************************************************************
                기능버튼 설정
    *************************************************************/
    // 조회 버튼.
    $("#btnSearch").kendoButton({
        click:function(e){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }
    });

    // 선택 버튼.
    $("#btnSelect").kendoButton({
        click:function(e) {

            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            if(rows !== null)
            {
                var data = [];
                $.each(rows, function(idx, row){
                    data.push(grid.dataItem(row));
                });

                winOptions.callbackFunc(data);
                parent.searchDMSMobileUserStatusPopupWin.close();
            }
        }
    });

    // 닫기 버튼.
    $("#btnCancel").kendoButton({
        click:function(e){
            parent.searchDMSMobileUserStatusPopupWin.close();
        }
    });

    /************************************************************
                조회조건 설정
    *************************************************************/
    if (winOptions.displayGrid) {
        displayGrid();
    }

    /************************************************************
                그리드 설정
    *************************************************************/

    $("#grid").kendoExtGrid({
        dataSource:{
            data:[]
        }
        ,multiSelectWithCheckbox:false
        ,height:378
        ,autoBind:false
        ,pageable:false
        ,navigatable:true
        ,editable:false
        ,sortable:false
        ,filterable:false
        ,columns:[
            {field:"usr_id", title:"<spring:message code='global.lbl.userId' />", width:100
            }
            ,{field:"usr_nm", title:"<spring:message code='global.lbl.userName' />", width:100
            }
            ,{field:"hp_no", title:"<spring:message code='global.lbl.hpNo' />", width:110
                ,attributes:{"class":"ac"}
            }
            ,{field:"tml_os_inf_cont", title:"<spring:message code='global.lbl.smartPhoneOsName' />", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"tml_os_ver_nm", title:"<spring:message code='global.lbl.smartPhoneOsVersion' />", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"app_ver_nm", title:"<spring:message code='global.lbl.mobileAppVersion' />", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"download_dt", title:"<spring:message code='global.lbl.downloadDate' />", width:140
                ,attributes:{"class":"ac"}
            }

            ,{title:""}
        ]
        ,change:function(e) {


        }

    });

    if(winOptions.autoBind){
        $("#grid").data("kendoExtGrid").dataSource.read();
    }
});

function displayGrid() {

    var params = {};

    params["mesgGrpCd"]           = 'E';           // SyncCommandSndr
    params["mesgCd"]              = '30008';
    params["dlrCd"]               = winOptions.dlrCd;

//     alert(JSON.stringify(params));

//     return;

    $.ajax({
        url:"<c:url value='/dply/cmm/sync/multiSyncCommand.do' />",
        data:JSON.stringify(params),
        type:'POST',
        dataType:'json',
        contentType:'application/json',
        error:function(jqXHR, status, error) {
//             alert("error");
            alert(error);

        },
        success:function(jqXHR, textStatus) {
            processRsltOfSyncCmd(jqXHR, params);
        }
    });

}

function processRsltOfSyncCmd(jqXHR, params) {

    var objXML = $.parseXML(jqXHR);
    var objJson = $.xml2json(objXML);

    var objTarget = $(objXML).find('result_list');
    objJson.total = objTarget.length;

    console.log(JSON.stringify(objJson));

//     $('#grid').data("kendoExtGrid").dataSource.data(objJson.result_list);

    if(objJson.result == 'OK') {
        $('#grid').data("kendoExtGrid").dataSource.data(objJson.result_list);
    } else if(objJson.result == 'NOK') {
        dms.notification.error(objJson.result_msg);
    }



}


</script>









