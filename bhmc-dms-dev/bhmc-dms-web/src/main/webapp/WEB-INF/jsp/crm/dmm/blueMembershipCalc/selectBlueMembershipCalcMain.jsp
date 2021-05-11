<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<%-- <c:set value="01" var="membershipStan" /> --%> <!-- 고객 -->
<c:set value="02" var="membershipStan" /> <!-- 자동차 -->


            <!-- 블루멤버십 정산 -->
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code="crm.title.blueMembershipCalc"/></h1><!-- 블루멤버십 정산(蓝缤会员清算) -->
                    <div class="btn_right">
                        <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
                        <button class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button><!-- 저장 -->
                        <button class="btn_m btn_save" id="btnCalcAccept">Accept</button><!-- 동의 -->
                    </div>
                </div>
                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:24%;">
                            <col style="width:66%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.calculateMonth"/></th><!-- 정산 월(清算月) -->
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sStartDt" name="sStartDt" class="form_datepicker ac" data-type="maskDate" >
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sEndDt" name="sEndDt" class="form_datepicker ac" data-type="maskDate">
                                        </div>
                                    </div>
                                </td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_grid mt10">
                    <div id="blueMembershipGrid"></div>
                </div>
            </section>
            <!-- //블루멤버십 정산 -->

            <!-- 조회 결과 -->
            <section class="group">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code="global.title.searchResult"/></h2><!-- 조회 결과(查询结果) -->
                </div>
                <div class="table_grid">
                    <div id="blueMemResultGrid"></div>
                </div>
            </section>
            <!-- //조회 결과 -->

