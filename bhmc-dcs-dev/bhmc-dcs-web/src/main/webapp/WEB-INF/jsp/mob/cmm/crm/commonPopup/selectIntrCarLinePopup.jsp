<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>


<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />
    <section id="content">
        <!-- content_pop_list -->
        <section id="content_pop_list">
            <div class="content_title">
                <h1 id="content_pop_list_title"><spring:message code="global.title.intrCarLine" /><!-- 관심차종  --></h1>
            </div>

            <div class="formarea">
                <table  class="flist01">
                    <caption></caption>
                    <colgroup>
                        <col style="width:30%;">
                        <col style="">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.carLine" /><!-- 차종 --></th>
                            <td>
                                <div class="f_text"><input id="carlineCd" name="carlineCd"  class="form_comboBox"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.model" /><!-- 모델 --></th>
                            <td>
                                <div class="f_text"><input id="modelCd" name="modelCd" class="form_comboBox" /></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.typicalCar" /><!-- 관심 --></th>
                            <td>
                                <input type="checkbox" class="f_check" data-type="checkbox" id="flagYn" name="flagYn" type="text" style="width:100%"/><label for="flagYn"></label>
                            </td>
                        </tr>


                    </tbody>
                </table>
            </div>
            <div class="con_btnarea btncount2">
                <div><span id="btnCancel" class="btnd1"><spring:message code='global.btn.cancel' /><!-- 취소 --></span></div>
                <div><span id="btnSave" class="btnd1"><spring:message code='global.btn.save' /><!-- 저장 --></span></div>
            </div>
        </section>

    </section>

<!-- script -->
<script>
var dateFormat =  '<dms:configValue code="dateFormat" />';
var toDate,
    gCrud;

//차종
var carLineCdDSList = [];
var carLineCdObj = {};

//그리드 모델 콤보 DataSource
var modelCdDSList = [];
var modelCdObj = {};


<c:forEach var="obj" items="${carLineCdInfo}">
carLineCdDSList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
carLineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
</c:forEach>


// 그리드에서 목록 선택시 선택값 세팅
var setDataItem;
$(document).ready(function() {



    $("#modelCd").kendoExtDropDownList({
        autoBind:false
        , dataTextField:"modelNm"
        , dataValueField:"modelCd"
        , optionLabel:"<spring:message code='global.lbl.check'/>"
        , index:0
        , enable:false
    });

    $("#carlineCd").kendoExtDropDownList({
        autoBind:false
        , dataTextField:"carlineNm"
        , dataValueField:"carlineCd"
        , dataSource:carLineCdDSList
        /* , select:selectGridCarlineCd */
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
        , index:0
        , enable:true
        , change:function(){
            var selcmmCd = this.dataItem(this.select()).carlineCd;

            if(selcmmCd != "" && selcmmCd != null){
                var responseJson = dms.ajax.getJson({
                    url:_contextPath + "/sal/svo/askHelpCar/selectModel.do"
                    ,data:JSON.stringify({"carlineCd":selcmmCd})
                    ,async:false
                });

                console.log("selectGridCarlineCd", responseJson.data);
                modelCdDSList = responseJson.data;

                modelCdObj = [];
            }


            var modelCd = $("#modelCd").data("kendoExtDropDownList");

            if(modelCdDSList != null){
                $.each(modelCdDSList, function(idx, obj){
                    modelCdObj[obj.modelCd] = obj.modelNm;
                });

                if(modelCdDSList.length > 0){
                    modelCd.enable(true);
                    $("#modelCd").kendoExtDropDownList({
                        autoBind:false
                        , dataTextField:"modelNm"
                        , dataValueField:"modelCd"
                        , optionLabel:"<spring:message code='global.lbl.check'/>"
                        , dataSource:modelCdDSList
                        , index:0
                    });
                }else{
                    modelCd.value("");
                    modelCd.enable(false);
                }
            }else{
                modelCd.value("");
                modelCd.enable(false);
            }
        }
    });



    function initPage(){

    }

    initPage();

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            var sUsrId = $("#sUsrId");
            var sUsrNm = $("#sUsrNm");
            var sEmpNo = $("#sEmpNo");

            if(sUsrId.val() != "") $("#search1Area span[name='searchStr']").text(sUsrId.val());
            if(sUsrNm.val() != "") $("#search2Area span[name='searchStr']").text(sUsrNm.val());
            if(sEmpNo.val() != "") $("#search3Area span[name='searchStr']").text(sEmpNo.val());
            setSearchBox();
            contentList();
        }
    });


});
</script>

<script>

/**
 * 차종에 따른 모델 조회
 */
function selectGridCarlineCd(e) {
    var dataItem = this.dataItem(e.item);
    var responseJson = dms.ajax.getJson({
        url:_contextPath + "/sal/svo/askHelpCar/selectModel.do"
        ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
        ,async:false
    });

    console.log("selectGridCarlineCd", responseJson.data);
    modelCdDSList = responseJson.data;

    modelCdObj = [];
    $.each(modelCdDSList, function(idx, obj){
        modelCdObj[obj.modelCd] = obj.modelNm;
    });



    if(dataItem.carlineCd != "" ){

        $("#modelCd").kendoExtDropDownList({
            autoBind:false
            ,dataTextField:"modelNm"
             ,dataValueField:"modelCd"
            , optionLabel:"　"
            , dataSource:modelCdDSList
            , index:0
            , enable:true
        });
    }

};


//취소 버튼.
$("#btnCancel").kendoButton({
    click:function(e){
        parent.intrCarLinePopupWin.close();
    }
});

$("#btnSave").kendoButton({
    click:function(e){

        var carlineCd = $("#carlineCd").val();
        var modelCd = $("#modelCd").val();
        var modelNm = $("#modelCd").data("kendoExtDropDownList").value();
        //var flagYn = $("#flagYn").checked;
        var flagYn = $("input:checkbox[id='flagYn']").is(":checked");

        if(flagYn == true){
            flagYn = "Y";
        }else{
            flagYn = "N";
        }
        if(carlineCd != null && carlineCd != ""){
            parent.addIntrCarLine(carlineCd, modelCd, flagYn);
            parent.intrCarLinePopupWin.close();
        }
    }


});



</script>