<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div id="resizableContainer">
    <div class="content">
    <!-- 구원서비스조회 -->
        <section class="group">
            <div class="header_area">
                <h1 class="title_basic"><spring:message code="ser.menu.rescList" /><!-- 구원서비스조회 --></h1>
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-11578" hasPermission="${dms:getPermissionMask('READ')}">
                        <button id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /></button>
                    </dms:access>
                </div>
            </div>
            <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:9%;">
                        <col style="width:15%;">
                        <col style="width:9%;">
                        <col style="width:15%;">
                        <col style="width:9%;">
                        <col style="width:15%;">
                        <col style="width:9%;">
                        <col style="width:19%;">
                    </colgroup>
                    <tbody>
                       <tr>
                            <th scope="row"><spring:message code='ser.lbl.carNo' /><!-- 차량번호 --></th>
                            <td>
                                <input type="text" id="sCarRegNo" class="form_input">
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.carOwner' /><!-- 차량소유자 --></th>
                            <td>
                                <input type="text" id="sCarOwnerNm" class="form_input">
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.driver' /><!-- 운전자 --></th>
                            <td>
                                <input id="sDriverNm" type="text" class="form_input">
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.vinNo' /><!-- vinNo --></th>
                            <td>
                                <input type="text" id="sVinNo" class="form_input">
                            </td>
                         </tr>
                       <tr>
                            <th scope="row"><spring:message code='ser.lbl.rescTp' /><!-- 구원유형 --></th>
                            <td>
                                <input type="text" id="sRescTp" class="form_comboBox">
                            </td>
                            <th scope="row">救援服务受理者<!-- 구원접수인 --></th>
                            <td>
                                <input type="text" id="sRegUsrNm" class="form_input">
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.rescDocNo' /><!-- 구원서비스번호 --></th>
                            <td>
                                <input type="text" id="sRescDocNo" class="form_input">
                            </td>
                            <th scope="row"><spring:message code='ser.menu.rescReqDt' /><!-- 구원요청일자 --></th>
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="sFromDt" class="form_datepicker ac">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sToDt" class="form_datepicker ac">
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="table_grid mt10">
                <div id="grid" class="resizable_grid"></div>
            </div>
        </section>
        <input type="hidden" id="rescDocNo" name="rescDocNo" />
        <input type="hidden" id="vinNo" name="vinNo" />

    </div>
</div>
<!-- script -->
<script>

//구원구분 Array
var rescueTpCdList = [];
<c:forEach var="obj" items="${rescueTpCdList}">
rescueTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//구원구분 Map
var rescueTpCdMap = dms.data.arrayToMap(rescueTpCdList, function(obj){ return obj.cmmCd; });

//구원유형 상태
rescueTpCdGrid = function(val){
  var returnVal = "";
  if(val != null && val != ""){
      if(rescueTpCdMap[val] != undefined)
          returnVal = rescueTpCdMap[val].cmmCdNm;
  }
  return returnVal;
};

