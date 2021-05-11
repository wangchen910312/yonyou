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

//공통 PROPERTY LIST
var cmmPrtyListObj = {};
<c:forEach var="obj" items="${cmmPrtyDS}">
    $.extend(cmmPrtyListObj, {"${obj.prtyNm}":"${obj.prtyVal}"});
</c:forEach>

//Notification Type:COM033
var notificationTpList = [];

<c:forEach var="obj" items="${notificationTpDS}">
    notificationTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var notificationTpArray = [];
$.each(notificationTpList, function(idx, obj){
    notificationTpArray[obj.cmmCd] = obj.cmmCdNm;
});

</script>


<form id="notificationHistoryForm" name="notificationHistoryForm" method="POST" onsubmit="return false;">
<!-- Notification History List 조회 -->
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <!-- <h1 class="title_basic"><spring:message code="cmm.title.messageSourceMng" /></h1> -->
        <h1 class="title_basic">Notification History</h1>
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_search" ><spring:message code="global.btn.search" /></button>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:10%;">
                <col style="width:10%;">
                <col style="width:10%;">
                <col style="width:10%;">
                <col style="width:10%;">
                <col style="width:10%;">
                <col style="width:10%;">
                <col style="width:10%;">
                <col style="width:10%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row">Event Date</th>
                    <td>
                        <input id="sEventDt" class="form_datepicker" style="width:100%"   >
                    </td>
                    <th scope="row">Notification Type</th>
                    <td>
                        <input id="sNotiTp" type="text" >
                    </td>
                    <th scope="row">Email Addr</th>
                    <td>
                        <input id="sEmailNm" type="text" class="form_input">
                    </td>
                    <th scope="row">Cellular Phone</th>
                    <td>
                        <input id="sHpNo" type="text" class="form_input" >
                    </td>
                    <th scope="row">Bundle Name</th>
                    <td>
                        <input id="sBundleNm" type="text" class="form_input" >
                    </td>

                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 기능 버튼 시작 -->
    <!-- 그리드 기능 버튼 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid">
        <div id="notificationHistoryGrid"></div>
    </div>
    <!-- 그리드 종료 -->

    <div class="table_form">
    <table>
        <caption></caption>
        <colgroup>
            <col style="width:10%;">
            <col style="width:15%;">
            <col style="width:10%;">
            <col style="width:15%;">
            <col style="width:10%;">
            <col style="width:15%;">
            <col style="width:10%;">
            <col>
        </colgroup>
        <tbody>
            <tr>
                <th scope="row">Event Date</th>
                <td>
                    <input id="eventDt" style="width:80%"  data-json-obj="true" >
                </td>
                <th scope="row">Notification Type</th>
                <td>
                    <input id="notiTp" name="notiTp" style="width:100%" data-json-obj="true" >
                </td>
                <th scope="row">Email Addr</th>
                <td>
                    <input id="emailNm" name="emailNm" class="form_input" style="width:100%" data-json-obj="true" >
                </td>
                <th scope="row">Celluar Phone</th>
                <td>
                    <input id="hpNo" name="hpNo" class="form_input" style="width:100%"  data-json-obj="true" >
                </td>
            </tr>
            <tr>
                <th scope="row">Bundle Name</th>
                <td colspan="3">
                    <input id="bundleNm" name="bundleNm" class="form_input" style="width:100%" data-json-obj="true" >
                </td>
                <th scope="row"></th>
                <td>

                </td>
            </tr>
            <tr>
                <th scope="row">Notification Message</th>
                <td colspan="7">
                    <textarea id="notiMesgBodyCont" name="notiMesgBodyCont" rows="4" placeholder="" class="form_textarea"  style="width:100%" data-json-obj="true" ></textarea>
                </td>
            </tr>

        </tbody>
    </table>
    </div>

</section>
</form>


<script type="text/javascript">


/******************************************
 * 함수영역 - start
 ******************************************/

var gv_notificationHistoryGridModel_currUid = null;

function initDetail() {
    $('#eventDt').val(null);
    $('#notiTp').data("kendoExtDropDownList").value(null);
    $('#emailNm').val(null);
    $('#hpNo').val(null);
    $('#bundleNm').val(null);
    $('#notiMesgBodyCont').val(null);
}


