<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="ser.title.monthlyInvoice" /></h1><!-- 월별 INVOICE -->
        <div class="btn_right">
            <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
        </div>
    </div>
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:20%;">
                <col style="width:70%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.invcMon" /></th> <!-- 확정월 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input type="text" id="sFromDt" class="form_monthpicker ac" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input type="text" id="sToDt" class="form_monthpicker ac"/>
                            </div>
                        </div>
                    </td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 인보이스 목록 -->
    <div>
        <div class="table_grid mt10">
            <div id="gridMaster" class="grid"></div>
        </div>
    </div>
<form id="invcForm">
    <!-- 인보이스 목록-->
    <div class="table_form mt10">
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
                <col style="width:15%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.invcNo" /></th><!-- INVOICE NO. -->
                    <td>
                        <input type="text" id="invcNo" name="invcNo" readonly class="form_input al form_readonly" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.confirmLbrAmt" /></th><!-- 공임금액 -->
                    <td>
                        <input type="text" id="confirmLbrAmt" name="confirmLbrAmt" value="0" readonly class="form_numeric ar form_readonly"/>
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.invcClaimCnt" /></th><!-- 대상건수 -->
                    <td>
                        <input type="text" id="invcClaimCnt" name="invcClaimCnt" value="0" readonly class="form_numeric ar form_readonly"/>
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.confirmItemAmt" /></th><!-- 부품금액 -->
                    <td>
                        <input type="text" id="confirmItemAmt" name="confirmItemAmt" value="0" readonly class="form_numeric ar form_readonly"/>
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.reqAmt" /></th><!-- 청구금액 -->
                    <td>
                        <input type="text" id="claimReqAmt" name="claimReqAmt" value="0" readonly class="form_numeric ar form_readonly"/>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.confirmSubAmt" /></th><!-- 외주금액 -->
                    <td>
                        <input type="text" id="confirmSubAmt" name="confirmSubAmt" value="0" readonly class="form_numeric ar form_readonly"/>
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.ddctTotAmt" /></th><!-- 공제금액(-) -->
                    <td>
                        <input type="text" id="ddctTotAmt" name="ddctTotAmt" value="0" readonly class="form_numeric ar form_readonly"/>
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.invcClaimTotAmt" /></th><!-- 확정금액 -->
                    <td>
                        <input type="text" id="invcClaimTotAmt" name="invcClaimTotAmt" value="0" readonly class="form_numeric ar form_readonly"/>
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.confirmTotAmt" /></th><!-- 계산 합계 -->
                    <td>
                        <input type="text" id="confirmTotAmt" name="confirmTotAmt" value="0" readonly class="form_numeric ar form_readonly"/>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</form>
    <!-- 인보이스 상세 목록 -->
    <div>
        <div class="table_grid mt10">
            <div id="gridDetail" class="grid"></div>
        </div>
    </div>
    <!-- 인보이스 상세 목록-->

    <!-- 인보이스 공제 목록 -->
    <div>
        <div class="table_grid mt10">
            <div id="gridDeduct" class="grid"></div>
        </div>
    </div>
    <!-- 인보이스 공제 목록-->
</section>


