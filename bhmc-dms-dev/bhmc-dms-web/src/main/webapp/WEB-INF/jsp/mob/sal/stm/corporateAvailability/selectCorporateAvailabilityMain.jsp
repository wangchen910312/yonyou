<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />
    <section id="content">
        <!-- content_list -->
        <section id="content_list">
            <div class="content_title conttitlePrev">
                <h2 id="content_list_title"><spring:message code="sal.lbl.corporateAvailabilityList" /><!-- 법인재고현황 목록 --></h2>
            </div>

            <div class="skeyarea">
                <div>
                    <table class="slist01">
                        <colgroup>
                            <col style="width:35%;">
                            <col style="">
                        </colgroup>
                        <tbody>
                             <tr id="search1Area">
                                <th scope="row"><span><spring:message code="global.lbl.carLine" /><!-- 차종 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /><!-- 삭제 --></span></td>
                            </tr>
                            <tr id="search2Area">
                                <th scope="row"><span><spring:message code="global.lbl.model" /><!-- 모델 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /><!-- 삭제 --></span></td>
                            </tr>
                            <tr id="search3Area">
                                <th scope="row"><span><spring:message code="global.lbl.ocn" /><!-- OCN --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /><!-- 삭제 --></span></td>
                            </tr>
                            <tr id="search4Area">
                                <th scope="row"><span><spring:message code="global.lbl.extColor" /><!-- 외장색 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /><!-- 삭제 --></span></td>
                            </tr>
                            <tr id="search5Area">
                                <th scope="row"><span><spring:message code="global.lbl.intColor" /><!-- 내장색 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /><!-- 삭제 --></span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="listarea">
                <div class="dlistitem listhead">
                    <span style="width:100%"><spring:message code="global.lbl.ocn" /><!-- OCN --></span>
                    <span style="width:30%"  class="clboth"><spring:message code='global.lbl.extColor' /><!-- 외장색 --></span>
                    <span style="width:30%"><spring:message code='global.lbl.intColor' /><!-- 내장색 --></span>
                    <span style="width:40%"><spring:message code='ser.lbl.qty' /><!-- 수량 --></span>
                </div>
                <iframe id="mainList" border="0" frameborder="0" width="100%" height="300"></iframe>
                <div class="dlistitem bgNone" style="display:none;" id="listarea_noData"><span></span></div>
            </div>
        </section>


        <!-- content_search -->
        <section id="content_search" class="content_search" style="display:none;">
            <div class="content_title conttitlePrev">
                <h2><spring:message code="sal.lbl.corporateAvailabilitySearch" /><!-- 법인재고현황조회조건   --></h2>
            </div>
           <div class="formarea">
                <table class="flist01">
                    <caption></caption>
                    <colgroup>
                        <col style="width:30%;">
                        <col style="">
                    </colgroup>
                     <tbody>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.carLine' /><!-- 차종 --></th>
                                <td>
                                    <div class="f_text"><input type="text" name="sCarlineCd" id="sCarlineCd" class="form_comboBox" style="width:100%"></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.model' /><!-- 모델 --></th>
                                <td>
                                    <div class="f_text"><input type="text" name="sModelCd" id="sModelCd" class="form_comboBox" style="width:100%"></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.ocn' /><!-- OCN --></th>
                                <td>
                                    <div class="f_text"><input type="text" name="sOcnCd" id="sOcnCd" class="form_comboBox" style="width:100%"></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.extColor' /><!-- 외장색 --></th>
                                <td>
                                    <div class="f_text"><input type="text" name="sExtColorCd" id="sExtColorCd" class="form_comboBox" style="width:100%"></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.intColor' /><!-- 내장색 --></th>
                                <td>
                                    <div class="f_text"><input type="text" name="sIntColorCd" id="sIntColorCd" class="form_comboBox" style="width:100%"></div>
                                </td>
                            </tr>

                        </tbody>
                </table>
            </div>
            <div class="con_btnarea">
                <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
            </div>
        </section>

    </section>
    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>



