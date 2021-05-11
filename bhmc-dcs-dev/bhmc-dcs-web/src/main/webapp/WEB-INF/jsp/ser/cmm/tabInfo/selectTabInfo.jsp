<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div style="min-height:205px;height:205px;">
    <div class="btn_right_absolute">
        <c:if test="${param.gubun ne 'S'}">
        <button type="button" id="custAdd" class="btn_s btn_add btn_s_min5" ><spring:message code="global.btn.add" /></button>
        <button type="button" id="custDel" class="btn_s btn_delete btn_s_min5" ><spring:message code="global.btn.del" /></button>
        </c:if>
    </div>
    <div class="table_grid">
        <div id="custRemarkGrid" class="grid"></div>
    </div>
</div>
<div style="min-height:205px;height:205px;">
    <div class="table_form table_form_btn">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10.5%;">
                <col style="width:15%;">
                <col style="width:15%;">
                <col style="width:15%;">
                <col style="width:15%;">
                <col style="width:15%;">
                <col>
            </colgroup>
            <c:choose>
                <c:when test="${param.gubun eq 'P'}">
                <tbody>
                    <tr>
                        <th scope="row"><span id="roadTerm" name="roadTerm" ><spring:message code="ser.lbl.roadCondition" /></span></th>   <!-- 도로조건 -->
                        <td><button type="button" id="roadTermCd1" name="roadTermCd1" value="Y" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.highway" /></button></td> <!-- 고속도로 -->
                        <td><button type="button" id="roadTermCd2" name="roadTermCd2" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.asphalt" /></button></td> <!-- asphalt -->
                        <td><button type="button" id="roadTermCd3" name="roadTermCd3" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.cementRoad" /></button></td> <!-- 시멘트 도로 -->
                        <td><button type="button" id="roadTermCd4" name="roadTermCd4" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.stonyRoad" /></button></td> <!-- 모래돌 도로 -->
                        <td><button type="button" id="roadTermCd5" name="roadTermCd5" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.soilRoad" /></button></td> <!-- 흙 도로 -->
                        <td><input type="text" id="roadTermCont" name="roadTermCont" class="form_input form_input2"  maxlength="100" /></td> <!-- 기타 -->
                    </tr>
                    <tr>
                        <th scope="row"><span id="roadPrcn" name="roadPrcn" ><spring:message code="ser.lbl.roadState" /></span></th> <!-- 도로현황 -->
                        <td><button type="button" id="roadPrcnCd1" name="roadPrcnCd1" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.ground" /></button></td> <!-- 수평 -->
                        <td><button type="button" id="roadPrcnCd2" name="roadPrcnCd2" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.uphill" /></button></td> <!-- 오름막 -->
                        <td><button type="button" id="roadPrcnCd3" name="roadPrcnCd3" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.downhill" /></button></td> <!-- 내리막 -->
                        <td><button type="button" id="roadPrcnCd4" name="roadPrcnCd4" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.sharpCurve" /></button></td> <!-- 코너(급) -->
                        <td><button type="button" id="roadPrcnCd5" name="roadPrcnCd5" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.curve" /></button></td> <!-- 코너(일반) -->
                        <td><input type="text" id="roadPrcnCont" name="roadPrcnCont" class="form_input form_input2"  maxlength="100" /></td> <!-- 기타 -->
                    </tr>
                    <tr>
                        <th scope="row"><span id="wetrTerm" name="wetrTerm"><spring:message code="ser.lbl.weatherCondition" /></span></th> <!-- 날씨조건 -->
                        <td><button type="button" id="wetrTermCd1" name="wetrTermCd1" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.fineWeather" /></button></td> <!-- 개임 -->
                        <td><button type="button" id="wetrTermCd2" name="wetrTermCd2" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.windyWeather" /></button></td> <!-- 바람 -->
                        <td><button type="button" id="wetrTermCd3" name="wetrTermCd3" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.rainWeather" /></button></td> <!-- 비 -->
                        <td><button type="button" id="wetrTermCd4" name="wetrTermCd4" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.snowWeather" /></button></td> <!-- 눈 -->
                        <td><input type="text" id="wetrTermCd5" name="wetrTermCd5" class="form_input ar form_input2" maxlength="3" data-type="number" data-name="<spring:message code="ser.lbl.temperature" />" style="width:70%;"> <span class="span_txt"><spring:message code="ser.lbl.temperature" /></span></td> <!-- ℃ -->
                        <td><input type="text" id="wetrTermCont" name="wetrTermCont" class="form_input form_input2"  maxlength="100" /></td> <!-- 기타 -->
                    </tr>
                    <tr>
                        <th scope="row"><span id="occrFreq" name="occrFreq"><spring:message code="ser.lbl.frequency" /></span></th> <!-- 발생빈도 -->
                        <td><button type="button" id="occrFreqCd1" name="occrFreqCd1" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.once" /></button></td> <!-- 한번만 -->
                        <td><button type="button" id="occrFreqCd2" name="occrFreqCd2" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.often" /></button></td> <!-- 자주 -->
                        <td><button type="button" id="occrFreqCd3" name="occrFreqCd3" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.reqular" /></button></td> <!-- 정기적 -->
                        <td><button type="button" id="occrFreqCd4" name="occrFreqCd4" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.occasionality" /></button></td> <!-- 비정기적 -->
                        <td><input type="text" id="occrFreqCd5" name="occrFreqCd5" class="form_input ar form_input2" data-type="number" min="1" data-name="<spring:message code="ser.lbl.repeat"/>" style="width:70%;"> <span class="span_txt"><spring:message code="ser.lbl.repeat" /></span></td> <!-- 차수 -->
                        <td><input type="text" id="occrFreqCont" name="occrFreqCont" class="form_input form_input2"  maxlength="100" /></td> <!-- 기타 -->

                    </tr>
                    <tr>
                        <th scope="row"><span id="driveStat" name="driveStat"><spring:message code="ser.lbl.driveState" /></span></th> <!-- 운전상태 -->
                        <td><button type="button" id="driveStatCd1" name="driveStatCd1" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.accelerateFast" /></button></td> <!-- 가속(급) -->
                        <td><button type="button" id="driveStatCd2" name="driveStatCd2" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.accelerate" /></button></td> <!-- 가속(일반) -->
                        <td><button type="button" id="driveStatCd3" name="driveStatCd3" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.suddenStop" /></button></td> <!-- 감속(급) -->
                        <td><button type="button" id="driveStatCd4" name="driveStatCd4" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.slowDown" /></button></td> <!-- 감속(일반) -->
                        <td><input type="text" id="driveStatCd5" name="driveStatCd5" class="form_input ar form_input2" data-type="number" min="1" maxlength="3" data-name="<spring:message code="ser.lbl.kmH" />" style="width:70%;"> <span class="span_txt"><spring:message code="ser.lbl.kmH" /></span></td> <!-- KM/H -->
                        <td><input type="text" id="driveStatCont" name="driveStatCont" class="form_input form_input2"  maxlength="100" /></td> <!-- 기타 -->
                    </tr>
                    <tr>
                        <th scope="row"><span id="operStat" name="operStat"><spring:message code="ser.lbl.workState" /></span></th> <!-- 작업상태 -->
                        <td><button type="button" id="operStatCd1" name="operStatCd1" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.cooling" /></button></td> <!-- 냉강 -->
                        <td><button type="button" id="operStatCd2" name="operStatCd2" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.heatUp" /></button></td> <!-- 열강 -->
                        <td><button type="button" id="operStatCd3" name="operStatCd3" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.startUp" /></button></td> <!-- 시동 -->
                        <td><button type="button" id="operStatCd4" name="operStatCd4" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.airConOn" /></button></td> <!-- 에어컨가동 -->
                        <td><input type="text" id="operStatCd5" name="operStatCd5" class="form_input ar form_input2" min="1" maxlength="3" data-type="number" data-name="<spring:message code="ser.lbl.step" />"  style="width:70%;"/> <span class="span_txt"><spring:message code="ser.lbl.step" /></span></td> <!-- 단계 -->
                        <td><input type="text" id="operStatCont" name="operStatCont" class="form_input form_input2"  maxlength="100" /></td> <!-- 기타 -->
                    </tr>
                </tbody>
                </c:when>
                <c:otherwise>
                <tbody>
                    <tr>
                        <th scope="row"><span id="roadTerm" name="roadTerm" ><spring:message code="ser.lbl.roadCondition" /></span></th>   <!-- 도로조건 -->
                        <td><button type="button" id="roadTermCd1" name="roadTermCd1" value="Y" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.highway" /></button></td> <!-- 고속도로 -->
                        <td><button type="button" id="roadTermCd2" name="roadTermCd2" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.asphalt" /></button></td> <!-- asphalt -->
                        <td><button type="button" id="roadTermCd3" name="roadTermCd3" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.cementRoad" /></button></td> <!-- 시멘트 도로 -->
                        <td><button type="button" id="roadTermCd4" name="roadTermCd4" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.stonyRoad" /></button></td> <!-- 모래돌 도로 -->
                        <td><button type="button" id="roadTermCd5" name="roadTermCd5" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.soilRoad" /></button></td> <!-- 흙 도로 -->
                        <td><input type="text" id="roadTermCont" name="roadTermCont" class="form_input form_input2"  maxlength="100" /></td> <!-- 기타 -->
                    </tr>
                    <tr>
                        <th scope="row"><span id="roadPrcn" name="roadPrcn" ><spring:message code="ser.lbl.roadState" /></span></th> <!-- 도로현황 -->
                        <td><button type="button" id="roadPrcnCd1" name="roadPrcnCd1" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.ground" /></button></td> <!-- 수평 -->
                        <td><button type="button" id="roadPrcnCd2" name="roadPrcnCd2" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.uphill" /></button></td> <!-- 오름막 -->
                        <td><button type="button" id="roadPrcnCd3" name="roadPrcnCd3" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.downhill" /></button></td> <!-- 내리막 -->
                        <td><button type="button" id="roadPrcnCd4" name="roadPrcnCd4" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.sharpCurve" /></button></td> <!-- 코너(급) -->
                        <td><button type="button" id="roadPrcnCd5" name="roadPrcnCd5" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.curve" /></button></td> <!-- 코너(일반) -->
                        <td><input type="text" id="roadPrcnCont" name="roadPrcnCont" class="form_input form_input2"  maxlength="100" /></td> <!-- 기타 -->
                    </tr>
                    <tr>
                        <th scope="row"><span id="wetrTerm" name="wetrTerm"><spring:message code="ser.lbl.weatherCondition" /></span></th> <!-- 날씨조건 -->
                        <td><button type="button" id="wetrTermCd1" name="wetrTermCd1" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.fineWeather" /></button></td> <!-- 개임 -->
                        <td><button type="button" id="wetrTermCd2" name="wetrTermCd2" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.windyWeather" /></button></td> <!-- 바람 -->
                        <td><button type="button" id="wetrTermCd3" name="wetrTermCd3" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.rainWeather" /></button></td> <!-- 비 -->
                        <td><button type="button" id="wetrTermCd4" name="wetrTermCd4" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.snowWeather" /></button></td> <!-- 눈 -->
                        <td><input type="text" id="wetrTermCd5" name="wetrTermCd5" class="form_input ar form_input2" maxlength="3" data-type="number" data-name="<spring:message code="ser.lbl.temperature" />" style="width:75%;"> <span class="span_txt"><spring:message code="ser.lbl.temperature" /></span></td> <!-- ℃ -->
                        <td><input type="text" id="wetrTermCont" name="wetrTermCont" class="form_input form_input2"  maxlength="100" /></td> <!-- 기타 -->
                    </tr>
                    <tr>
                        <th scope="row"><span id="occrFreq" name="occrFreq"><spring:message code="ser.lbl.frequency" /></span></th> <!-- 발생빈도 -->
                        <td><button type="button" id="occrFreqCd1" name="occrFreqCd1" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.once" /></button></td> <!-- 한번만 -->
                        <td><button type="button" id="occrFreqCd2" name="occrFreqCd2" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.often" /></button></td> <!-- 자주 -->
                        <td><button type="button" id="occrFreqCd3" name="occrFreqCd3" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.reqular" /></button></td> <!-- 정기적 -->
                        <td><button type="button" id="occrFreqCd4" name="occrFreqCd4" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.occasionality" /></button></td> <!-- 비정기적 -->
                        <td><input type="text" id="occrFreqCd5" name="occrFreqCd5" class="form_input ar form_input2" data-type="number" min="1" data-name="<spring:message code="ser.lbl.repeat"/>" style="width:75%;"> <span class="span_txt"><spring:message code="ser.lbl.repeat" /></span></td> <!-- 차수 -->
                        <td><input type="text" id="occrFreqCont" name="occrFreqCont" class="form_input form_input2"  maxlength="100" /></td> <!-- 기타 -->

                    </tr>
                    <tr>
                        <th scope="row"><span id="driveStat" name="driveStat"><spring:message code="ser.lbl.driveState" /></span></th> <!-- 운전상태 -->
                        <td><button type="button" id="driveStatCd1" name="driveStatCd1" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.accelerateFast" /></button></td> <!-- 가속(급) -->
                        <td><button type="button" id="driveStatCd2" name="driveStatCd2" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.accelerate" /></button></td> <!-- 가속(일반) -->
                        <td><button type="button" id="driveStatCd3" name="driveStatCd3" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.suddenStop" /></button></td> <!-- 감속(급) -->
                        <td><button type="button" id="driveStatCd4" name="driveStatCd4" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.slowDown" /></button></td> <!-- 감속(일반) -->
                        <td><input type="text" id="driveStatCd5" name="driveStatCd5" class="form_input ar form_input2" data-type="number" min="1" maxlength="3" data-name="<spring:message code="ser.lbl.kmH" />" style="width:75%;"> <span class="span_txt"><spring:message code="ser.lbl.kmH" /></span></td> <!-- KM/H -->
                        <td><input type="text" id="driveStatCont" name="driveStatCont" class="form_input form_input2"  maxlength="100" /></td> <!-- 기타 -->
                    </tr>
                    <tr>
                        <th scope="row"><span id="operStat" name="operStat"><spring:message code="ser.lbl.workState" /></span></th> <!-- 작업상태 -->
                        <td><button type="button" id="operStatCd1" name="operStatCd1" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.cooling" /></button></td> <!-- 냉강 -->
                        <td><button type="button" id="operStatCd2" name="operStatCd2" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.heatUp" /></button></td> <!-- 열강 -->
                        <td><button type="button" id="operStatCd3" name="operStatCd3" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.startUp" /></button></td> <!-- 시동 -->
                        <td><button type="button" id="operStatCd4" name="operStatCd4" class="btn_s btn_s_v4 troble"><spring:message code="ser.lbl.airConOn" /></button></td> <!-- 에어컨가동 -->
                        <td><input type="text" id="operStatCd5" name="operStatCd5" class="form_input ar form_input2" min="1" maxlength="3" data-type="number" data-name="<spring:message code="ser.lbl.step" />"  style="width:75%;"/> <span class="span_txt"><spring:message code="ser.lbl.step" /></span></td> <!-- 단계 -->
                        <td><input type="text" id="operStatCont" name="operStatCont" class="form_input form_input2"  maxlength="100" /></td> <!-- 기타 -->
                    </tr>
                </tbody>
                </c:otherwise>
            </c:choose>

        </table>
    </div>
