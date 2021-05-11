<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

            <!-- 리드 판매 -->
            <section class="group">
                <div class="header_area">
                    <%-- <h1 class="title_basic"><spring:message code='crm.menu.leadOpptMgmt' /><!-- 리드/판매기회관리 --></h1> --%>
                    <div class="btn_left">
                        <button id="btnLeadSearch" class="btn_m">线索<!-- 리드 --></button>
                        <button id="btnOpptSearch" class="btn_m">商机<!-- 판매기회 --></button>
                    </div>
                    <div class="btn_right">
                        <button id="btnActive" class="btn_m">跟踪<!-- 추종 --></button>
                        <button class="btn_m btn_search">查询<!-- 조회 --></button>
                        <!-- <button id="btnAdd" class="btn_m btn_add">添加</button> -->
                        <button id="btnLead" class="btn_m">添加线索<!-- 리드추가 --></button>
                        <button id="btnOppt" class="btn_m">添加商机<!-- 판매기회추가 --></button>
                        <!-- <button id="btnVsitMgmt" class="btn_m">전시장</button> -->
                        <!-- <button id="btnVsitResult" class="btn_m">전시장유동량결과등록</button> -->
                    </div>
                </div>
                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:23%;">
                            <col style="width:10%;">
                            <col style="width:18%;">
                            <col style="width:12%;">
                            <col style="width:18%;">
                            <col style="width:9%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row">客户名</th>
                                <td>
                                    <input type="text" value="" class="form_input">
                                </td>
                                <th scope="row">移动电话</th>
                                <td>
                                    <input type="text" value="" class="form_input">
                                </td>
                                <th scope="row">销售顾问</th>
                                <td>
                                    <input type="text" value="" class="form_comboBox">
                                </td>
                                <td class="ar">
                                    <button type="button" id="btnHidden" class="btn_s">条件详情</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_form mt5" id="hiddenTable" style="display:none;">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:23%;">
                            <col style="width:10%;">
                            <col style="width:18%;">
                            <col style="width:12%;">
                            <col style="width:18%;">
                            <col style="width:9%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row">线索来源</th>
                                <td>
                                    <input type="text" value="" class="form_comboBox">
                                </td>
                                <th scope="row">线索状态</th>
                                <td>
                                    <input type="text" value="" class="form_comboBox">
                                </td>
                                <th scope="row">是否为 BHMC线索</th>
                                <td>
                                    <input type="text" value="" class="form_comboBox">
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <th scope="row">线索分配日</th>
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input value="" class="form_datepicker">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input value="" class="form_datepicker">
                                        </div>
                                    </div>
                                </td>
                                <th scope="row">商机阶段</th>
                                <td>
                                    <input type="text" value="" class="form_comboBox">
                                </td>
                                <th scope="row">商机转出状态</th>
                                <td>
                                    <input type="text" value="" class="form_comboBox">
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <th scope="row">商机录入日</th>
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input value="" class="form_datepicker">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input value="" class="form_datepicker">
                                        </div>
                                    </div>
                                </td>
                                <th scope="row">商机意向车种</th>
                                <td>
                                    <input type="text" value="" class="form_comboBox">
                                </td>
                                <th scope="row">商机意向车型</th>
                                <td>
                                    <input type="text" value="" class="form_comboBox">
                                </td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>


                <div class="table_grid mt10">
                    <div id="salesOpptGrid"></div>
                </div>

            <input type="hidden" name="leadSalesTp" id="leadSalesTp" />

            </section>


            <script type="text/javascript">


                $(document).ready(function() {



                    var leadPopupWindow
                    , opptPopupWindow
                    , activePopupWindow
                    , vsitMgmtPopupWindow
                    , vsitResultPopupWindow
                    ;


                    $(".form_datepicker").kendoDatePicker({
                        format:"yyyy-MM-dd"
                    });
                    /* $(".grid").kendoGrid({
                        height:419
                    }); */
                    $(".form_comboBox").kendoExtDropDownList();
                    //$(".btn_m, .btn_s").kendoButton();


                    // 리드/판매기회 추가
                    $("#btnAdd").kendoButton({
                        click:function(e){

                            if ( $("#leadSalesTp").val() === "01" ) {

                                leadPopupWindow = dms.window.popup({
                                    windowId:"leadPopupWindow"
                                    , title:"线索"
                                    , width:"800px"
                                    , height:220
                                    , content:{
                                        url:"<c:url value='/crm/cso/salesOpptMgmt/selectLeadPopup.do'/>"
                                        , data:{
                                            "autoBind":false
                                            , "type"  :null
                                            , "callbackFunc":function(data){
                                                if(data.length >= 1) {

                                                    console.log(data);

                                                    $("#sScId").val(data[0].mngScId);
                                                    $("#sScNm").val(data[0].mngScNm);
                                                    $("#sCustNo").val(data[0].custNo);
                                                    $("#sCustNm").val(data[0].custNm);
                                                    $("#sVsitDt").data("kendoExtMaskedDatePicker").value(data[0].preVsitDt);
                                                    $("#sHpNo").data("kendoMaskedTextBox").value(data[0].hpNo);
                                                    $("#sSaleOpptStepCd").data("kendoExtDropDownList").value(data[0].saleOpptStepCd);

                                                    // 내방에서 리드번호 있는경우 리드번호등록 + 관심차종을 등록하기 때문에 리드에서 들어온경우 최초 1회 등록후 리드번호 초기화.
                                                    $("#leadNo").val("");

                                                    leadPopupWindow.close();

                                                }
                                            }
                                        }
                                    }
                                });


                            } else if ( $("#leadSalesTp").val() === "02" ) {

                                opptPopupWindow = dms.window.popup({
                                    windowId:"opptPopupWindow"
                                    , title:"商机"
                                    , height:260
                                    , content:{
                                        url:"<c:url value='/crm/cso/salesOpptMgmt/selectSalesOpptPopup.do'/>"
                                        , data:{
                                            "autoBind":false
                                            , "type"  :null
                                            , "callbackFunc":function(data){
                                                if(data.length >= 1) {

                                                    console.log(data);

                                                    $("#sScId").val(data[0].mngScId);
                                                    $("#sScNm").val(data[0].mngScNm);
                                                    $("#sCustNo").val(data[0].custNo);
                                                    $("#sCustNm").val(data[0].custNm);
                                                    $("#sVsitDt").data("kendoExtMaskedDatePicker").value(data[0].preVsitDt);
                                                    $("#sHpNo").data("kendoMaskedTextBox").value(data[0].hpNo);
                                                    $("#sSaleOpptStepCd").data("kendoExtDropDownList").value(data[0].saleOpptStepCd);

                                                    // 내방에서 리드번호 있는경우 리드번호등록 + 관심차종을 등록하기 때문에 리드에서 들어온경우 최초 1회 등록후 리드번호 초기화.
                                                    $("#leadNo").val("");

                                                    opptPopupWindow.close();

                                                }
                                            }
                                        }
                                    }
                                });



                            } else {

                                // 판매기회 / 을(를) 선택해주세요.
                                dms.notification.warning("请选择线索或者商机");

                            }

                        }
                        , enable:false

                    });

                    // 리드목록 조회
                    $("#btnLeadSearch").kendoButton({
                        click:function(e){
                            //dms.notification.warning("리드목록 조회");
                        }

                    });

                    // 판매기회목록 조회
                    $("#btnOpptSearch").kendoButton({
                        click:function(e){
                            //dms.notification.warning("판매기회목록 조회");
                        }

                    });

                    // 활동 팝업
                    $("#btnActive").kendoButton({
                        click:function(e){

                            activePopupWindow = dms.window.popup({
                                windowId:"activePopupWindow"
                                , title:"跟踪"  /* 추종  */
                                , width:"800px"
                                , height:210
                                , content:{
                                    url:"<c:url value='/crm/cso/salesOpptMgmt/selectActivePopup.do'/>"
                                    , data:{
                                        "autoBind":false
                                        , "type"  :null
                                        , "callbackFunc":function(data){
                                            if(data.length >= 1) {

                                                console.log(data);

                                                $("#sScId").val(data[0].mngScId);
                                                $("#sScNm").val(data[0].mngScNm);
                                                $("#sCustNo").val(data[0].custNo);
                                                $("#sCustNm").val(data[0].custNm);
                                                $("#sVsitDt").data("kendoExtMaskedDatePicker").value(data[0].preVsitDt);
                                                $("#sHpNo").data("kendoMaskedTextBox").value(data[0].hpNo);
                                                $("#sSaleOpptStepCd").data("kendoExtDropDownList").value(data[0].saleOpptStepCd);

                                                // 내방에서 리드번호 있는경우 리드번호등록 + 관심차종을 등록하기 때문에 리드에서 들어온경우 최초 1회 등록후 리드번호 초기화.
                                                $("#leadNo").val("");

                                                leadPopupWindow.close();

                                            }
                                        }
                                    }
                                }
                            });


                        }

                    });


                    // 리드 팝업
                    $("#btnLead").kendoButton({
                        click:function(e){

                            console.log("btnLead")

                            //$("#leadSalesTp").val("01")
                            //$("#btnAdd").data("kendoButton").enable(true);
                            console.log("리드 팝업")
                            leadPopupWindow = dms.window.popup({
                                windowId:"leadPopupWindow"
                                , title:"线索"
                                , width:"800px"
                                , height:220
                                , content:{
                                    url:"<c:url value='/crm/cso/salesOpptMgmt/selectLeadPopup.do'/>"
                                    , data:{
                                        "autoBind":false
                                        , "type"  :null
                                        , "callbackFunc":function(data){
                                            if(data.length >= 1) {

                                                console.log(data);

                                                $("#sScId").val(data[0].mngScId);
                                                $("#sScNm").val(data[0].mngScNm);
                                                $("#sCustNo").val(data[0].custNo);
                                                $("#sCustNm").val(data[0].custNm);
                                                $("#sVsitDt").data("kendoExtMaskedDatePicker").value(data[0].preVsitDt);
                                                $("#sHpNo").data("kendoMaskedTextBox").value(data[0].hpNo);
                                                $("#sSaleOpptStepCd").data("kendoExtDropDownList").value(data[0].saleOpptStepCd);

                                                // 내방에서 리드번호 있는경우 리드번호등록 + 관심차종을 등록하기 때문에 리드에서 들어온경우 최초 1회 등록후 리드번호 초기화.
                                                $("#leadNo").val("");

                                                leadPopupWindow.close();

                                            }
                                        }
                                    }
                                }
                            });


                        }

                    });

                    // 판매기회 팝업
                    $("#btnOppt").kendoButton({
                        click:function(e){

                            console.log("btnOppt")

                            //$("#leadSalesTp").val("02")
                            //$("#btnAdd").data("kendoButton").enable(true);

                            opptPopupWindow = dms.window.popup({
                                windowId:"opptPopupWindow"
                                , title:"商机"
                                , height:260
                                , content:{
                                    url:"<c:url value='/crm/cso/salesOpptMgmt/selectSalesOpptPopup.do'/>"
                                    , data:{
                                        "autoBind":false
                                        , "type"  :null
                                        , "callbackFunc":function(data){
                                            if(data.length >= 1) {

                                                console.log(data);

                                                $("#sScId").val(data[0].mngScId);
                                                $("#sScNm").val(data[0].mngScNm);
                                                $("#sCustNo").val(data[0].custNo);
                                                $("#sCustNm").val(data[0].custNm);
                                                $("#sVsitDt").data("kendoExtMaskedDatePicker").value(data[0].preVsitDt);
                                                $("#sHpNo").data("kendoMaskedTextBox").value(data[0].hpNo);
                                                $("#sSaleOpptStepCd").data("kendoExtDropDownList").value(data[0].saleOpptStepCd);

                                                // 내방에서 리드번호 있는경우 리드번호등록 + 관심차종을 등록하기 때문에 리드에서 들어온경우 최초 1회 등록후 리드번호 초기화.
                                                $("#leadNo").val("");

                                                opptPopupWindow.close();

                                            }
                                        }
                                    }
                                }
                            });



                        }

                    });

                    // 전시장유동량관리
                    $("#btnVsitMgmt").kendoButton({
                        click:function(e){
                            // 전시장 유동량 페이지 - 내방상세정보 만  팝업
                            //dms.notification.warning("전시장 유동량 페이지 - 내방상세정보 만  팝업");

                            // 탭 오픈
                            /*
                            2 - 결과등록
                            3 - 이력
                            */

                            vsitMgmtPopupWindow = dms.window.popup({
                                windowId:"vsitMgmtPopupWindow"
                                , title:"전시장"
                                , width:"800px"
                                , height:400
                                , content:{
                                    url:"<c:url value='/crm/cso/salesOpptMgmt/selectVsitMgmtPopup.do'/>"
                                    , data:{
                                        "autoBind":false
                                        , "type"  :null
                                        , "callbackFunc":function(data){
                                            if(data.length >= 1) {

                                                console.log(data);

                                                $("#sScId").val(data[0].mngScId);
                                                $("#sScNm").val(data[0].mngScNm);
                                                $("#sCustNo").val(data[0].custNo);
                                                $("#sCustNm").val(data[0].custNm);
                                                $("#sVsitDt").data("kendoExtMaskedDatePicker").value(data[0].preVsitDt);
                                                $("#sHpNo").data("kendoMaskedTextBox").value(data[0].hpNo);
                                                $("#sSaleOpptStepCd").data("kendoExtDropDownList").value(data[0].saleOpptStepCd);

                                                // 내방에서 리드번호 있는경우 리드번호등록 + 관심차종을 등록하기 때문에 리드에서 들어온경우 최초 1회 등록후 리드번호 초기화.
                                                $("#leadNo").val("");

                                                leadPopupWindow.close();

                                            }
                                        }
                                    }
                                }
                            });




                        }

                    });
/*

                    // 전시장유동량결과입력
                    $("#btnVsitResult").kendoButton({
                        click:function(e){

                            // 전시장 유동량 결과입력 팝업
                            // 탭 - 내방상세정보(내방상세정보, 첨부파일, 관심차종) / 내방이력
                            dms.notification.warning("전시장 유동량 결과입력 팝업");


                            vsitResultPopupWindow = dms.window.popup({
                                windowId:"vsitResultPopupWindow"
                                , title:"跟踪"
                                , width:"800px"
                                , height:410
                                , content:{
                                    url:"<c:url value='/crm/cso/salesOpptMgmt/selectVsitResultPopup.do'/>"
                                    , data:{
                                        "autoBind":false
                                        , "type"  :null
                                        , "callbackFunc":function(data){
                                            if(data.length >= 1) {

                                                console.log(data);

                                                $("#sScId").val(data[0].mngScId);
                                                $("#sScNm").val(data[0].mngScNm);
                                                $("#sCustNo").val(data[0].custNo);
                                                $("#sCustNm").val(data[0].custNm);
                                                $("#sVsitDt").data("kendoExtMaskedDatePicker").value(data[0].preVsitDt);
                                                $("#sHpNo").data("kendoMaskedTextBox").value(data[0].hpNo);
                                                $("#sSaleOpptStepCd").data("kendoExtDropDownList").value(data[0].saleOpptStepCd);

                                                // 내방에서 리드번호 있는경우 리드번호등록 + 관심차종을 등록하기 때문에 리드에서 들어온경우 최초 1회 등록후 리드번호 초기화.
                                                $("#leadNo").val("");

                                                leadPopupWindow.close();

                                            }
                                        }
                                    }
                                }
                            });


                        }

                    });


                     */
                    // 검색조건 show/hide
                    $("#btnHidden").kendoButton({
                        click:function(e){

                            $("#hiddenTable").toggle();

                        }

                    });

                    // 판매기회 관리 그리드 시작 //
                    $("#salesOpptGrid").kendoExtGrid({
                        dataSource:[
                                          {"trsfStatCd":"","custNm":""}
                                        , {"trsfStatCd":"","custNm":""}
                                        , {"trsfStatCd":"","custNm":""}
                                        , {"trsfStatCd":"","custNm":""}
                                        , {"trsfStatCd":"","custNm":""}
                                        , {"trsfStatCd":"","custNm":""}
                                        , {"trsfStatCd":"","custNm":""}
                                        , {"trsfStatCd":"","custNm":""}
                                        , {"trsfStatCd":"","custNm":""}
                                        , {"trsfStatCd":"","custNm":""}

                                      ]

                    /*
                        dataSource:{
                            transport:{
                                read:{
                                    url:"<c:url value='/crm/cso/salesOpptMgmt/selectSalesOpptMgmts.do' />"
                                }
                                ,parameterMap:function(options, operation) {
                                    if (operation === "read") {

                                        var params = {};

                                        params["recordCountPerPage"]    = options.pageSize;
                                        params["pageIndex"]             = options.page;
                                        params["firstIndex"]            = options.skip;
                                        params["lastIndex"]             = options.skip + options.take;
                                        params["sort"]                  = options.sort;

                                        console.log("salesOpptGrid:" + params);
                                        return kendo.stringify(params);

                                    }else if (operation !== "read" && options.models) {
                                        return kendo.stringify(options.models);
                                    }
                                }
                            }
                            ,schema:{
                                errors:"error"
                                    ,data:"data"
                                    ,total:"total"
                                    ,model:{
                                        id:"saleOpptSeq"
                                        ,fields:{
                                            rnum:{type:"number"}
                                            ,saleOpptSeq:{type:"number"}
                                            ,custNm:{type:"string"}
                                            ,carlineNm:{type:"string"}
                                            ,modelNm:{type:"string"}
                                            ,expcSaleDt:{type:"date"}
                                            ,succPrbCd:{type:"string"}
                                            ,saleOpptSrcCd:{type:"string"}
                                            ,saleOpptStepCd:{type:"string"}
                                            ,scNm:{type:"string"}
                                            ,regDt:{type:"date"}
                                        }
                                    }
                            }
                        }
                        ,change:function(e){

                            var selectedVal = this.dataItem(this.select());
                            var saleOpptSeq = selectedVal.saleOpptSeq;

                            if(saleOpptSeq != null && saleOpptSeq != "undefined" ){

                                var param = {
                                        "sSaleOpptSeq":saleOpptSeq
                                        };

                                console.log(JSON.stringify(param));
                                //return;

                                $.ajax({
                                        url:"<c:url value='/crm/cso/salesOpptMgmt/selectSalesOpptMgmtByKey.do' />"
                                        ,data:JSON.stringify(param)      //파라미터
                                        ,type:'POST'                        //조회요청
                                        ,dataType:'json'                  //json 응답
                                        ,contentType:'application/json'   //문자열 파라미터
                                        ,error:function(jqXHR,status,error){
                                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                        }
                                }).done(function(body) {

                                    console.log("selectSalesOpptMgmtByKey:",body);

                                    // 판매기회 상태 알림 팝업 ( 등록일 기준 1개월 이상이면 팝업 )
                                    var regPrid = body.regPrid;
                                    //var regPrid = 0;
                                    console.log("regPrid:"+regPrid)


                                    initForm();

                                    $("#saleOpptSeq").val(body.saleOpptSeq);
                                    $("#remark").val(body.remark);
                                    $("#custNo").val(body.custNo);
                                    $("#custNm").val(body.custNm);
                                    $("#hpNo").data("kendoMaskedTextBox").value(body.hpNo);
                                    $("#scId").val(body.scId);
                                    $("#saleOpptStepCd").data("kendoExtDropDownList").value(body.saleOpptStepCd);
                                    $("#expcSaleDt").data("kendoExtMaskedDatePicker").value(body.expcSaleDt);
                                    $("#succPrbCd").data("kendoExtDropDownList").value(body.succPrbCd);
                                    $("#saleOpptSrcCd").data("kendoExtDropDownList").value(body.saleOpptSrcCd);
                                    $("#trsfStatCd").data("kendoExtDropDownList").value(body.trsfStatCd);
                                    $("#regUsrId").val(body.regUsrId);
                                    $("#regDt").val(body.regDt);

                                    $("#btnActive").data("kendoButton").enable(true);
                                    $("#btnVisitResv").data("kendoButton").enable(true);
                                    $("#btnCall").data("kendoButton").enable(true);
                                    $("#btnSuccess").data("kendoButton").enable(true);
                                    $("#btnTrsfReq").data("kendoButton").enable(true);
                                    $("#btnTrsfApprover").data("kendoButton").enable(true);

                                    $("#carGrid").data("kendoExtGrid").dataSource.read();
                                    $("#salesOpptFailDetlGrid").data("kendoExtGrid").dataSource.read();
                                    $("#activeGrid").data("kendoExtGrid").dataSource.read();

                                });

                            }

                        }
                        */
                        ,columns:[
                                    //{field:"saleOpptSeq", title:"SEQ", width:30}
                                    /*
                                    {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                                        ,attributes:{"class":"ac"}
                                    }
                                    ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:90}  //고객명
                                    ,{field:"carlineNm", title:"<spring:message code='global.lbl.intrCarLine' />", width:90} // 관심차종
                                    ,{field:"modelNm", title:"<spring:message code='global.lbl.intrModel' />", width:230} // 관심모델
                                    ,{field:"expcSaleDt", title:"<spring:message code='global.lbl.expcSaleDt' />", width:90, attributes:{"class":"ac"} // 예상판매일자
                                        ,format:"{0:<dms:configValue code='dateFormat' />}"
                                    }
                                    ,{field:"succPrbCd", title:"<spring:message code='global.lbl.succPrbCd' />", width:90, attributes:{"class":"ac"} // 성공확률
                                        ,template:'#= succPrbCdArrVal(succPrbCd)#'
                                    }
                                    ,{field:"saleOpptSrcCd", title:"<spring:message code='global.lbl.saleOpptSrcCd' />", width:90 // 판매기회출처
                                        ,template:'#= saleOpptSrcCdArrVal(saleOpptSrcCd)#'
                                    }
                                    ,{field:"saleOpptStepCd", title:"<spring:message code='global.lbl.saleOpptStepCd' />", width:90 // 판매기회단계
                                        ,template:'#= saleOpptStepCdArrVal(saleOpptStepCd)#'
                                    }
                                    ,{field:"scNm", title:"<spring:message code='crm.lbl.scId' />", width:90, sortable:false} // 담당SC
                                    ,{field:"trsfStatCd", title:"<spring:message code='global.lbl.trsfStatCd' />", width:90 // 전출상태
                                        ,attributes:{"class":"ac"}
                                        ,template:'#= trsfStatCdArrVal(trsfStatCd)#'
                                    }
                                    ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:90, attributes:{"class":"ac"} // 등록일
                                        ,format:"{0:<dms:configValue code='dateFormat' />}"
                                    }
                                    ,{title:""}
                                     */
                                      {field:"custNm", title:"选择", width:90 // 선택
                                        ,attributes:{"class":"ac"}
                                    }
                                    , {field:"trsfStatCd", title:"客户名", width:90 // 고객명
                                        ,attributes:{"class":"ac"}
                                    }
                                    , {field:"trsfStatCd", title:"移动电话", width:90 // 전화번호
                                        ,attributes:{"class":"ac"}
                                    }
                                    , {field:"trsfStatCd", title:"客户类型", width:90 // 고객유형
                                        ,attributes:{"class":"ac"}
                                    }
                                    , {field:"trsfStatCd", title:"潜在/保有", width:90 // 잠재/보유
                                        ,attributes:{"class":"ac"}
                                    }
                                    , {field:"trsfStatCd", title:"销售顾问", width:90 // 판매고문
                                        ,attributes:{"class":"ac"}
                                    }
                                    , {field:"trsfStatCd", title:"线索来源", width:90 // 리드출처
                                        ,attributes:{"class":"ac"}
                                    }
                                    , {field:"trsfStatCd", title:"线索状态", width:90 // 리드상태
                                        ,attributes:{"class":"ac"}
                                    }
                                    , {field:"trsfStatCd", title:"商机转换日期", width:90 // 판매기회전환일자
                                        ,attributes:{"class":"ac"}
                                    }
                                    , {field:"trsfStatCd", title:"线索意向车种", width:90 // 리드의향차종
                                        ,attributes:{"class":"ac"}
                                    }
                                    , {field:"trsfStatCd", title:"线索意向车型", width:90 // 리드의향차형
                                        ,attributes:{"class":"ac"}
                                    }
                                    , {field:"trsfStatCd", title:"分配日期", width:90 // 배정일자
                                        ,attributes:{"class":"ac"}
                                    }
                                    , {field:"trsfStatCd", title:"结束日期", width:90 // 완료날짜
                                        ,attributes:{"class":"ac"}
                                    }
                                    , {field:"trsfStatCd", title:"线索录入日", width:90 // 리드등록날짜
                                        ,attributes:{"class":"ac"}
                                    }
                                    , {field:"trsfStatCd", title:"商机概述", width:90 // 판매기회개술
                                        ,attributes:{"class":"ac"}
                                    }
                                    , {field:"trsfStatCd", title:"商机来源", width:90 // 판매기회출처
                                        ,attributes:{"class":"ac"}
                                    }
                                    , {field:"trsfStatCd", title:"商机阶段", width:90 // 판매기회단계
                                        ,attributes:{"class":"ac"}
                                    }
                                    , {field:"trsfStatCd", title:"成功概率", width:90 // 성공확률
                                        ,attributes:{"class":"ac"}
                                    }
                                    , {field:"trsfStatCd", title:"预计销售日", width:90 // 예상판매일자
                                        ,attributes:{"class":"ac"}
                                    }
                                    , {field:"trsfStatCd", title:"转出状态", width:90 // 전출상태
                                        ,attributes:{"class":"ac"}
                                    }
                                    , {field:"trsfStatCd", title:"商机意向车种", width:90 // 판매기회의향차종
                                        ,attributes:{"class":"ac"}
                                    }
                                    , {field:"trsfStatCd", title:"商机意向车型", width:90 // 판매기회의향차형
                                        ,attributes:{"class":"ac"}
                                    }
                                    , {field:"trsfStatCd", title:"失败类型", width:90 // 실패유형
                                        ,attributes:{"class":"ac"}
                                    }
                                    , {field:"trsfStatCd", title:"失败1级原因", width:90 // 실패1급원인
                                        ,attributes:{"class":"ac"}
                                    }
                                    , {field:"trsfStatCd", title:"失败2级原因", width:90 // 실패2ㅈ급원인
                                        ,attributes:{"class":"ac"}
                                    }
                                    , {field:"trsfStatCd", title:"失败品牌", width:90 // 실패브랜드
                                        ,attributes:{"class":"ac"}
                                    }
                                    , {field:"trsfStatCd", title:"商机录入日", width:90 // 판매기회등록일
                                        ,attributes:{"class":"ac"}
                                    }

                        ]
                        ,editable:false
                        ,navigatable:false
                        ,autoBind:true
                        //,height:150
                        ,resizable:false
                        //,sortable:false
                        ,selectable:"row"
                    });
                    // 판매기회 관리 그리드 종료 //


                });

            </script>