<!-- script -->
<script>
var dateFormat =  '<dms:configValue code="dateFormat" />';
var toDate,
    gCrud;

toDate = new Date();


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
        default :
            break;
    }

    obj.find("span[name='searchStr']").text("");
    setSearchBox();
    contentList();
});



function setSearchBox(){

    var sCarlineCd     = $("#sCarlineCd").data("kendoExtDropDownList").value();
    var sModelCd       = $("#sModelCd").data("kendoExtDropDownList").value();
    var sOcnCd         = $("#sOcnCd").data("kendoExtDropDownList").value();
    var sExtColorCd    = $("#sExtColorCd").data("kendoExtDropDownList").value();
    var sIntColorCd    = $("#sIntColorCd").data("kendoExtDropDownList").value();

    if(sCarlineCd == "" && sModelCd == "" && sOcnCd == "" && sExtColorCd == "" && sIntColorCd == ""){
        $(".skeyarea").hide();
    }else{
        $(".skeyarea").show();
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

    }
}

/**
 * 차종 콤보
 */
 var carLineCdList = [];
 var carLineCdArr = [];
 <c:forEach var="obj" items="${carLineCdInfo}">
  carLineCdList.push({"carlineNm":"${obj.carlineCdNm}", "carlineCd":"${obj.carlineCd}"});
  carLineCdArr["${obj.carlineCd}"] = "${obj.carlineCdNm}"
 </c:forEach>
 var modelCdList = [];
 var modelCdArr;
 var ocnCdList = [];
 var extColorList = [];
 var intColorList = [];

// 하치장 SAL152
 var vinmVlocObj = {};
 <c:forEach var="obj" items="${vinmVlocDS}">
     vinmVlocObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
 </c:forEach>


