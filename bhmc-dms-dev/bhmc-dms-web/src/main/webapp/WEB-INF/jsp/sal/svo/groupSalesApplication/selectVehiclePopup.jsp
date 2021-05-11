<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />


<!-- 집단판매신청 - 차량조회팝업. -->
<section id="window" class="pop_wrap">

    <div class="clfix" style="margin-top:15px">
        <!-- 차량조회영역 -->
        <div class="left_areaStyle" style="width:50%">
            <!-- 조회 조건 시작 -->
            <div class="table_form" role="search" data-btnid="btnSearch">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:23%;">
                        <col style="width:40%;">
                        <col style="width:1%;">
                        <col style="width:1%;">
                        <col style="width:1%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.vinNum" /></span></th><!-- VIN NO -->
                            <td >
                                <input type="text" id="sVinNo" name="sVinNo" class="form_input" maxlength="17"/>
                            </td>
                            <%-- <th scope="row"><spring:message code='global.lbl.carLine' /></th><!-- 차종 -->
                            <td>
                                <input type="text" id="sCarlineCd" name="sCarlineCd" class="form_comboBox" />
                            </td> --%>
                            <th scope="row"></th>
                            <td></td>
                            <th scope="row"></th>
                            <td style="float:right;">
                                <button id="btnSearch" class="btn_xs btn_search"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- 그리드 시작 -->
            <div class="table_grid mt10">
                <div id="grid"></div>
            </div>
            <!-- 조회 조건 종료 -->
        </div>
        <!-- 차량조회영역 끝 -->

            <!-- 그리드 종료 -->
        <ul class="promotion_btn pt_v1" style="padding-top:130px;">
            <li><button class="btn_s btn_next" id="btnAddR"></button></li>
            <li><button class="btn_s btn_prev" id="btnDelR"></button></li>
        </ul>

        <!-- 조회후 선택 영역 -->
        <div class="right_areaStyle" style="width:40%">
            <div class="header_area">
                <div class="btn_right">
                    <button id="btnSelect" class="btn_s btn_Select"><spring:message code="global.btn.select" /></button> <!-- 선택 -->
                </div>
            </div>
            <!-- 그리드 시작 -->
            <div class="table_grid mt5" >
                <div id="grid2"></div>
            </div>
            <!-- 그리드 종료 -->
        </div>
        <!-- 조회후 선택 영역 끝 -->
    </div>


</section>
<!-- //차량마스터관리 팝업 -->

<!-- script -->
<script>
//팝업옵션
var options = parent.searchVehiclePopupWin.options.content.data;

var dlrCd = options.dlrCd;
var usrId = options.usrId;
var reqSeq = options.reqSeq;
var arrInfo = options.arrInfo;



//차량
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>


//사용불가 빈 원인
var notUseVinList = [];
<c:forEach var="obj" items="${notUseVinList}">
    notUseVinList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var notUseVinMap = dms.data.arrayToMap(notUseVinList, function(obj){return obj.cmmCd;});

$(document).ready(function() {
	//2018-11-29 update by lyy 清空VIN_NO查询条件 start
	$("#sVinNo").val("");
	//2018-11-29 update by lyy 清空VIN_NO查询条件 end
	// 사용불가 빈 원인
    notUseVinSet = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(notUseVinMap[val] != undefined)
            returnVal = notUseVinMap[val].cmmCdNm;
        }
        return returnVal;
    };

  /*   //차종
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       ,optionLabel:" "   // 전체
       ,autoWidth : true

    });
 */
    // 모델
/*     $("#sModelCd").kendoExtDropDownList({
        dataTextField:"modelNm"
       ,dataValueField:"modelCd"
       ,optionLabel:" "   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/veh/vehicleMaster/selectOcn.do' />"
               ,data:JSON.stringify({"carlineCd":$("#sCarlineCd").val(), "modelCd":dataItem.modelCd})
               ,async:false
           });
       }
    });
    $("#sModelCd").data("kendoExtDropDownList").enable(false); */




