<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div id="resizableContainer">
<section class="group" style="margin:5px 10px;">

    <div class="header_area">
        <h1 class="title_basic">Migration</h1>
        <div class="btn_right">
            <button type="button" class="btn_m btn_search" id="btnSearch">Search</button>
        </div>
    </div>

    <div class="table_form" role="search" data-btnid="btnSearch">
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
                    <th scope="row">Dealer Code</th>
                    <td>
                        <input id="dlrCd" type="text" value="D0000" class="form_input">
                    </td>
                    <th scope="row">Center DMS Y/N</th>
                    <td>
                        <input id="useCenterDmsYn" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.membershipPolicy" /><!-- 멤버십 운영기준 --></th>
                    <td>
                        <input id="membershipPolicy" name="membershipPolicy" type="text" class="form_comboBox" required data-name="<spring:message code="global.lbl.membershipPolicy" />" data-bind="value:data.membershipPolicy" />
                    </td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- 프로세스 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid"></div>
    </div>
    <!-- 프로세스 그리드 종료 -->

    <!-- 실행로그 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="logGrid" class="resizable_grid"></div>
    </div>
    <!-- 실행로그 그리드 종료 -->

    <input type="hidden" id="sSkipRows" name="sSkipRows" />
</section>
</div>

<script type="text/javascript">
var grid = null;
var timerId = null;
var alertYn = false;
function validationCheck(dataItems, dataItem){
    var result = true;

    //딜러코드 입력 체크
    if($("#dlrCd").val() == "" || $("#dlrCd").val() == "D0000"){
        alert("Please input dealer code");
        result = false;

    //프로세스 진행중 체크
    }else if(dataItem.pstep == "2"){
        //alert("Task is running");
        //result = false;
    //프로세스 완료 체크
    }else if(dataItem.pstep == "3"){
        //alert("Task was completed");
        //result = false;
    //프로세스 실행 체크
    }else if(dataItem.canYN == "N"){
        alert("Can not Execute!!");
        result = false;
    //실행하려는 프로세스가 선처리되어야 할 프로세스가 있다면 해당 프로세스의 진행여부를 확인한다.
    } else if(!dms.string.isEmpty(dataItem.prepid)){
        $.each(dataItems, function(idx, item){
            if(item.pid == dataItem.prepid && item.pstep != "3"){
                result = true;
                alert("Please run the ["+item.pnm+"] first");
                return false;
            }
        });
    }

    return result;
}

function inquiryLog(rnum){

    if ( dms.string.isNotEmpty(rnum) ) {

        $("#sSkipRows").val(rnum);
        $("#logGrid").data("kendoExtGrid").dataSource.page(1);

    };

}

//Task 실행
function executeProcess(uid){
    var grid = $("#grid").data("kendoExtGrid");
    var row = grid.tbody.find("tr[data-uid='" + uid + "']");
    var dataItem = grid.dataItem(row);
    var pid_nm = "";
    if(dataItem.pid == "updateMigNdmsComInit"){
        pid_nm = "需要执行数据迁移第1步吗？(Migration Step.1을 실행하시겠습니까?)"
    }else if(dataItem.pid == "updateMigNdmsInsert"){
        pid_nm = "需要执行数据迁移第2步吗？(Migration Step.2을 실행하시겠습니까?)"
    }else if(dataItem.pid == "updateMigAfeterProcInsert"){
        pid_nm = "需要执行数据迁移第3步吗？(Migration Step.3을 실행하시겠습니까?)"
    }else {
        return;
    }
    dms.window.confirm({
          message:pid_nm
          ,width:500
          ,confirmBtnText:"Yes"
          ,cancelBtnText:"No"
          ,callback:function(result){
              if(result){
                  fMultiExecProgram(grid, dataItem);
              }else{
                  return;
              }
          }
    });
}

