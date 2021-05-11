<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<%-- <c:set value="01" var="membershipStan" /> --%> <!-- 고객 -->
<c:set value="02" var="membershipStan" /> <!-- 자동차 -->


            <!-- 블루멤버십 가입 목록 -->
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code="crm.menu.blueMemJoin"/></h1><!-- 블루멤버십 가입 목록 -->
                    <div class="btn_right">
                        <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
                        <button class="btn_m btn_save" id="btnSave"><spring:message code='global.btn.save'/></button><!-- 저장 -->
                        <button class="btn_m btn_add" id="btnAdd"><spring:message code='global.btn.rowAdd'/></button><!-- 추가 -->
                        <button class="btn_m btn_cancel" id="btnCancel"><spring:message code='global.btn.cancel' /></button><!-- 취소 -->
                    </div>
                </div>
                <div class="table_form form_width_70per">
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
                                <th scope="row"><spring:message code='global.lbl.custNm'/></th><!-- 고객명 -->
                                <td>
                                    <div class="form_search">
                                        <input id="sCustNm" disabled="disabled" class="form_input" placeholder="<spring:message code='global.lbl.custSearch' />" /><!-- // 고객조회 -->
                                        <a href="javascript:;"  id="sCustSearch" ><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></a>
                                        <input type="hidden" id="sCustNo" name="sCustNo" >
                                    </div>
                                </td>
                                <th scope="row"><spring:message code='global.lbl.vinNo'/></th><!-- VIN 번호 -->
                                <td>
                                    <input type="text" id="sVinNo" name="sVinNo" value="" class="form_input">
                                </td>
                                <th scope="row"><spring:message code='global.lbl.regDt'/></th><!-- 등록일 -->
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
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table_grid mt10">
                    <div id="blueMemUsrGrid"></div>
                </div>
            </section>
            <!-- //고객등록 현황(법인) -->

            <!-- 고객등록 현황(법인) -->
            <section class="group">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code="crm.title.blueMemJoinDetail"/></h2><!-- 블루멤버십 가입 상세정보(蓝缤会员入会列表) -->
                </div>
                <div class="table_form">
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
                                <th scope="row"><spring:message code="global.lbl.custNm" /></th><!-- 고객명 -->
                                <td class="readonly_area">
                                    <div class="form_search">
                                        <input id="custNm" disabled="disabled" class="form_input" placeholder="<spring:message code='global.lbl.custSearch' />" data-json-obj="true" /><!-- // 고객조회 -->
                                        <a href="javascript:;"  id="custSearchInfo" ><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></a>
                                        <input type="hidden" id="custNo" name="custNo" data-json-obj="true">
                                        <input type="hidden" id="blueMembershipNo" name="blueMembershipNo" data-json-obj="true">
                                        <input type="hidden" id="dlrCd" name="dlrCd" data-json-obj="true">
                                        <!-- <input type="hidden" id="custCd" name="custCd" data-json-obj="true"> -->
                                    </div>
                                </td>
                                <th scope="row"><spring:message code="global.lbl.custTp" /></th><!-- 고객유형 -->
                                <td>
                                    <input id="custTp" name="custTp" class="form_comboBox" readonly="readonly" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="crm.lbl.carOwnYn" /></th><!-- 차주여부(是否是车主) -->
                                <td>
                                    <!-- <input type="text" value="" readonly class="form_input form_readonly"> -->
                                    <input id="carOwnYn" name="carOwnYn" class="form_comboBox" readonly="readonly" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.hpNo' /></th><!-- 휴대전화 -->
                                <td>
                                    <input id="hpNo" name="hpNo" value="" readonly="readonly" class="form_input form_readonly" data-json-obj="true" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.mathDocTp' /></th><!-- 증거 유형 -->
                                <td class="readonly_area">
                                    <input id="mathDocTp" name="mathDocTp" class="form_comboBox" readonly="readonly" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.ssnCrnNo' /></th><!-- 증거번호 -->
                                <td>
                                    <!-- <input id="ssnCrnNo" name="ssnCrnNo" type="text" value="" class="numberandalpha form_readonly" readonly="readonly" /> -->
                                    <input id="ssnCrnNo" name="ssnCrnNo" value="" class="form_input form_readonly" readonly="readonly" data-json-obj="true" />
                                </td>
                                <td colspan="4"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="header_area">
                    <h3 class="title_basic"><spring:message code='global.lbl.addr'/></h3><!-- 주소 -->
                </div>
                <div class="table_grid">
                    <div id="addrGrid"></div>
                </div>
                <div class="table_form mt10">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:50%;">
                            <col style="">
                        </colgroup>
                        <tbody>
                            <tr>
                                <td>
                                    <label class="label_check ml5"><input type="checkbox" id="joinReqAgreeYn" name="joinReqAgreeYn" class="form_check" data-json-obj="true" ><spring:message code="crm.lbl.blueMemJoinAgree"/><!--  Bluemembers 가입 신청 동의함(同意加入蓝缤) --></label>
                                    <label class="label_check ml5"><input type="checkbox" id="policyAgreeYn" name="policyAgreeYn" class="form_check" data-json-obj="true" ><spring:message code="crm.lbl.blueMemUsrPolicyAgree"/><!-- Bluemembers 회원 정책 동의함(同意蓝缤会员政策) --></label>
                                </td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
            <!-- //블루멤버십 가입 목록 -->

