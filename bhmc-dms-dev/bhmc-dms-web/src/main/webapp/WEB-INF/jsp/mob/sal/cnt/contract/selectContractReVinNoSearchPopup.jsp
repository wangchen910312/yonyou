<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />
    <section id="content">
        <div class="content_title conttitlePrev">
            <h2 id="content_title_h2"><spring:message code="global.lbl.carSearch" /><!-- 차량검색조건 --></h2>
        </div>

        <div id="carInfoSearchTabDiv"> <!-- 차량정보 TAB - 시작-->
            <!-- content_pop_list -->
            <section id="content_pop_list" style="display:none;">
                <div class="skeyarea">
                    <div>
                        <table class="slist01">
                            <colgroup>
                                <col style="width:35%;">
                                <col style="">
                            </colgroup>
                            <tbody>
                                <tr id="search1Area">
                                    <th scope="row"><span><spring:message code='global.lbl.carLine' /></span></th><!-- 차종 -->
                                    <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /></span></td>
                                </tr>
                                <tr id="search2Area">
                                    <th scope="row"><span><spring:message code='global.lbl.model' /></span></th><!-- 모델 -->
                                    <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /></span></td>
                                </tr>
                                <tr id="search3Area">
                                    <th scope="row"><span><spring:message code="global.lbl.ocn" /></span></th><!-- OCN -->
                                    <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /></span></td>
                                </tr>
                                <tr id="search4Area">
                                    <th scope="row"><span><spring:message code='global.lbl.extColor' /></span></th><!-- 외장색 -->
                                    <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /></span></td>
                                </tr>
                                <tr id="search5Area">
                                    <th scope="row"><span><spring:message code='global.lbl.intColor' /></span></th><!-- 내장색 -->
                                    <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /></span></td>
                                </tr>
                                <tr id="search6Area">
                                    <th scope="row"><span><spring:message code='global.lbl.vinNo' /></span></th><!-- VIN -->
                                    <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /></span></td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="listarea">
                    <div class="dlistitem listhead">
                        <span style="width:60%"><spring:message code="global.lbl.vinNo" /></span><!-- VIN -->
                        <span style="width:40%"><spring:message code="sal.lbl.lockKind" /></span><!-- 종류 -->
                        <span style="width:30%" class="clboth"><spring:message code="global.lbl.vinSts" /></span><!-- 차량상태 -->
                        <span style="width:30%"><spring:message code="sal.lbl.carRetlAmt" /></span><!-- 지도가 -->
                        <span style="width:40%"><spring:message code="global.lbl.stockMonth" /></span><!-- 재고월령 -->
                        <span style="width:30%" class="clboth"><spring:message code="global.lbl.carlineNm" /></span><!-- 차종 -->
                        <span style="width:70%"><spring:message code="global.lbl.modelNm" /></span><!-- 차관 -->
<%--                         <span style="width:50%"><spring:message code="global.lbl.ocnNm" /></span><!-- OCN -->
                        <span style="width:30%" class="clboth"><spring:message code="global.lbl.extColorNm" /></span><!-- 와장색 -->
                        <span style="width:30%"><spring:message code="global.lbl.intColorNm" /></span><!-- 내장색 --> --%>
                    </div>
                    <iframe id="comonPopupList" border="0" frameborder="0" width="100%" height="300"></iframe>
                    <div class="dlistitem bgNone" style="display:none;" id="listarea_noData_pop"><span></span></div>
                </div>
                <div class="con_btnarea">
                    <span class="btnd1" id="btnSelect"><spring:message code="global.btn.select" /><!-- 선택 --></span>
                </div>
            </section>


            <!-- content_pop_search(차량) -->
            <section id="content_pop_search" class="content_pop_search">
               <div class="formarea">
                    <table class="flist01">
                        <caption></caption>
                        <colgroup>
                            <col style="width:30%;">
                            <col style="">
                        </colgroup>
                         <tbody>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.carLine' /></th><!-- 차종 -->
                                    <td>
                                        <div class="f_text"><input type="text" id="sCarlineCd"  class="form_input" ></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.model' /></th><!-- 모델 -->
                                    <td>
                                        <div class="f_text"><input type="text" id="sModelCd"  class="form_input" ></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.ocn' /></th><!-- OCN -->
                                    <td>
                                        <div class="f_text"><input type="text" id="sOcnCd"  class="form_input" ></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.extColor' /></th><!-- 외장색 -->
                                    <td>
                                        <div class="f_text"><input type="text" id="sExtColorCd"  class="form_input" ></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.intColor' /></th><!-- 내장색 -->
                                    <td>
                                        <div class="f_text"><input type="text" id="sIntColorCd" class="form_input" ></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='global.lbl.vinNo' /></th><!-- VIN -->
                                    <td>
                                        <div class="f_text"><input type="text" id="sVinNo"  class="form_input" ></div>
                                    </td>
                                </tr>
                            </tbody>
                    </table>
                </div>
                <div class="con_btnarea">
                    <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
                </div>
            </section>
        </div><!-- 차량정보 TAB - 끝-->

        <span style="display:none">
            <input type="hidden" id="sDlrCd"  /><!-- 딜러코드 -->
        </span>

    </section>
    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>


