<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 날짜, 통화 -->
    <section id="content">
    <!-- Barcode 목록  [Start] -->
    <!-- Barcode 목록  [Start] -->
    <!-- Barcode 목록  [Start] -->
        <!-- content_list -->

        <section id="content_list_1">
            <div class="content_title conttitlePrev">
                <h2>BARCODE 목록</h2>
                <div class="title_btn">
                    <span class="tbtn01" id="selAll">전체선택</span>
                </div>
            </div>
            <div class="listarea">
                <div class="listhead checkitem">
                    <span style="width:60%;"><spring:message code='global.lbl.vinNum' /></span>
                    <span style="width:40%;"><spring:message code='global.lbl.grDt' /><!-- 입고일 --></span>
                </div>
                <iframe id="mainList" border="0" frameborder="0" width="100%" height=""></iframe>
            </div>
            <div class="btnfixed">
                <div class="con_btnarea">
                    <span class="btnd1"><span class="search" id="btn_wearingSearch">입고대상조회<!-- 입고대상조회  --></span></span>
                </div>
            </div>
        </section>


    <!-- Barcode 목록  [End] -->
    <!-- Barcode 목록  [End] -->
    <!-- Barcode 목록  [End] -->

    <!-- 중복차량체크  [Start] -->
    <!-- 중복차량체크  [Start] -->
    <!-- 중복차량체크  [Start] -->


        <section id="content_list_2" style="display:none;">
            <div class="content_title conttitlePrev">
                <h2>BARCODE 목록</h2>
                <div class="title_btn">
                    <span class="tbtn01">전체선택</span>
                </div>
            </div>
            <div id="duplConfirmWearingListArea"></div>
            <div class="con_btnarea">
                <span class="btnd1" id="btn_wearingDuplChk">선택</span>
            </div>
        </section>

        <section id="content_list_3" style="display:none;">
            <div class="content_title conttitlePrev">
                <h2>입고대상 목록</h2>
            </div>

            <div class="listarea">
                <div class="listhead checkitem">
                    <span style="width:60%;"><spring:message code='global.lbl.vinNum' /></span>
                    <span style="width:40%;"><spring:message code='mob.lbl.barcode' /><!-- 바코드 --></span>
                    <span style="width:60%;" class="clboth"><spring:message code='ser.lbl.carLine' /><!-- 차종 --></span>
                    <span style="width:40%;"><spring:message code='global.lbl.extColor' />/<spring:message code='global.lbl.intColor' /><!-- 외장색/내장색 --></span>
                    <span style="width:100%;" class="clboth"><spring:message code="global.lbl.model" /><!-- 모델 --></span>
                    <span style="width:100%;"><spring:message code="global.lbl.ocn" /><!-- OCN --></span>
                </div>

                <div id="confirmWearingListArea"></div>
            </div>
            <div class="con_btnarea">
                <span class="btnd1" id="btn_wearingConfrim">입고확정</span>
            </div>
        </section>






    <!-- 중복차량체크  [End] -->
    <!-- 중복차량체크  [End] -->
    <!-- 중복차량체크  [End] -->






    </section>
    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>



<!-- script -->
<script>
var toDate,
    gCrud;

toDate = new Date();




$(document).ready(function() {


   /*  function initPage(){
        if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        }
        partsJs.validate.groupObjAllDataInit();
        gCrud = 'C';
        $(".skeyarea").hide();

    }


    initPage();
 */
    // 타이틀
    $("#header_title").html("<spring:message code="sal.title.confirmWearingVehicle" />"); //완성차입고확정
    //$("#header_title").on("click", contentSearch);

    // 목록 조회
    $("#mainList").attr("src", "<c:url value='/mob/sal/sti/confirmWearingVehicle/selectConfirmWearingVehicleList.do' />");
    //document.getElementById("mainList").contentWindow.selectItemList();


    // 버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e) {
            var custNm = $("#custNm").val();
            var custHp = $("#custHp").val();
            var custSourceTxt = $("#custSource").data("kendoExtDropDownList").text();
            var custSourceVal = $("#custSource").data("kendoExtDropDownList").value();

            document.getElementById("mainList").contentWindow.addItemList(custNm, custHp, custSourceTxt, custSourceVal);
        }
    });

    // 버튼 - 초기화
    $("#btnInit").kendoButton({
        click:function(e) {
            $("#custNm").val("");
            $("#custHp").val("");
            $("#custSource").data("kendoExtDropDownList").value("");
        }
    });

    // 버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentList(); }
        else if ($("#content_detail").css("display") == "block") { contentList(); }
    });

    //버튼 - TOP
    $("#docu_top").bind("click", function()
    {
        $("body,html").animate({scrollTop:0}, 200);
    });

    //상단으로 이동
    $(window).scroll(function () {
        if ($(this).scrollTop() != 0)
        {
            //$("#docu_top").fadeIn();
        }
        else
        {
            $("#docu_top").fadeOut();
        }
    });


});