$(document).ready(function() {

    // 조회 버튼.
    $("#btnSearch").kendoButton({
        click:function(e){

            $("#grid").data("kendoExtGrid").dataSource.read();
        }
    });

    // 구원구분
    $("#sRescTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:rescueTpCdList
        ,optionLabel:" "
        ,index:0
    });

    // RO일자
    $("#sFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sFromDt}"
    });

    // RO일자
    $("#sToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sToDt}"
    });


    $(document).on("click", ".linkPreDocNo", function(e){

        var grid = $("#grid").data("kendoExtGrid");
        var row = $(e.target).closest("tr");
        grid.tbody.find('>tr').each(function(){
            $(this).removeClass("k-state-selected");
         });
         // k-state-selected add
         row.addClass("k-state-selected");

        var selectedVal = grid.dataItem(row);

        parent._createOrReloadTabMenu("<spring:message code='ser.menu.rescMng' />", "<c:url value='/ser/res/rescue/selectRescueMain.do'/>?rescDocNo="+selectedVal.rescDocNo+"&vinNo="+selectedVal.vinNo, "VIEW-D-10188"); // RO Main
    });

    $("#grid").kendoExtGrid({
        gridId:"G-SER-1011-000085"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/res/rescue/selectRescuesList.do' />"
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

                        params["sFromDt"]       = $("#sFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sToDt"]         = $("#sToDt").data("kendoExtMaskedDatePicker").value();
                        params["sCarRegNo"]     = $("#sCarRegNo").val();
                        params["sDriverNm"]     = $("#sDriverNm").val();
                        params["sCarOwnerNm"]   = $("#sCarOwnerNm").val();
                        params["sVinNo"]        = $("#sVinNo").val();
                        params["sRescDocNo"]    = $("#sRescDocNo").val();
                        params["sRegUsrNm"]    = $("#sRegUsrNm").val();
                        params["sPreFixId"]     = "${preFixId}"
                        params["sRescTp"]       = $("#sRescTp").data("kendoExtDropDownList").value();

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                        rnum:{type:"number", editable:false}
                        ,dlrCd:{type:"string", editable:false}
                        ,rescDocNo:{type:"string", editable:false}
                        ,rescReqDt:{type:"date", editable:false}
                        ,expcRescStartDt:{type:"date", editable:false}
                        ,rescStartDt:{type:"date", editable:false}
                        ,arrvDt:{type:"date", editable:false}
                        ,rescEndDt:{type:"date", editable:false}
                        ,rescReturnDt:{type:"date", editable:false}
                        ,updtDt:{type:"date", editable:false}
                        ,regDt:{type:"date", editable:false}
                        ,returnRunDistVal:{type:"number", editable:false}
                    }
                }
            }
        }
        ,height:520
        ,sortable:false
        ,autoBind:true
        ,editable:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,selectable:"row"
        ,change:function(e){
            if(!e.sender.dataItem(e.sender.select()).isNew()){

                var selectedVal = this.dataItem(this.select());
                var rescDocNo = selectedVal.rescDocNo;
                var vinNo = selectedVal.vinNo;

                $("#rescDocNo").val(rescDocNo);
                $("#vinNo").val(vinNo);

            };
        }
        ,columns:[
                {field:"carRegNo", title:"<spring:message code='ser.lbl.carNo' />", width:100}                    // 차량번호
                ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:150}                       // VIN
                ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.carOwner' />", width:100}               // 소유자
                ,{field:"driverNm", title:"<spring:message code='ser.lbl.vsitr' />", width:100}                    // 방문자
                ,{field:"carlineNm", title:"<spring:message code='ser.lbl.carlineNm' />", width:100}                                        // 차종명칭
                ,{field:"modelNm", title:"<spring:message code='par.lbl.modelNm' />", width:100}                                            // 모델명칭
                ,{field:"carRunDistVal", title:"<spring:message code='ser.lbl.accuDrivDis' />", attributes :{"class":"ar"}, width:100 , format:"{0:n0}"}    // 누적주행거리
                ,{field:"rescStatCd", title:"救援服务状态", width:100 , hidden:true}                    // 구원서비스상태
                ,{field:"rescDocNo", title:"<spring:message code='ser.lbl.rescDocNo' />", width:150
                    //,template:'<a href ="javascript:getPreChekTab('+"'#= rescDocNo#'"+','+"'#= vinNo#'"+' )">#= diagDocNo#</a>'
                    ,template:function(dataItem){
                        var spanObj = "<a href='#' class='linkPreDocNo'>"+dataItem.rescDocNo+"</a>";
                        return spanObj;
                    }
                }
                ,{field:"rescTp", title:"<spring:message code='ser.lbl.rescTp' />", width:100
                    ,template:"#=rescueTpCdGrid(rescTp)#"
                }                    // 구원서비스유형
                ,{field:"regUsrNm", title:"救援服务受理者", width:100}              // 구원서비스접수인
                ,{field:"regDt", title:"救援服务生成时间", width:120        // 구원서비스 생성일자
                    , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}", attributes:{"class":"ac"}}
                ,{field:"", title:"救援服务确认时间", width:100 , hidden : true}                    // 구원서비스확인일자
                ,{field:"rescReqDt", title:"<spring:message code='ser.lbl.rescReqDt' />", width:120
                    , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}", attributes:{"class":"ac"}}
                ,{field:"expcRescStartDt", title:"<spring:message code='ser.lbl.expStartDt' />", width:120
                    , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}", attributes:{"class":"ac"}}  //예정출동일자
                ,{field:"rescAddrNm", title:"<spring:message code='ser.lbl.rescAddr' />", width:150}        //구원서비스확인일자
                ,{field:"updtDt", title:"变更救援服务时间", width:120
                    , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}", attributes:{"class":"ac"}}  //구원서비스변경일자
                ,{field:"updtUsrNm", title:"变更救援服务者", width:100}                    //구원서비스변경자
                ,{field:"", title:"取消救援服务时间", width:100 , hidden:true
                    , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}", attributes:{"class":"ac"}} //구원서비스취소일자
                ,{field:"", title:"取消救援服务者", width:100, hidden:true}                                 //구원서비스취소인
                ,{field:"cancReasonCont", title:"取消原因", width:100}                         //취소원인
                ,{field:"rescRemark", title:"<spring:message code='ser.lbl.rescRemark' />", width:100}                    // 구원비고
                ,{field:"", title:"维修委托", width:100, hidden:true}                    // RO
                ,{field:"lbrAmt", title:"<spring:message code='ser.lbl.preLbrSubAmt' />", width:100, attributes :{"class":"ar"}, format:"{0:n2}"} // 예정공임비
                ,{field:"parAmt", title:"<spring:message code='ser.lbl.preParSubAmt' />", width:100, attributes :{"class":"ar"}, format:"{0:n2}"}                    // 예정부품비
                ,{field:"etcAmt", title:"<spring:message code='ser.lbl.preEtcSubAmt' />", width:100, attributes :{"class":"ar"}, format:"{0:n2}"}                    // 에정기타비
                ,{field:"dcAmt", title:"预计优惠金额", width:100, attributes :{"class":"ar"}, format:"{0:n2}"}                    // 예정혜택금액
                ,{field:"sumAmt", title:"<spring:message code='ser.lbl.preTotAmt' />", width:100}                    // 예정총금액
                ,{field:"", title:"救援出动提示时间", width:100, hidden:true}                    // 구원알람시간
                ,{field:"", title:"救援出动提示者", width:100, hidden:true}                     // 구원알람인
                ,{field:"", title:"<spring:message code='ser.lbl.rescMthCd' />", width:100, hidden:true}                    // 구원인
                ,{field:"rescStartDt", title:"<spring:message code='ser.lbl.rescStartDt' />", width:120//구원출동일자
                    , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}", attributes:{"class":"ac"}}
                ,{field:"arrvDt", title:"<spring:message code='ser.lbl.siteArrvDt' />", width:120   //현장도탁일자
                    , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}", attributes:{"class":"ac"}}
                ,{field:"rescEndDt", title:"<spring:message code='ser.lbl.rescEndDt' />", width:120 //현장leave시간
                    , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}", attributes:{"class":"ac"}}
                ,{field:"rescReturnDt", title:"<spring:message code='ser.lbl.rescReturnDt' />", width:120   //현장복귀일자
                    , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}", attributes:{"class":"ac"}}
                ,{field:"rescReturnDt", title:"救援完成时间", width:120   //구원완성일자
                    , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}", attributes:{"class":"ac"}}
                ,{field:"rescCarCd", title:"救援服务车辆", width:100}  //구원서비스차량
                ,{field:"moveRunDistVal", title:"<spring:message code='ser.lbl.moveRunDistVal' />", width:100, attributes :{"class":"ar"}, format:"{0:n0}"}  //출동주행거리
                ,{field:"returnRunDistVal", title:"<spring:message code='ser.lbl.returnRunDistVal' />", width:100, attributes :{"class":"ar"}, format:"{0:n0}"}  //복귀주행거리
             ]
    });

});

</script>
<!-- //script -->