function fMultiExecProgram(grid, dataItem){
    if(validationCheck(grid.dataSource.data(), dataItem)){
        $.ajax({
            url:"<c:url value='/cmm/mig/multiExecProgram.do' />"
            ,data:JSON.stringify({
                "dlrCd":$("#dlrCd").val()
                ,"pid":dataItem.pid
                ,"useCenterDmsYn":$("#useCenterDmsYn").data("kendoExtDropDownList").value()
                ,"partRunNum":dataItem.partRunNum
                ,"partRunNum2":dataItem.partRunNum2
                ,"membershipPolicy":$("#membershipPolicy").data("kendoExtDropDownList").value()
            })
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,async:true
            ,beforeSend:function(xhr){

                dataItem.set("pstep", "2");

                $("#"+dataItem.pid).show();

                var rnum = dataItem.rnum;

                $("#sSkipRows").val(rnum);

                $("#logGrid").data("kendoExtGrid").dataSource.data([]);
                timerId = window.setInterval("inquiryLog('"+rnum+"')", 5000);
                alertYn = false;
            }
        });
    }
}

//멤버쉽 운영기준 코드
var membershipPolicyList = [];
<c:forEach var="obj" items="${membershipPolicyList}">
    membershipPolicyList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

$(document).ready(function() {

    //센터DMS사용여부
    $("#useCenterDmsYn").kendoExtDropDownList({
        dataSource:["N", "Y"]
        ,index:0
    });

    //멤버쉽 운영기준
    $("#membershipPolicy").kendoExtDropDownList({
        dataSource:membershipPolicyList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/cmm/mig/selectMigTargetList.do' />"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                }
                ,parameterMap:function(options, operation) {

                    var params = {};
                    params["dlrCd"] = $("#dlrCd").val();

                    return kendo.stringify(params);

                }
            }
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                        rnum:{type:"number", editable:false}
                        ,pstep:{type:"number", editable:true}
                        //,allRunYN:{type:"string", validation:{required:true, pattern:"[Y|N]"}}
                        ,partRunNum:{type:"number", editable:true}
                        ,partRunNum2:{type:"number", editable:true}
                        ,pid:{type:"string", editable:false}
                        ,pnm:{type:"string", editable:false}
                        ,prepid:{type:"number", editable:false}
                        ,canYN:{type:"string", editable:false}
                    }
                }
            }
        }
        ,filterable:false
        ,indvColumnVisible:false             //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:false         //컬럼순서 변경 개인화 적용. default:true
        ,appendEmptyColumn:true
        //,editableOnlyNew:true
        ,pageable:false
        ,selectable:true
        ,editable:true
        ,autoBind:false
        ,height:95
        ,edit:function(e) { //그리드에서 수정하려고 들어가는 시점에서 화면 컨트롤
            var data = e.model;

            if ( e.sender.columns[e.container.index()].field == "pstep") {
                this.closeCell();
            }

        }
        ,columns:[
            {field:"rnum", title:"No", width:60, sortable:false ,attributes:{"class":"ac"}}
            ,{field:"pstep", title:"Status", width:100, sortable:false, attributes:{"class":"ac"}
                ,template:function(dataItem){
                    if(dataItem.pstep == "1"){
                        return "<span class='txt_label bg_gray'\>Ready</span>";
                    }else if(dataItem.pstep == "2"){
                        return "<span class='txt_label bg_yellow'\>Processing</span>";
                    }else if(dataItem.pstep == "3"){
                        return "<span class='txt_label bg_blue'\>Completed</span>";
                    }

                    return "";
                }
            }
            ,{field:"pnm", title:"Task", width:300, sortable:false
                ,template:function(dataItem){
                    return dataItem.pnm + "<span id='"+dataItem.pid+"' style='display:none;'><img src='<c:url value='/resources/img/loading.gif'/>'></div>";
                }
            }
            ,{field:"", title:"Run", width:60, sortable:false ,attributes:{"class":"ac"}
                ,template:"<span class='txt_label bg_gray' class='execBtn' style='cursor:pointer' onclick='executeProcess(\"#=uid#\")'>Run</span>"
            }
            /*,{field:"allRunYn", title:"All Run Y/N", width:150, sortable:false ,attributes:{"class":"ac"}
                ,validation:{required:true}
                ,editor:function(container, options) {
                    $('<input required name="allRunYn" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:true
                        ,dataSource:['Y','N']
                        ,index:1
                    });
                    $('<span class="k-invalid-msg" data-for="allRunYn"></span>').appendTo(container);
                }
            }*/
            ,{field:"partRunNum", title:"Part Run-Start(Numeric)", width:150, sortable:false, attributes:{"class":"ac"}
                ,validation:{required:true}
                ,editor:function(container, options) {

                     var rnum = options.model.rnum;
                     var maxValue = 0;
                     var minValue = 0;

                     if ( rnum === 1 ) {
                         minValue = 1;
                         maxValue = 100;
                     } else if ( rnum === 2 ) {
                         minValue = 101;
                         maxValue = 200;
                     } else if ( rnum === 3 ) {
                         minValue = 201;
                         maxValue = 300;
                     } else if ( rnum === 4 ) {
                         minValue = 301
                         maxValue = 400;
                     };

                    $('<input required name="partRunNum" maxlength="3" style="width:100%" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        min:minValue
                        ,max:maxValue
                        ,format:"n0"
                        ,spinners:false
                    });
                    $('<span class="k-invalid-msg" data-for="partRunNum"></span>').appendTo(container);

                }
            }
            ,{field:"partRunNum2", title:"Part Run-End(Numeric)", width:150, sortable:false, attributes:{"class":"ac"}
                ,validation:{required:true}
                ,editor:function(container, options) {

                     var rnum = options.model.rnum;
                     var maxValue = 0;
                     var minValue = 0;

                     if ( rnum === 1 ) {
                         minValue = 1;
                         maxValue = 100;
                     } else if ( rnum === 2 ) {
                         minValue = 101;
                         maxValue = 200;
                     } else if ( rnum === 3 ) {
                         minValue = 201;
                         maxValue = 300;
                     } else if ( rnum === 4 ) {
                         minValue = 301
                         maxValue = 400;
                     };

                    $('<input required name="partRunNum2" maxlength="3" style="width:100%" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        min:minValue
                        ,max:maxValue
                        ,format:"n0"
                        ,spinners:false
                    });
                    $('<span class="k-invalid-msg" data-for="partRunNum2"></span>').appendTo(container);

                }
            }
            ,{field:"", title:"Log", width:150, sortable:false ,attributes:{"class":"ac"}
                ,template:function(dataItem){
                    return "<span class='txt_label bg_gray' class='execBtn' style='cursor:pointer' onclick='inquiryLog("+dataItem.rnum+")'>Inquiry Log</span>"
                }
            }
            ,{field:"canYN", title:"canYn", width:150, sortable:false ,attributes:{"class":"ac"}
                ,validation:{required:true}
                ,editor:function(container, options) {
                    $('<input required name="canYN" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:true
                        ,dataSource:['Y','N']
                        ,index:1
                    });
                    $('<span class="k-invalid-msg" data-for="canYN"></span>').appendTo(container);
                }
            }
        ]
    });

  	//그리드 설정
    $("#logGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/cmm/mig/selectMigNdmsLogList.do' />"
                }
                ,async:true
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        var sSkipRows = $("#sSkipRows").val();

                        if (dms.string.isNotEmpty(sSkipRows)) {
                            params["skipRows"] = sSkipRows;
                        } else {
                            return;
                        };

                        //console.log("log param : ",params);
                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
        }
        ,filterable:false
        ,indvColumnVisible:false
        ,indvColumnReorderable:false
        ,pageable:false
        ,selectable:false
        ,editable:false
        ,autoBind:false
        ,dataBound:function(e) {

			console.log("logGrid dataBound : ",e.sender.dataSource)

            var grid = $("#grid").data("kendoExtGrid");
            var dataItemList = grid.dataSource.data();
            if ( e.sender.dataSource._total > 0 ) {

                var sSkipRows = $("#sSkipRows").val();
                var pnm = e.sender.dataSource._data[0].pnm;
                var logGrid = $("#logGrid").data("kendoExtGrid");
                for(var i = 0; i < logGrid._data.length; i++ ){
                	if(alertYn == false){
	                    if(logGrid._data[i].statCd == "F"){
    	                    alert("Error!! Please check log grid list");
        	                alertYn = true;
            	        }
	                }
                }
                //기초정보 프로시저 실행로그
                if ( sSkipRows == 1 ){

                    dataItemList[0].set("pstep", "1");

                    if(pnm == "MIG_NDMS_COM_INIT FINISH"){
                        window.clearInterval(timerId);
                        timerId = null;

                        dataItemList[0].set("pstep", "3");
                        $("#"+dataItemList[1].pid).hide();
                    }else{
                        dataItemList[0].set("pstep", "2");
                    }

                } else if ( sSkipRows == 2 ) {

                    dataItemList[1].set("pstep", "1");

                    if(pnm == "MIG_NDMS_INSERT FINISH"){
                        window.clearInterval(timerId);
                        timerId = null;

                        dataItemList[1].set("pstep", "3");
                        $("#"+dataItemList[1].pid).hide();
                    }else{
                        dataItemList[1].set("pstep", "2");
                    }

                } else if ( sSkipRows == 3 ) {

                    dataItemList[2].set("pstep", "1");

                    if(pnm == "MIG_DMS_DCS_COM FINISH"){
                        window.clearInterval(timerId);
                        timerId = null;

                        dataItemList[2].set("pstep", "3");
                        $("#"+dataItemList[2].pid).hide();
                    }else{
                        dataItemList[2].set("pstep", "2");
                    }

                } else if ( sSkipRows == 4 ) {

                    dataItemList[3].set("pstep", "1");

                    if(pnm == "MIG_CRM_UPLOAD END"){
                        window.clearInterval(timerId);
                        timerId = null;

                        dataItemList[3].set("pstep", "3");
                        $("#"+dataItemList[3].pid).hide();
                    }else{
                        dataItemList[3].set("pstep", "2");
                    }

                };
            } else {

                window.clearInterval(timerId);
                timerId = null;
                $("#"+dataItemList[0].pid).hide();
                $("#"+dataItemList[1].pid).hide();
                $("#"+dataItemList[2].pid).hide();

            }

        }
        ,columns:[
            {field:"pid", title:"No", width:60, sortable:false ,attributes:{"class":"ac"}}
            ,{field:"statCd", title:"Result", width:120, sortable:false, attributes:{"class":"ac"}
	            ,template:function(dataItem){
	                if(dataItem.statCd == "B"){
	                    return "<span class='txt_label bg_yellow'\>Processing</span>";
	                }else if(dataItem.statCd == "S"){
	                    return "<span class='txt_label bg_blue'\>Success</span>";
	                }else if(dataItem.statCd == "F"){
	                	return "<span class='txt_label bg_red'\>Failed</span>";
	                }

	                return "";
	            }
            }
            ,{field:"pnm", title:"Process", width:150, sortable:false}
            ,{field:"detailPnm", title:"Process-Detail", width:200, sortable:false}
            ,{field:"startTime", title:"Start", width:150, sortable:false, attributes:{"class":"ac"}
            	,template:"#= kendo.toString(data.startTime, 'yyyy-MM-dd HH:mm:ss') #"
            }
            ,{field:"endTime", title:"End", width:150, sortable:false, attributes:{"class":"ac"}
            	,template:"#= kendo.toString(data.endTime, 'yyyy-MM-dd HH:mm:ss') #"
            }
            ,{field:"elapsedTime", title:"Elapsed Time", width:100, sortable:false, attributes:{"class":"ac"}, format:"{0:n0}"}
            ,{field:"srcCnt", title:"Source Count", width:100, sortable:false, attributes:{"class":"ar"}, format:"{0:n0}"}
            ,{field:"targetCnt", title:"Target Count", width:100, sortable:false, attributes:{"class":"ar"}, format:"{0:n0}"}
            ,{field:"pmsg", title:"Message", sortable:false}
            ,{field:"bytes", title:"Bytes(MB)", sortable:false, width:80, attributes:{ "style":"text-align:right"}}
        ]
    })

    //버튼 - 업데이트 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid");
            grid.dataSource.read();
        }
    });

});
</script>