var searchClickFl = false;
$(document).ready(function() {
    /**
     * 차종 콤보박스
     */
     $("#sCarlineCd").kendoExtDropDownList({
         dataTextField:"carlineNm"
        ,dataValueField:"carlineCd"
        ,dataSource:carLineCdList
        ,select:onSelectCarlineCd
        ,optionLabel:"<spring:message code='global.lbl.all' />"           //전체
     });
     /**
     * 모델 콤보박스
     */
     $("#sModelCd").kendoExtDropDownList({
         dataTextField:"modelCdNm"
        ,dataValueField:"modelCd"
        ,select:onSelectModelCd
        ,optionLabel:"<spring:message code='global.lbl.all' />"           //전체
     });

     /**
     * OCN 콤보박스
     */
     $("#sOcnCd").kendoExtDropDownList({
         dataTextField:"ocnCdNm"
        ,dataValueField:"ocnCd"
            ,optionLabel:"<spring:message code='global.lbl.all' />"           //전체
     });

     /**
     * 외장색 콤보박스
     */
     $("#sExtColorCd").kendoExtDropDownList({
         dataTextField:"extColorNm"
        ,dataValueField:"extColorCd"
        ,select:onSelectExtColorCd
        ,optionLabel:"<spring:message code='global.lbl.all' />"           //전체
     });

     /**
     * 내장색 콤보박스
     */
     $("#sIntColorCd").kendoExtDropDownList({
         dataTextField:"intColorNm"
        ,dataValueField:"intColorCd"
        ,optionLabel:"<spring:message code='global.lbl.all' />"           //전체
     });

     /**
     * 차종에 따른 모델 조회
     */
     function onSelectCarlineCd(e) {

         var responseJson = dms.ajax.getJson({
             url:"<c:url value='/sal/veh/vehicleSpec/selectVehicleSpecModelList.do'/>"
             ,data:JSON.stringify({"carlineCd":this.dataItem(e.item).carlineCd})
             ,async:false
         });

         $("#sModelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
         $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
         $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
         $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
     };
     /**
     * 모델에 따른 OCN 조회
     */
     function onSelectModelCd(e) {

         var responseOcnCdJson = dms.ajax.getJson({
             url:"<c:url value='/sal/veh/modelPackage/selectModelPackageOcn.do'/>"
             ,data:JSON.stringify({"sCarlineCd":$("#sCarlineCd").val(), "sModelCd":this.dataItem(e.item).modelCd})
             ,async:false
         });

         $("#sOcnCd").data("kendoExtDropDownList").setDataSource(responseOcnCdJson.data);

         var responseExtColorCdJson = dms.ajax.getJson({
             url:"<c:url value='/sal/cnt/contract/selectExtColor.do'/>"
             ,data:JSON.stringify({"modelCd":this.dataItem(e.item).modelCd})
             ,async:false
         });

         $("#sExtColorCd").data("kendoExtDropDownList").setDataSource(responseExtColorCdJson.data);
         $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
     };

     /**
      * 외장색에 따른 내장색 조회
      */
      function onSelectExtColorCd(e) {

          var responseJson = dms.ajax.getJson({
              url:"<c:url value='/sal/cnt/contract/selectIntColor.do'/>"
              ,data:JSON.stringify({"modelCd":this.dataItem(e.item).modelCd})
              ,async:false
          });

          $("#sIntColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
      };

    function initPage(){
        /* if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        }
        partsJs.validate.groupObjAllDataInit();
        gCrud = 'C'; */
        $(".skeyarea").hide();
    }

    function fnChkDateValue(e){
        var chkDateValue = dms.string.checkDate($(this),$(this).val(),'date');
        if(!chkDateValue.result){
            var chkArgs = chkDateValue.resultArgs;
            if(dms.string.isEmpty(chkArgs)){
                mob.notification.warning("<spring:message code='global.err.checkDateValue' />");
            }else{
                mob.notification.warning("<spring:message code='global.err.checkDateExceedParam' arguments='" + chkArgs + "'/>");
            }
            $(this).data("kendoExtMaskedDatePicker").val('');
        }else{
            $(this).data("kendoExtMaskedDatePicker").val(new Date(chkDateValue.resultMsg));
        }

    }

    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code='sal.title.corporateAvailability' />"); //법인재고현황
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    // 목록 조회
    $("#mainList").attr("src", "<c:url value='/mob/sal/stm/corporateAvailability/selectCorporateAvailabilityList.do' />");

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {

            //mob.notification.warning("<spring:message code='sal.info.functionDeveloping' />");
             var sCarlineCd     = $("#sCarlineCd").data("kendoExtDropDownList").text();
            var sModelCd       = $("#sModelCd").data("kendoExtDropDownList").text();
            var sOcnCd         = $("#sOcnCd").data("kendoExtDropDownList").text();
            var sExtColorCd    = $("#sExtColorCd").data("kendoExtDropDownList").text();
            var sIntColorCd    = $("#sIntColorCd").data("kendoExtDropDownList").text();

            if(sCarlineCd != "") $("#search1Area span[name='searchStr']").text(sCarlineCd);
            if(sModelCd != "") $("#search2Area span[name='searchStr']").text(sModelCd);
            if(sOcnCd != "") $("#search3Area span[name='searchStr']").text(sOcnCd);
            if(sExtColorCd != "") $("#search4Area span[name='searchStr']").text(sExtColorCd);
            if(sIntColorCd != "") $("#search5Area span[name='searchStr']").text(sIntColorCd);

            searchClickFl = true;
            setSearchBox();
            contentList(); 


        }
    });



    // 버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentListNonRefresh(); }
        else if ($("#content_detail").css("display") == "block") { contentListNonRefresh(); }
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
</script>

<script>
//메인화면 가기
function goMain() {
  window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
}

//목록페이지 보기
function contentList() {
  $("#content_search").css("display","none");
  $("#content_list").css("display","block");$("#header_title span").attr("class","search_open");
  //$("iframe").get(0).contentDocument.location.reload(); // 목록 iframe 새로고침
  document.getElementById("mainList").contentWindow.document.location.reload(); // 목록 iframe 새로고침
    setTimeout(function(){ setMainListHeight();}, 200);
}

//검색페이지 보기
function contentSearch() {
  $("#content_list").css("display","none");
  $("#content_search").css("display","block");
}

</script>