<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div id="resizableContainer">
    <!-- 출고취소 심사결과조회 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="sal.title.releaseCancel" /></h1> <!-- 출고취소 심사결과조회 -->
            <div class="btn_right">
                <dms:access viewId="VIEW-D-10914" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                </dms:access>
            </div>
        </div>
        <!-- 조회 조건 시작 -->
        <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:8%;">
                    <col style="width:15%;">
                    <col style="width:8%;">
                    <col style="width:19%;">
                    <col style="width:8%;">
                    <col style="width:19%;">
                    <col style="width:8%;">
                    <col style="width:15%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="crm.lbl.evalStatus" /></th> <!-- 심사상태 -->
                        <td>
                            <input name="sEvalStatusCd" id="sEvalStatusCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="sal.lbl.reqDt" /></th> <!-- 신청일자 -->
                        <td>
                            <input id="sStartEvalDt" data-type="maskDate" class="form_datepicker" style="width:40%">
                            ~
                            <input id="sEndEvalDt" data-type="maskDate" class="form_datepicker" style="width:40%">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.custNm" /></th> <!-- 고객명 -->
                        <td>
                            <div class="form_float">
                                <div class="form_left">
                                    <div class="form_search">
                                        <input id="sContractCustNm" name="sContractCustNm" type="text" class="form_input onKey_down" placeholder="<spring:message code='par.lbl.custNm' />" onchange="fnOnChange(this.id,this.value);" maxlength="30" />
                                        <a href="#;" onclick="javascript:sContractCustPopupWindow();" id="sContractCustSearch"><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></a>
                                    </div>
                                </div>
                                <div class="form_right">
                                    <input id="sContractCustNo" type="text" readonly class="form_input form_readonly">
                                </div>
                           </div>
                        </td>
                        <th scope="row"><spring:message code='global.lbl.vinNum' /></th><!-- VIN NO -->
                        <td>
                            <input id="sVinNo" type="text" class="form_input">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- 조회 조건 종료 -->
        <div class="table_grid mt10">
            <div id="grid" class="resizable_grid"></div>
        </div>
    </section>
</div>

