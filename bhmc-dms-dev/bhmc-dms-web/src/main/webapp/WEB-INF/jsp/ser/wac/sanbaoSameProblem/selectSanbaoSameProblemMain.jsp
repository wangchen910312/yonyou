<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!--  //khskhs  문제시 삭제 -->
<%@ page import="org.springframework.mobile.device.Device" %>
<%@ page import="org.springframework.mobile.device.DeviceUtils" %>
<c:set var="isTablet" value="<%=DeviceUtils.getCurrentDevice(request).isTablet()|| DeviceUtils.getCurrentDevice(request).isMobile()%>" />
<!-- //khskhs  문제시 삭제 -->

<!-- 현황 -->
<div id="resizableContainer">
    <div class="content">
        <section class="group">
            <div class="header_area">
                <h1 class="title_basic"></h1>
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-12126" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
                    </dms:access>
                </div>
            </div>
            <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:24%;">
                        <col style="width:10%;">
                        <col style="width:23%;">
                        <col style="width:10%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code='ser.lbl.searchYm' /></th><!-- 조회년월 -->
                            <td>
                                <input id="sFromDt" class="form_datepicker ac"/>
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.itemGrp' /></th><!-- 부품그룹 -->
                            <td>
                                <input type="text" id="sItemGrpCd" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.itemAtc' /></th><!-- 분류항목 -->
                            <td>
                                <input type="text" id="sItemAtcCd" class="form_input" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='ser.lbl.occrCnt' /></th><!-- 발생횟수 -->
                            <td>
                                <input type="text" id="sOccrCnt" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.vinNo' /></th><!-- VIN번호 -->
                            <td>
                                <input type="text" id="sVinNo" class="form_input">
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.salDlrCd' /></th><!-- 판매딜러 -->
                            <td>
                                <input type="text" id="sDlrCd" class="form_input">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="table_grid mt10">
                <div id="gridItem" class="grid"></div>
            </div>
            <form id="sanbaoListForm">
                <section class="group">
                    <div class="table_form form_width_100per mt10">
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
                                    <th scope="row"><spring:message code='ser.lbl.salDlrCd' /></th><!-- 판매딜러 -->
                                    <td colspan="3">
                                        <div class="form_float">
                                            <div class="form_left" style="width:37.5%">
                                                <input type="text" value="" id="saleDlrCd" name="saleDlrCd" readonly class="form_input form_readonly">
                                            </div>
                                            <div class="form_right" style="width:62.5%"><input type="text" id="saleDlrNm" name="saleDlrNm" value="" readonly class="form_input form_readonly" ></div>
                                        </div>
                                    </td>
                                    <th scope="row"><spring:message code='ser.lbl.sanbaoRemainPrid' /></th><!-- 삼포잔여기간 -->
                                    <td>
                                        <div class="form_float">
                                            <div class="form_left"  style="width:50%">
                                                <input type="text" value="" id="sanbaoRemainDay" name="sanbaoRemainDay" readonly class="form_input ar form_readonly">
                                            </div>
                                            <div class="form_right"  style="width:50%">
                                                <input type="text" value="" id="sanbaoWartPrid" name="sanbaoWartPrid" readonly class="form_input ar form_readonly">
                                            </div>
                                        </div>
                                    </td>
                                    <th scope="row"><spring:message code='ser.lbl.totWorkDay' /></th><!-- 총작업소요일 -->
                                    <td>
                                        <input type="text" value="" id="workDay" name="workDay" readonly class="form_input ar form_readonly">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code='ser.lbl.creDt' /></th><!-- 생산일자 -->
                                    <td>
                                        <input type="text" value="" id="creDt" name="creDt" readonly class="form_datepicker ac form_readonly">
                                    </td>
                                    <th scope="row"><spring:message code='ser.lbl.saleDt' /></th><!-- 판매일자 -->
                                    <td>
                                        <input type="text" value="" id="saleDt" name="saleDt" readonly class="form_datepicker ac form_readonly">
                                    </td>
                                    <th scope="row"><spring:message code='ser.lbl.wartDt' /></th><!-- 보증일자 -->
                                    <td>
                                        <input type="text" value="" id="wartDt" name="wartDt" readonly class="form_datepicker ac form_readonly">
                                    </td>
                                    <th scope="row"><spring:message code='ser.lbl.accuDrivDis' /></th><!-- 최종주행거리 -->
                                    <td>
                                        <input type="text" value="" id="runDistVal" name="runDistVal" readonly class="form_numeric ar form_readonly">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="table_grid mt10">
                        <div id="gridCust" class="grid"></div>
                    </div>

                    <div class="table_grid mt10">
                        <div id="gridClaim" class="grid"></div>
                    </div>
                </section>
                <input type="hidden" id="vinNo" name="vinNo" />
                <input type="hidden" id="dlrCd" name="dlrCd" />
            </form>
        </section>
    </div>
