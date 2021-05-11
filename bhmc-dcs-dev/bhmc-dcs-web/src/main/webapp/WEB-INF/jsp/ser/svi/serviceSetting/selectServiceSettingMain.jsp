<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- 서비스설정화면 -->
<section class="group">

    <!-- 그리드 기능 버튼 시작 -->
    <div class="header_area">
        <h1 class="title_basic">服务运营设置</h1><!-- 서비스설정화면 -->
        <div class="btn_right">
            <button class="btn_m btn_reset" id="btnReset"><spring:message code="global.btn.init" /></button><!-- 초기화 -->
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
            <button class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button><!-- 저장 -->
        </div>
    </div>
    <!-- 그리드 기능 버튼 종료 -->
    <form id="saveForm" name="saveForm" method="POST">
     <div class="table_form">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:60%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row">看板基准设置</th><!--칸반기본설정  -->
                    <td>
                        <input id="dlrCd" type="hidden">
                        <input id="model" type="hidden" value="INSERT">
                        <input id="boardStdPrefCd" name="boardStdPrefCd" class="form_comboBox" data-json-obj="true" style="width:22%">
                    </td>
                </tr>
                <tr>
                    <th scope="row">预约可用时间</th><!--예약가용시간  -->
                    <td>
                        <input id="resvAvlbStartHm" name="resvAvlbStartHm" class="form_dateTimePicker" style="width:10%" data-json-obj="true">
                        ~ <input id="resvAvlbEndHm" name="resvAvlbEndHm" class="form_dateTimePicker" style="width:10%" data-json-obj="true">
                    </td>
                </tr>
                <tr>
                    <th scope="row">预约间隔时间</th><!--예약간격시간  -->
                    <td>
                        <input id="resvIvalCd" name="resvIvalCd" class="form_comboBox" data-json-obj="true" style="width:22%">
                    </td>
                </tr>
                <tr>
                    <th scope="row">预约状态时间</th><!--예약준수시간  -->
                    <td>
                    </td>
                </tr>
                <tr>
                    <th scope="row"></th><!--예약준수시간  -->
                    <td>
                                                                        预约守约基准:预约时间以后 <input id="resvKeepHmCd" name="resvKeepHmCd" class="form_comboBox" data-json-obj="true" style="width:10%"> 以内
                    </td>
                </tr>
                <tr>
                    <th scope="row"></th><!--예약미준수시간  -->
                    <td>
                                                                    预约失约基准:预约守约时间以后
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
  </form>
</section>

<script type="text/javascript">