<!-- script -->
<script>
    /*************************************************************
     *드랍다운 리스트 셋팅
     *************************************************************/
    // 고객유형 드랍다운 리스트.   custTpList    (CRM001)
    /* var custTpList              = [];
    var custTpCdMap              = [];
    <c:forEach var="obj" items="${custTpList}">
    custTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    custTpCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach> */

    //고객유형 설정
    var custTpList              = [{"cmmCd":"", "cmmCdNm":""}];
    var custTpMap = [];
    <c:forEach var="obj" items="${custTpList}">
    custTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    custTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

  //신분증 유형(주요인증문서유형) 설정
    var mathDocTpList           = [{"cmmCd":"", "cmmCdNm":""}];
    var mathDocTpMap            = [];
    <c:forEach var="obj" items="${mathDocTpList}">
    mathDocTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    mathDocTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    //우편번호
    var addrTpList           = [{"cmmCd":"", "cmmCdNm":""}];
    var addrTpMap               = [];
    <c:forEach var="obj" items="${addrTpList}">
    addrTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    addrTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    var chgBuyYnMap             = [];
    chgBuyYnMap["Y"] = "<spring:message code='global.lbl.yes' />";
    chgBuyYnMap["N"] = "<spring:message code='global.lbl.n' />";
    var chgBuyYnDS              = [];
    chgBuyYnDS.push({"cmmCd":"Y" , "cmmCdNm":"<spring:message code='global.lbl.yes' />"});
    chgBuyYnDS.push({"cmmCd":"N" , "cmmCdNm":"<spring:message code='global.lbl.n' />"});



    $(document).ready(function() {
        //차주여부
        $("#carOwnYn").kendoExtDropDownList({
            dataSource:["","Y","N"]
            ,index:0
            , enable:false
        });

        // 신분증유형            mathDocTp       (CRM024)
        $("#mathDocTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "
            , dataSource:mathDocTpList
            , index:0
        });

     // 고객유형 드랍다운 리스트.   custTpList    (CRM001)
        $("#custTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            //, optionLabel:" "
            , dataSource:custTpList
            , index:0
            , enable:false
        });


        //조회조건-소멸일 선택
        $("#sStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
           ,change:fnChkDateValue
        });

        $("#sEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
           ,change:fnChkDateValue
        });
        /* $(".form_datepicker").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        }); */
        /* $(".grid").kendoGrid({
            height:127
        }); */
        /* $(".form_comboBox").kendoExtDropDownList();
        $(".btn_m, .btn_s").kendoButton(); */

        /*************************************************************
         * 버튼 영역
         *************************************************************/

        //버튼 - 조회
        $("#btnSearch").kendoButton({
            click:function(e){
                $('#blueMemUsrGrid').data('kendoExtGrid').dataSource.page(1);
            }
        });

        //버튼 - 저장
        $("#btnSave").kendoButton({
            click:function(e){
                if(dms.string.isEmpty($("#custNo").val())){
                    // 고객명(를) 선택하여 주십시오.
                    dms.notification.info("<spring:message code='global.lbl.custNm' var='arguMsg' /><spring:message code='global.info.validation.select' arguments='${arguMsg}'/>");
                    return;
                }
                /* if(!dms.string.isEmpty($("#custNo").val()) && !dms.string.isEmpty($("#blueMembershipNo").val())){
                    //dms.notification.info("<spring:message code='global.info.required.change'/>");
                    alert("초기화후 다시 등록해 주시기 바랍니다.");
                    return;
                } */
                if(!$("#joinReqAgreeYn").prop("checked")){
                    //가입신청 동의함을(를) 체크하여 주십시오.
                    dms.notification.info("<spring:message code='crm.lbl.blueMemJoinAgree' var='arguMsg' /><spring:message code='global.info.validation.check' arguments='${arguMsg}'/>");
                    return;
                }
                if(!$("#policyAgreeYn").prop("checked")){
                    //회원정책 동의함을(를) 체크하여 주십시오.
                    dms.notification.info("<spring:message code='crm.lbl.blueMemUsrPolicyAgree' var='arguMsg' /><spring:message code='global.info.validation.check' arguments='${arguMsg}'/>");
                    return;
                }

                //진행된 설문이 있는지 부터 확인
                var grid = $('#addrGrid').data('kendoExtGrid');
                var selectedItem = grid.dataItem(grid.select());

                if(selectedItem == null){
                    // 주소을(를) 선택하여 주십시오.
                    dms.notification.info("<spring:message code='global.lbl.addr' var='arguMsg' /><spring:message code='global.info.validation.select' arguments='${arguMsg}'/>");
                    return;
                }


                var paramData = {};
                var rst = 0;
                paramData["dlrCd"] = $("#dlrCd").val();
                paramData["custNo"] = $("#custNo").val();
                paramData["custNm"] = $("#custNm").val();
                paramData["custTp"] = $("#custTp").val();
                paramData["carOwnYn"] = $("#carOwnYn").val();
                paramData["hpNo"] = $("#hpNo").val();
                paramData["mathDocTp"] = $("#mathDocTp").val();
                paramData["ssnCrnNo"] = $("#ssnCrnNo").val();
                paramData["sungNm"] = selectedItem.sungNm; //성
                paramData["cityNm"] = selectedItem.cityNm; //시
                paramData["distNm"] = selectedItem.distNm; //지역명
                paramData["zipCd"] = selectedItem.zipCd ;//우편번호
                //paramData["extZipCd"] = selectedItem.zipCd;//확장우편번호
                paramData["addrNm"] = selectedItem.addrNm;//주소명
                paramData["addrDetlCont"] = selectedItem.addrDetlCont;//주소상세내용

                if($("#joinReqAgreeYn").prop("checked")){
                    paramData["joinReqAgreeYn"] = "Y";
                }else{
                    paramData["joinReqAgreeYn"] = "N";
                }
                if($("#policyAgreeYn").prop("checked")){
                    paramData["policyAgreeYn"] = "Y";
                }else{
                    paramData["policyAgreeYn"] = "N";
                }
                paramData["joinApproveYn"] = "N";
                /*
                paramData["joinDlrCd"] = selectedItem.joinDlrCd;

                paramData["joinApproveDt"] = selectedItem.joinApproveDt;
                */

                $.ajax({
                    url:"<c:url value='/crm/dmm/blueMembershipJoin/insertBlueMembershipJoin.do' />",
                    data:JSON.stringify(paramData),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    },
                    success:function(result) {
                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                        $('#blueMemUsrGrid').data('kendoExtGrid').dataSource.page(1);
                        init();
                        //입력값을 확인하여 주십시오.
                        //dms.notification.warning("<spring:message code='global.info.check.input'/>");
                    }//end success
                })//end ajax


            }
        });

        //버튼 - 행추가
        $("#btnAdd").kendoButton({
            click:function(e){
                $('#blueMemUsrGrid').data('kendoExtGrid').dataSource.insert(0);
            }
        });
        //버튼 - 취소
        $("#btnCancel").kendoButton({
            click:function(e){
                var grid = $("#blueMemUsrGrid").data("kendoExtGrid");
                var rows = grid.select();

                rows.each(function(index, row) {
                    grid.removeRow(row);
                });
            }
        });

        //검색부 고객명 조회
        $("#sCustSearch").click(function(){

            popupWindow = dms.window.popup({
                windowId:"customerSearchPopup"
                , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
                , content:{
                    url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                    , data:{
                        "autoBind":false
                        , "type"  :null
                        , "callbackFunc":function(data){
                            if(data.length >= 1) {
                                $("#sCustNo").val(data[0].custNo);
                                $("#sCustNm").val(data[0].custNm);
                            }//end if
                        }//end callbackFunc
                    }//end data
                }// end content
            });
        });

        //등록부 고객명 조회
        $("#custSearchInfo").click(function(){

            popupWindow = dms.window.popup({
                windowId:"customerSearchPopup"
                , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
                , content:{
                    url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                    , data:{
                        "autoBind":false
                        , "type"  :null
                        , "callbackFunc":function(data){
                            if(data.length >= 1) {
                                $("#custNo").val(data[0].custNo);
                                $("#custNm").val(data[0].custNm);
                                $("#hpNo").val(data[0].hpNo);
                                if(data[0].custCd == "01"){
                                    $("#carOwnYn").data("kendoExtDropDownList").value("Y");
                                }else{
                                    $("#carOwnYn").data("kendoExtDropDownList").value("N");
                                }
                                $("#ssnCrnNo").val(data[0].ssnCrnNo);
                                $("#mathDocTp").data("kendoExtDropDownList").value(data[0].mathDocTp);
                                $("#custTp").data("kendoExtDropDownList").value(data[0].custTp);

                                $('#addrGrid').data('kendoExtGrid').dataSource.page(1);

                            }//end if
                        }//end callbackFunc
                    }//end data
                }// end content
            });
        });


        /*************************************************************
         *   그리드 셋팅
        *************************************************************/
        //그리드 설정
        $("#blueMemUsrGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/dmm/blueMembershipJoin/selectBlueMembershipJoins.do'/>"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"]    = options.pageSize;
                            params["pageIndex"]             = options.page;
                            params["firstIndex"]            = options.skip;
                            params["lastIndex"]             = options.skip + options.take;
                            params["sort"]                  = options.sort;

                            params["sCustNo"] = $("#sCustNo").val();
                            params["sVinNo"] = $("#sVinNo").val();
                            params["sStartDt"]    = $("#sStartDt").data("kendoExtMaskedDatePicker").value();
                            params["sEndDt"]      = $("#sEndDt").data("kendoExtMaskedDatePicker").value();

//                            console.log(params);
                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                        model:{
                            id:"dlrCd"
                                ,fields:{
                                    rnum:{type:"string"}
                                    ,dlrCd:{type:"string"}
                                    ,custNo:{type:"string", validation:{required:true}} //고객번호
                                    ,custNm:{type:"string", validation:{required:true} } //고객명
                                    ,custTp:{type:"string",  validation:{required:true}} // 고객유형
                                    ,hpNo:{type:"string", validation:{required:true}} // 휴대전화
                                    ,carOwnYn:{type:"string", validation:{required:true}} //차주여부
                                    ,mathDocTp:{type:"string", validation:{required:true}} //신분증유형
                                    ,ssnCrnNo:{type:"string", validation:{required:true}} //신분증번호
                                    ,sungNm:{type:"string", validation:{required:true}} //성
                                    ,cityNm:{type:"string", validation:{required:true}} //시
                                    ,regUsrId:{type:"string", validation:{required:true}} //등록자
                                    ,regDt:{type:"date", validation:{required:true}} //등록일
                                    ,joinApproveYn:{type:"string", validation:{required:true}} //가입승인여부
                                    ,joinApproveDt:{type:"date", validation:{required:true}} //가입승인일자
                                    ,blueMembershipNo:{type:"string", validation:{required:true}} //블루멤버쉽 번호
                                    ,blueMembershipJoinDt:{type:"date", validation:{required:true}} //블루멤버십 가입일자
                                    ,blueMembershipJoinDlrCd:{type:"string", validation:{required:true}} //블루멤버쉽 가입딜러코드
                                }
                        }
                }
            }
            , change:function(e){

                var dataItem = this.dataItem(this.select());


                $("#dlrCd").val(dataItem.dlrCd);
                $("#custNo").val(dataItem.custNo);
                $("#custNm").val(dataItem.custNm);
                $("#membershipNo").val(dataItem.membershipNo);
                $("#custTp").data("kendoExtDropDownList").value(dataItem.custTp)//고객유형
                //$("#carOwnYn").val();
                $("#carOwnYn").data("kendoExtDropDownList").value(dataItem.carOwnYn)//차주여부
                $("#hpNo").val(dataItem.hpNo);
                //$("#mathDocTp").val();
                $("#mathDocTp").data("kendoExtDropDownList").value(dataItem.mathDocTp)//증거유형
                $("#ssnCrnNo").val(dataItem.ssnCrnNo);//증거번호
                if(dataItem.joinReqAgreeYn == "Y"){
                    $("#joinReqAgreeYn").attr('checked',true);
                }
                if(dataItem.policyAgreeYn == "Y"){
                    $("#policyAgreeYn").attr('checked',true);
                }
                $("#addrGrid").data("kendoExtGrid").dataSource.page(1);  //주소
            }
            //,multiSelectWithCheckbox:false
            ,height:380
            , editable:false
            /* ,editable:{
                 mode:"incell"
                ,confirmation:false
            } */
            ,autoBind:false
            ,navigatable:true
            ,sortable:true
            ,pageable:true
            ,columns:[
                {field:"rnum", title:"no" ,width:50,attributes:{"class":"ac"}}// no
               ,{field:"dlrCd", title:"<spring:message code='crm.lbl.dlrCd'/>", hidden:true}// 딜러코드
               ,{field:"custNo", title:"<spring:message code='global.lbl.custNo'/>", hidden:true}// 고객번호
               ,{field:"custNm", title:"<spring:message code='global.lbl.custNm'/>",attributes:{"class":"ac"},width:150}// 고객명
               ,{field:"custTp", title:"<spring:message code='global.lbl.custTp'/>", attributes:{"class":"ac"}
                   ,width:80
                   , editor:function(container, options){
                       $('<input data-bind="value:' + options.field + '"  />')
                       .appendTo(container)
                       .kendoExtDropDownList({
                           dataTextField:"cmmCdNm"
                           , dataValueField:"cmmCd"
                           , dataSource:custTpList
                       });
                   }
                   , template:'#if (custTp !== ""){# #= custTpMap[custTp]# #}#'
               }// 고객유형
               ,{field:"hpNo", title:"<spring:message code='global.lbl.hpNo'/>", attributes:{"class":"ac"},width:100}// 휴대전화
               ,{field:"carOwnYn", title:"<spring:message code='crm.lbl.carOwnYn'/>", attributes:{"class":"ac"},width:100}// 차주여부
               ,{field:"mathDocTp", title:"<spring:message code='global.lbl.mathDocTp'/>", attributes:{"class":"ac"}
                   ,width:120
                   , editor:function(container, options){
                       $('<input data-bind="value:' + options.field + '"  />')
                       .appendTo(container)
                       .kendoExtDropDownList({
                           dataTextField:"cmmCdNm"
                           , dataValueField:"cmmCd"
                           , dataSource:mathDocTpList
                       });
                   }
                   , template:'#if (mathDocTp !== ""){# #= mathDocTpMap[mathDocTp]# #}#'
               }// 증거유형
               ,{field:"ssnCrnNo", title:"<spring:message code='global.lbl.ssnCrnNo'/>",attributes:{"class":"ac"},width:150}// 증거번호
               ,{field:"sungNm", title:"<spring:message code='global.lbl.sungNm'/>",attributes:{"class":"ac"},width:120}// 성
               ,{field:"cityNm", title:"<spring:message code='global.lbl.city'/>",attributes:{"class":"ac"},width:120}// 시
               ,{field:"regUsrId", title:"<spring:message code='global.lbl.regUsrId'/>",attributes:{"class":"ac"}}// 등록자
               ,{field:"regDt", title:"<spring:message code='global.lbl.regDt'/>",attributes:{"class":"ac"}
                   ,width:120
                   , format:"{0:<dms:configValue code='dateFormat' />}"
               }// 등록일
               ,{field:"joinApproveYn", title:"<spring:message code='crm.lbl.joinApproveYn'/>",attributes:{"class":"ac"},width:120}// 가입승인여부
               ,{field:"joinApproveDt", title:"<spring:message code='crm.lbl.joinApproveDt'/>",attributes:{"class":"ac"} // 가입승인일자
                   ,width:120
                   , format:"{0:<dms:configValue code='dateFormat' />}"
               }// 등록일
               ,{field:"blueMembershipNo", title:"<spring:message code='crm.lbl.blueMembershipNo'/>",attributes:{"class":"ac"},width:120, hidden:true}// 블루멤버십 번호
               ,{field:"blueMembershipJoinDt", title:"<spring:message code='crm.lbl.blueMembershipJoinDt'/>",attributes:{"class":"ac"} // 블루멤버십 가입일자
                   ,width:150
                   , hidden:true
                   , format:"{0:<dms:configValue code='dateFormat' />}"
               }// 블루멤버십 가입일자
               ,{field:"blueMembershipJoinDlrCd", title:"<spring:message code='crm.lbl.blueMembershipJoinDlrCd'/>",attributes:{"class":"ac"}, hidden:true,width:150}// 블루멤버쉽 가입딜러코드
               ,{}
            ]
        });




        /*************************************************************
         *   그리드 셋팅
        *************************************************************/
        // 주소 그리드
        $("#addrGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/cmm/addressInfo/selectAddressInfo.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"]    = options.pageSize;
                            params["pageIndex"]             = options.page;
                            params["firstIndex"]            = options.skip;
                            params["lastIndex"]             = options.skip + options.take;
                            params["sort"]                  = options.sort;
                            params["sRefTableNm"]           = "CR_0101T";
                            params["sRefKeyNm"]             = $("#custNo").val();

                            console.log(params);
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
                            id:"seq"
                            ,fields:{
                                seq:{type:"string", editable:false}
                                ,rnum  :{type:"number" , editable:false}
                                ,addrTp:{type:"string", editable:true}
                                ,zipCd:{type:"string", editable:false}
                                ,sungCd:{type:"string", editable:false}
                                ,cityCd:{type:"string", editable:false}
                                ,distCd:{type:"string", editable:false}
                                ,sungNm:{type:"string", editable:false}
                                ,cityNm:{type:"string", editable:false}
                                ,distNm:{type:"string", editable:false}
                                ,addrNm:{type:"string", editable:true}
                                ,addrDetlCont:{type:"string", editable:true}
                                ,flagYn:{type:"string", editable:true}
                                ,refTableNm:{type:"string", editable:false}
                                ,refKeyNm:{type:"string", editable:true}
                                ,useYn:{type:"string", editable:true}
                            }
                        }
                }
            }
            ,multiSelectWithCheckbox:false
            ,autoBind:false
            ,navigatable:false
            ,height:150
            ,pageable:false
            ,columns:[
               {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false ,attributes:{"class":"ac"}}
               ,{template:'<input type="checkbox" #= flagYn == "Y"? \'checked="checked"\':"" # class="flagYn" data-uid="#= uid #" />', width:60, attributes:{"class":"ac"},title:"<spring:message code='global.lbl.selectAddr' />"}
               ,{field:"addrTp", title:"<spring:message code='global.lbl.type' />", width:100, attributes:{"class":"ac"}
                   , editor:function(container, options){
                       $('<input data-bind="value:' + options.field + '"  />')
                       .appendTo(container)
                       .kendoExtDropDownList({
                           dataTextField:"cmmCdNm"
                           , dataValueField:"cmmCd"
                           , dataSource:addrTpList
                       });
                   }
                   , template:'#if (addrTp !== ""){# #= addrTpMap[addrTp]# #}#'
               }       // 주소유형
               ,{field:"sungNm", title:"<spring:message code='global.lbl.sungNm' />", width:100, attributes:{"class":"al"}}       // 성
               ,{field:"cityNm", title:"<spring:message code='global.lbl.cityNm' />", width:100, attributes:{"class":"al"}}       // 도시
               ,{field:"distNm", title:"<spring:message code='global.lbl.distNm' />", width:100, attributes:{"class":"al"}}       // 지역
               ,{field:"distCd", title:"<spring:message code='global.lbl.distCd' />", width:100, attributes:{"class":"al"}}       // 지역
               ,{field:"addrNm", hidden:true}       // 주소
               ,{field:"addrDetlCont", title:"<spring:message code='global.lbl.detlAddr' />", width:200, attributes:{"class":"al"}}       // 상세주소
               ,{field:"zipCd", title:"<spring:message code='global.lbl.zipCd' />", width:100, attributes:{"class":"ac"}}       // 우편번호
               ,{field:"useYn", title:"<spring:message code='global.lbl.validYn' />", width:100, attributes:{"class":"ac"}
                   , editor:function(container, options){
                       $('<input data-bind="value:' + options.field + '"  />')
                       .appendTo(container)
                       .kendoExtDropDownList({
                           dataTextField:"cmmCdNm"
                           , dataValueField:"cmmCd"
                           , dataSource:chgBuyYnDS
                       });
                   }
                   , template:'#if (useYn !== ""){# #= chgBuyYnMap[useYn]# #}#'
               }       // 사용유무
               ,{field:"sungCd", hidden:true}
               ,{field:"cityCd", hidden:true}
               ,{field:"distCd", hidden:true}
               ,{field:"refTableNm", hidden:true}
               ,{field:"refKeyNm", hidden:true}
               ,{title:""}
            ]

        });

    });

    function init(){

        $("#addrGrid").data("kendoExtGrid").dataSource.data([]);  //주소

        $("#custNo").val("");
        $("#custNm").val("");
        $("#membershipNo").val("");
        $("#custTp").data("kendoExtDropDownList").value("")//고객유형
        //$("#carOwnYn").val();
        $("#carOwnYn").data("kendoExtDropDownList").value("")//차주여부
        $("#hpNo").val("");
        //$("#mathDocTp").val();
        $("#mathDocTp").data("kendoExtDropDownList").value("")//증거유형
        $("#ssnCrnNo").val("");//증거번호
        $("#joinReqAgreeYn").attr('checked',false);
        $("#policyAgreeYn").attr('checked',false);

    }

 // 날짜 검증
    function fnChkDateValue(e){

        var  elmt  = e.sender.element[0],
             id    = elmt.id,
             toYY,
             toMM,
             toDD,
             frYY,
             frMM,
             frDD;

          //등록시작일
          if(id === 'sStartDt'){
              frYY = this.value().getFullYear();
              frMM = this.value().getMonth();
              frDD = this.value().getDate();
              $("#sEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
          }else if(id === 'sEndDt'){//등록종료일
              toYY = this.value().getFullYear();
              toMM = this.value().getMonth();
              toDD = this.value().getDate();
              $("#sStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
          }
     }


</script>
<!-- //script -->