<!-- script -->
<script>

    /*************************************************************
     * 데이터 셋업
     *************************************************************/

    //1.그리드 만족도조사 유형 콤보  DataSource
    var pointCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${pointCdList}">
    pointCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var pointCdListMap = dms.data.arrayToMap(pointCdList, function(obj){ return obj.cmmCd; });

    $(document).ready(function() {
        /* $(".form_datepicker").kendoExtMaskedDatePicker({
            format:"yyyy-MM"
            ,start:"year"
            ,depth:"year"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        }); */
        $("#sStartDt").kendoExtMaskedDatePicker({
            format:"yyyy-MM"
            ,start:"year"
            ,depth:"year"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        $("#sEndDt").kendoExtMaskedDatePicker({
            format:"yyyy-MM"
            ,start:"year"
            ,depth:"year"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
//console.log(pointCdList);
        /*************************************************************
         * 버튼 영역
         *************************************************************/

        //버튼 - 조회
        $("#btnSearch").kendoButton({
            click:function(e){
                $("#blueMemResultGrid").data("kendoExtGrid").dataSource.data([]);
                $('#blueMembershipGrid').data('kendoExtGrid').dataSource.page(1);
            }
        });

        //버튼 - 조회
        $("#btnCalcAccept").kendoButton({
            click:function(e){
                $.ajax({
                    url:"<c:url value='/crm/dmm/blueMembershipCalc/updateBlueMembershipCalcAcceptInfo.do' />",
                    //data:JSON.stringify(paramData),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    },
                    success:function(result) {
                        //console.log("111 result : ",result)
                    }//end success
                })//end ajax
            }
        });

        /*************************************************************
         *   그리드 셋팅
        *************************************************************/
        //그리드 설정
        $("#blueMembershipGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/dmm/blueMembershipCalc/selectBlueMembershipCalcs.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"]    = options.pageSize;
                            params["pageIndex"]             = options.page;
                            params["firstIndex"]            = options.skip;
                            params["lastIndex"]             = options.skip + options.take;
                            params["sort"]                  = options.sort;

                            params["sStartDt"] = $("#sStartDt").data("kendoExtMaskedDatePicker").value();
                            params["sEndDt"] = $("#sEndDt").data("kendoExtMaskedDatePicker").value();
                            /* params["sStsfIvstMthCd"] = $("#sStsfIvstMthCd").data("kendoExtDropDownList").value();
                            params["sStsfIvstExpdCd"] = $("#sStsfIvstExpdCd").data("kendoExtDropDownList").value();
                            params["sStsfIvstTpCd"] = $("#sStsfIvstTpCd").data("kendoExtDropDownList").value(); */

//                            console.log(params);
                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                        model:{
                            id:"monthly"
                            ,fields:{
                                rnum:{type:"string", editable:false}
                                ,dlrCd:{type:"string"}
                                ,monthly:{type:"string",  validation:{required:true},editable:false} // 정산월
                                ,totalEmployPointVal:{type:"string", validation:{required:true},editable:false } //총사용포인트
                                ,totalSavePointVal:{type:"string", validation:{required:true},editable:false } //총사용포인트
                                ,col4:{type:"string", validation:{required:true}} //정산금액
                                ,regDt:{type:"date", validation:{required:false},editable:false} //등록일
                            }
                        }
                }
            }
            ,change:function(e){
                //var dataItem = this.dataItem(this.select());
                $("#blueMemResultGrid").data("kendoExtGrid").dataSource.read();
            }
            ,multiSelectWithCheckbox:false
            ,height:196
            /* ,editable:{
                 mode:"incell"
                ,confirmation:false
            } */
            ,autoBind:false
            ,navigatable:true
            ,sortable:true
            ,pageable:true
            ,columns:[
               {field:"rnum", title:"no" ,width:50,attributes:{"class":"ac"}}// 캠페인코드
               ,{field:"dlrCd", title:"<spring:message code='crm.lbl.dlrCd'/>", hidden:true}// 딜러코드
               ,{field:"calculateMonth", title:"<spring:message code='crm.lbl.calculateMonth'/>", attributes:{"class":"ac"}}// 정산월
               ,{field:"totalEmployPointVal", title:"<spring:message code='crm.lbl.totEmployPoint'/>", attributes:{"class":"ac"}}// 총사용포인트
               ,{field:"totalSavePointVal", title:"<spring:message code='crm.lbl.totSavePoint'/>", attributes:{"class":"ac"}}// 총적립포인트
               ,{field:"col4", title:"<spring:message code='global.lbl.calcAmt'/>", attributes:{"class":"ac"}}// 정산금액
               ,{field:"regDt", title:"<spring:message code='global.lbl.regDt'/>", attributes:{"class":"ac"}}// 등록일
            ]
        }); /* end blueMembershipGrid */

        /*************************************************************
         *   그리드 셋팅
        *************************************************************/
        //그리드 설정
        $("#blueMemResultGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/dmm/blueMembershipCalc/selectBlueMembershipCalcDetails.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};
                            var grid = $('#blueMembershipGrid').data('kendoExtGrid');
                            var selectedItem = grid.dataItem(grid.select());
                            var v = selectedItem.calculateMonth;


                            params["recordCountPerPage"]    = options.pageSize;
                            params["pageIndex"]             = options.page;
                            params["firstIndex"]            = options.skip;
                            params["lastIndex"]             = options.skip + options.take;
                            params["sort"]                  = options.sort;

                            var sOccrDt = kendo.parseDate(v+"-01", "<dms:configValue code='dateFormat' />");
                            //console.log("endTime:" + sOccrDt);
                            params["sOccrDt"] = sOccrDt;

//                          console.log(params);
                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                        model:{
                            id:"pointHisSeq"
                            ,fields:{
                                rnum:{type:"number", editable:false}
                                ,dlrCd:{type:"string"}
                                ,pointHisSeq:{type:"number", validation:{required:true}} //
                                ,custNo:{type:"string", validation:{required:true}} //고객번호
                                ,custNm:{type:"string", validation:{required:true} } //고객명
                                ,col1:{type:"string",  validation:{required:true}} // 타입
                                ,blueMembershipNo:{type:"string", validation:{required:true}} //블루멤버십카드
                                ,pointTp:{type:"string", validation:{required:true}} //유형
                                ,pointCd:{type:"string", validation:{required:true}} //내용
                                ,occrPointVal:{type:"number", validation:{required:true}} //사용포인트
                                ,occrDt:{type:"date", validation:{required:true}} //날짜
                            }
                        }
                }
            }
            ,multiSelectWithCheckbox:false
            ,height:196
            /* ,editable:{
                 mode:"incell"
                ,confirmation:false
            } */
            ,editable:false
            ,autoBind:false
            ,navigatable:true
            ,sortable:true
            ,pageable:true
            ,columns:[
               {field:"rnum", title:"no" ,width:100,attributes:{"class":"ac"}}// 캠페인코드
               ,{field:"dlrCd", title:"<spring:message code='crm.lbl.dlrCd'/>", hidden:true}// 딜러코드
               ,{field:"pointHisSeq", title:"<spring:message code='global.lbl.custNo'/>", hidden:true}// 고객번호
               ,{field:"custNo", title:"<spring:message code='global.lbl.custNo'/>", hidden:true}// 고객번호
               ,{field:"custNm", title:"<spring:message code='global.lbl.custNm'/>",attributes:{"class":"ac"}}// 고객명
               ,{field:"col1", title:"<spring:message code='crm.lbl.blueMemTpCd'/>", attributes:{"class":"ac"}}// 타입
               ,{field:"blueMembershipNo", title:"<spring:message code='crm.lbl.blueMemCard'/>", attributes:{"class":"ac"}}// 블루멤버십 카드
               ,{field:"pointTp", title:"<spring:message code='crm.lbl.blueMemMthCd'/>", attributes:{"class":"ac"}}// 유형
               ,{field:"pointCd", title:"<spring:message code='global.lbl.cont'/>", attributes:{"class":"ac"}
                   ,width:120
                   ,editor:function(container, options){
                       $('<input data-bind="value:' + options.field + '"  />')
                       .appendTo(container)
                       .kendoExtDropDownList({
                           dataTextField:"cmmCdNm"
                           ,dataValueField:"cmmCd"
                           ,dataSource:pointCdList
                       });
                   }
                   //,template:'#if(pointCd !== ""){# #= pointCdListMap[pointCd]# #}#'
               }// 내용
               ,{field:"occrPointVal", title:"<spring:message code='crm.lbl.employPoint'/>",attributes:{"class":"ac"}}// 사용포인트
               ,{field:"occrDt", title:"<spring:message code='global.lbl.date'/>",attributes:{"class":"ac"}
                   ,attributes:{"class":"ac"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
                   ,editor:function(container, options) {
                       $('<input required name="occrDt" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtMaskedDatePicker({
                           format:"<dms:configValue code='dateFormat' />"
                           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                           ,value:""
                       });
                       $('<span class="k-invalid-msg" data-for="occrDt"></span>').appendTo(container);
                   }
               }// 날짜
            ]
        }); /* end blueMemResultGrid */

    }); /* end ready */


</script>
<!-- //script -->