<script  type="text/javascript">

    /**
     * 심사상태 콤보박스
     */
    var sEvalStatusCdList = [];
    <c:forEach var="obj" items="${evalStatusCdList}">
        sEvalStatusCdList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
    </c:forEach>

    //심사상태 Map
    var evalStatusCdMap = dms.data.arrayToMap(sEvalStatusCdList, function(obj){ return obj.cmmCd; });

	/**
     * 출고취소사유코드
     */
    var sCancReasonCdList = [];
    <c:forEach var="obj" items="${cancReasonCdList}">
    sCancReasonCdList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
    </c:forEach>

    var cancReasonCdMap = dms.data.arrayToMap(sCancReasonCdList, function(obj){ return obj.cmmCd; });

	//조회조건 - 신청일자(기간)- START
    $("#sStartEvalDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:oneDay
    });

    //조회조건 - 신청일자(기간)- END
    $("#sEndEvalDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:lastDay
    });

    //검색조건 - 고객조회
    function sContractCustPopupWindow(){
        var custNm = $("#sContractCustNm").val();

        popupWindow = dms.window.popup({
            windowId:"customerSearchPopupMain"
            , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
            , content:{
                url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                , data:{
                    "autoBind":true
                    , "closeYn":"Y"
                    , "custNm":custNm
                    , "type"  :null
                    , "callbackFunc":function(data){
                        if (data.length >= 1) {
                            if ( dms.string.isNotEmpty(data[0].custNo) ) {
                                $("#sContractCustNo").val(data[0].custNo);
                                $("#sContractCustNm").val(data[0].custNm);
                            }

                            //popupWindow.close();
                        }
                    }
                }
            }
        })
    }

	$(document).ready(function () {
        /**
         * 심사상태 콤보박스
         */
         $("#sEvalStatusCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:sEvalStatusCdList
            ,optionLabel:" "   // 전체
         });

		//버튼 - 조회
	    $("#btnSearch").kendoButton({
	        click:function(e) {
                $('#grid').data('kendoExtGrid').dataSource.page(1);
	        }
	    });

    	//그리드 1번
    	$("#grid").kendoExtGrid({
    	    gridId:"G-SAL-1021-125143"
           	,dataSource:{
           	 transport:{
                 read:{
                     url:"<c:url value='/sal/dlv/releaseCancelJudgeResult/selectReleaseCancelJudgeResult.do' />"
                 }
                ,parameterMap:function(options, operation) {
                     if (operation === "read") {

                         var params = {};

                         /*Paging Param Start~!*/
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         /*Paging Param End~!*/

                         params["sort"] = options.sort;

                         params["evalStatusCd"] = $("#sEvalStatusCd").val();
                         params["startEvalDt"] = $("#sStartEvalDt").data("kendoExtMaskedDatePicker").value();
                         params["endEvalDt"] = $("#sEndEvalDt").data("kendoExtMaskedDatePicker").value();
                         params["vinNo"] = $("#sVinNo").val();
                         params["contractCustNo"] = $("#sContractCustNo").val();

                         return kendo.stringify(params);
                     }else if (operation !== "read" && options.models) {
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,error:function(e){

             }
             ,schema:{
                 data:"data"
                ,model:{
                     id:"modelCd"
                    ,fields:{
                         rnum:{type:"string", editable:false}         //No
                        ,vinNo:{type:"string", editable:true}        //VIN_NO
                        ,custNm:{type:"string", editable:false}       //고객명
                        ,realDlDt:{type:"date", editable:false}     //출고일자
                        ,reqStatCd:{type:"string", editable:false}    //심사상태
                        ,reqDt:{type:"date", editable:false}        //신청일자
                        ,approveDt:{type:"date", editable:false}    //심사일자
                        ,cancReasonCd:{type:"string", editable:false} //출고취소사유코드
                        ,carlineCd:{type:"string", editable:false}    //차종코드
                        ,carlineNm:{type:"string", editable:false}    //차종명
                        ,modelNm:{type:"string", editable:false}      //차관명
                        ,ocnCd         :{type:"string"}               //OCN코드
                        ,ocnNm         :{type:"string"}               //OCN명
                        ,extColorNm:{type:"string", editable:false}   //외색
                        ,extColorCd    :{type:"string"}               //외색코드
                        ,extColorNm:{type:"string", editable:false}   //외색명
                        ,intColorCd    :{type:"string"}               //내색코드
                        ,reqUsrId:{type:"string", editable:false}     //신청인
                     }
                 }
             }
           }
            ,dataBound:function(e) {
                var rows = e.sender.tbody.children();

                var qty = 0;

                $.each(rows, function(idx, row){
                    var dataItem = e.sender.dataItem(row);

                    if(dataItem.ordpVapr != null){
                        qty += Number(dataItem.ordpVapr);
                    }
                });
            }
           ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
           ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
           ,appendEmptyColumn:false          //빈컬럼 적용. default:false
           ,enableTooltip:true               //Tooltip 적용, default:false
           ,autoBind:true
           ,scrollable:true
           ,editable:false
           ,pageable :{
               refresh :true
               ,pageSize :500
               ,pageSizes :[ "500", "1000", "1500", "2000"]
           }
           ,columns:[
                 {field:"rnum", title:"<spring:message code='global.lbl.no' />"
                    ,width:60
                    ,sortable:false, attributes:{"class":"ac"}}
                ,{field:"vinNo", title:"<spring:message code='global.lbl.vinNum' />"
                    ,width:150
                    ,headerAttributes:{style:"text-align:center;"}
                } // VIN_NO
                ,{field:"custNm", title:"<spring:message code='ser.lbl.custNm' />"
                    ,width:150
                    ,headerAttributes:{style:"text-align:center;"}
                } // 고객명
                ,{field:"realDlDt", title:"<spring:message code='global.lbl.giDocRegDt' />"
                    ,width:100
                    ,headerAttributes:{style:"text-align:center;"}
                    ,attributes:{"class":"ac"}
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                } // 출고일자
                ,{field:"reqStatCd", title:"<spring:message code='crm.lbl.evalStatus' />"
                    ,width:130
                    ,template:"# if(evalStatusCdMap[reqStatCd] != null){# #= evalStatusCdMap[reqStatCd].cmmCdNm# #}#"
                    ,headerAttributes:{style:"text-align:center;"}
                    ,attributes:{"class":"ac"}
                } // 심사상태
                ,{field:"reqDt", title:"<spring:message code='global.lbl.fincReqDt' />"
                    ,width:100
                    ,headerAttributes:{style:"text-align:center;"}
                    ,attributes:{"class":"ac"}
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                } // 신청일자
                ,{field:"approveDt", title:"<spring:message code='global.lbl.evalDt' />"
                    ,width:100
                    ,headerAttributes:{style:"text-align:center;"}
                    ,attributes:{"class":"ac"}
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                } // 심사일자
                ,{field:"cancReasonCd", title:"<spring:message code='sal.lbl.deliveryCancReason' />"
                    ,width:130
                    ,template:"# if(cancReasonCdMap[cancReasonCd] != null){# #= cancReasonCdMap[cancReasonCd].cmmCdNm# #}#"
                    ,headerAttributes:{style:"text-align:center;"}
                } // 출고취소사유코드
                ,{field:"carlineCd",     title:"<spring:message code='global.lbl.carlineCd' />"
                    ,width:80
                    ,headerAttributes:{style: "text-align:center:"}
                }//차종code
                ,{field:"carlineNm",   title:"<spring:message code='global.lbl.carLine' />"
                    ,width:150
                    ,headerAttributes:{style:"text-align:center;"}
                } // 차종명
                ,{field:"modelNm", title:"<spring:message code='global.lbl.model' />"
                    ,width:250
                    ,headerAttributes:{style:"text-align:center;"}
                } // 차관
                ,{field:"ocnCd", title:"<spring:message code='global.lbl.ocnCode' />"
                    ,width:80
                    ,headerAttributes:{style:"text-align:center;"}
                } //OCNcode
                ,{field:"ocnNm",     title:"<spring:message code='global.lbl.ocnNm' />"
                    ,width:140
                    ,headerAttributes:{style:"text-align:center;"}
                }//OCN명
                ,{field:"extColorCd", title:"<spring:message code='global.lbl.extColorCd' />"
                    ,width:80
                    ,headerAttributes:{style:"text-align:center;"}
                }//외장색코드
                ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColorNm' />"
                    ,width:150
                    ,headerAttributes:{style:"text-align:center;"}
                } //외색
                ,{field:"intColorCd", title:"<spring:message code='global.lbl.intColorCd' />"
                    ,width:80
                    ,headerAttributes:{style:"text-align:center;"}
                } //내장색코드
                ,{field:"reqUsrId", title:"<spring:message code='sal.lbl.requestUsr' />"
                    ,width:100
                    ,headerAttributes:{style:"text-align:center;"}
                    ,attributes:{"class":"ac"}
                } //신청자
            ]
    	});

        // 출고취소 심사결과조회
        $.ajax({
            url:"<c:url value='/sal/orm/btoCreateOrder/selectBtoCreateOrderPreAmtSearch.do' />"
            //,data:JSON.stringify(param)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR, status, error) {
                dms.notification.error(jqXHR.responseJSON.errors);
            }
            ,success:function(jqXHR, textStatus) {
                //정상적으로 반영 되었습니다.
                //dms.notification.success("<spring:message code='global.info.searchSuccess'/>");
            }
        });

        fnOnChange = function(id,vl){
            if(id == "sContractCustNm"){
                $("#sContractCustNo").val("");
            }else if(id == "purcCustNm"){
                $("#purcCustNo").val("");
            }else if(id == "vinNo"){
                $("#carlineCd").data("kendoExtDropDownList").value("");
                $("#modelCd").data("kendoExtDropDownList").value("");
                $("#ocnCd").data("kendoExtDropDownList").value("");
                $("#extColorCd").data("kendoExtDropDownList").value("");
                $("#intColorCd").data("kendoExtDropDownList").value("");
            }


        }
        // 고객명에서 ObKeyDown
        $(".onKey_down").keydown(function(e){
            if (e.keyCode == 13) {
                if($(this).val() != "") {
                    if($(this).attr("id") == 'sContractCustNm'){
                        sContractCustPopupWindow();
                    }
                }
            }
        });

	}); //document.ready End

</script>