<!-- script -->
<script>

//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

//차량보유상태 SAL149
var ownStatDs = [];
var ownStatObj = {};
<c:forEach var="obj" items="${ownStatList}">
    ownStatDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ownStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//차량상태 SAL001
var carStatList = [];
var carStatObj = {};
<c:forEach var="obj" items="${carStatList}">
    carStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    carStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//차량
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>


$(".skeyarea .btn_delete").click(function(){
    var obj = $(this).parent().parent();
    switch(obj.attr("id")){
        case "search1Area" :
            $("#sCarlineCd").data("kendoExtDropDownList").value("");
            break;
        case "search2Area" :
            $("#sModelCd").data("kendoExtDropDownList").value("");
            break;
        case "search3Area" :
            $("#sOcnCd").data("kendoExtDropDownList").value("");
            break;
        case "search4Area" :
            $("#sExtColorCd").data("kendoExtDropDownList").value("");
            break;
        case "search5Area" :
            $("#sIntColorCd").data("kendoExtDropDownList").value("");
            break;
        case "search6Area" :
            $("#sVinNo").val("");
            break;
        default :
            break;
    }

    obj.find("span[name='searchStr']").text("");

    if ($("#content_pop_list").css("display") == "block"){
        setSearchBox();
        contentList();
    }

});


//고객정보 조회
function setSearchBox(){

      var sCarlineCd = $("#sCarlineCd").data("kendoExtDropDownList").value();
      var sModelCd = $("#sModelCd").data("kendoExtDropDownList").value();
      var sOcnCd = $("#sOcnCd").data("kendoExtDropDownList").value();
      var sExtColorCd = $("#sExtColorCd").data("kendoExtDropDownList").value();
      var sIntColorCd = $("#sIntColorCd").data("kendoExtDropDownList").value();
      var sVinNo = $("#sVinNo").val();

      //var regDtFrom = $("#regDtFrom").val();
      //var regDtTo = $("#regDtTo").val();

      if(sCarlineCd == "" && sModelCd == "" && sOcnCd == "" &&
              sExtColorCd == "" && sExtColorCd == "" && sIntColorCd == "" && sVinNo == ""){
          $("#content_pop_list .skeyarea").hide();
      } else {
          $("#content_pop_list .skeyarea").show();

          if(sCarlineCd == "") $("#search1Area").hide();
              else $("#search1Area").show();
          if(sModelCd == "") $("#search2Area").hide();
              else $("#search2Area").show();
          if(sOcnCd == "") $("#search3Area").hide();
              else $("#search3Area").show();
          if(sExtColorCd == "") $("#search4Area").hide();
              else $("#search4Area").show();
          if(sIntColorCd == "") $("#search5Area").hide();
              else $("#search5Area").show();
          if(sVinNo == "") $("#search6Area").hide();
              else $("#search6Area").show();
      }
      //setMainListHeight();
      //setPopUpListHeight();
}

//그리드에서 목록 선택시 선택값 세팅
var setDataItem; //차량

