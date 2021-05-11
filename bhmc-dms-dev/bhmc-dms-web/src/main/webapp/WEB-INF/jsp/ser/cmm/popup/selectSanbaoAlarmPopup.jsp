<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 삼보알람 팝업 -->
    <form id="sambaoForm">
        <section id="window" class="pop_wrap">
            <div class="table_form table_form_info mt10">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:16%;">
                            <col style="width:15%;">
                            <col style="width:18%;">
                            <col style="width:15%;">
                            <col style="width:18%;">
                            <col style="width:18%;">
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="col"><spring:message code="ser.lbl.gubun" /></th>                        <!-- 구분 -->
                                <th scope="col" colspan="2"><spring:message code="ser.lbl.appyStd" /></th>          <!-- 적용기준 -->
                                <th scope="col" colspan="2"><spring:message code="ser.lbl.sanbaoRemainPrid" /></th> <!-- 삼보잔여기간 -->
                                <th scope="col"><spring:message code="ser.lbl.targYn" /></th>                       <!-- 대상여부 -->
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row" class="ac"><spring:message code="ser.lbl.sanbaoWartPrid" /></th>         <!-- 삼보보증기간 -->
                                <td class="ar" id="sanbaoWartPrid">&nbsp;<spring:message code="ser.lbl.yy" /></td>        <!-- 삼보 보증기간 적용기준 년 -->
                                <td class="ar" id="sanbaoWartRunDistVal">&nbsp; KM</td>                            <!-- 삼보보증기간 적용기준 주행거리-->
                                <td class="ar" id="sanbaoWartRmPrid">&nbsp; <spring:message code="ser.lbl.monday" /></td> <!-- 삼보보증기간 잔여 월-->
                                <td class="ar" id="sanbaoWartRmRunDistVal">&nbsp; KM</td>                                 <!-- 삼보보증기간 잔여 주행거리-->
                                <td class="ar" id="sanbaoWartkYn"></td> <!-- 삼보보증 대상여부 -->
                            </tr>
                            <tr>
                                <th scope="row" class="ac"><spring:message code="ser.lbl.sanbaoNewCar" /></th>           <!-- 신차보증기간 -->
                                <td class="ar" id="newCarWartPrid">&nbsp; <spring:message code="ser.lbl.day" /></td>      <!-- 신차보증기간 적용 일-->
                                <td class="ar" id="newCarWartRunDistVal">&nbsp; KM</td>                                   <!-- 신차보증기간 적용 주행거리-->
                                <td class="ar" id="newCarWartRmPrid">&nbsp; <spring:message code="ser.lbl.day" /></td>    <!-- 신차보증기간 잔여 일-->
                                <td class="ar" id="newCarWartRmRunDistVal">&nbsp KM</td>                                 <!-- 신차보증기간 잔여 주행거리-->
                                <td class="ar" id="newCarWartYn"></td>                <!-- 신차보증기간 대상여부-->
                            </tr>
                            <tr>
                                <th scope="row" class="ac"><spring:message code="ser.lbl.sanbaoWorkrOver" /></th>               <!-- 작업일수 초과 -->
                                <td class="ar" colspan="2" id="workOverPrid">&nbsp; <spring:message code="ser.lbl.day" /></td>   <!-- 작업일수 초과 적용 일-->
                                <td class="ar" colspan="2" id="workOverRmPrid">&nbsp; <spring:message code="ser.lbl.day" /></td> <!-- 작업일수 초과 잔여 일-->
                                <td class="ar" id="workOverYn"></td> <!-- 작업일수 초과 대상여부-->
                            </tr>
                        </tbody>
                    </table>
                </div>

            <div class="header_area btn_none pt0 mt10">
                <h2 class="title_basic"><spring:message code="ser.lbl.sameFauExchHist" /></h2><!-- 동일하자현황 -->
            </div>

            <div class="table_list">
                <div class="table_grid">
                    <div id="grid"></div>
                </div>
            </div>
        </section>

        <input type="hidden" id="vinNo" name="vinNo" />
    </form>
    <!-- //삼보알람 팝업 -->

<!-- script -->
<script>

/** 사용여부 **/
var useYnList = [];
<c:forEach var="obj" items="${useYnDs}">
   useYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var useYnMap = dms.data.arrayToMap(useYnList, function(obj){return obj.cmmCd;});



var itemGrpList = [];
<c:forEach var="obj" items="${itemGrpDs}">
itemGrpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var itemGrpMap = dms.data.arrayToMap(itemGrpList, function(obj){return obj.cmmCd;});


setUseYnCdMap = function(value){
    var resultVal = "";
    if( dms.string.strNvl(value) != ""){
        if(useYnMap[value] != undefined)
        resultVal =  useYnMap[value].cmmCdNm;
    }
    return resultVal;
};