function getItemListInit(initFl){
    //네이티브연동 불가시 임시 테스트
    //네이티브 연동테스트 사용
    //테스트 결과 네이티브에서는 return함수를 메인에서 사용함
    //적용시 수정 필요
    try{
      if(mob.browser.isSafari()){
      document.location='bhmccp://SELECT?TABLE_NM=Vehicle_Settlement&return_func=setItemList';
    }else{
          window.bhmccp.SELECT('Vehicle_Settlement','setItemList');
        }
      }catch(e){
          //if(confirm('네이티 연동 불가시 임시 테스트 향후 하위 로직 삭제 ')){
              var resultList ;

/*
F0000062
B3269282
B3237218
IK919524
IK918708
IK919511
IK919544
  */

              if(initFl) {
                  resultList = {'data':[
               //{"CREATE_DATE":"2016-05-30", "INSERT_DATE":"2016-06-27", "VEHICLE_CD":"LBEDMBKB1DZ045835"},
               //{"CREATE_DATE":"2016-05-30", "INSERT_DATE":"2016-06-28", "VEHICLE_CD":"LBEDMBKB1DZ046466"},
               //{"CREATE_DATE":"2016-05-30", "INSERT_DATE":"2016-06-29", "VEHICLE_CD":"LBEDMBKB1DZ038988"},
               //{"CREATE_DATE":"2016-05-30", "INSERT_DATE":"2016-06-30", "VEHICLE_CD":"LBEDMBKB1DZ046489"}
               {"CREATE_DATE":"2016-05-30", "INSERT_DATE":"2016-06-27", "VEHICLE_CD":"F0000062"},
               {"CREATE_DATE":"2016-05-30", "INSERT_DATE":"2016-06-28", "VEHICLE_CD":"B3269282"},
               {"CREATE_DATE":"2016-05-30", "INSERT_DATE":"2016-06-29", "VEHICLE_CD":"B3237218"},
               {"CREATE_DATE":"2016-05-30", "INSERT_DATE":"2016-06-30", "VEHICLE_CD":"IK919524"}
                  ]};
              } else { //저장후 reload
                  resultList = {'data':[
               {"CREATE_DATE":"2016-12-30", "INSERT_DATE":"2016-07-29", "VEHICLE_CD":"11111111"},
               {"CREATE_DATE":"2016-12-30", "INSERT_DATE":"2016-07-30", "VEHICLE_CD":"22222222"}
                  ]};
              }

              setItemList(resultList); //데이터 취득 그리드 생성후 데이터 조회를 위하여 timeout 설정
      }
}

function setItemList(param){
  document.getElementById("mainList").contentWindow.getItemList(param);
}

</script>

<script>
//메인화면 가기
function goMain() {
  window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
}

//버튼 - 이전
$("#selAll").bind("click", function()
{
    $("#mainList").contents().find("input[name='isSaveName']").each(function(cnt){
        $("#mainList").contents().find("input[name='isSaveName']")[cnt].checked = true;
    });
});

//입고대상조회
var selList      = [];
$("#btn_wearingSearch").bind("click", function()
{
    var listCnt = 0;
    var checkFlag = true;
    $("#mainList").contents().find("input[name='isSaveName']").each(function(cnt){
        if($("#mainList").contents().find("input[name='isSaveName']")[cnt].checked == true){
            var gridData = {
                    barcodeNo             :$("#mainList").contents().find("input[name='barcodeNo']")[cnt].value
            };
            selList.push(gridData);
            listCnt ++;
        }
    });
    var searchData = {insertList:selList};
    var resultDataList = [];
    if(listCnt == 0){
        alert("선택건수가 없음");
    //체크건수가 존재하는경우
    } else {
        var data = [];
        var rowIndex = 0;
        var duplRowNum = [];
        $.ajax({
            url:"<c:url value='/sal/sti/confirmWearingVehicle/retVehicleInfo.do' />"
            ,data:JSON.stringify(searchData)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR, status, error) {
                mob.notification.error(jqXHR.responseJSON.errors);
            }
            ,success:function(result) {
                if(result.data!=null){
                    rowTotal = result.total;
                    var duplCheck = false;
                    var prevBarcodeNo = "";
                    $.each(result.data , function(i , row){
                        rowIndex++;
                        resultDataList.push({rowIdx:rowIndex,
                            barcodeNo      :row.barcodeNo,
                            vinNo          :row.vinNo,
                            carlineCd      :row.carlineCd,
                            carlineNm      :row.carlineNm,
                            modelCd        :row.modelCd,
                            modelNm        :row.modelNm,
                            ocnCd          :row.ocnCd,
                            ocnNm          :row.ocnNm,
                            extColorCd     :row.extColorCd,
                            extColorNm     :row.extColorNm,
                            intColorCd     :row.intColorCd,
                            intColorNm     :row.intColorNm,
                            ordTp          :row.ordTp
                         });
                        if(row.barcodeNo == prevBarcodeNo) {
                            duplCheck = true;
                            duplRowNum.push(i-1); //이전데이터 중복항목추가
                            duplRowNum.push(i);   //현데이터 중복항목추가
                        }
                        prevBarcodeNo = row.barcodeNo;
                    });
                    duplRowNum.removeDup();//중복데이터 row에 데이터 정리

                    if(duplCheck){ //중복데이터 존재
                        drawConfirmWearingVehicleDupl(resultDataList,duplRowNum);
                    } else { //중복데이터 미존재
                        drawConfirmWearingVehicle(resultDataList,[]);
                    }
                } // if(result.data!=null){
            }// success:function(result) {
        });
        listCnt = 0;
        selList      = [];
    }//if(listCnt >0){
});