$(document).ready(function() {

    setDataItem = null ;// 화면 로딩시 초기화

    function initPage(){
        /* if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        } */
        partsJs.validate.groupObjAllDataInit();
        gCrud = 'C';
        $(".skeyarea").hide();

        //$("#custTp").data("kendoExtDropDownList").value(custTpFromSNSOPP);

    }


 // 팝업 설정값
    var options = parent.popupWindow.options.content.data;

    //차종
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       ,optionLabel:" "   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sModelCd").data("kendoExtDropDownList").enable(true);

           $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);   // OCN data
           $("#sOcnCd").data("kendoExtDropDownList").enable(false);       // OCN 닫음

           $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

           $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

           if(dataItem.carlineCd == ""){
               $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sModelCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/cnt/contract/selectModel.do' />"
               ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
               ,async:false
           });
           $("#sModelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });

    // 모델
    $("#sModelCd").kendoExtDropDownList({
        dataTextField:"modelNm"
       ,dataValueField:"modelCd"
       ,optionLabel:" "   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sOcnCd").data("kendoExtDropDownList").enable(true);

           $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

           $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

           if(dataItem.modelCd == ""){
               $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sOcnCd").data("kendoExtDropDownList").enable(false);
               return false;
           }
           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/cnt/contract/selectOcn.do' />"
               ,data:JSON.stringify({"carlineCd":$("#sCarlineCd").val(), "modelCd":dataItem.modelCd})
               ,async:false
           });
           $("#sOcnCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });
    $("#sModelCd").data("kendoExtDropDownList").enable(false);

    // ocn
    $("#sOcnCd").kendoExtDropDownList({
         dataTextField: "ocnNm"
        ,dataValueField:"ocnCd"
        ,optionLabel:" "   // 전체
        ,select:function(e){
            $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sExtColorCd").data("kendoExtDropDownList").enable(true);

            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

            if(this.dataItem(e.item).ocnCd == ""){
                $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
                $("#sExtColorCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/cnt/contract/selectExtColor.do' />"
                ,data:JSON.stringify({"modelCd":$("#sModelCd").data("kendoExtDropDownList").value() })
                ,async:false
            });
            $("#sExtColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
    });
    $("#sOcnCd").data("kendoExtDropDownList").enable(false);

    //외장색
    $("#sExtColorCd").kendoExtDropDownList({
         dataTextField: "extColorNm"
        ,dataValueField:"extColorCd"
        ,optionLabel:" "   // 전체
        ,select:function(e){
            if(this.dataItem(e.item).extColorCd == ""){
                $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
                $("#sIntColorCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColorCd").data("kendoExtDropDownList").enable(true);

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/cnt/contract/selectIntColor.do' />"
                ,data:JSON.stringify({"modelCd":$("#sModelCd").data("kendoExtDropDownList").value() })
                ,async:false
            });
            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
    });
    $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

    //내장색
    $("#sIntColorCd").kendoExtDropDownList({
         dataTextField: "intColorNm"
        ,dataValueField:"intColorCd"
        ,optionLabel:" "   // 전체
    });
    $("#sIntColorCd").data("kendoExtDropDownList").enable(false);


    $("#sDlrCd").val(options.sDlrCd);
    $("#sVinNo2").val(options.sVinNo2);
    $("#sVinNo").val(options.sVinNo);

    if(dms.string.strNvl(options.sCarlineCd) != ""){
        $("#sCarlineCd").data("kendoExtDropDownList").value(dms.string.strNvl(options.sCarlineCd));
    }
    if(dms.string.strNvl(options.sModelCd) != ""){
        var sModelCd = $("#sModelCd").data("kendoExtDropDownList");
        sModelCd.setDataSource([{modelNm:options.sModelNm, modelCd:options.sModelCd}]);
        sModelCd.value(options.sModelCd); // 모델
    }
    if(dms.string.strNvl(options.sOcnCd) != ""){
        var sOcnCd = $("#sOcnCd").data("kendoExtDropDownList");
        sOcnCd.setDataSource([{ocnNm:options.sOcnNm, ocnCd:options.sOcnCd}]);
        sOcnCd.value(options.sOcnCd); // OCN
    }
    if(dms.string.strNvl(options.sExtColorCd) != ""){
        var sExtColorCd = $("#sExtColorCd").data("kendoExtDropDownList");
        sExtColorCd.setDataSource([{extColorNm:options.sExtColorNm, extColorCd:options.sExtColorCd}]);
        sExtColorCd.value(options.sExtColorCd); // 외장색
    }
    if(dms.string.strNvl(options.sIntColorCd) != ""){
        var sIntColorCd = $("#sIntColorCd").data("kendoExtDropDownList");
        sIntColorCd.setDataSource([{intColorNm:options.sIntColorNm, intColorCd:options.sIntColorCd}]);
        sIntColorCd.value(options.sIntColorCd); // 내장색
    }


    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code='sal.title.carSearch' />"); // 차량조회
    //$("#header_title").on("click", contentSearch);
    //("#header_title").on("click", contentSearchCheck);

    // 목록 조회
    //$("#comonPopupList").attr("src", "<c:url value='/mob/crm/cif/customerInfo/selectContractCustSearchListPopup.do' />");


    // 버튼 - 조회(고객)
    $("#btnSearch").kendoButton({
        click:function(e) {
            var sUsrId = $("#sUsrId");
            var sUsrNm = $("#sUsrNm");
            var sEmpNo = $("#sEmpNo");

            //contentList();
            //조회버튼 클릭 시점에 contentList2()함수와 동일 기능 구현
            $("#content_pop_search").css("display","none");
            $("#content_pop_list").css("display","block");
            $("#comonPopupList").attr("src", "<c:url value='/mob/sal/cnt/contract/selectContractReVinNoSearchListPopup.do' />");

        }
    });


    // 버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        if ($("#content_pop_list").css("display") == "block") {
        //goMain();
        parent.popupWindow.close();
        } else if ($("#content_pop_search").css("display") == "block") {
            contentList();
        }

        if ($("#content_pop_list2").css("display") == "block") {
         //goMain();
            parent.popupWindow.close();
        }

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


    //헤더 접기 실행
    $("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");
    /*
    $("#header_title").bind("click", function(){
        if($("#content_pop_search").css("display") == "block"){
            $("#header_title span").attr("class","search_close");
        }else{
            $("#header_title span").attr("class","search_open");
        }
    });
    */
    $("#header_title").bind("click", function(){

        if($("#content_pop_search").css("display") == "block"){

            $("#content_pop_search").css("display","none");
            $("#content_pop_list").css("display","block");$("#header_title span").attr("class","search_open");
            $("#header_title span").attr("class","search_open");
        } else if($("#content_pop_list").css("display")=="block"){
            $("#header_title span").attr("class","search_close");
            contentSearch();
        }

    });
    if (options.autoBind) {
        $("#custNm").val(options.custNm);
        $("#btnSearch").click();
        //console.log("asdf : ",document.getElementById("comonPopupList").contentWindow.listViewClick());

    }
});
</script>

<script>

//팝업 레이어닫기

function goMain() {
  //window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
    parent.popupWindow.close();
}


//목록페이지 보기 (고객)
function contentList() {
  $("#content_pop_search").css("display","none");
  $("#content_pop_list").css("display","block");$("#header_title span").attr("class","search_open");
  document.getElementById("comonPopupList").contentWindow.document.location.reload(); // 목록 iframe 새로고침
  setTimeout(function(){ setPopUpListObjHeight("content_pop_list");}, 200);
}

//검색페이지 보기(고객)
function contentSearch() {
  $("#content_pop_list").css("display","none");
  //$("#content_detail").css("display","none");
  $("#content_pop_search").css("display","block");
}

// 팝업 설정값
var options = parent.popupWindow.options.content.data;


function contentCommonDetail(dataItem) {
    setDataItem = dataItem;
}

//선택 버튼.
$("#btnSelect").kendoButton({
    click:function(e){
        if(setDataItem != null) {
            options.callbackFunc(setDataItem);
            parent.popupWindow.close();
        }
    }
});


function contentSearchCheck(){
    if ($("#custSearchTabDiv").css("display") == "block") { contentSearch(); }
    if ($("#carInfoSearchTabDiv").css("display") == "block") { contentSearch2(); }
}



</script>