</div>
<!-- //현황 -->
<!-- script -->
<script>

$(document).ready(function() {


  //공통코드:부품그룹코드
  var itemGrpList = [];
  <c:forEach var="obj" items="${itemGrpDs}">
  itemGrpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
  </c:forEach>

  var itemGrpMap = dms.data.arrayToMap(itemGrpList, function(obj){return obj.cmmCd;});

  setItemGrpNm = function(value){

      var strNm = "";
      if( dms.string.strNvl(value) != ""){
          if(itemGrpMap[value] != undefined)
              strNm =  itemGrpMap[value].cmmCdNm;
      }
      return strNm;
  };

  /**클레임유형**/
  var claimTpList = [];
   <c:forEach var ="obj" items="${claimTpDs}">
   claimTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
   </c:forEach>

   var claimTpMap = dms.data.arrayToMap(claimTpList , function(obj){return obj.cmmCd;});

   setClaimTpMap = function(value){
       var resultVal = "";
       if( dms.string.strNvl(value) != ""){
          if(claimTpMap[value] != undefined)
           resultVal =  claimTpMap[value].cmmCdNm;
       }
       return resultVal;
   };


    /**조회조건 시작일자 **/
    $("#sFromDt").kendoExtMaskedDatePicker({
        //format:"<dms:configValue code='dateFormat' />"
         format:"yyyy-MM"
        ,start:"year"
        ,depth:"year"
        //,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sFromDt}"
    });

    $("#creDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#saleDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#wartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#runDistVal").kendoExtNumericTextBox({
        min:0
       ,format:"n0" //"{0:##,###}"
       ,spinners:false             // 증,감 화살표

     });


   $("#btnSearch").kendoButton({

       click:function(e){

           $("#gridItem").data("kendoExtGrid").dataSource.page(1);

       }
   });

   initAll = function(){

       $("#sanbaoListForm").get(0).reset();
       $("#gridCust").data("kendoExtGrid").dataSource.data([]);
       $("#gridClaim").data("kendoExtGrid").dataSource.data([]);

   }
    /** 조회 결과값  세팅**/
    setResultDataSetting =  function (result){
       // initFieldClear();
        $("#saleDlrCd").val(result["saleDlrCd"]);
        $("#saleDlrNm").val(result["saleDlrNm"]);
        $("#sanbaoRemainDay").val(result["sanbaoRemainDay"]);
        $("#sanbaoWartPrid").val( result["sanbaoWartPrid"] *365 );
        $("#workDay").val(result["workDay"]);
        $("#vinNo").val(result["vinNo"]);
        $("#saleDt").data("kendoExtMaskedDatePicker").value(result["saleDt"]);
        $("#creDt").data("kendoExtMaskedDatePicker").value(result["creDt"]);
        $("#wartDt").data("kendoExtMaskedDatePicker").value(result["wartDt"]);
        $("#dlrCd").val(result["dlrCd"]);
        $("#runDistVal").data("kendoExtNumericTextBox").value(result["runDistVal"]);

    };

   //동일부품
    $("#gridItem").kendoExtGrid({
        gridId:"G-SER-1220-000001"
        ,dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/wac/sanbaoSameProblem/selectSanbaoItems.do' />"
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

                         params["sFromDt"] = $("#sFromDt").data("kendoExtMaskedDatePicker").value();
                         params["sVinNo"] = $("#sVinNo").val();
                         params["sItemGrpCd"] = $("#sItemGrpCd").val();
                         params["sItemAtcCd"] = $("#sItemAtcCd").val();
                         params["sDlrCd"] = $("#sDlrCd").val();
                         params["sOccrCnt"] = $("#sOccrCnt").val();


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
                        rnum:{type:"number" }
                       ,itemGrpCd:{type:"string" }
                       ,dlrCd:{type:"string" }
                       ,vinNo:{type:"string" }
                    }
                 }//model
           }//schema
        }//dataSource
        //,scrollable:false
        ,height:200
        ,editable:false
        ,sortable:false
        ,selectable:"row"
        ,appendEmptyColumn:true
        /*
        ,autoBind:true

        */
        ,change:function (e){

            var selectedVal = this.dataItem(this.select());

            var dlrCd = selectedVal.dlrCd;
            var vinNo = selectedVal.vinNo;

            var params = {};
            params["sVinNo"] = selectedVal.vinNo;
            params["sDlrCd"] = selectedVal.dlrCd;


            $.ajax({
                url:"<c:url value='/ser/wac/sanbaoSameProblem/selectSanbaoAlarmInfoByKey.do' />"
               ,data:JSON.stringify(params)
               ,type:"POST"
               ,dataType:"json"
               ,contentType:"application/json"
               ,error:function(jqXHR,status,error) {

                  dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
               }
               ,success:function (result){

                   setResultDataSetting(result);
                   $("#gridCust").data("kendoExtGrid").dataSource.data([]);
                   $("#gridClaim").data("kendoExtGrid").dataSource.data([]);
                   $("#gridCust").data("kendoExtGrid").dataSource.read();
                   $("#gridClaim").data("kendoExtGrid").dataSource.read();
                   //dms.notification.success("<spring:message code='global.info.searchSuccess' />");
                }

            }) ;
        }
        ,columns:[
                    {field:"rnum",title:"<spring:message code='ser.lbl.no' />", width:50,sortable:false, attributes:{"class":"ac"}}
                   ,{field:"dlrCd",title:"<spring:message code='ser.lbl.dlrCd' />", width:80,sortable:false, attributes :{"class":"al"}  }
                   ,{field:"vinNo",title:"<spring:message code='ser.lbl.vinNo' />", width:150, attributes :{"class":"al"} }
                   ,{field:"carlineNm", title:"<spring:message code='ser.lbl.carLine' />" , width:150 , attributes :{"class":"al"}}
                   ,{field:"itemGrpCd",title:"<spring:message code='ser.lbl.itemGrp' />", width:120}
                   ,{field:"itemGrpNm",title:"<spring:message code='ser.lbl.itemGrpNm' />", width:170,attributes :{"class":"al"}}
                   ,{field:"ltsModelNm", title:"<spring:message code='ser.lbl.ltsModelNm' />" , width:180 , attributes :{"class":"al"}}//
                   ,{field:"itemAtcCd", title:"<spring:message code='ser.lbl.itemAtc' />" , width:120 , attributes :{"class":"al"}
                          ,attributes :{"class":"ac"}
                          ,template:"#=setItemGrpNm(itemAtcCd)#"
                  }//
                  ,{field:"sameFauExchTermVal", title:"<spring:message code='ser.lbl.sameFauExchTermVal' />" , width:80 , attributes :{"class":"ar"}, format:"{0:n2}"}//
                  ,{field:"occrCnt", title:"<spring:message code='ser.lbl.sameFauExchCnt' />" , width:80 , attributes :{"class":"ar"}, format:"{0:n0}"}//
                 ]
    });


   //삼포고객정보
    $("#gridCust").kendoExtGrid({
        gridId:"G-SER-1220-000002"
        ,dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/wac/sanbaoSameProblem/selectSanbaoCustInfo.do' />"
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
                         params["sDlrCd"] = $("#dlrCd").val();


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
                        rnum:{type:"number" }
                       ,dlrCd:{type:"string" }
                       ,pwaStatCd:{type:"string" }
                       ,vinNo:{type:"string" }
                       ,pwaDocNo:{type:"string" }
                       ,regDt:{type:"date" }
                    }

                 }//model
           }//schema
        }//dataSource
        ,editable:false
        ,scrollable:true
        ,autoBind:false
        ,sortable:false
        ,selectable:"row"
        ,height:100
        ,filterable:false                 // 필터링 기능 사용안함
        ,appendEmptyColumn:true
        ,columns:[
                   {field:"carOwnerNm",title:"<spring:message code='ser.lbl.custNm' />", width:120,sortable:false, attributes :{"class":"al"} , hidden:true }
                  ,{field:"carOwnerSsnCrnNo",title:"<spring:message code='sal.lbl.ssnCrnNo' />", width:200, attributes :{"class":"al"} }
                  ,{field:"carOwnerHpNo",title:"<spring:message code='ser.lbl.hpNo' />", width:120 ,attributes :{"class":"ac"}}
                  ,{field:"carOwnerTelNo", title:"<spring:message code='ser.lbl.telNo' />" , width:120 , attributes :{"class":"al"}}
                  ,{field:"carOwnerZipCd", title:"<spring:message code='ser.lbl.zipCd' />" , width:120 , attributes :{"class":"al"}}//
                  ,{field:"carOwnerAddr", title:"<spring:message code='ser.lbl.addr' />" , width:350 , attributes :{"class":"al"}}//
                  ,{field:"carOwnerEmailNm", title:"<spring:message code='ser.lbl.email' />" , width:200 , attributes :{"class":"ar"}, format:"{0:n2}"}//

                 ]

    });


   //삼포클레임정보
    $("#gridClaim").kendoExtGrid({
        gridId:"G-SER-1220-000003"
        ,dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/wac/sanbaoSameProblem/selectSanbaoSameProblemClaimInfo.do' />"
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
                         params["sDlrCd"] = $("#dlrCd").val();



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
                        rnum:{type:"number" }
                       ,dlrCd:{type:"string" }
                       ,pwaStatCd:{type:"string" }
                       ,vinNo:{type:"string" }
                       ,pwaDocNo:{type:"string" }
                       ,regDt:{type:"date" }
                    }

                 }//model
           }//schema
        }//dataSource
        ,editable:false
        ,scrollable:true
        ,autoBind:false
        ,sortable:false
        ,selectable:"row"
        ,height:170
        ,filterable:false                 // 필터링 기능 사용안함
        ,appendEmptyColumn:true
        ,columns:[
                    {field:"rnum",title:"<spring:message code='ser.lbl.no' />", width:50,sortable:false, attributes:{"class":"ac"}}
                   ,{field:"dlrCd",title:"<spring:message code='ser.lbl.dlrCd' />", width:80,sortable:false, attributes :{"class":"al"} , hidden:true }
                   ,{field:"roDocNo",title:"<spring:message code='ser.lbl.roDocNo' />", width:150, attributes :{"class":"al"} }
                   ,{field:"claimDocNo",title:"<spring:message code='ser.lbl.claimNo' />", width:150, attributes :{"class":"al"} }
                   ,{field:"claimTp",title:"<spring:message code='ser.lbl.claimTp' />", width:80
                       ,attributes :{"class":"ac"}
                       ,template:"#=setClaimTpMap(claimTp)#"
                     }
                  ,{field:"runDistVal", title:"<spring:message code='ser.lbl.runDist' />" , width:200 , attributes :{"class":"al"}}
                  ,{field:"cauItemCd", title:"<spring:message code='ser.lbl.cauItemCd' />" , width:150 , attributes :{"class":"al"}}//주작업코드
                  ,{field:"cauItemNm", title:"<spring:message code='ser.lbl.cauItemNm' />" , width:150 , attributes :{"class":"al"}}//원인부품
                  ,{field:"cauCd", title:"<spring:message code='ser.lbl.cauCd' />" , width:120 , attributes :{"class":"ar"}, format:"{0:n2}"}//부품금액
                  ,{field:"phenCd", title:"<spring:message code='ser.lbl.phenCd' />" , width:120 , attributes :{"class":"ar"}, format:"{0:n2}"}//공임금액
                 ]

    });
 // tablet 사이즈 맞추는거 khskhs 문제시 삭제
    if(${isTablet}){
        if(window.matchMedia('(max-width:1024px)').matches){
            $(".table_grid").attr("style","width:958px !important; max-width:958px !important");
        }
    }
 // tablet 사이즈 맞추는거 khskhs 문제시 삭제
});
</script>
<!-- //script -->