/*************************** 검색 조건 영역 END **************************************************/

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
        	//sal.info.inputSearchVinCarline
        	//검색조건을 입력해주세요. [VIN NO 혹은 차종중 둘중 하나] / 请输入查询条件【VIN码或者车种可选一】
            /* if ( dms.string.isEmpty($("#sVinNo").val()) && dms.string.isEmpty($("#sCarlineCd").val())){
                dms.notification.warning("<spring:message code='sal.info.inputSearchVinCarline' />");
                return false;
            } */

             if ( $("#sVinNo").val().length < 17  ){
                dms.notification.warning("<spring:message code='sal.lnfo.chkVinNoLen' />");
                return false;
            }
            $('#grid').data('kendoExtGrid').dataSource.data([]);
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });


    // 선택 버튼.
    $("#btnSelect").kendoButton({
        click:function(e){

             var grid = $('#grid2').data('kendoExtGrid');
             var chkIdx = 0;
             var selectVeh = [];
             $(".grid2-checkbox-item").each( function(index , obj){
                 var dataItem = grid.dataSource._data;

                 if( $(obj).hasClass("k-state-selected")){

                     //console.log(dataItem[chkIdx])
                     var data = {
                             "carlineCd":dataItem[chkIdx].carlineCd
                             ,"carlineCdNm":dataItem[chkIdx].carlineCdNm
                             ,"modelCd":dataItem[chkIdx].modelCd
                             ,"modelCdNm":dataItem[chkIdx].modelCdNm
                             ,"ocnCd":dataItem[chkIdx].ocnCd
                             ,"ocnCdNm":dataItem[chkIdx].ocnCdNm
                             ,"extColorCd":dataItem[chkIdx].extColorCd
                             ,"extColorCdNm":dataItem[chkIdx].extColorCdNm
                             ,"intColorCd":dataItem[chkIdx].intColorCd
                             ,"intColorCdNm":dataItem[chkIdx].intColorCdNm
                             ,"vinNo":dataItem[chkIdx].vinNo
                             ,"carId":dataItem[chkIdx].carId
                             ,"whPrc":dataItem[chkIdx].whPrc
                      };
                      selectVeh.push(data);
                 }

                 chkIdx++;
             });
             if(selectVeh.length == 0 ){
                 dms.notification.info("<spring:message code='global.lbl.car' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                 return;
             }else{
                 options.callbackFunc(selectVeh);
                 parent.searchVehiclePopupWin.close();
             }
        }
    });

    // 추가
    $("#btnAddR").kendoButton({
        click:function(e){


            /* var grid = $("#grid").data("kendoExtGrid");
            var selectRows = grid.select();

            if(selectRows.length > 0){

                $.each(selectRows, function(idx, val){
                    var data = grid.dataItem(val);

                    if(!isTargetModelGrid(data.vinNo)){
                        $('#grid2').data('kendoExtGrid').dataSource.insert(idx, {
                             carlineCd    :data.carlineCd
                            ,carlineCdNm  :data.carlineCdNm
                            ,modelCd      :data.modelCd
                            ,modelCdNm    :data.modelCdNm
                            ,ocnCd	      :data.ocnCd
                            ,ocnCdNm      :data.ocnCdNm
                            ,extColorCd   :data.extColorCd
                            ,extColorCdNm :data.extColorCdNm
                            ,intColorCd   :data.intColorCd
                            ,intColorCdNm :data.intColorCdNm
                            ,vinNo        :data.vinNo
                            ,whPrc        :data.whPrc
                        });
                    }
                });

            } */

            var grid = $('#grid').data('kendoExtGrid');
            var chkIdx = 0;
            var gridIdx = 0;
            $(".grid-checkbox-item").each( function(index , obj){
                var dataItem = grid.dataSource._data;

                if( $(obj).hasClass("k-state-selected")){

                    if(!isTargetModelGrid(dataItem[chkIdx].vinNo)){
                        $('#grid2').data('kendoExtGrid').dataSource.insert(index, {
                             carlineCd    :dataItem[chkIdx].carlineCd
                            ,carlineCdNm  :dataItem[chkIdx].carlineCdNm
                            ,modelCd      :dataItem[chkIdx].modelCd
                            ,modelCdNm    :dataItem[chkIdx].modelCdNm
                            ,ocnCd        :dataItem[chkIdx].ocnCd
                            ,ocnCdNm      :dataItem[chkIdx].ocnCdNm
                            ,extColorCd   :dataItem[chkIdx].extColorCd
                            ,extColorCdNm :dataItem[chkIdx].extColorCdNm
                            ,intColorCd   :dataItem[chkIdx].intColorCd
                            ,intColorCdNm :dataItem[chkIdx].intColorCdNm
                            ,vinNo        :dataItem[chkIdx].vinNo
                            ,whPrc        :dataItem[chkIdx].whPrc
                        });

                    }
                    var uid = obj.uid;
                    $(".grid-checkbox-item[data-uid=" + uid + "]").prop("checked", false);
                    $(".grid-checkbox-item[data-uid=" + uid + "]").removeClass("k-state-selected");
                }
                chkIdx++;
            });

            //이동시 자동으로 체크박스 선택
            var dataRows = $('#grid2').data('kendoExtGrid').dataSource._data;
            $(dataRows).each(function(idx,obj){
                var uid = obj.uid;
                $(".grid2-checkbox-item[data-uid=" + uid + "]").prop("checked", true);
                $(".grid2-checkbox-item[data-uid=" + uid + "]").addClass("k-state-selected");

            });


            //grid.refresh();
        }
    });

    // 추가 시, vehicleItemList2에  데이터가 존재 유무 체크.
    function isTargetModelGrid(vinNo){
        var flag = false;
        var grid2 = $('#grid2').data('kendoExtGrid');
        var rows = grid2.tbody.find("tr");

        rows.each(function(index, row){
            var data = grid2.dataItem(row);

            if(vinNo == data.vinNo){
                flag = true;
            }
        });
        return flag;
    }


    // 삭제
    $("#btnDelR").kendoButton({
        click:function(e){
          /*   var grid2 = $("#grid2").data("kendoExtGrid");
            var rows = grid2.select();

            if(rows.length  == 0 ){
                //삭제할 데이터가 없습니다.
                dms.notification.warning("<spring:message code='global.lbl.del' var='del' /><spring:message code='global.info.notExistData' arguments='${del},' />");
                return false;
            }

            rows.each(function(index, row) {
                grid2.removeRow(row);
            });

             */

            var grid = $('#grid2').data('kendoExtGrid');
            var chkIdx = 0;
            $(".grid2-checkbox-item").each( function(index , obj){
                var dataItem = grid.dataSource._data;
                if( $(obj).hasClass("k-state-selected")){
                    var rows = grid.tbody.find("tr[data-uid='" + $(this).attr("data-uid") + "']");
                    grid.removeRow(rows);
                    chkIdx++;
                }
            });
            if(chkIdx == 0 ){
                dms.notification.warning("<spring:message code='global.lbl.del' var='del' /><spring:message code='global.info.notExistData' arguments='${del},' />");
                return;
            }else{

            }
        }
    });


    $("#grid").on("dblclick", "tr.k-state-selected", function (e) {

        var grid = $("#grid").data("kendoExtGrid");
        var selectRows = grid.select();

        if(selectRows.length > 0){

            $.each(selectRows, function(idx, obj){
                var data = grid.dataItem(obj);

                if( dms.string.isEmpty(data.useYn) ){

                    if(!isTargetModelGrid(data.vinNo)){
                        $('#grid2').data('kendoExtGrid').dataSource.insert(idx, {
                             carlineCd    :data.carlineCd
                            ,carlineCdNm  :data.carlineCdNm
                            ,modelCd      :data.modelCd
                            ,modelCdNm    :data.modelCdNm
                            ,ocnCd        :data.ocnCd
                            ,ocnCdNm      :data.ocnCdNm
                            ,extColorCd   :data.extColorCd
                            ,extColorCdNm :data.extColorCdNm
                            ,intColorCd   :data.intColorCd
                            ,intColorCdNm :data.intColorCdNm
                            ,vinNo        :data.vinNo
                            ,whPrc        :data.whPrc
                        });
                    }
                }

            });

            //이동시 자동으로 체크박스 선택
            var dataRows = $('#grid2').data('kendoExtGrid').dataSource._data;
            $(dataRows).each(function(idx,obj){
                var uid = obj.uid;
                $(".grid2-checkbox-item[data-uid=" + uid + "]").prop("checked", true);
                $(".grid2-checkbox-item[data-uid=" + uid + "]").addClass("k-state-selected");

            });

            //grid.refresh();

        }

    });



    /*********************************************** 버튼 끝 **********************************************************************/

    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-1712-170712"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/svo/groupSalesApplication/selectVehicleInfoPopup.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDlrCd"]  = dlrCd;                                                           // 딜러
                        params["sUsrId"]  = usrId;
                        params["sReqSeq"] = reqSeq;

                        params["sVinNo"] = $("#sVinNo").val();                                               // 빈넘버
                        //params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();           // 차종
                        //params["sModelCd"]   = $("#sModelCd").data("kendoExtDropDownList").value();           // 모델


                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,requestEnd:function(e) {
                if (e.type == "read") {
                    //조회가 완료 되였습니다.
                  //  dms.notification.info("<spring:message code='global.info.searchSuccess' />");
                }
            }
            ,schema:{
                model:{
                    id:"vinNo"
                    ,fields:{
                         vinNo        :{type:"string"}
            		    ,carId		  :{type:"string"}
                        ,ncarDstinCd  :{type:"string"}
                        ,dlrCd        :{type:"string"}
                        ,carlineCdNm  :{type:"string"}
                        ,modelCdNm    :{type:"string"}
                        ,ocnCdNm	  :{type:"string"}
                        ,extColorCdNm :{type:"string"}
                        ,intColorCdNm :{type:"string"}
                        ,whPrc        :{type:"number"}
                    }
                }
            }
        }
        //,multiSelectWithCheckbox:true
        ,editable:false
        ,autoBind:false
        ,pageable:false
        ,filterable:false
        ,height  :320
        ,indvColumnVisible:false             //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:false         //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:false               //Tooltip 적용, default:false
        ,dataBound:function (e){

            var rows = e.sender.tbody.children();

            $.each(rows, function(idx, row){
                var row = $(rows[idx]);
                var dataItem = e.sender.dataItem(row);
                //if(dataItem.useYn != "Y" ){
                if(dms.string.isNotEmpty(dataItem.useYn) ){
                    e.sender.tbody.find("input[data-uid='" + dataItem.uid + "']").attr("disabled","disabled");
                    $(row).css("background-color", "#E0E0E0");
                }else{
                    e.sender.tbody.find("input[data-uid='" + dataItem.uid + "']").attr("disabled");
                }
            });
        }
        ,columns:[
             {_field:"_checkAll",title:"", width:40
                ,attributes:{"class":"ac"} , _field:"_checkAll"
                ,template:"<input type='checkbox' data-uid='#= uid #' class='grid-checkbox-item' />"
                ,headerTemplate:"<input type='checkbox' class='checkAll' />"
             }
            ,{field:"carlineCdNm", title:"<spring:message code='global.lbl.carlineNm' />", width:60, attributes:{"class":"al"}} //차종명
            ,{field:"modelCdNm", title:"<spring:message code='global.lbl.modelNm' />", width:80, attributes:{"class":"al"}}     //모델명
            ,{field:"vinNo", title:"<spring:message code='global.lbl.vinNum' />", width:130, attributes:{"class":"al"}}         //Vin NO
            ,{field:"useYn", title:"<spring:message code='sal.lbl.dupCause' />",width:70, attributes:{"class":"ac"}
                ,template:"#=notUseVinSet(useYn)#"
            }
            ,{field:"dlrCd", hidden:true}
            ,{field:"carId", hidden:true}
            ,{field:"ocnCdNm", hidden:true}
            ,{field:"extColorCdNm", hidden:true}
            ,{field:"intColorCdNm", hidden:true}
            ,{field:"whPrc", hidden:true}           // 인터페이스에서 MS_PRC 로 변경. 2017.07.01 김진석. 
        ]
    });




    //그리드 설정
    $("#grid2").kendoExtGrid({
        gridId:"G-SAL-1712-170713"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/svo/groupSalesApplication/selectVehicleInfoPopup.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDlrCd"] = dlrCd;                                                           // 딜러
                        params["sVinNo"] = $("#sVinNo").val();                                              // 빈넘버
                        //params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();          // 차종
                        //params["sModelCd"]   = $("#sModelCd").data("kendoExtDropDownList").value();          // 모델


                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"vinNo"
                    ,fields:{
                         vinNo        :{type:"string"}
                        ,ncarDstinCd  :{type:"string"}
                        ,dlrCd        :{type:"string"}
                        ,carlineCd    :{type:"string"}
                        ,modelCd      :{type:"string"}
                        ,carlineCdNm  :{type:"string"}
                        ,modelCdNm    :{type:"string"}
                        ,whPrc        :{type:"number"}
                    }
                }
            }
        }
        //,multiSelectWithCheckbox:true
        ,editable:false
        ,autoBind:false
        ,filterable:false
        ,pageable:false
        ,height  :320
        ,columns:[
             {_field:"_checkAll2", title:"", width:40
                ,attributes:{"class":"ac"}
                ,template:"<input type='checkbox' data-uid='#= uid #' class='grid2-checkbox-item' />"
                ,headerTemplate:"<input type='checkbox' class='checkAll2' />"
             }
            ,{field:"dlrCd", hidden:true}
            ,{field:"carlineCd", hidden:true}
            ,{field:"modelCd", hidden:true}
            ,{field:"ocnCd", hidden:true}
            ,{field:"extColorCd", hidden:true}
            ,{field:"intColorCd", hidden:true}
            ,{field:"ocnCdNm", hidden:true}
            ,{field:"extColorCdNm", hidden:true}
            ,{field:"intColorCdNm", hidden:true}
            ,{field:"whPrc", hidden:true}
            ,{field:"carlineCdNm",title:"<spring:message code='global.lbl.carlineNm' />",width:60,   attributes:{"class":"al"}}     //차종명
            ,{field:"modelCdNm",  title:"<spring:message code='global.lbl.modelNm' />",  width:80,  attributes:{"class":"al"}}      //모델명
            ,{field:"vinNo",      title:"<spring:message code='global.lbl.vinNum' />",   width:130,  attributes:{"class":"ac"}}     //Vin NO
        ]
    });



    //그리드 헤더CheckBox 클릭이벤트
    $(".checkAll").on("click" , function(e){

        var grid = $("#grid").data("kendoExtGrid");
        var checked = $(this).is(":checked");
        var uid = $(this).attr("data-uid");
        var rows = grid.tbody.find("tr");
        var chkRows = grid.tbody.find("tr[data-uid=" + uid + "]");

        if(checked){
            rows.each(function(index, row) {
                var dataItem = grid.dataSource._data;
                if(dataItem[index].useYn == 'Y'){
                    $(".grid-checkbox-item[data-uid=" + dataItem[index].uid + "]").prop("checked", true);
                    $(".grid-checkbox-item[data-uid=" + dataItem[index].uid + "]").addClass("k-state-selected");
                }
            });
        }else{
            grid.clearSelection();
            rows.each(function(index, row) {
            var dataItem = grid.dataSource._data;
                $(".grid-checkbox-item[data-uid=" + dataItem[index].uid + "]").prop("checked", false);
                $(".grid-checkbox-item[data-uid=" + dataItem[index].uid + "]").removeClass("k-state-selected");
            });
        }

    });

    //그리드 헤더CheckBox 클릭이벤트
    $(".checkAll2").on("click" , function(e){

        var grid = $("#grid2").data("kendoExtGrid");
        var checked = $(this).is(":checked");
        var uid = $(this).attr("data-uid");
        var rows = grid.tbody.find("tr");
        var chkRows = grid.tbody.find("tr[data-uid=" + uid + "]");

        if(checked){
            rows.each(function(index, row) {
                var dataItem = grid.dataSource._data;
                $(".grid2-checkbox-item[data-uid=" + dataItem[index].uid + "]").prop("checked", true);
                $(".grid2-checkbox-item[data-uid=" + dataItem[index].uid + "]").addClass("k-state-selected");
            });
        }else{
            grid.clearSelection();
            rows.each(function(index, row) {
            var dataItem = grid.dataSource._data;
                $(".grid2-checkbox-item[data-uid=" + dataItem[index].uid + "]").prop("checked", false);
                $(".grid2-checkbox-item[data-uid=" + dataItem[index].uid + "]").removeClass("k-state-selected");
            });
        }

    });


    //그리드 선택 이벤트
