<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<div id="resizableContainer">  <!--  resizableContainer Div -->
    <!-- 그룹선택 팝업 -->
    <section id="windows" class="pop_wrap">
        <!-- 탭메뉴 -->
        <div id="custSearchTabDiv" class="mt0"> <!--  고객조회 TAB -  btnCustSearch 시작 -->
            <!-- 조회 조건 타이틀 시작 -->
            <section class="group">
            <div class="header_area"> <!-- 조회 조건 타이틀 시작 -->
                <div class="btn_right">
                    <button id="btnCtlSearchCoupon" class="btn_m btn_Search "><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                    <button id="btnSelect" class="btn_m btn_Select "><spring:message code="global.btn.select" /></button> <!-- 선택 -->
                </div>
            </div> <!-- 조회 조건 타이틀 끝 -->
            <div class="table_form" role="search" data-btnid="btnCtlSearchCoupon">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:30%;">
                        <col style="width:10%;">
                        <col style="width:20%;">
                        <col style="width:10%;">
                        <col>
                    </colgroup>
                    <tbody id="tdrvInputForm">
                        <tr>
                            <th scope="row"><spring:message code="crm.lbl.cupnNm"/></th><!-- 쿠폰명 -->
                            <td>
                                <input type="text" id="sCupnNm" name="sCupnNm" maxlength="100" value="" class="form_input"/>
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.dcUseTp"/></th><!-- 할인사용구분 -->
                            <td>
                                <input type="text" id="sDcUseTp" name="sDcUseTp" maxlength="100" value="" class="form_comboBox" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- 조회 조건 타이틀 종료 -->

            <div class="table_grid mt10">
                <div id="couponGrid" class="resizable_grid"></div>
            </div>
            </section>
        </div>  <!--  고객조회 TAB - 끝 -->
    </section>
    <!-- //그룹선택 팝업 -->
</div>  <!--  resizableContainer Div -->
 <script type="text/javascript">

 var sysDate = new Date("<c:out value='${sysDate}' />");

 var dcCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
 var dcCdArr = [];
 var dcUseTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
 var dcUseTpArr = [];
 var yesNoDS = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
 var yesNoDSMap = [];

 <c:forEach var="obj" items="${dcCdList}">
     dcCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     dcCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
 </c:forEach>

 <c:forEach var="obj" items="${dcUseTpList}">
     dcUseTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     dcUseTpArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
 </c:forEach>

 yesNoDS.push({"cmmCd":"Y" , "cmmCdNm":"<spring:message code='global.lbl.yes' />"});
 yesNoDS.push({"cmmCd":"N" , "cmmCdNm":"<spring:message code='global.lbl.n' />"});
 yesNoDSMap["Y"] = "<spring:message code='global.lbl.yes' />";
 yesNoDSMap["N"] = "<spring:message code='global.lbl.n' />";

$(document).ready(function() {

    var options = parent.custCouponpopupWindow.options.content.data;
    /*************************************************************
            드랍다운 리스트 셋팅
    *************************************************************/


    // 닫기 버튼.
    $("#btnCancel").kendoButton({
        click:function(e){
            parent.custCouponpopupWindow.close();
        }
    });

    //조회조건-소멸일 선택
    $("#cupnFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#cupnToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

 // 쿠폰할인구분   sDcUseTp
    $("#sDcUseTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:dcUseTpList
        , index:0
    });

// 사용여부   useYn
    $("#useYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:yesNoDS
        , index:1
    });

// 할인사용구분   dcUseTp
    $("#dcUseTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:dcUseTpList
        , index:0
    });

