<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!--  //khskhs  문제시 삭제 -->
<%@ page import="org.springframework.mobile.device.Device" %>
<%@ page import="org.springframework.mobile.device.DeviceUtils" %>
<!-- 20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 start -->
<!--<c:set var="isTablet" value="<%=DeviceUtils.getCurrentDevice(request).isTablet()|| DeviceUtils.getCurrentDevice(request).isMobile()%>" />" /> -->
<c:set var="isTablet" value="<%=DeviceUtils.getCurrentDevice(request).isTablet()|| DeviceUtils.getCurrentDevice(request).isMobile()%>" />
<!-- 20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 end -->

<!-- //khskhs  문제시 삭제 -->

    <!-- 그룹선택 팝업 -->
    <section id="windows" class="pop_wrap">
    <div id="tabstrip" class="tab_area">
        <!-- 탭메뉴 -->
        <ul>
            <li id="custSearchTab" class="k-state-active"><spring:message code="global.title.custSearch" /><!-- 고객조회 --></li>
            <li id="carInfoSearchTab"><spring:message code="ser.title.carInfo" /> <!-- 차량정보 --></li>
            <li id="pConSearchTab"><spring:message code="crm.lbl.pconCustInfo" /> <!-- 연계인 --></li>
        </ul>
        <span class="btn_right_absolute2">
            <button id="btnCustCreate" class="btn_m btn_Search" style="display:none;"><spring:message code="global.btn.custAdd" /></button> <!-- 고객생성 -->
            <button id="btnCustSearch" class="btn_m btn_Search"><spring:message code="global.btn.search" /><!-- 조회 --></button>
            <button id="btnCustSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /><!-- 선택 --></button>
        </span>
        <div id="custSearchTabDiv" class="mt0"> <!--  고객조회 TAB - 시작 -->
            <section class="group">
                <div class="table_form form_width_100per mt10" role="search" data-btnid="btnCustSearch" >
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:28%;">
                            <col style="width:10%;">
                            <col style="width:21%;">
                            <col style="width:10%;">
                            <col>
                        </colgroup>
                        <tbody id="tdrvInputForm">
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.custNm" /></th><!-- 고객명 -->
                                <td>
                                    <input type="text" id="custNm" name="custNm" class="form_input" data-json-obj="true">
                                    <input type="hidden" id="mngScId" name="mngScId" class="form_input" >
                                </td>
                                <th scope="row"><spring:message code="global.lbl.custTp" /></th><!-- 고객유형 -->
                                <td>
                                    <input type="text" id="custTp" name="custTp" class="form_comboBox" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code="global.lbl.hpNo" /></th><!-- 이동전화 -->
                                <td>
                                    <input type="text" id="hpNo" name="hpNo" class="form_input numberic" data-json-obj="true">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.sex" /></th><!-- 성별 -->
                                <td>
                                    <input type="text" id="sexCd" name="sexCd" class="form_comboBox" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code="global.lbl.homeTelNo" /></th> <!-- 집전화 -->
                                <td>
                                    <input id="telNo" name="telNo" type="text" value="" class="form_input numberic" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code="global.lbl.custCd" /></th> <!-- 잠재/보유고객 -->
                                <td>
                                    <input type="text" id="custCd" name="custCd" class="form_comboBox" data-json-obj="true">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.regDt" /></th><!-- 등록일 -->
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="regDtFrom" name="regDtFrom" class="form_datepicker" data-json-obj="true">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="regDtTo" name="regDtTo" class="form_datepicker" data-json-obj="true">
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code="global.lbl.ssnCrnNo" /></th> <!-- 증거번호  -->
                                <td>
                                    <input id="sSsnCrnNo" name="sSsnCrnNo" type="text" value="" class="form_input"  pattern="[0-9A-Z]" maxlength="20" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.dlrMbrShip" /></th><!-- 딜러멤버십 -->
                                <td>
                                    <input type="text" id="sDlrMbrYn" name="sDlrMbrYn" class="form_comboBox" data-json-obj="true">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table_grid mt10">
                    <div id="customerGrid"></div>
                </div>
            </section>
        </div><!--  고객조회 TAB - 끝 -->
        <div id="carInfoSearchTabDiv" class="mt0">
            <section class="group">
                <div class="table_form form_width_100per mt10" role="search" data-btnid="btnCustSearch" >
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:23%;">
                            <col style="width:10%;">
                            <col style="width:23%;">
                            <col style="width:10%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.carNo' /></th><!-- 차량번호 -->
                                <td>
                                    <input id="sVcarRegNo" name="sVcarRegNo" class="form_input" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.vinNo' /></th><!-- VIN -->
                                <td>
                                    <input id="sVvinNo" name="sVvinNo" class="form_input numberandalpha"/>
                                </td>
                                <th scope="row"><spring:message code="global.lbl.hpNo" /></th><!-- 이동전화 -->
                                <td>
                                    <input type="text" id="sVhpNo" name="sVhpNo" class="form_input numberic" data-json-obj="true">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.custNm" /></th><!-- 고객명 -->
                                <td>
                                    <input type="text" id="sVcustNm" name="sVcustNm" class="form_input" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code="global.lbl.custTp" /></th><!-- 고객유형 -->
                                <td>
                                    <input type="text" id="sVcustTp" name="sVcustTp" class="form_comboBox" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code="global.lbl.homeTelNo" /></th> <!-- 집전화 -->
                                <td>
                                    <input id="sVtelNo" name="sVtelNo" type="text" value="" class="form_input numberic" data-json-obj="true">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.dlrMbrShip" /></th><!-- 딜러멤버십 -->
                                <td>
                                    <input type="text" id="sVdlrMbrYn" name="sVdlrMbrYn" class="form_comboBox" data-json-obj="true">
                                </td>
                                <th></th>
                                <td></td>
                                <th></th>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table_grid mt10">
                    <div id="grid" class="grid"></div>
                </div>
            </section>
        </div>
        <div id="pConSearchTabDiv" class="mt0">
            <section class="group">
                <div class="table_form form_width_100per mt10" role="search" data-btnid="btnCustSearch" >
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:23%;">
                            <col style="width:10%;">
                            <col style="width:23%;">
                            <col style="width:10%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.hpNo" /></th><!-- 이동전화 -->
                                <td>
                                    <input type="text" id="sPhpNo" name="sPhpNo" class="form_input numberic" data-json-obj="true" placeholder="<spring:message code='global.lbl.customer' />/<spring:message code='crm.lbl.pconCustInfo' />" >
                                </td>
                                <th scope="row"><spring:message code="global.lbl.custNm" /></th><!-- 고객명 -->
                                <td>
                                    <input type="text" id="sPcustNm" name="sPcustNm" class="form_input" data-json-obj="true"  placeholder="<spring:message code='global.lbl.customer' />/<spring:message code='crm.lbl.pconCustInfo' />">
                                </td>
                                <th></th>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table_grid mt10">
                    <div id="pConGrid"></div>
                </div>
            </section>
        </div>
    </div>
    </section>
    <!-- //그룹선택 팝업 -->

 <script type="text/javascript">
 var isTablet = ${isTablet}+"";
 var sysDate = new Date("<c:out value='${sysDate}' />");
 var custTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
 var custTpMap = [];
 var sexCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
 var sexCdMap = [];
 var custCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
 var custCdMap = [];

 var mathDocTpArrVal = [];
 var pconTpMap = [];

 var ynListDS = [];
 ynListDS.push({"cmmCd":"Y" , "cmmCdNm":"<spring:message code='global.lbl.yes' />"});
 ynListDS.push({"cmmCd":"N" , "cmmCdNm":"<spring:message code='global.lbl.n' />"});

 <c:forEach var="obj" items="${custCdList}">
 custCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
 custCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
 </c:forEach>

 <c:forEach var="obj" items="${mathDocTpList}">
 mathDocTpArrVal["${obj.cmmCd}"] = "${obj.cmmCdNm}";
 </c:forEach>

 <c:forEach var="obj" items="${custTpList}">
 custTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
 custTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
 </c:forEach>

 <c:forEach var="obj" items="${sexCdList}">
 sexCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
 sexCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
 </c:forEach>

 <c:forEach var="obj" items="${pconTpList}">
 pconTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
 </c:forEach>

 var options = parent.popupWindow.options.content.data
   , autoBind = options.autoBind                        // 고객조회 그리드 자동 조회 여부
   , pconYn = options.pconYn                            // 연계인탭 여부 ( Y : 연계인 탭부터 오픈 )
   , custNm = options.custNm                            // autoBind : true 인경우 검색조건 set
   , hpNo = options.hpNo                                // autoBind : true 인경우 검색조건 set / 연계인 탭인경우 연계인 검색조건 set
   , telNo = options.telNo                              // 검색조건 set
   , custCd = options.custCd                            // 잠재/보유고객 - 01:잠재 ( 고객탭만 나옴 ) / 02:보유
   , custTp = options.custTp                            // 고객유형 - 01:개인 / 02:법인
   , dlrMbrYn = options.dlrMbrYn                        // 딜러멤버십 가입여부
   , dlrMbrEnableYn = options.dlrMbrEnableYn            // 딜러멤버십 enable 여부
   , callBackTp = options.callBackTp                    // 판매에서만 사용. BTN_CREATE 인경우 고객등록 버튼 show > 버튼 클릭시 판매쪽 고객등록 팝업 open
   , mngScId = options.mngScId                          // 판매고문 있는 경우 해당 판매고문것만 조회 하도록 한다.
   , closeYn = options.closeYn                          // 팝업 close 여부
   , membershipStan = options.membershipStan            // 멤버십 관리 > 멤버십 등록 팝업에서 고객등록 팝업을 열경우 차량기준일때 차량 탭만 보여준다.
   , custCollSrcCd = options.custCollSrcCd              // 고객등록 버튼 활성화 시 고객수집경로 (01:판매, 02:정비)
   , addrTp = options.addrTp                            // 주소타입 검색 조건 (CRM033)
 ;