/*
        $("#grid").on("click", "tr.k-state-selected", function (e) {

        var grid = $("#grid").data("kendoExtGrid");
        var selectedVal = grid.dataItem(grid.select());
        var checked = $(this).is(":checked");
        var chkBoolean = true;
        if(selectedVal != null){
            var uid = selectedVal.uid;
            if(selectedVal.useYn == "Y"){
                chkBoolean = $(".grid-checkbox-item[data-uid=" + uid + "]").prop("checked") ? false : true;

                if(chkBoolean){
                    $(".grid-checkbox-item[data-uid=" + uid + "]").prop("checked", true);
                    $(".grid-checkbox-item[data-uid=" + uid + "]").addClass("k-state-selected");
                }else{
                    $(".grid-checkbox-item[data-uid=" + uid + "]").prop("checked", false);
                    $(".grid-checkbox-item[data-uid=" + uid + "]").removeClass("k-state-selected");
                }
            }
        }
    }); */

    //그리드 선택 이벤트
  /*     $("#grid2").on("click", "tr.k-state-selected", function (e) {

        var grid = $("#grid2").data("kendoExtGrid");
        var selectedVal = grid.dataItem(grid.select());
        var checked = $(this).is(":checked");
        var chkBoolean = true;
        if(selectedVal != null){
            var uid = selectedVal.uid;

            chkBoolean = $(".grid2-checkbox-item[data-uid=" + uid + "]").prop("checked") ? false : true;

            if(chkBoolean){
                $(".grid2-checkbox-item[data-uid=" + uid + "]").prop("checked", true);
                $(".grid2-checkbox-item[data-uid=" + uid + "]").addClass("k-state-selected");
            }else{
                $(".grid2-checkbox-item[data-uid=" + uid + "]").prop("checked", false);
                $(".grid2-checkbox-item[data-uid=" + uid + "]").removeClass("k-state-selected");
            }

        }

    });
 */

    //체크박스 선택이벤트
    $("#grid").on("click", ".grid-checkbox-item", function(e){
        var checked = $(this).is(":checked");
        var grid = $("#grid").data("kendoExtGrid");
        var chkBoolean = true;
        var uid = $(this).attr("data-uid");
        var rows = grid.tbody.find("tr");

//console.log("checked:"+checked+"/uid="+uid);

        if(checked){
            $(".grid-checkbox-item[data-uid=" + uid + "]").prop("checked", true);
            $(".grid-checkbox-item[data-uid=" + uid + "]").addClass("k-state-selected");
           // $(grid.tbody.find("tr[data-uid=" + uid + "]")).removeClass("k-state-selected");
        }else{
            $(".grid-checkbox-item[data-uid=" + uid + "]").prop("checked", false);
            $(".grid-checkbox-item[data-uid=" + uid + "]").removeClass("k-state-selected");
            //$(grid.tbody.find("tr[data-uid=" + uid + "]")).removeClass("k-state-selected");
        }

    });

    //체크박스 선택이벤트
    $("#grid2").on("click", ".grid2-checkbox-item", function(e){
        var checked = $(this).is(":checked");
        var grid = $("#grid2").data("kendoExtGrid");

        var chkBoolean = true;
        var uid = $(this).attr("data-uid");
        var rows = grid.tbody.find("tr");

        if(checked){
            $(".grid2-checkbox-item[data-uid=" + uid + "]").prop("checked", true);
            $(".grid2-checkbox-item[data-uid=" + uid + "]").addClass("k-state-selected");
        }else{
            $(".grid2-checkbox-item[data-uid=" + uid + "]").prop("checked", false);
            $(".grid2-checkbox-item[data-uid=" + uid + "]").removeClass("k-state-selected");
        }

        /*
        rows.each( function(index , obj){
            var dataItem = grid.dataSource._data;
            if( uid  == dataItem[index].uid){
                $(grid.tbody.find("tr[data-uid=" + dataItem[index].uid  + "]")).toggleClass("k-state-selected");
            }else{
                $(grid.tbody.find("tr[data-uid=" + dataItem[index].uid + "]")).removeClass("k-state-selected");
            }
        }); */
    });


});
</script>
<!-- //script -->