setItemGrpNm = function(value){

    var strNm = "";
    if( dms.string.strNvl(value) != ""){
        if(itemGrpMap[value] != undefined)
            strNm =  itemGrpMap[value].cmmCdNm;
    }
    return strNm;
};


$(document).ready(function() {

    var parentJsonData = parent.sanBaoAlarmPopup.options.content.data;

    /**삼보 보증기간 대상여부**/
   /*  $("#sanbaoWartkYn").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:useYnList

    }); */
    /**신차보증기간 대상여부**/
    /* $("#newCarWartYn").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:useYnList

    });
 */
    /**작업일수초과 대상여부**/
   /*  $("#workOverYn").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:useYnList

    });
 */

    setResult = function (result){

        $("#vinNo").val(result.vinNo);

        $("#sanbaoWartPrid").html( result.sanbaoWartPrid+"&nbsp;<spring:message code='ser.lbl.yy' />");
        $("#sanbaoWartRunDistVal").html(result.sanbaoWartRunDistVal+"&nbsp; KM");
        $("#sanbaoWartRmPrid").html( result.sanbaoWartRmPrid +"&nbsp; <spring:message code='ser.lbl.monday' />");
        $("#sanbaoWartRmRunDistVal").html( result.sanbaoWartRmRunDistVal +"&nbsp; KM");
        $("#sanbaoWartkYn").html(  setUseYnCdMap(result.sanbaoWartYn) );

        $("#newCarWartPrid").html( result.newCarWartPrid +"&nbsp; <spring:message code='ser.lbl.day' />" );
        $("#newCarWartRunDistVal").html( result.newCarWartRunDistVal+"&nbsp; KM" );
        $("#newCarWartRmPrid").html( result.newCarWartRmPrid +"&nbsp; <spring:message code='ser.lbl.day' />");
        $("#newCarWartRmRunDistVal").html( result.newCarWartRmRunDistVal +"&nbsp; KM");
        $("#newCarWartYn").html(setUseYnCdMap(result.newCarWartYn ));

        $("#workOverPrid").html( result.workOverPrid +"&nbsp; <spring:message code='ser.lbl.day' />");
        $("#workOverRmPrid").html( result.workOverRmPrid +"&nbsp; <spring:message code='ser.lbl.day' />");
        $("#workOverYn").html( setUseYnCdMap(result.workOverYn) );

        $("#grid").data("kendoExtGrid").dataSource.read();


    };

    $("#grid").kendoExtGrid({
        gridId:"G-SER-1011-000036"
        ,dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/cmm/popup/selectSanbaoItems.do' />"
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
                         params["sVinNo"] = $("#vinNo").val();

                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                        rnum:{type:"number", editable:false }
                       ,itemGrpCd:{type:"string", editable:false, validation:{required:true} }
                       ,itemGrpNm:{type:"string", validation:{required:true} }
                       ,itemAtcCd:{type:"string", validation:{required:true} }
                       ,sameFauExchTermVal:{type:"number", validation:{required:true} }
                       ,occrCnt:{type:"number", validation:{required:true} }
                       ,itemGrpYn:{type:"string", validation:{required:true} }
                    }

                 }//model
           }//schema
        }//dataSource
        ,autoBind:false
        ,height:205
        ,multiSelectWithCheckbox:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,editable:false
        ,pageable:false
        ,sortable:false
        ,columns:[
                    {field:"itemGrpCd", title:"<spring:message code='ser.lbl.itemGrp' />", width:70, attributes :{"class":"al"}} //부품그룹
                   ,{field:"itemGrpNm", title:"<spring:message code='ser.lbl.itemGrpNm' />", width:100, attributes :{"class":"al"}}//부품그룹명
                   ,{field:"itemAtcCd", title:"<spring:message code='ser.lbl.itemAtc' />", width:100
                       ,attributes :{"class":"al"}
                       ,template:"#=setItemGrpNm(itemAtcCd)#"
                   }//분류항목
                   ,{field:"sameFauExchTermVal", title:"<spring:message code='ser.lbl.sameFauExchTermVal' />", width:50
                       ,attributes :{"class":"ar"}
                       ,format:"{0:n0}"
                   }//동일하자 기준
                   ,{field:"occrCnt", title:"<spring:message code='ser.lbl.occrCnt' />", width:50,attributes :{"class":"ar"}}//발생횟수
                   ,{field:"itemGrpYn", title:"<spring:message code='ser.lbl.targYn' />", width:50, attributes :{"class":"ac"}} //대상여부
                 ]

    });


    setResult(parentJsonData.result);

});
</script>
<!-- //script -->