function rowDuplChk(duplLowArr,i){
    for(var j = 0 ; j < duplLowArr.length;j++){
        if(i == duplLowArr[j]){
            return true;
            break;
        }
    }
    return false;
}
var resultDataListAll;
function drawConfirmWearingVehicleDupl(resultDataList,duplLowArr){
    var txt = '';
    var prevBarcodeNo = '';
    var firstChk = false;
    resultDataListAll = resultDataList;
    $.each(resultDataList , function(i , row){
        if(rowDuplChk(duplLowArr,i)){ //현재 row가 중복데이터 여부 확인
            if(prevBarcodeNo != row.barcodeNo) {
                //첫번째루프가 아니면 이전 화면 에서 오는 바코드 데이터가 틀린경우 이전목록div(listarea01과 영역 분리
                if(firstChk){
                    txt +='</div>';  //
                    txt +='<div class="pb10"></div>';
                } else {
                    firstChk = true;
                }
                txt +='<div class="listarea01">';
                txt +='  <div class="dlistitem listhead">';
                txt +='      <span><spring:message code='mob.lbl.barcode' />:'+row.barcodeNo+'</span>';
                txt +='  </div>';

            }
            txt +='  <div class="checkitem">';
            txt +='      <span class="check">';
            txt +='       <input type="checkbox" id="check_'+i+'" name="check_dupl" class="f_check"/><label for="check_'+i+'"></label>';
            txt +='       <input type="hidden" name="check_dupl_row" value="'+i+'"/>';
            txt +='      </span>';
            txt +='      <span style="">'+row.vinNo+'</span>';
            txt +='      <span class="clboth" style="width:60%;">'+row.carlineNm+'</span>';
            txt +='      <span style="width:40%;">'+row.extColorNm+'/'+row.intColorNm+'</span>';
            txt +='      <span class="clboth">'+row.modelNm+'</span>';
            txt +='      <span class="clboth">'+row.ocnNm+'</span>';
            txt +='  </div>';
            prevBarcodeNo = row.barcodeNo;
        }

    });
    txt +='</div>'; // 마지막 div(listarea01) 닫기
    $("#duplConfirmWearingListArea").html(txt);
    $("#content_list_2").show();
    $("#content_list_1").hide();
}

function drawConfirmWearingVehicle(resultDataList,duplDelArr){
    var txt = '';
    $.each(resultDataList , function(i , row){
        if(!rowDuplChk(duplDelArr,i)){ //현재 row가 중복 제거 데이터 여부 확인 후 제거 데이터인경우 항목제외
            txt +='  <div class="checkitem">';
            txt +='      <span class="check">';
            txt +='       <input type="checkbox" id="check_confirm_'+i+'" name="check_confirm" class="f_check"/><label for="check_confirm_'+i+'"></label>';
            txt +='       <input type="hidden" name="check_confirm" value="'+i+'"/>';
            txt +='      </span>';
            txt +='      <span style="">'+row.vinNo+'</span>';
            txt +='      <span class="clboth" style="width:60%;">'+row.carlineNm+'</span>';
            txt +='      <span style="width:40%;">'+row.extColorNm+'/'+row.intColorNm+'</span>';
            txt +='      <span class="clboth">'+row.modelNm+'</span>';
            txt +='      <span class="clboth">'+row.ocnNm+'</span>';
            txt +='  </div>';
        }
    });
    $("#confirmWearingListArea").html(txt);
    $("#content_list_3").show();
    $("#content_list_2").hide();
    $("#content_list_1").hide();
}

$("#btn_wearingDuplChk").bind("click", function(){
    var duplDelArr = [];
    $("input[name='check_dupl']").each(function(cnt){
        if($("input[name='check_dupl']")[cnt].checked == false){
            duplDelArr.push($("input[name='check_dupl_row']")[cnt].value);
        }
    });
    drawConfirmWearingVehicle(resultDataListAll,duplDelArr);
});


Array.prototype.valueIndex = function(pval){
    var idx = -1;
    if(this == null || this == undefined || pval == null ||pval == undefined){
    } else {
        for(var i = 0 ; i < this.length;i++){
            if(this[i] == pval){
                idx = i;
                break;
            }
        }
    }
    return idx;
}

Array.prototype.removeDup = function(){
    var resultArray =[];
    if(this == null || this == undefined){
    }else{
        for(var i = 0 ; i < this.length;i++){
            var el = this[i];
            if(resultArray.valueIndex(el) == -1)
                resultArray.push(el);
        }
    }
    return resultArray;
 }
</script>