$(document).ready(function() {

    if(isTablet=="true"){
        $("#tabstrip").width(930);
    }
    console.log("options : ",options);
    /*************************************************************
            드랍다운 리스트 셋팅
    *************************************************************/
    $("#sDlrMbrYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:ynListDS
    });

    $("#sVdlrMbrYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:ynListDS
    });

    // 고객유형 드랍다운 리스트.
    $("#custTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:custTpList
        , index:0
        , change:function(e) {
            var selcmmCd = this.dataItem(this.select()).cmmCd;
        }
    });

    // 고객유형 드랍다운 리스트.
    $("#sVcustTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:custTpList
        , index:0
    });

    // 고객타입 드랍다운 리스트. (잠재/보유)
    $("#custCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:custCdList
        , index:0
    });

    // 성별 드랍다운 리스트.
    $("#sexCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:sexCdList
        , index:0
    });

    // 숫자
    var onlyNum = new RegExp("[^0-9]","i");
    $(".numberic").keyup(function(e)
    {
        var content = $(this).val();
        if(content.match(onlyNum)){
            $(this).val('');
        }
    });
    $(".numberic").focusout(function(){
        $(this).val($.trim($(this).val()));
        var content = $(this).val();
        if(content.match(onlyNum)){
            $(this).val('');
        }
    });

    // 숫자와 알파벳
    var onlyNumAlpha = new RegExp("[^A-Z0-9]");
    $(".numberandalpha").keyup(function(e)
    {
        var contents = $(this).val();
        if(onlyNumAlpha.test(contents)){
            $(this).val('');
        }
    });
    $(".numberandalpha").focusout(function(){
        $(this).val($.trim($(this).val()));
        var contents = $(this).val();
        if(onlyNumAlpha.test(contents)){
            $(this).val('');
        }
    });
    // 고객등록팝업
    $("#btnCustCreate").kendoButton({
        click:function(e){
            var data = [];
            data.callBackTp = "BTN_CREATE"
            options.callbackFunc(data);
            if(closeYn == undefined || closeYn == "Y"){
                parent.popupWindow.close();
            }
        }
    });

    // 닫기 버튼.
    $("#btnCancel").kendoButton({
        click:function(e){
            parent.popupWindow.close();
        }
    });

    // 등록일 From - To
    $("#regDtTo").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
    sysDate.setDate(sysDate.getDate()-7);
    $("#regDtFrom").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    /************************************************************
         그리드 설정
    *************************************************************/
    //그리드 설정 (그룹 CRUD)
    $("#customerGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/crm/cif/customerInfo/customerListSearch.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};
                        params["recordCountPerPage"]    = options.pageSize;
                        params["pageIndex"]             = options.page;
                        params["firstIndex"]            = options.skip;
                        params["lastIndex"]             = options.skip + options.take;
                        params["sort"]                  = options.sort;

                        params["sCustNm"]               = $("#custNm").val();
                        params["sCustTp"]               = $("#custTp").data("kendoExtDropDownList").value();
                        params["sCustCd"]               = $("#custCd").data("kendoExtDropDownList").value();
                        params["sHpNo"]                 = $("#hpNo").val();
                        params["sSexCd"]                = $("#sexCd").data("kendoExtDropDownList").value();
                        params["sTelNo"]                = $("#telNo").val();
                        params["sRegDtFrom"]            = $("#regDtFrom").data("kendoExtMaskedDatePicker").value();
                        params["sRegDtTo"]              = $("#regDtTo").data("kendoExtMaskedDatePicker").value();
                        params["sSsnCrnNo"]             = $("#sSsnCrnNo").val();
                        params["sDlrMbrYn"]             = $("#sDlrMbrYn").data("kendoExtDropDownList").value();
                        params["sMngScId"]                = $("#mngScId").val();
                        params["sAddrTp"] = addrTp;

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                    errors:"error"
                    , model:{
                        id:"rnum"
                        , fields:{
                            rnum:{type:"number"}
                            , custNo       :{type:"string", editable:false}
                            , custNm       :{type:"string", editable:false}
                            , custTp       :{type:"string", editable:false}
                            , hpNo         :{type:"string", editable:false}
                            , telNo        :{type:"string", editable:false, defaultValue:""}
                            , officeTelNo  :{type:"string", editable:false, defaultValue:""}
                            , regDt        :{type:"date", editable:false}
                            , zipCd       :{type:"string", editable:false}
                            , sungNm       :{type:"string", editable:false}
                            , cityNm       :{type:"string", editable:false}
                            , distNm       :{type:"string", editable:false}
                            , addrDetlCont :{type:"string", editable:false}
                            , mathDocTp    :{type:"string", editable:false}
                            , ssnCrnNo     :{type:"string", editable:false}
                        }
                    }
            }
        }
        ,dataBound:function(e) {

            if ( pconYn !== "Y" ) {
                var grid          = $("#customerGrid").data("kendoExtGrid");
                var gridDataSource = grid.dataSource;
                if (gridDataSource._data.length == 1 && (closeYn == undefined || closeYn == "Y")) {
                    selectRow = grid.tbody.find(">tr:not(.k-grouping-row)").eq(0);
                    grid.select(selectRow);
                    //$("#btnCustSelect").click();//用户信息有单个时，不进行选择  贾明 2018-12-18 
                }

            }
        }
        ,filterable:false
        ,autoBind:false
        ,selectable:"row"
        ,navigatable:false
        ,editable:false
        ,height:343
        ,columns:[
                    {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:40, sortable:false ,attributes:{"class":"ac"}}
                    , {field:"custTp" , title:"<spring:message code='global.lbl.custTp' />", width:80, attributes:{"class":"ac"}
                        , sortable:false , template:"#=custTpMap[custTp]#"}
                    , {field:"custNo" , title:"<spring:message code='global.lbl.custNo' />",  width:140, attributes:{"class":"ac"}}
                    , {field:"custNm" , title:"<spring:message code='global.lbl.custNm' />",  width:120, attributes:{"class":"ac"}}
                    , {field:"sexCd"   , title:"<spring:message code='global.lbl.sex' />", width:30, attributes:{"class":"ac"}
                        ,attributes:{"class":"ac"}
                        ,template:function(dataItem){
                            var spanObj = "";
                            if (dataItem.sexCd == 'M') {
                                spanObj = "<span class='icon_male'></span>";
                            } else if (dataItem.sexCd == 'F') {
                                spanObj = "<span class='icon_female'></span>";
                            }
                            return spanObj;
                        }
                    } // 성별
                    , {field:"birthDt"  , title:"<spring:message code='global.lbl.birthday' />", width:100, attributes:{"class":"ac"}} // 생일
                    , {field:"custCd" , title:"<spring:message code='global.lbl.custCd' />", width:100, attributes:{"class":"ac"}, sortable:false
                        , template:"#=custCdMap[custCd]#" }
                    , {field:"hpNo"   , title:"<spring:message code='global.lbl.hpNo' />", width:120, attributes:{"class":"ac"}}
                    , {field:"telNo"  , title:"<spring:message code='global.lbl.officeTelNo' />", width:120, attributes:{"class":"ac"}
                        , template:"#if (data.custTp == '01'){# #= dms.string.strNvl(data.telNo)# #} else {# #= dms.string.strNvl(data.officeTelNo)# #}#" }
                    , {field:"ssnCrnNo"  , title:"<spring:message code='global.lbl.ssnCrnNo' />", width:120, attributes:{"class":"ac"}}
                    , {field:"hpNoInvldYn"  , title:"<spring:message code='global.lbl.hpNoInvld' />", width:90
                        , attributes:{"class":"ac"}
                        ,template:function(dataItem){
                            var spanObj = "";
                            if (dataItem.hpNoInvldYn == 'Y') {
                                spanObj = "<span class='icon_ok'></span>";
                            }
                            return spanObj;
                        }
                    }  // 핸드폰번호무효  (법인검증무효)
                    , {field:"hpNoAddImposYn"  , title:"<spring:message code='global.lbl.hpNoAddImpos' />", width:90
                        , attributes:{"class":"ac"}
                        ,template:function(dataItem){
                            var spanObj = "";
                            if (dataItem.hpNoAddImposYn == 'Y') {
                                spanObj = "<span class='icon_ok'></span>";
                            }
                            return spanObj;
                        }
                    }  // 핸드폰번호수정불가 (딜러갱신불가)
                    , {field:"sungNm", title:"<spring:message code='global.lbl.sungNm' />", width:100, attributes:{"class":"al"}, sortable:false}       // 성
                    , {field:"cityNm", title:"<spring:message code='global.lbl.cityNm' />", width:100, attributes:{"class":"al"}, sortable:false}       // 도시
                    , {field:"distNm", title:"<spring:message code='global.lbl.distNm' />", width:100, attributes:{"class":"al"}, sortable:false}       // 지역
                    , {field:"addrDetlCont", title:"<spring:message code='global.lbl.detlAddr' />", width:150, attributes:{"class":"al"}, sortable:false}  // 상세주소
                    , {field:"mngScNm", title:"<spring:message code='crm.lbl.prsn' />", width:100, attributes:{"class":"ac"}, sortable:false}       // 책임자
                    , {field:"blueMembershipNo"  , title:"<spring:message code='crm.lbl.blueMembershipYn' />", width:90, sortable:false
                        , attributes:{"class":"ac"}
                        ,template:function(dataItem){
                            var spanObj = "";
                            if (dms.string.isNotEmpty(dataItem.blueMembershipNo)) {   //
                                spanObj = "<span class='icon_ok'></span>";
                            }
                            return spanObj;
                        }
                    }  // 블루멤버십 BLUE_MEMBERSHIP_NO
                    , {field:"dlrMbrYn"  , title:"<spring:message code='crm.lbl.mbrShipTpYn' />", width:90, sortable:false
                        , attributes:{"class":"ac"}
                        ,template:function(dataItem){
                            var spanObj = "";
                            if (dms.string.isNotEmpty(dataItem.dlrMbrYn)) {   //
                                spanObj = "<span class='icon_ok'></span>";
                            }
                            return spanObj;
                        }
                    }  // 딜러멤버십
                    , {field:"saleDt"  , title:"<spring:message code='sal.lbl.saleDt' />", width:130, attributes:{"class":"ac"}, sortable:false
                        ,template:"#if (saleDt !== null ){# #= kendo.toString(saleDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"}//판매일자
                    , {field:"regDt"  , title:"<spring:message code='global.lbl.regDt' />", width:130, attributes:{"class":"ac"}
                        ,template:"#if (regDt !== null ){# #= kendo.toString(regDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"}//등록일자
                ]
    });
    // 그리드 더블 클릭 이벤트.
    $("#customerGrid").on("dblclick", "tr.k-state-selected", function (e) {
        $("#btnCustSelect").click();
    });
    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/crm/cif/customerInfo/selectCustomerAndCarInfo.do'/>"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};
                        params["recordCountPerPage"]    = options.pageSize;
                        params["pageIndex"]             = options.page;
                        params["firstIndex"]            = options.skip;
                        params["lastIndex"]             = options.skip + options.take;
                        params["sort"]                  = options.sort;

                        params["sCustNm"] = $("#sVcustNm").val();
                        params["sCustTp"] = $("#sVcustTp").data("kendoExtDropDownList").value(); // 01: 개인, 02:법인
                        params["sHpNo"] = $("#sVhpNo").val();
                        params["sTelNo"] = $("#sVtelNo").val();
                        params["sDlrMbrYn"] = $("#sVdlrMbrYn").data("kendoExtDropDownList").value(); // 01: 잠재, 02:보유, 03:타사보유
                        params["sVinNo"] = $("#sVvinNo").val();
                        params["sCarRegNo"] = $("#sVcarRegNo").val();
                        params["sMngScId"] = $("#mngScId").val();
                        params["sAddrTp"] = addrTp;

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
                            ,custNo:{type:"string", validation:{required:true}} //고객번호
                            ,custNm:{type:"string", validation:{required:true} } //고객명
                            ,custTp:{type:"string",  validation:{required:true}} // 고객유형
                            ,hpNo:{type:"string", validation:{required:true}} // 휴대전화
                            ,mathDocTp:{type:"string", validation:{required:true}} //신분증유형
                            ,ssnCrnNo:{type:"string", validation:{required:true}} //신분증번호
                            ,regUsrId:{type:"string", validation:{required:true}} //등록자
                            ,regDt:{type:"date", validation:{required:true}} //등록일
                            ,regDtFormat:{type:"date", validation:{required:true}} //등록일
                            ,saleDt:{type:"date", validation:{required:true}} //인도일일
                        }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                            elem.blueMembershipJoinDtFormat = kendo.parseDate(elem.blueMembershipJoinDt, "<dms:configValue code='dateFormat' />");
                            elem.joinApproveDtFormat = kendo.parseDate(elem.joinApproveDt, "<dms:configValue code='dateFormat' />");
                        });
                    }
                    return d;
                }
            }
        }
        ,filterable:false
        ,autoBind:false
        ,selectable:"row"
        ,navigatable:false
        ,editable:false
        ,height:343
        ,columns:[
                  {field:"rnum", title:"no" ,width:50,attributes:{"class":"ac"}}// no
                 ,{field:"custNo", title:"<spring:message code='global.lbl.custNo'/>", hidden:true}// 고객번호
                 ,{field:"custNm", title:"<spring:message code='global.lbl.custNm'/>",attributes:{"class":"ac"},width:150}// 고객명
                 ,{field:"vinNo", title:"<spring:message code='crm.lbl.vinNo'/>",attributes:{"class":"ac"},width:150}// VIN
                 ,{field:"carRegNo", title:"<spring:message code='crm.lbl.carRegNo'/>",attributes:{"class":"ac"},width:150}// 차량번호
                 ,{field:"carlineNm", title:"<spring:message code='global.lbl.carlineNm'/>",attributes:{"class":"ac"},width:150}// 차종
                 ,{field:"modelNm", title:"<spring:message code='global.lbl.modelNm'/>",attributes:{"class":"ac"},width:150}// 모델
                 ,{field:"custTp", title:"<spring:message code='global.lbl.custTp'/>", attributes:{"class":"ac"},width:80
                     ,template:'#if (custTp != null ){# #= custTpMap[custTp]# #}#'}// 고객유형
                 ,{field:"hpNo", title:"<spring:message code='global.lbl.hpNo'/>", attributes:{"class":"ac"},width:100}// 휴대전화
                 ,{field:"mathDocTp", title:"<spring:message code='global.lbl.mathDocTp'/>", attributes:{"class":"ac"},width:120, sortable:false
                     ,template:'#if (mathDocTp != null){# #= mathDocTpArrVal[mathDocTp]# #}#'}// 증거유형
                 ,{field:"ssnCrnNo", title:"<spring:message code='global.lbl.ssnCrnNo'/>",attributes:{"class":"ac"},width:150}// 증거번호
                 ,{field:"saleDt", title:"<spring:message code='sal.lbl.deliveryDt'/>",attributes:{"class":"ac"},width:120
                     , format:"{0:<dms:configValue code='dateFormat' />}"}//인도일자
                 ,{field:"regDt", title:"<spring:message code='global.lbl.regDt'/>",attributes:{"class":"ac"},width:120
                     , format:"{0:<dms:configValue code='dateFormat' />}", hidden:true}
                 ,{field:"regDtFormat", title:"<spring:message code='global.lbl.regDt' />", width:150
                     ,attributes:{"class":"ac tooltip-disabled"}
                     ,template:"#= kendo.toString(data.regDt, '<dms:configValue code='dateTimeFormat' />') #"}// 등록일
                 ,{field:"carRunDistVal", title:"carRunDistVal", width:120, hidden:true }//차량주행거리값
                 ,{field:"ocnCd", title:"ocnCd", width:120, hidden:true }//OCN코드
              ]
    });
    // 그리드 더블 클릭 이벤트.
    $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
        $("#btnCustSelect").click();
    });
    //연계인 그리드 설정
    $("#pConGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/crm/cif/customerInfo/selectCustomerAndPconInfo.do'/>"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};
                        params["recordCountPerPage"]    = options.pageSize;
                        params["pageIndex"]             = options.page;
                        params["firstIndex"]            = options.skip;
                        params["lastIndex"]             = options.skip + options.take;
                        params["sort"]                  = options.sort;

                        params["sCustNm"] = $("#sPcustNm").val();
                        params["sHpNo"] = $("#sPhpNo").val();
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
                            ,custPconTp:{type:"string", validation:{required:true}} //고객/연계인
                            ,custNo:{type:"string", validation:{required:true}} //고객번호
                            ,custNm:{type:"string", validation:{required:true} } //고객명
                            ,hpNo:{type:"string", validation:{required:true}} // 휴대전화
                            ,relCustNm:{type:"string",  validation:{required:true}} // 연계인 고객명
                            ,relHpNo:{type:"string", validation:{required:true}} // 연계인 휴대전화
                            ,relFlagYn:{type:"string", validation:{required:true}} //주요 연계인
                            ,pconTp:{type:"string", validation:{required:true}} //연계인 유형
                            ,regDt:{type:"date", validation:{required:true}} //등록일
                        }
                }
            }
        }
        ,filterable:false
        ,autoBind:false
        ,selectable:"row"
        ,navigatable:false
        ,editable:false
        ,height:343
        ,columns:[
                  {field:"rnum", title:"no" ,width:50,attributes:{"class":"ac"}}// no
                 ,{field:"custPconTp", title:"<spring:message code='global.lbl.customer' />/<spring:message code='crm.lbl.pconCustInfo' />",  width:100, attributes:{"class":"ac"}
                     , template:'#if (custPconTp == "C"){# #= "<spring:message code='global.lbl.customer' />"# #}else if(custPconTp == "R"){# #= "<spring:message code='crm.lbl.pconCustInfo' />"# #}#'}//고객 / 연계인
                 ,{field:"custNo", title:"<spring:message code='global.lbl.custNo'/>", hidden:true}// 고객번호
                 ,{field:"custNm", title:"<spring:message code='global.lbl.custNm'/>",attributes:{"class":"ac"},width:150}// 고객명
                 ,{field:"hpNo", title:"<spring:message code='global.lbl.hpNo'/>", attributes:{"class":"ac"},width:100}// 휴대전화
                 ,{field:"pconTp", title:"<spring:message code='crm.lbl.relType' />",  width:100, attributes:{"class":"ac"}
                     , template:'#if (pconTp !== null){# #= pconTpMap[pconTp]# #}else{# #= ""# #}#'}//연계인 유형
                 ,{field:"relNm", title:"<spring:message code='crm.lbl.relCustNm'/>",attributes:{"class":"ac"},width:150}//연계인 명
                 ,{field:"relHpNo", title:"<spring:message code='crm.lbl.relHpNo'/>", attributes:{"class":"ac"},width:100}//연계인 핸드폰번호
                 ,{field:"relFlagYn", title:"<spring:message code='crm.lbl.majorCustRel'/>", attributes:{"class":"ac"},width:100}//주요 연계인
                 ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:150,attributes:{"class":"ac tooltip-disabled"}
                     ,template:"#if(regDt){# #=kendo.toString(regDt, '<dms:configValue code='dateFormat' />')# #}#" }// 등록일
              ]
    });
    // 그리드 더블 클릭 이벤트.
    $("#pConGrid").on("dblclick", "tr.k-state-selected", function (e) {
        $("#btnCustSelect").click();
    });

    /************************************************************
         기능버튼 설정
    *************************************************************/
    $("#btnCustSearch").kendoButton({// 조회 버튼.
        click:function(e){
           var selectedIndex = $("#tabstrip").data("kendoExtTabStrip").select().index();
           var selectedTabId = $("#tabstrip").data("kendoExtTabStrip").items()[selectedIndex].id;
           if(selectedTabId == "custSearchTab"){ //고객 Search
               var regDtFrom = $("#regDtFrom").data("kendoExtMaskedDatePicker").value();
               var regDtTo = $("#regDtTo").data("kendoExtMaskedDatePicker").value();
               if ( dms.string.isEmpty(regDtFrom)){
                   if (dms.string.isNotEmpty(regDtTo)) {
                       dms.notification.warning("<spring:message code='global.lbl.regDt' var='returnMsg' /><spring:message code='global.info.emptyParamInfo' arguments='${returnMsg}' />");
                       $("#regDtFrom").focus();
                       return false;
                   }
               }
               if ( dms.string.isEmpty(regDtTo)){
                   if (dms.string.isNotEmpty(regDtFrom)) {
                       dms.notification.warning("<spring:message code='global.lbl.regDt' var='returnMsg' /><spring:message code='global.info.emptyParamInfo' arguments='${returnMsg}' />");
                       $("#regDtTo").focus();
                       return false;
                   }
               }

               if(dms.date.isValidPeriod($("#regDtFrom").data("kendoExtMaskedDatePicker").value()
                       ,$("#regDtTo").data("kendoExtMaskedDatePicker").value())){
                   $("#customerGrid").data("kendoExtGrid").dataSource.page(1);
               }else{
                   dms.notification.warning('<spring:message code="global.err.checkDateValue"/>');
                   $("#regDtTo").data("kendoExtMaskedDatePicker").value(new Date(''));
                   $("#regDtTo").focus();
               }

           }else if(selectedTabId == "carInfoSearchTab"){ //차량 고객 Search
               $("#grid").data("kendoExtGrid").dataSource.read();
           }else if(selectedTabId == "pConSearchTab"){ //고객&연계인 Search
               if ( dms.string.isNotEmpty($("#sPhpNo").val()) || dms.string.isNotEmpty($("#sPcustNm").val()) ){
                   $("#pConGrid").data("kendoExtGrid").dataSource.page(1);
               }else{
                   dms.notification.error("<spring:message code='global.lbl.custNm' var='returnMsg1' /><spring:message code='global.lbl.hpNo' var='returnMsg2' /><spring:message code='global.info.inputOneParam' arguments='${returnMsg1},${returnMsg2}' />");
                   return false;
               }
           }
        }
    });
    $("#btnCustSelect").kendoButton({// 선택 버튼.
        click:function(e){
            var selectedIndex = $("#tabstrip").data("kendoExtTabStrip").select().index();
            var selectedTabId = $("#tabstrip").data("kendoExtTabStrip").items()[selectedIndex].id;
            if(selectedTabId == "custSearchTab"){//고객 Search
                custSearchSelect();
            }else if(selectedTabId == "carInfoSearchTab"){//차량 고객 Search
                custAndCarSearchSelect();
            }else if(selectedTabId == "pConSearchTab"){//고객&연계인 Search
                custAndPconSearchSelect();
            }
        }
    });
    $("#tabstrip").kendoExtTabStrip({
        animation:false
    });
    $("#pConSearchTab").hide();
    $("#pConSearchTabDiv").hide();

    // 멤버십 관리 > 멤버십 등록 팝업에서 고객등록 팝업을 열경우 차량기준일때 차량 탭만 보여준다.
    if ( membershipStan === "V" ) {
        $("#tabstrip").data("kendoExtTabStrip").select(1);
        $("#custSearchTab").hide();
        $("#custSearchTabDiv").hide();
        $("#sMembershipStan").val(membershipStan);
    } else {
        membershipStan = "C";
        $("#sMembershipStan").val(membershipStan);
    };

    if(custCd=="01"){
        $("#custCd").data("kendoExtDropDownList").value(custCd);
        $("#custCd").data("kendoExtDropDownList").enable(false);
        $("#carInfoSearchTab").hide();
        $("#carInfoSearchTabDiv").hide();
    } else if(custCd=="02"){
        $("#custCd").data("kendoExtDropDownList").value(custCd);
        $("#custCd").data("kendoExtDropDownList").enable(false);
    };

    if ( custTp === "01" ) {
        $("#custTp").data("kendoExtDropDownList").value(custTp);
        $("#sVcustTp").data("kendoExtDropDownList").value(custTp);
    } else if ( custTp === "02" ) {
        $("#custTp").data("kendoExtDropDownList").value(custTp);
        $("#sVcustTp").data("kendoExtDropDownList").value(custTp);
    };

    if ( dms.string.isNotEmpty(dlrMbrYn) ) {

        var sDlrMbrYn = $("#sDlrMbrYn").data("kendoExtDropDownList");
        var sVdlrMbrYn = $("#sVdlrMbrYn").data("kendoExtDropDownList");

        sDlrMbrYn.value(dlrMbrYn);
        sVdlrMbrYn.value(dlrMbrYn);

        if ( dms.string.isNotEmpty(dlrMbrEnableYn) ) {
            sDlrMbrYn.enable(dlrMbrEnableYn);
            sVdlrMbrYn.enable(dlrMbrEnableYn);
        };

    };

    if ( dms.string.isNotEmpty(telNo) ) {
        $("#telNo").val(telNo);
    };

    if ( dms.string.isNotEmpty(hpNo) ) {
        $("#hpNo").val(hpNo);
    };

    if ( dms.string.isNotEmpty(mngScId) ) {
        $("#mngScId").val(mngScId);
    };

    if ( dms.string.isNotEmpty(custNm) ) {
        $("#custNm").val(custNm);
        $("#sCustNm").val(custNm);
    };

    if ( pconYn === "Y" ) {
        if ( dms.string.isNotEmpty(hpNo) ) {
            $("#sPhpNo").val(hpNo);
            $("#pConGrid").data("kendoExtGrid").dataSource.page(1);
        };
        $("#tabstrip").data("kendoExtTabStrip").select(2);
        $("#pConSearchTab").show();
        $("#pConSearchTabDiv").show();
    };

    if ( dms.string.isNotEmpty(callBackTp)){
        if (callBackTp == "BTN_CREATE") {
            $("#btnCustCreate").show();
        } else {
            $("#btnCustCreate").hide();
        }
    };

    if (autoBind) {
        $("#custNm").val(custNm);
        $("#hpNo").val(hpNo);
        $("#btnCustSearch").click();
    };

});
function custSearchSelect(){
    var grid = $('#customerGrid').data('kendoExtGrid');
    var selectedItem = grid.dataItem(grid.select());
    var rows = grid.select();
    if (rows.length >= 1){
        var data = [];
        $.each(rows, function(idx, row){
            data.push(grid.dataItem(row));
        })
        var param = {};
        param["sCustNo"] = data[0].custNo;
        param["sSearchRange"] = "MY";
        param["sAddrTp"] = addrTp;
        $.ajax({
            url:"<c:url value='/crm/cif/customerInfo/customerSearch.do' />"
            ,data:JSON.stringify(param)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(result){
                console.log("::::customerSearch::::");
                var membershipNo = data[0].membershipNo;
                data = result.custInfoDS;
                data[0].addressDS = result.addressDS;
                data[0].groupDS = result.groupDS;
                data[0].tagDS = result.tagDS;
                data[0].hobbyDS = result.hobbyDS;
                console.log("cc .membershipNo : ", membershipNo)
                data.membershipNo = membershipNo;
                data.searchTp = "C"

                options.callbackFunc(data);
                if(closeYn == undefined || closeYn == "Y"){
                    parent.popupWindow.close();
                }
            }
            ,beforeSend:function(xhr) {
                dms.loading.show();
            }
            ,complete:function(xhr, status) {
                dms.loading.hide();
            }
        });
    } else {
        dms.notification.info("<spring:message code='global.lbl.customer' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
    }
}
function custAndCarSearchSelect(){
    var grid = $("#grid").data("kendoExtGrid");
    var selectedItem = grid.dataItem(grid.select());
    var rows = grid.select();

    if (rows.length >= 1){
        var data = [];
        $.each(rows, function(idx, row){
            data.push(grid.dataItem(row));
        });
        var custNo = data[0].custNo;
        var custNm = data[0].custNm;
        var vinNo = data[0].vinNo;
        var carRegNo = data[0].carRegNo;
        var carlineNm = data[0].carlineNm;
        var carlineCd = data[0].carlineCd;
        var modelCd = data[0].modelCd;
        var modelNm = data[0].modelNm;
        var ocnCd = data[0].ocnCd;
        var ocnNm = data[0].ocnNm;
        var carRunDistVal = data[0].carRunDistVal;

        var param = {};
        param["sCustNo"] = custNo // $("#custNo").val();
        param["sSearchRange"] = "MY";
        param["sVinNo"] = vinNo;
        param["sAddrTp"] = addrTp;
        //console.log("param : ",param);

        $.ajax({
            url:"<c:url value='/crm/cif/customerInfo/customerSearch.do' />"
            ,data:JSON.stringify(param)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,beforeSend:function(xhr) {
                dms.loading.show();
            }
            ,complete:function(xhr, status) {
                dms.loading.hide();
            }
        }).done(function(result) {
            var membershipNo = data[0].membershipNo;
            data.membershipNo = membershipNo;
            console.log("vv .membershipNo : ", membershipNo)
            data = result.custInfoDS;
            data.searchTp = "V";
            data.vinNo = vinNo;
            data.carRegNo = carRegNo;
            data.carlineCd = carlineCd;
            data.carlineNm = carlineNm;
            data.modelCd = modelCd;
            data.modelNm = modelNm;
            data.ocnCd = ocnCd;
            data.ocnNm = ocnNm;
            data.carRunDistVal = carRunDistVal;

            data.custNo = custNo;
            data.custNm = custNm;

            options.callbackFunc(data);
            parent.popupWindow.close();
        });
    } else {
        dms.notification.info("<spring:message code='global.lbl.customer' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
    }
}
function custAndPconSearchSelect(){
    var grid = $("#pConGrid").data("kendoExtGrid");
    var selectedItem = grid.dataItem(grid.select());

    if( selectedItem != null ) {

        var data = [];
        var custInfoDS = {};
        custInfoDS.custPconTp = selectedItem.custPconTp;      // 연개인/고객유형
        custInfoDS.pconTp = selectedItem.pconTp;              // 연계인타입

        custInfoDS.custNo = selectedItem.custNo;
        custInfoDS.custNm = selectedItem.custNm;
        custInfoDS.hpNo = selectedItem.hpNo;

        custInfoDS.relCustNo = selectedItem.relCustNo;        // 연계인고객번호
        custInfoDS.relNm = selectedItem.relNm;                // 연계인명
        custInfoDS.relHpNo = selectedItem.relHpNo;            // 연계인연락처
        data.push(custInfoDS)

        data.searchTp = "R"

        parent.popupWindow.close();
        options.callbackFunc(data);

    } else {
        dms.notification.info("<spring:message code='global.lbl.customer' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
    }
}
 </script>