//예약준수 Array
var keepResvTpList = [{"cmmCd":"", "cmmCdNm":""}];
<c:forEach var="obj" items="${keepResvTpList}">
keepResvTpList.push({
  "cmmCd":"${obj.cmmCd}"
  , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>

//예약준수 Map
var keepResvTpMap = dms.data.arrayToMap(keepResvTpList, function(obj){ return obj.cmmCd; });

//예약간격 Array
var resvInkTpList = [{"cmmCd":"", "cmmCdNm":""}];
<c:forEach var="obj" items="${resvInkTpList}">
resvInkTpList.push({
  "cmmCd":"${obj.cmmCd}"
  , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>

//예약간격 Map
var resvInkTpMap = dms.data.arrayToMap(resvInkTpList, function(obj){ return obj.cmmCd; });

//보드기준 Array
var boardTpList = [{"cmmCd":"", "cmmCdNm":""}];
<c:forEach var="obj" items="${boardTpList}">
boardTpList.push({
  "cmmCd":"${obj.cmmCd}"
  , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>

//보드기준 Map
var boardTpMap = dms.data.arrayToMap(boardTpList, function(obj){ return obj.cmmCd; });
$(document).ready(function() {

    $("#tabstrip").kendoExtTabStrip({
        animation:false
    });

    $("#resvAvlbStartHm").kendoTimePicker({
        format:"HH:mm"
    })

    $("#resvAvlbEndHm").kendoTimePicker({
        format:"HH:mm"
    })

    $("#boardStdPrefCd").kendoExtDropDownList({
        dataSource:boardTpList
       ,dataValueField:"cmmCd"
       ,dataTextField:"cmmCdNm"
       ,index:0
    });

    $("#resvIvalCd").kendoExtDropDownList({
        dataSource:resvInkTpList
       ,dataValueField:"cmmCd"
       ,dataTextField:"cmmCdNm"
       ,index:0
    });

    $("#resvKeepHmCd").kendoExtDropDownList({
        dataSource:keepResvTpList
       ,dataValueField:"cmmCd"
       ,dataTextField:"cmmCdNm"
       ,index:0
    });

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            var formParam = {};
            $.ajax({
                url:"<c:url value='/ser/svi/serviceSetting/selectServiceSettings.do' />",
                data:JSON.stringify(formParam),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                },
                success:function(jqXHR, textStatus) {
                    if(jqXHR.data){
                        $("#boardStdPrefCd").data("kendoExtDropDownList").value(jqXHR.data[0].boardStdPrefCd);
                        $("#resvIvalCd").data("kendoExtDropDownList").value(jqXHR.data[0].resvIvalCd);
                        $("#resvKeepHmCd").data("kendoExtDropDownList").value(jqXHR.data[0].resvKeepHmCd);
                        $("#resvAvlbStartHm").val(jqXHR.data[0].resvAvlbStartHm);
                        $("#resvAvlbEndHm").val(jqXHR.data[0].resvAvlbEndHm);
                    }
                }
            });
        }
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e) {
            var formParam = $("saveForm").serializeObject($("#saveForm").serializeArrayInSelector("[data-json-obj='true']"));

                $.ajax({
                    url:"<c:url value='/ser/svi/serviceSetting/insertServiceSetting.do' />",
                    data:JSON.stringify(formParam),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    },
                    success:function(jqXHR, textStatus) {
                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });



        }
    });

    //취소
    $("#btnReset").kendoButton({
        click:function(e) {
            $("#saveForm").get(0).reset();
        }
    });


    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/ser/svi/subBpMaster/selectSubBpMasters.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;


                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                        dlrCd:{type:"string", validation:{required:true}}
                        ,rnum:{type:"string", editable:false}
                        ,subBpCd:{type:"string", validation:{required:true}}
                        ,subBpNm:{type:"string", validation:{required:true},editable:false}
                        ,subLbrDcRate:{type:"number",validation:{ max:99}}
                        ,subParDcRate:{type:"number",validation:{max:99}}
                        ,useYn:{type:"string"}
                    }
                }
            }
        }
        ,multiSelectWithCheckbox:true
        ,columns:[
            {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:40, sortable:false, attributes:{"class":"ac"}}
            ,{field:"subBpCd", title:"<spring:message code='ser.lbl.subBpCd' />", width:120//외주거래처코드
                ,attributes:{"class":"ac"}
                ,editor:function(container, options) {
                     if(!options.model.isNew()){
                         container.context.innerText = options.model.subBpCd
                         return ;
                        }
                    $('<div class="form_search"><input required class="form_input" data-bind="value:' + options.field + '"/><a href="#" onclick="javascript:selectVenderMasterPopupWindow();"></a></div>')
                    .appendTo(container)
                }
            }
            ,{field:"subBpNm", title:"<spring:message code='ser.lbl.subBpNm' />", width:200, attributes:{"class":"ac"}}//외주거래처명
            ,{field:"subLbrDcRate", title:"<spring:message code='ser.lbl.lbrDcRate' />(%)", width:100//공임할인율
                ,attributes:{"class":"ar"}
            }
            ,{field:"subParDcRate", title:"<spring:message code='ser.lbl.parDcRate' />(%)", width:100//부품할인율
                ,attributes:{"class":"ar"}
            }
            ,{field:"useYn", title:"<spring:message code='ser.lbl.useYn' />", width:80
                ,attributes:{"class":"ac"}
                ,template:"#=useYnGrid(useYn)#"
                ,editor:function(container, options) {
                    $('<input data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataValueField:"cmmCd"
                        ,dataTextField:"cmmCdNm"
                        ,dataSource:useYnList
                        ,index:1
                    });
                }
            }
            ,{title:""}
        ]

    });

});

//거래처 팝업 열기 함수.
var venderSearchPopupWin;
function selectVenderMasterPopupWindow(){

    venderSearchPopupWin = dms.window.popup({
        windowId:"venderMasterPopup"
        ,title:"<spring:message code = 'ser.title.venderSelect'/>"   // 거래처 조회
        ,content:{
            url:"<c:url value='/par/pmm/venderMaster/selectVenderMasterPopup.do'/>"
            ,data:{
                "type":"custom1"
                ,"autoBind":true
                ,"callbackFunc":function(data){
                    var grid = $('#grid').data('kendoExtGrid');
                    var dataItems = grid.dataSource._data;
                    var checkVal = true;

                    // 중복값 체크
                    $.each(dataItems, function(idx, obj){
                        if(data[0].bpCd == obj.subBpCd){
                            checkVal = false;
                        }
                    });
                    if(checkVal){
                        var dataItem = grid.dataItem(grid.select());
                        dataItem.subBpCd = data[0].bpCd;
                        dataItem.subBpNm = data[0].bpNm;
                        grid.refresh();
                    }
                }
            }
        }
    });
}

useYnGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = useYnMap[val].cmmCdNm;
    }
    return returnVal;
}

</script>