// 할인방식   dcCd
    $("#dcCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:dcCdList
        , index:0
        , change:function(){
            var selcmmCd = this.dataItem(this.select()).cmmCd;
            $("[class^=dcCd]").hide();
            if (selcmmCd == "01"){
                $(".dcCd01").show();
            } else if (selcmmCd == "02"){
                $(".dcCd02").show();
            } else if (selcmmCd == "03"){
                $(".dcCd03").show();
            }
        }
    });

    $("#lbrDcRate").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       //,min:0.00
       ,value:0.00
       ,spinners:false
    });

    $("#parDcRate").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       //,min:0.00
       ,value:0.00
       ,spinners:false
    });

    $("#totDcRate").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       //,min:0.00
       ,value:0.00
       ,spinners:false
    });

    $("#lbrDcAmt").kendoExtNumericTextBox({
        format:"n1"
       ,decimals :1
       //,min:0.00
       ,value:0.0
       ,spinners:false
    });

    $("#parDcAmt").kendoExtNumericTextBox({
        format:"n1"
       ,decimals :1
       //,min:0.00
       ,value:0.0
       ,spinners:false
    });

    $("#totDcAmt").kendoExtNumericTextBox({
        format:"n1"
       ,decimals :1
       //,min:0.00
       ,value:0.0
       ,spinners:false
    });

    $("#goodsCnt").kendoExtNumericTextBox({
        format:"n0"
       ,decimals :0
       //,min:0.00
       ,value:0
       ,spinners:false
    });

    $("#cupnValidPrid").kendoExtNumericTextBox({
        format:"n0"
       ,decimals :0
       //,min:0.00
       ,value:0
       ,spinners:false
//        ,change:function(){
//            if ($(this).val()) {
//                $("#cupnFromDt").data("kendoExtMaskedDatePicker").enable(false);
//                $("#cupnToDt").data("kendoExtMaskedDatePicker").enable(false);
//                $("#cupnFromDt").data("kendoExtMaskedDatePicker").value('');
//                $("#cupnToDt").data("kendoExtMaskedDatePicker").value('');
//            } else {
//                $("#cupnFromDt").data("kendoExtMaskedDatePicker").enable(true);
//                $("#cupnToDt").data("kendoExtMaskedDatePicker").enable(true);
//            }

//        }
    });

    //버튼 - 쿠폰 Master 조회
    $("#btnCtlSearchCoupon").kendoButton({
        click:function(e) {
            $("#couponGrid").data("kendoExtGrid").dataSource.page(1);
        }
    });

    // 그리드 더블 클릭 이벤트.
    $("#couponGrid").on("dblclick", "tr.k-state-selected", function (e) {
        $("#btnSelect").click();
    });

    /************************************************************
         그리드 설정
    *************************************************************/
    //그리드 설정
    $("#couponGrid").kendoExtGrid({
        gridId:"G-CRM-0111-103512"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/crm/cif/customerDcInfo/selectCustCouponInfo.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"]    = options.pageSize;
                        params["pageIndex"]             = options.page;
                        params["firstIndex"]            = options.skip;
                        params["lastIndex"]             = options.skip + options.take;
                        params["sort"]                  = options.sort;

                        params["sCupnNm"] = $("#sCupnNm").val();
                        params["sDcUseTp"] = $("#sDcUseTp").data("kendoExtDropDownList").value();

                        params["sUseYn"] = "Y";

                        console.log(params);
                        return kendo.stringify(params);


                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                    model:{
                        id:"cupnSeq"
                        ,fields:{
                            rnum:{type:"string", editable:false}
                            ,cupnSeq:{type:"string", editable:false}
                            ,cupnNm:{type:"string", editable:false}
                            ,dcCd:{type:"string", editable:false}
                            ,dcUseTp:{type:"string", editable:false}
                            ,useYn:{type:"string", editable:false}
                            ,cupnFromDt:{type:"date", editable:false}
                            ,cupnFromDtFormat:{type:"date", editable:false}
                            ,cupnToDt:{type:"date", editable:false}
                            ,cupnToDtFormat:{type:"date", editable:false}
                            ,regDt:{type:"date", validation:{required:false},editable:false}    //등록일
                            ,updtDt:{type:"date", validation:{required:false},editable:false}    //수정일
                        }
                    }
                    ,parse:function(d) {
                        if(d.data){
                            $.each(d.data, function(idx, elem) {
                                elem.cupnFromDtFormat = kendo.parseDate(elem.cupnFromDt, "<dms:configValue code='dateFormat' />");
                                elem.cupnToDtFormat = kendo.parseDate(elem.cupnToDt, "<dms:configValue code='dateFormat' />");
                            });
                        }
                        return d;
                    }
            }
        }
        ,change:function(e){
            var dataItem = this.dataItem(this.select());
            if(!dms.string.isEmpty(dataItem.cupnSeq)){
                $("#cupnSeq").val(dataItem.cupnSeq);
                console.log("dcUseTp::::");
                //console.log($("#useYn").data("kendoExtDropDownList").value());


            }

        }
        ,multiSelectWithCheckbox:true
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,enableTooltip:true               //Tooltip 적용, default:fa
        ,height:280
        ,autoBind:true
        ,navigatable:true
        ,sortable:false
        ,columns:[
           {field:"rnum", title:"<spring:message code='global.lbl.no' />" ,width:50,attributes:{"class":"ac"}}// 캠페인코드
           ,{field:"cupnSeq", title:"", attributes:{"class":"ac"}, hidden:true}//일련번호
           ,{field:"cupnNm", title:"<spring:message code='crm.lbl.cupnNm'/>", width:150 ,attributes:{"class":"al"}}  //쿠폰명
           ,{field:"dcCd", title:"<spring:message code='crm.lbl.dcCd' />", width:100 , attributes:{"class":"ac"}       // 할인방식
                , template:'#if (dcCd !== ""){# #= dcCdArr[dcCd]# #}#'
            }
           ,{field:"dcUseTp", title:"<spring:message code='crm.lbl.dcUseTp' />", width:100 , attributes:{"class":"ac"}       // 할인사용구분
                , template:'#if (dcUseTp !== ""){# #= dcUseTpArr[dcUseTp]# #}#'
            }
           ,{field:"useYn", title:"<spring:message code='global.lbl.useYn' />", width:75 , attributes:{"class":"ac"}                   //사용여부
                , template:'#if (useYn !== ""){# #= yesNoDSMap[useYn]# #}#'
           }
           ,{field:"cupnValidPrid", title:"<spring:message code='crm.lbl.validPrid' />", width:75 , attributes:{"class":"ac"}                   //유효일자
           }
           ,{field:"cupnFromDtFormat", title:"<spring:message code='crm.lbl.cupnFromDt' />", width :150               // 쿠폰시작일
               ,attributes:{"class":"ac tooltip-disabled"}
               ,template:"#if (cupnFromDtFormat !== null ){# #= kendo.toString(data.cupnFromDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
           }
           ,{field:"cupnToDtFormat", title:"<spring:message code='crm.lbl.cupnToDt' />", width :150               // 쿠폰종료일
               ,attributes:{"class":"ac tooltip-disabled"}
               ,template:"#if (cupnToDtFormat !== null ){# #= kendo.toString(data.cupnToDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
           }
           ,{field:"lbrDcRate", title:"<spring:message code='global.lbl.lbrDcRate' />", attributes:{"class":"ar"}, width:90, format :"{0:n2}"
           }   // 예상보험금액
           ,{field:"parDcRate", title:"<spring:message code='global.lbl.parDcRate' />", attributes:{"class":"ar"}, width:90, format :"{0:n2}" }   // 예상보험금액
           ,{field:"totDcRate", title:"<spring:message code='crm.lbl.totDcRate' />", attributes:{"class":"ar"}, width:90, format :"{0:n2}" }   // 예상보험금액
           ,{field:"lbrDcAmt", title:"<spring:message code='global.lbl.lbrDcAmt' />", attributes:{"class":"ar"}, width:90, format :"{0:n2}" }   // 예상보험금액
           ,{field:"parDcAmt", title:"<spring:message code='global.lbl.parDcAmt' />", attributes:{"class":"ar"}, width:90, format :"{0:n2}" }   // 예상보험금액
           ,{field:"totDcAmt", title:"<spring:message code='crm.lbl.totDcAmt' />", attributes:{"class":"ar"}, width:90, format :"{0:n2}" }   // 예상보험금액
           ,{field:"itemNm", title:"<spring:message code='crm.lbl.prenGoods' />", attributes:{"class":"ar"}, width:90, format :"{0:n2}" }   // 예상보험금액
           ,{field:"goodsCnt", title:"<spring:message code='global.lbl.qty' />", attributes:{"class":"ar"}, width:90, format :"{0:n0}" }   // 예상보험금액
        ]
    });

    /************************************************************
         기능버튼 설정
    *************************************************************/

    // 선택 버튼.
    $("#btnSelect").kendoButton({
        click:function(e){
           var grid = $("#couponGrid").data("kendoExtGrid");
           var selectedItem = grid.dataItem(grid.select());
           var rows = grid.select();

           if (rows.length >= 1){
               var data = [];
               $.each(rows, function(idx, row){
                   data.push(grid.dataItem(row));
               });

               console.log("Search Popup Data-btnSelect!!!!");
               console.log(data);

               options.callbackFunc(data);
               //parent.custCouponpopupWindow.close();


           } else {
               dms.notification.info("<spring:message code='global.lbl.customer' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
           }
        }
    });

});
 </script>