</div>

<script type="text/javascript">

/** 원인현상코드 조회 팝업 **/
var phenCauCodeWin;
var custDemandPopup;

var tabInfoPreFixId = "";
var tabInfoJobNo = "";

var preFixId = "${preFixId}";
var preFixTp = "${preFixTp}";

$(document).ready(function(){

    var editYn = true;
    if(preFixTp == "ROSTATUS"){
        editYn = false;
    }

    /** 원인 현상코드 팝업**/
    selectPhenCauCodeSearchPopupWindow = function(idx){

        phenCauCodeWin = dms.window.popup({
            windowId:"phenCauCodeSearchPopupWindow"
            , title:"<spring:message code = 'ser.title.cauPhenSearch'/>"    //
            , template:$("#dstinCd").prop("readOnly", false).addClass("form_readonly")
            //,height:150
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectNcdCcdCodePopup.do'/>"
                , data:{
                     "autoBind":true
                    ,"paintYn":"C"  // paint:P , 원인코드:C
                    ,"itemCd":""
                    , "callbackFunc":function(data){
                        $("#cauCd"+idx).val(data[0].cauCd);
                        $("#cauNm"+idx).val(data[0].cauNm);
                        $("#phenCd"+idx).val(data[0].phenCd);
                        $("#phenNm"+idx).val(data[0].phenNm);
                    }
                }
            }
        });
    };


    /**############################ 버튼 설정##################################**/
    /** 요청사항 추가  **/
     $("#custAdd").kendoButton({
         click:function (e){
             var grid = $("#custRemarkGrid").data("kendoExtGrid");
             var length = grid.dataSource.data().length;
             if(length > 0){
                length = length - 1;
             }
             var data = grid.dataItem("tr:eq("+length+")");

             if(dms.string.isNotEmpty(data.custReqCont)){
                custDemandAdd();
             }
         }
     });

    /** 요청사항 삭제  **/
    $("#custDel").kendoButton({
        click:function (e){
            var grid = $("#custRemarkGrid").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    // 고객요청사항 그리드
    $("#custRemarkGrid").kendoExtGrid({
        dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/cmm/tabInfo/selectCustDemands.do' />"
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         if(dms.string.isNotEmpty(sDlrCd)){
                             params["sDlrCd"] =  sDlrCd;
                         }
                         params["sPreFixId"] = tabInfoPreFixId;
                         params["sJobNo"] = tabInfoJobNo;

                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"lineNo"
                    ,fields:{
                        lineNo:{type:"number", editable:false }
                       ,custReqCont:{type:"string", editable:true }
                       ,preFixId:{type:"string", editable:false }
                       ,dlrCd:{type:"string", editable:false }
                    }

                 }//model
           }//schema
        }//dataSource
        ,height:180
        ,pageable:false
        ,autoBind:false
        ,sortable:false
        ,editable:editYn
        ,editable:{
            confirmation:false
        }
        ,reorderable:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,resizable:false
        ,edit:function(e){
            if(preFixTp == "ROSTATUS"){
                this.closeCell();
            }
        }
        ,dataBound:function(){
            var grid = $("#custRemarkGrid").data("kendoExtGrid").dataSource;
            if(grid.data().length <= 0){
                custDemandAdd();
            }
        }
        ,columns:[
             {field:"lineNo", title:"<spring:message code='ser.lbl.custReqCd' />", width:50, attributes:{"class":"ac"}}
            ,{field:"custReqCont", title:"<spring:message code='ser.lbl.reqCont' />", width:400}
            ,{field:"preFixId" ,title:"preFixId", hidden:true, width:100}
            ,{field:"dlrCd" ,title:"dlrCd", hidden:true, width:100}
        ]
    });


    //고장설명 조회
    trobleDescInfo = function(jobNo, listType){

        tabInfoPreFixId = dms.string.strNvl(listType) == "" ? $("#preFixId").val():listType;
        tabInfoJobNo = jobNo;

        var params = {
            "sPreFixId":tabInfoPreFixId
            ,"sJobNo":tabInfoJobNo
            ,"sDlrCd":sDlrCd
        };

        $.ajax({
            url:"<c:url value='/ser/cmm/tabInfo/selectTrobleDescs.do' />"
            ,data:JSON.stringify(params)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR, status, error) {
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(result, textStatus){
                if(result != null){

                    trobleDescInfoSet(result);
                }
            }
        });

    };

   /** 고객요구사항 정보**/
   custDemandParam = function(e){
     //고객요구사항
       var custDemandGrid = $("#custRemarkGrid").data("kendoExtGrid");
       var custSaveData = custDemandGrid.dataSource.data();

       return custSaveData;
   };

   $(".btn_s.btn_s_v4.troble").click(function(){
       $(this).toggleClass("btn_active");
   });

    /** 고장서술 정보**/
    trobleDescParam = function(e){

        //고장서술 저장
        var trobleParam = {
             "preFixId":$("#preFixId").val()
             ,"roadTermCd1":($("#roadTermCd1")[0].className.indexOf("btn_active") > -1 ) ? "Y":"N"
             ,"roadTermCd2":($("#roadTermCd2")[0].className.indexOf("btn_active") > -1 ) ? "Y":"N"
             ,"roadTermCd3":($("#roadTermCd3")[0].className.indexOf("btn_active") > -1 ) ? "Y":"N"
             ,"roadTermCd4":($("#roadTermCd4")[0].className.indexOf("btn_active") > -1 ) ? "Y":"N"
             ,"roadTermCd5":($("#roadTermCd5")[0].className.indexOf("btn_active") > -1 ) ? "Y":"N"
             ,"roadTermCont": $("#roadTermCont").val()
             ,"roadPrcnCd1":($("#roadPrcnCd1")[0].className.indexOf("btn_active") > -1 ) ? "Y":"N"
             ,"roadPrcnCd2":($("#roadPrcnCd2")[0].className.indexOf("btn_active") > -1 ) ? "Y":"N"
             ,"roadPrcnCd3":($("#roadPrcnCd3")[0].className.indexOf("btn_active") > -1 ) ? "Y":"N"
             ,"roadPrcnCd4":($("#roadPrcnCd4")[0].className.indexOf("btn_active") > -1 ) ? "Y":"N"
             ,"roadPrcnCd5":($("#roadPrcnCd5")[0].className.indexOf("btn_active") > -1 ) ? "Y":"N"
             ,"roadPrcnCont":$("#roadPrcnCont").val()
             ,"wetrTermCd1":($("#wetrTermCd1")[0].className.indexOf("btn_active") > -1 ) ? "Y":"N"
             ,"wetrTermCd2":($("#wetrTermCd2")[0].className.indexOf("btn_active") > -1 ) ? "Y":"N"
             ,"wetrTermCd3":($("#wetrTermCd3")[0].className.indexOf("btn_active") > -1 ) ? "Y":"N"
             ,"wetrTermCd4":($("#wetrTermCd4")[0].className.indexOf("btn_active") > -1 ) ? "Y":"N"
             ,"wetrTermCd5":$("#wetrTermCd5").val()
             ,"wetrTermCont":$("#wetrTermCont").val()
             ,"occrFreqCd1":($("#occrFreqCd1")[0].className.indexOf("btn_active") > -1 ) ? "Y":"N"
             ,"occrFreqCd2":($("#occrFreqCd2")[0].className.indexOf("btn_active") > -1 ) ? "Y":"N"
             ,"occrFreqCd3":($("#occrFreqCd3")[0].className.indexOf("btn_active") > -1 ) ? "Y":"N"
             ,"occrFreqCd4":($("#occrFreqCd4")[0].className.indexOf("btn_active") > -1 ) ? "Y":"N"
             ,"occrFreqCd5":$("#occrFreqCd5").val()
             ,"occrFreqCont":$("#occrFreqCont").val()
             ,"driveStatCd1":($("#driveStatCd1")[0].className.indexOf("btn_active") > -1 ) ? "Y":"N"
             ,"driveStatCd2":($("#driveStatCd2")[0].className.indexOf("btn_active") > -1 ) ? "Y":"N"
             ,"driveStatCd3":($("#driveStatCd3")[0].className.indexOf("btn_active") > -1 ) ? "Y":"N"
             ,"driveStatCd4":($("#driveStatCd4")[0].className.indexOf("btn_active") > -1 ) ? "Y":"N"
             ,"driveStatCd5":$("#driveStatCd5").val()
             ,"driveStatCont":$("#driveStatCont").val()
             ,"operStatCd1":($("#operStatCd1")[0].className.indexOf("btn_active") > -1 ) ? "Y":"N"
             ,"operStatCd2":($("#operStatCd2")[0].className.indexOf("btn_active") > -1 ) ? "Y":"N"
             ,"operStatCd3":($("#operStatCd3")[0].className.indexOf("btn_active") > -1 ) ? "Y":"N"
             ,"operStatCd4":($("#operStatCd4")[0].className.indexOf("btn_active") > -1 ) ? "Y":"N"
             ,"operStatCd5":$("#operStatCd5").val()
             ,"operStatCont":$("#operStatCont").val()
         };

         return trobleParam;
    };


    //고장설명 결과값 세팅
    trobleDescInfoSet = function(result){
        $(".btn_s.btn_s_v4.troble").removeClass("btn_active");

        if(result.roadTermCd1 == "Y" ) $("#roadTermCd1").toggleClass("btn_active");
        if(result.roadTermCd2 == "Y" ) $("#roadTermCd2").toggleClass("btn_active");
        if(result.roadTermCd3 == "Y" ) $("#roadTermCd3").toggleClass("btn_active");
        if(result.roadTermCd4 == "Y" ) $("#roadTermCd4").toggleClass("btn_active");
        if(result.roadTermCd5 == "Y" ) $("#roadTermCd5").toggleClass("btn_active");
        $("#roadTermCont").val(result.roadTermCont);

        if(result.roadPrcnCd1 == "Y" ) $("#roadPrcnCd1").toggleClass("btn_active");
        if(result.roadPrcnCd2 == "Y" ) $("#roadPrcnCd2").toggleClass("btn_active");
        if(result.roadPrcnCd3 == "Y" ) $("#roadPrcnCd3").toggleClass("btn_active");
        if(result.roadPrcnCd4 == "Y" ) $("#roadPrcnCd4").toggleClass("btn_active");
        if(result.roadPrcnCd5 == "Y" ) $("#roadPrcnCd5").toggleClass("btn_active");
        $("#roadPrcnCont").val(result.roadPrcnCont);

        if(result.wetrTermCd1 == "Y" ) $("#wetrTermCd1").toggleClass("btn_active");
        if(result.wetrTermCd2 == "Y" ) $("#wetrTermCd2").toggleClass("btn_active");
        if(result.wetrTermCd3 == "Y" ) $("#wetrTermCd3").toggleClass("btn_active");
        if(result.wetrTermCd4 == "Y" ) $("#wetrTermCd4").toggleClass("btn_active");
        $("#wetrTermCd5").val(result.wetrTermCd5);
        $("#wetrTermCont").val(result.wetrTermCont);

        if(result.occrFreqCd1 == "Y" ) $("#occrFreqCd1").toggleClass("btn_active");
        if(result.occrFreqCd2 == "Y" ) $("#occrFreqCd2").toggleClass("btn_active");
        if(result.occrFreqCd3 == "Y" ) $("#occrFreqCd3").toggleClass("btn_active");
        if(result.occrFreqCd4 == "Y" ) $("#occrFreqCd4").toggleClass("btn_active");
        $("#occrFreqCd5").val(result.occrFreqCd5);
        $("#occrFreqCont").val(result.occrFreqCont);

        if(result.driveStatCd1 == "Y" ) $("#driveStatCd1").toggleClass("btn_active");
        if(result.driveStatCd2 == "Y" ) $("#driveStatCd2").toggleClass("btn_active");
        if(result.driveStatCd3 == "Y" ) $("#driveStatCd3").toggleClass("btn_active");
        if(result.driveStatCd4 == "Y" ) $("#driveStatCd4").toggleClass("btn_active");
        $("#driveStatCd5").val(result.driveStatCd5);
        $("#driveStatCont").val(result.driveStatCont);

        if(result.operStatCd1 == "Y" ) $("#operStatCd1").toggleClass("btn_active");
        if(result.operStatCd2 == "Y" ) $("#operStatCd2").toggleClass("btn_active");
        if(result.operStatCd3 == "Y" ) $("#operStatCd3").toggleClass("btn_active");
        if(result.operStatCd4 == "Y" ) $("#operStatCd4").toggleClass("btn_active");
        $("#operStatCd5").val(result.operStatCd5);
        $("#operStatCont").val(result.operStatCont);

        $("#custRemarkGrid").data("kendoExtGrid").dataSource.read();
    };

    var grid = $("#custRemarkGrid").data("kendoExtGrid").dataSource;
        if(grid.data().length <= 0){
            custDemandAdd();
        }
    });

    custDemandAdd = function() {
        var grid = $("#custRemarkGrid").data("kendoExtGrid").dataSource;
        grid.add({
            "lineNo":grid.data().length + 1
           ,"custReqCont" :""
    });


    custRemarkSerAlramAdd = function(jsonObj){

        var custGrid = $("#custRemarkGrid").data("kendoExtGrid");
        var custGridData = custGrid.dataSource._data;
        var preRoTp = "";

        if(jsonObj.total > 0){

            $.each(jsonObj.data, function(idx, data){

                var copyData;
                var checkVal = true;


                // 중복값 체크
                $.each(custGridData , function(idx, obj){
                    if(data.preFixId == obj.preFixId && data.custReqCont == obj.custReqCont ){
                        checkVal = false;
                    }
                });

                if(checkVal && preFixId == "RO"){
                    data.lineNo = custGrid.dataSource.data().length + 1;
                    custGrid.dataSource.add(data);
                }


            });
        }
    }

};

</script>