/******************************************
 * 함수영역 - end
 ******************************************/

$(document).ready(function() {

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#notificationHistoryGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //그리드 설정
    $("#notificationHistoryGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/cmm/noti/selectNotificationHistory.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sEventDt"]  = $("#sEventDt").val().replace(/-/, '').replace(/-/, '');
                        params["sNotiTp"]   = $("#sNotiTp").val();
                        params["sEmailNm"]  = $("#sEmailNm").val();
                        params["sHpNo"]     = $("#sHpNo").val();
                        params["sBundleNm"] = $("#sBundleNm").val();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"seq"
                    ,fields:{
                         eventDt          :{type:'string'}
                        ,seq              :{type:'string'}
                        ,notiTp           :{type:'string'}
                        ,emailNm          :{type:'string'}
                        ,hpNo             :{type:'string'}
                        ,notiMesgBodyCont :{type:'string'}
                        ,bundleNm         :{type:'string'}
                        ,regUsrId         :{type:'string'}
                        ,regDt            :{type:'date'}
                        ,updtUsrId        :{type:'string'}
                        ,updtDt           :{type:'date'}

                    }
                }
            }
            ,requestEnd:function(e) {
                $("#notificationHistoryGrid").data("kendoExtGrid").dataSource.data([]);

                initDetail();

            }
        }

//         ,multiSelectWithCheckbox:true
        ,height:400
        ,autoBind:false
        ,selectable:"row"
        ,editable:false
        ,columns:[
            {field:"eventDt", title:"Event Date", width:60, sortable:false
                ,attributes:{"class":"ac"}
                ,template:function(dataItem) {
                    var dt = dataItem.eventDt;
                    return dt.substring(0, 4) + '-' + dt.substring(4,6) + '-' + dt.substring(6,8) + ' ' + dt.substring(8,10) + ':' + dt.substring(10,12) + ':' + dt.substring(12,14);
                }
            }
            ,{field:"seq", title:"Sequence", width:40, sortable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"notiTp", title:"Noti Type", width:40, sortable:false
                ,attributes:{"class":"ac"}
                ,template:"#=notificationTpArray[notiTp]#"

            }
            ,{field:"emailNm", title:"Email Addr", width:90
                ,attributes:{"class":"ac"}
            }
            ,{field:"hpNo", title:"Celluar Phone", width:60
                ,attributes:{"class":"ac"}
            }

            ,{field:"bundleNm", title:"Bundle Name", width:200
                ,attributes:{"class":"ac"}
            }
        ]
        ,change:function(e) {
//          if(!e.sender.dataItem(e.sender.select()).isNew()) {
            if(e.sender.dataItem(e.sender.select()) != null) {
                var selectedVal = this.dataItem(this.select());

//                 gv_notificationHistoryGridModel_currUid = selectedVal.uid;

//                 $('#eventDt').val(selectedVal.eventDt);
                $('#eventDt').data("kendoMaskedTextBox").value(selectedVal.eventDt);
                $('#notiTp').data("kendoExtDropDownList").value(selectedVal.notiTp);
                $('#emailNm').val(selectedVal.emailNm);
                $('#hpNo').val(selectedVal.hpNo);
                $('#bundleNm').val(selectedVal.bundleNm);
                $('#notiMesgBodyCont').val(selectedVal.notiMesgBodyCont);

            } else {
                initDetail();
            }


        }
        ,dataBinding:function(e) {

        }

    });

    // Event Date
    $("#sEventDt").kendoExtMaskedDatePicker({
        format:"{0:"+vDtyyyyMMdd+"}"
       ,patternToMask:vDtyyyyMMdd
       ,value:oneDay
   });

    // Event Date
    $("#eventDt").kendoMaskedTextBox({
        mask:"0000-00-00 00:00:00"
//         format:"{0:"+vDtyyyyMMdd+"}"
//        ,patternToMask:vDtyyyyMMdd
//        ,value:oneDay
   });

    // Notification Type
    $("#sNotiTp").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:notificationTpList
       ,optionLabel:{cmmCdNm:'', cmmCd:''}
    });

    // Notification Type
    $("#notiTp").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:notificationTpList
       ,optionLabel:{cmmCdNm:'', cmmCd:''}
    });

});





</script>