<!-- script -->
<script>
    $(document).ready(function() {

        /**클레임유형**/
        var claimTpList = [];
         <c:forEach var ="obj" items="${claimTpDs}">
         claimTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         </c:forEach>

         var claimTpMap = dms.data.arrayToMap(claimTpList , function(obj){return obj.cmmCd;});

         $("#sClaimTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
             ,dataValueField:"cmmCd"
             ,dataSource:claimTpList
             ,optionLabel:" "
             ,index:0
         });

         setClaimTpMap = function(value){
             var resultVal = "";
             if( dms.string.strNvl(value) != ""){
                if(claimTpMap[value] != undefined)
                 resultVal =  claimTpMap[value].cmmCdNm;
             }
             return resultVal;
         };

         /** 공임금액 **/
         $("#confirmLbrAmt").kendoExtNumericTextBox({
              min:0
             ,format:"n2" //"{0:##,###}"
             ,value :0.00
             ,spinners:false             // 증,감 화살표
           });
         /** 대상건수 **/
         $("#invcClaimCnt").kendoExtNumericTextBox({
              min:0
             ,format:"n0" //"{0:##,###}"
             ,value :0
             ,spinners:false             // 증,감 화살표
           });
         /** 부품금액 **/
         $("#confirmItemAmt").kendoExtNumericTextBox({
              min:0
             ,format:"n2" //"{0:##,###}"
             ,value :0.00
             ,spinners:false             // 증,감 화살표
           });
         /** 청구금액 **/
         $("#claimReqAmt").kendoExtNumericTextBox({
              min:0
             ,format:"n2" //"{0:##,###}"
             ,value :0.00
             ,spinners:false             // 증,감 화살표
           });
         /** 외주금액**/
         $("#confirmSubAmt").kendoExtNumericTextBox({
              min:0
             ,format:"n2" //"{0:##,###}"
             ,value :0.00
             ,spinners:false             // 증,감 화살표
           });
         /** 공제금액(-) **/
         $("#ddctTotAmt").kendoExtNumericTextBox({
              min:0
             ,format:"n2" //"{0:##,###}"
             ,value :0.00
             ,spinners:false             // 증,감 화살표
           });
         /** 확정금액 **/
         $("#invcClaimTotAmt").kendoExtNumericTextBox({
              min:0
             ,format:"n2" //"{0:##,###}"
             ,value :0.00
             ,spinners:false             // 증,감 화살표
           });
         /** 계산합계 **/
         $("#confirmTotAmt").kendoExtNumericTextBox({
              min:0
             ,format:"n2" //"{0:##,###}"
             ,value :0.00
             ,spinners:false             // 증,감 화살표
           });

     // ********************** 데이터 format 세팅 **********************
        /**조회조건 시작일자 **/
        $("#sFromDt").kendoExtMaskedDatePicker({
            format:"yyyy-MM"
            ,start:"year"
            ,depth:"year"
            ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:"${sFromDt}"
        });




       /**조회조건 종료일자**/
        $("#sToDt").kendoExtMaskedDatePicker({
            format:"yyyy-MM"
            ,start:"year"
            ,depth:"year"
            ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:"${sToDt}"
        });





        chageDate = function(toDt){
            //var fromVal = $("#sFromDt").data("kendoExtMaskedDatePicker").value();
            var yy = kendo.toString(kendo.parseDate(toDt), "yyyy");
            var mm = kendo.toString(kendo.parseDate(toDt), "MM");
            var dd = kendo.toString((new Date(yy ,mm ,0)).getDate());
            var toDt = kendo.parseDate(yy+"-"+mm+"-"+dd);

            return toDt;


        };


        /********************** 버튼  설정 ***************************/
        /** 조회 버튼**/
        $("#btnSearch").kendoButton({
            click:function(e){

                $("#gridMaster").data("kendoExtGrid").dataSource.read();
                initAll();
            }
        });



        /** 초기화 **/
        initAll = function(e){

            $("#invcForm").get(0).reset();
            $("#gridDetail").data("kendoExtGrid").dataSource.data([]);
            $("#gridDeduct").data("kendoExtGrid").dataSource.data([]);

        }


        $("#gridMaster").kendoExtGrid({
            gridId:"G-SER-0818-172101"
            ,dataSource:{
                transport:{
                       read :{
                           url:"<c:url value='/ser/wac/invoice/selectInvoiceMonthlyMains.do' />"
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

                             var sToDt =  $("#sToDt").data("kendoExtMaskedDatePicker").value();

                             params["sFromDt"] = $("#sFromDt").data("kendoExtMaskedDatePicker").value();
                             params["sToDt"]   = chageDate(sToDt);

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
                           ,invcDt:{type:"date" } //인보이스일자
                           ,invcNo:{type:"string" }//인보이스번호
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
            ,change:function (e){
                var selectedVal = this.dataItem(this.select());

                $("#invcNo").val(selectedVal.invcNo);
                $("#confirmLbrAmt").data("kendoExtNumericTextBox").value(selectedVal.confirmLbrAmt);
                $("#invcClaimCnt").data("kendoExtNumericTextBox").value(selectedVal.invcClaimCnt);
                $("#confirmItemAmt").data("kendoExtNumericTextBox").value(selectedVal.confirmItemAmt);
                $("#claimReqAmt").data("kendoExtNumericTextBox").value(selectedVal.claimReqAmt);
                $("#confirmSubAmt").data("kendoExtNumericTextBox").value(selectedVal.confirmSubAmt);
                $("#ddctTotAmt").data("kendoExtNumericTextBox").value(selectedVal.ddctTotAmt);
                $("#invcClaimTotAmt").data("kendoExtNumericTextBox").value(selectedVal.invcClaimTotAmt);
                $("#confirmTotAmt").data("kendoExtNumericTextBox").value(selectedVal.confirmTotAmt);


                $("#gridDetail").data("kendoExtGrid").dataSource._destroyed = [];
                $("#gridDeduct").data("kendoExtGrid").dataSource._destroyed = [];
                $("#gridDetail").data("kendoExtGrid").dataSource.read();
                $("#gridDeduct").data("kendoExtGrid").dataSource.read();


            }
            ,columns:[
                        {field:"rnum",title:"<spring:message code='ser.lbl.no' />", width:80,sortable:false, attributes:{"class":"ac"}}
                       ,{field:"invcNo",title:"<spring:message code='ser.lbl.invcNo' />", width:200,sortable:false, attributes :{"class":"al"}}
                       ,{field:"invcClaimTotAmt",title:"<spring:message code='ser.lbl.invcClaimTotAmt' />", width:250, attributes :{"class":"ar"} , format:"{0:n2}"}
                       ,{field:"ddctTotAmt",title:"<spring:message code='ser.lbl.ddctTotAmt' />", width:250, attributes :{"class":"ar"} , format:"{0:n2}"}
                       ,{field:"confirmTotAmt",title:"<spring:message code='ser.lbl.confirmTotAmt' />", width:250, attributes :{"class":"ar"} , format:"{0:n2}"}
                     ]

        });

        $("#gridDetail").kendoExtGrid({
            gridId:"G-SER-0818-172102"
            ,dataSource:{
                transport:{
                       read :{
                           url:"<c:url value='/ser/wac/invoice/selectInvoiceMonthlyDetail.do' />"
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

                             params["sInvcNo"] = $("#invcNo").val();


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
                           ,invcNo:{type:"string" } //인보이스번호
                           ,judgDt:{type:"date" }//판정일자
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
                       ,{field:"roDocNo",title:"<spring:message code='ser.lbl.roDocNo' />", width:150,sortable:false, attributes :{"class":"al"}}
                       ,{field:"claimDocNo",title:"<spring:message code='ser.lbl.claimNo' />", width:150,sortable:false, attributes :{"class":"al"}}
                       ,{field:"claimTp",title:"<spring:message code='ser.lbl.claimTp' />", width:100
                           ,attributes :{"class":"ac"}
                           ,template:"#=setClaimTpMap(claimTp)#"

                       }
                       ,{field:"vinNo",title:"<spring:message code='ser.lbl.vinNo' />", width:200, attributes :{"class":"ar"} , format:"{0:n2}"}
                       ,{field:"judgDt",title:"<spring:message code='ser.lbl.judgDt' />", width:150
                           , attributes :{"class":"ac"}
                           , format:"{0:<dms:configValue code='dateFormat' />}"
                       }
                       ,{field:"confirmTotAmt",title:"<spring:message code='ser.lbl.confirmTotAmt' />", width:150, attributes :{"class":"ar"} , format:"{0:n2}"}
                       ,{field:"confirmLbrAmt",title:"<spring:message code='ser.lbl.confirmLbrAmt' />", width:150, attributes :{"class":"ar"} , format:"{0:n2}"}
                       ,{field:"confirmItemAmt",title:"<spring:message code='ser.lbl.confirmItemAmt' />", width:150, attributes :{"class":"ar"} , format:"{0:n2}"}
                       ,{field:"confirmSubAmt",title:"<spring:message code='ser.lbl.confirmSubAmt' />", width:150, attributes :{"class":"ar"} , format:"{0:n2}"}
                     ]

        });

        $("#gridDeduct").kendoExtGrid({
            gridId:"G-SER-0818-172103"
            ,dataSource:{
                transport:{
                       read :{
                           url:"<c:url value='/ser/wac/invoice/selectInvoiceMonthlyDeduct.do' />"
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

                             params["sInvcNo"] = $("#invcNo").val();


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
                           ,invcNo:{type:"string" } //인보이스번호
                           ,ddctNo:{type:"string" } //공제번호
                           ,ddctReasonCd:{type:"string" }//공제사유코드
                           ,ddctReasonCont:{type:"string" }//공제사유명
                           ,ddctAmt:{type:"number" }//공제금액
                           ,claimDocNo:{type:"string" }//클레임번호 */
                           ,ddctReqDt:{type:"date" }//공제일자
                         }

                     }//model
               }//schema
            }//dataSource
            ,editable:false
            ,pageable:false
            ,scrollable:true
            ,autoBind:false
            ,sortable:false
            ,selectable:"row"
            ,height:170
            ,filterable:false                 // 필터링 기능 사용안함
            ,appendEmptyColumn:true
            ,columns:[
                        {field:"rnum",title:"<spring:message code='ser.lbl.no' />", width:50,sortable:false, attributes:{"class":"ac"}}
                       ,{field:"ddctNo",title:"<spring:message code='ser.lbl.ddctNo' />", width:100,sortable:false, attributes :{"class":"al"}}
                       ,{field:"ddctReasonCd",title:"<spring:message code='ser.lbl.ddctReasonCd' />", width:100,sortable:false, attributes :{"class":"al"}}
                       ,{field:"ddctReasonCont",title:"<spring:message code='ser.lbl.ddctReasonNm' />", width:300, attributes :{"class":"ar"} }
                       ,{field:"claimDocNo",title:"<spring:message code='ser.lbl.claimNo' />", width:150, attributes :{"class":"ar"} }
                       ,{field:"ddctAmt",title:"<spring:message code='ser.lbl.deductionAmt' />", width:150, attributes :{"class":"ar"} , format:"{0:n2}"}
                       ,{field:"ddctReqDt",title:"<spring:message code='ser.lbl.judgDt' />", width:100
                           , attributes :{"class":"ac"}
                           , format:"{0:<dms:configValue code='dateFormat' />}"
                       }
                     ]

        });

        $(".tab_area").kendoExtTabStrip({
            animation:false
        });
    });
</script>
<!-- //script -->
