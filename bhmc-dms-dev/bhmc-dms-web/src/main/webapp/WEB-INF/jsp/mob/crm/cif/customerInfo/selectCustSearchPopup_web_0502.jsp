<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- 그룹선택 팝업 -->
    <section id="windows" class="pop_wrap">
    <div id="tabstrip" class="tab_area">
        <!-- 탭메뉴 -->
        <ul>
            <li id="custSearchTab" class="k-state-active"><spring:message code="global.title.custSearch" /><!-- 고객조회 --></li>
            <li id="carInfoSearchTab"><spring:message code="ser.title.carInfo" /> <!-- 차량정보 --></li>
        </ul>
        <div id="custSearchTabDiv"> <!--  고객조회 TAB - 시작 -->
            <!-- 조회 조건 타이틀 시작 -->
            <div class="header_area">
                <div class="btn_right">
                    <button id="btnCustSearch" class="btn_m btn_Search"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                    <button id="btnCustSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button> <!-- 선택 -->
                    <%-- <button id="btnCancel" class="btn_m btn_Cancel"><spring:message code="global.btn.cancel" /></button> <!-- 취소 --> --%>
                </div>
            </div>
            <div class="table_form" role="search" data-btnid="btnCustSearch">
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
                            <th scope="row"><spring:message code="global.lbl.custNm" /></th><!-- 고객명 -->
                            <td>
                                <input type="text" id="custNm" name="custNm" class="form_input" data-json-obj="true">
                            </td>
                            <th scope="row"><spring:message code="global.lbl.custTp" /></th><!-- 고객유형 -->
                            <td>
                                <input type="text" id="custTp" name="custTp" class="form_comboBox" data-json-obj="true">
                            </td>
                            <th scope="row"><spring:message code="global.lbl.hpNo" /></th><!-- 이동전화 -->
                            <td>
                                <input type="number" class="numberic" id="hpNo" name="hpNo" class="form_input" data-json-obj="true">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.sex" /></th><!-- 성별 -->
                            <td>
                                <input type="text" id="sexCd" name="sexCd" class="form_comboBox" data-json-obj="true">
                            </td>
                            <th scope="row"><spring:message code="global.lbl.homeTelNo" /></th> <!-- 집전화 -->
                            <td>
                                <input id="telNo" name="telNo" type="text" value="" class="form_input" data-json-obj="true">
                            </td>
                            <th scope="row"><spring:message code="global.lbl.bhmcyn" /></th><!-- BHMC여부 -->
                            <td>
                                <label class="label_check ml5"><input id="bhmcYn" type="checkbox" class="form_check" unchecked data-json-obj="true"></label>
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
                            <th scope="row"></th>
                            <td></td>
                            <th scope="row"></th>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- 조회 조건 타이틀 종료 -->

            <div class="table_grid mt10">
                <div id="customerGrid"></div>
            </div>
        </div>  <!--  고객조회 TAB - 끝 -->
        <div id="carInfoSearchTabDiv">
            <div class="header_area">
                <div class="btn_right">
                    <button id="btnSearch" class="btn_m btn_Search"><spring:message code="global.btn.search" /></button>
                    <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button>
                    <%-- <button id="btnCancel" class="btn_m btn_Cancel"><spring:message code="global.btn.cancel" /></button> --%>
                </div>
            </div>

            <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
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
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.vinNo' /></th><!-- VIN -->
                            <td>
                                <input id="sVinNo" name="sVinNo" class="form_input"/>
                            </td>
                            <th scope="row"><spring:message code='global.lbl.carNo' /></th><!-- 차량번호 -->
                            <td>
                                <input id="sCarNo" name="sCarNo" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code='global.lbl.custNm' /></th><!-- 고객명 -->
                            <td>
                                <input id="sCustNm" name="sCustNm" class="form_input" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="table_grid mt10">
                <div id="grid" class="grid"></div>
            </div>
        </div>

    </div>
    </section>
    <!-- //그룹선택 팝업 -->

 <script type="text/javascript">

 var sysDate = new Date("<c:out value='${sysDate}' />");

 var custTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
 var sexCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
 var custTpMap = [];
 var sexCdMap = [];

 <c:forEach var="obj" items="${custTpList}">
 custTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
 custTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
 </c:forEach>

 <c:forEach var="obj" items="${sexCdList}">
 sexCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
 sexCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
 </c:forEach>



$(document).ready(function() {

    /*************************************************************
            드랍다운 리스트 셋팅
    *************************************************************/

    // 고객유형 드랍다운 리스트.
    $("#custTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:custTpList
        , index:0
        , change:function(e) {
            var selcmmCd = this.dataItem(this.select()).cmmCd;
            /*
            if (selcmmCd == "01"){  // 개인 (01), 법인(02)
               $("#sexCd").data("kendoExtDropDownList").enabel(false); // 성별
            } else {
                custHoldTpDtl.enable(false);
            }
            */
        }
    });

    // 성별 드랍다운 리스트.
    $("#sexCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        //, optionLabel:" "
        , dataSource:sexCdList
        , index:0
    });

    // 숫자
    $(".numberic").kendoMaskedTextBox({
        mask:"00000000000000000000"
        , promptChar:" "
    });

    var options = parent.popupWindow.options.content.data;

    if (options.telNo != null && options.telNo != ""){
        $("#telNo").val(options.telNo);
    }

    // 선택 버튼.
    $("#btnCustSelect").kendoButton({
        click:function(e){

            //var tabStrip = $('#tabstrip').data('kendoExtTabStrip');
            //console.log(tabStrip.select());
            //console.log(tabStrip.select().item());
            //var tabId = tabStrip.select().item();
            var grid = $('#customerGrid').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());
            var rows = grid.select();
            if (rows.length >= 1){
                var data = [];
                //data.push(selectedItem);
                $.each(rows, function(idx, row){
                    data.push(grid.dataItem(row));
                })
                options.callbackFunc(data);
                parent.popupWindow.close();
            } else {
                dms.notification.info("<spring:message code='global.lbl.customer' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
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

    // 검색 버튼.
    $("#btnCustSearch").kendoButton({
        click:function(e){
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

            $("#customerGrid").data("kendoExtGrid").dataSource.page(1);
        }
    });


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
                        params["sCustTp"]               = $("#custTp").val();
                        params["sHpNo"]                 = $("#hpNo").val();
                        params["sSexCd"]                = $("#sexCd").val();
                        params["sTelNo"]                = $("#telNo").val();
                        params["sRegDtFrom"]            = $("#regDtFrom").data("kendoExtMaskedDatePicker").value();
                        params["sRegDtTo"]              = $("#regDtTo").data("kendoExtMaskedDatePicker").value();

                        if ($("#bhmcYn").prop("checked")){ params["sBhmcYn"] = "Y" };

                        console.log(params);

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                    errors:"error"
                    //, data:"custInfoDS"
                    //, total:"total"
                    , model:{
                        id:"rnum"
                        , fields:{
                            rnum:{type:"number"}
                            , custNo       :{type:"string", editable:false}
                            , custNm       :{type:"string", editable:false}
                            , custTp       :{type:"string", editable:false}
                            , hpNo         :{type:"string", editable:false}
                            , telNo        :{type:"string", editable:false}
                            , bhmcYn       :{type:"string", editable:false}
                            , regDt        :{type:"date", editable:false}
                            , zipCd       :{type:"string", editable:false}
                            , sungCd       :{type:"string", editable:false}
                            , cityCd       :{type:"string", editable:false}
                            , distCd       :{type:"string", editable:false}
                            , sungNm       :{type:"string", editable:false}
                            , cityNm       :{type:"string", editable:false}
                            , distNm       :{type:"string", editable:false}
                            , addr1        :{type:"string", editable:false}
                            , addrDetlCont       :{type:"string", editable:false}
                        }
                    }
            }
            ,requestEnd:function(e){
                if (e.type !== "read"){
                    //this.page(1);
                }
            }
            //,serverSorting:false
        }
        ,autoBind:false
        ,selectable:"row"
        ,columns:[
                    {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:40, sortable:false
                                ,attributes:{"class":"ac"}
                    }
                    , {field:"custNo" , title:"<spring:message code='global.lbl.custNo' />",  width:150, attributes:{"class":"ac"}}
                    , {field:"custNm" , title:"<spring:message code='global.lbl.custNm' />",  width:100, attributes:{"class":"ac"}}
                    , {field:"custTp" , title:"<spring:message code='global.lbl.custTp' />", width:100, attributes:{"class":"ac"}
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
                    }
                    , {field:"hpNo"   , title:"<spring:message code='global.lbl.hpNo' />", width:120, attributes:{"class":"ac"}}
                    , {field:"telNo"  , title:"<spring:message code='global.lbl.homeTelNo' />", width:120, attributes:{"class":"ac"}}
                    , {field:"bhmcYn" , title:"<spring:message code='global.lbl.bhmcyn' />", width:100, attributes:{"class":"ac"}}
                    , {field:"regDt"  , title:"<spring:message code='global.lbl.regDt' />", width:100, attributes:{"class":"ac"}
                        , format:"{0:<dms:configValue code='dateFormat' />}"
                      }
                    ,{title:""}
                ]
        ,navigatable:false
        ,sortable:false
        ,editable:false
        ,height:205
    });

    // 그리드 더블 클릭 이벤트.
    $("#customerGrid").on("dblclick", "tr.k-state-selected", function (e) {
        $("#btnCustSelect").click();
    });

    /************************************************************
         그리드 설정
    *************************************************************/
    //그리드 설정
    $("#grid").kendoExtGrid({
    dataSource:{
     transport:{
        read:{
            url:"<c:url value='/ser/cmm/vehOfCustInfo/selectVehOfCustInfo.do' />"
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {

                var params = {};

                params["recordCountPerPage"] = options.pageSize;
                params["pageIndex"] = options.page;
                params["firstIndex"] = options.skip;
                params["lastIndex"] = options.skip + options.take;
                params["sort"] = options.sort;

                params["sVinNo"] = $("#sVinNo").val();
                params["sCarNo"] = $("#sCarNo").val();
                params["sCustNm"] = $("#sCustNm").val();

                console.log("Search Customer Popup VIN!!");
                console.log(params);
                return kendo.stringify(params);

            } else if (operation !== "read" && options.models) {
                return kendo.stringify(options.models);
            }
        }
    }
    ,schema:{
        model:{
            id:"rnum"
            ,fields:{
                 rnum:{type:"number", editable:false}
                ,vinNo:{type:"string"}
                ,carRegNo:{type:"string"}
                ,carOwnerNm:{type:"string"}
                ,carOwnerTelNo:{type:"string"}
                ,carOwnerHpNo:{type:"string"}
                ,carlineCd:{type:"string"}
                ,modelCd:{type:"string"}
                ,ocnCd:{type:"string"}
                ,carStatCd:{type:"string"}
                ,ownStatCd:{type:"string"}
                ,carDstinCd:{type:"string"}
                ,grDt:{type:"date"}
                ,pltGiDt:{type:"date"}
                ,makerCd:{type:"string"}
                ,enginNo:{type:"string"}
                ,signOffDt:{type:"date"}
                ,cmpCd:{type:"string"}
                ,custSaleDt:{type:"date"}
                ,custSaleCancDt:{type:"date"}
                ,statCd:{type:"string"}
                ,carNm:{type:"string"}
                ,cmpCarYn:{type:"string"}
                ,cmpCarDstinCd:{type:"string"}
                ,carRunDistVal:{type:"number"}
                ,tecId:{type:"string"}
                ,carBrandCd:{type:"string"}
                ,driverId:{type:"string"}
                ,driverNm:{type:"string"}
                ,driverTelNo:{type:"string"}
                ,driverHpNo:{type:"string"}
                ,driverZipCd:{type:"string"}
                ,driverAddr:{type:"string"}
                ,driverMailNm:{type:"string"}
                ,carOwnerId:{type:"string"}
                ,carOwnerZipCd:{type:"string"}
                ,carOwnerAddr:{type:"string"}
                ,carOwnerMailNm:{type:"string"}
                ,incNo:{type:"string"}
                ,befIncNo:{type:"string"}
                ,incCorpCd:{type:"string"}
                ,incCarNo:{type:"string"}
                ,incCarNoRegDt:{type:"string"}
                ,incEndDt:{type:"string"}
            }
        }
    }
    }
    ,autoBind:false
    ,multiSelectWithCheckbox:false
    ,selectable:options.selectable === "multiple"? "multiple,row":"row"
    ,navigatable:false
    ,editable:false
    ,pageable:{
             pageSize:30
            ,pageSizes:[ "30", "50", "100", "200" ]
            }
    ,height:249
    ,columns:[
      {field:"rnum",title:"<spring:message code='global.lbl.no' />", width:40, attributes:{"class":"ac"}}
     ,{field:"vinNo", title:"<spring:message code='global.lbl.vinNo' />", width:150 ,attributes:{"class":"ac"}}//VIN
     ,{field:"carRegNo", title:"<spring:message code='global.lbl.carNo' />", width:100,attributes:{"class":"ac"}}//차량번호
     ,{field:"carOwnerNm", title:"<spring:message code='global.lbl.custNm' />", width:120,attributes:{"class":"ac"}}//고객명
     ,{field:"carOwnerTelNo", title:"<spring:message code='global.lbl.telNo' />", width:120,attributes:{"class":"ac"}}//전화번호
     ,{field:"carOwnerHpNo", title:"<spring:message code='global.lbl.hpNo' />", width:120,attributes:{"class":"ac"}}//전화번호
     ,{field:"carlineCd", title:"carlineCd", width:120 , hidden:true }//차종코드
     ,{field:"modelCd", title:"modelCd", width:120, hidden:true }//모델코드
     ,{field:"ocnCd", title:"ocnCd", width:120, hidden:true }//OCN코드
     ,{field:"carStatCd", title:"carStatCd", width:120, hidden:true }//차량상태코드
     ,{field:"ownStatCd", title:"ownStatCd", width:120, hidden:true }//소유상태코드
     ,{field:"carDstinCd", title:"carDstinCd", width:120, hidden:true }//차량구분코드
     ,{field:"grDt", title:"grDt", width:120,format:"{0:<dms:configValue code='dateFormat' />}", hidden:true }//입고일자
     ,{field:"pltGiDt", title:"pltGiDt", width:120,format:"{0:<dms:configValue code='dateFormat' />}", hidden:true }//공장출고일자
     ,{field:"makerCd", title:"makerCd", width:120, hidden:true }//메이커코드
     ,{field:"enginNo", title:"enginNo", width:120, hidden:true }//엔진번호
     ,{field:"signOffDt", title:"signOffDt", width:120,format:"{0:<dms:configValue code='dateFormat' />}", hidden:true }//생산일자
     ,{field:"cmpCd", title:"cmpCd", width:120,format:"{0:<dms:configValue code='dateFormat' />}", hidden:true }//회사코드
     ,{field:"custSaleDt", title:"custSaleDt", width:120,format:"{0:<dms:configValue code='dateFormat' />}", hidden:true }//고객판매일자
     ,{field:"custSaleCancDt", title:"custSaleCancDt", width:120,format:"{0:<dms:configValue code='dateFormat' />}", hidden:true }//고객판매취소일자
     ,{field:"statCd", title:"statCd", width:120, hidden:true }//상태코드
     ,{field:"carNm", title:"carNm", width:120, hidden:true }//차량명
     ,{field:"cmpCarYn", title:"cmpCarYn", width:120, hidden:true }//회사차여부
     ,{field:"cmpCarDstinCd", title:"회사차구분코드", width:120, hidden:true }//회사차구분코드
     ,{field:"carRunDistVal", title:"carRunDistVal", width:120, hidden:true }//차량주행거리값
     ,{field:"tecId", title:"tecId", width:120, hidden:true }//TECMANID
     ,{field:"carBrandCd", title:"carBrandCd", width:120, hidden:true }//차량브랜드코드
     ,{field:"driverId", title:"driverId", width:120, hidden:true }//운전자ID
     ,{field:"driverNm", title:"driverNm", width:120, hidden:true }//운전자명
     ,{field:"driverTelNo", title:"driverTelNo", width:120, hidden:true }//운전자전화번호
     ,{field:"driverHpNo", title:"driverHpNo", width:120, hidden:true }//운전자핸드폰
     ,{field:"driverZipCd", title:"driverZipCd", width:120, hidden:true }//운전자우편번호
     ,{field:"driverAddr", title:"driverAddr", width:120, hidden:true }//운전자주소
     ,{field:"driverMailNm", title:"driverMailNm", width:120, hidden:true }//운전자이메일
     ,{field:"carOwnerId", title:"carOwnerId", width:120, hidden:true }//소유자ID
     ,{field:"carOwnerZipCd", title:"carOwnerZipCd", width:120, hidden:true }//소유자우편번호
     ,{field:"carOwnerAddr", title:"carOwnerAddr", width:120, hidden:true }//소유자주소
     ,{field:"carOwnerMailNm", title:"carOwnerMailNm", width:120, hidden:true }//소유자이메일
     ,{field:"incNo", title:"incNo", width:120, hidden:true }//보험번호
     ,{field:"befIncNo", title:"befIncNo", width:120, hidden:true }//이전보험번호
     ,{field:"incCorpCd", title:"incCorpCd", width:120, hidden:true }//보험사법인코드
     ,{field:"incCarNo", title:"incCarNo", width:120, hidden:true }//보험차량번호
     ,{field:"incCarNoRegDt", title:"incCarNoRegDt", width:120, hidden:true }//보험차량등록일자
     ,{field:"incEndDt", title:"incEndDt", width:120, hidden:true }//보험마감일
     ,{title:""}
    ]

    });

    /************************************************************
         기능버튼 설정
    *************************************************************/
    // 조회 버튼.
    $("#btnSearch").kendoButton({
    click:function(e){
       $("#grid").data("kendoExtGrid").dataSource.read();
    }
    });

    // 선택 버튼.
    $("#btnSelect").kendoButton({
    click:function(e){
       var grid = $("#grid").data("kendoExtGrid");
       var rows = grid.select();

       if(rows !== null)
       {
           var data = [];
           $.each(rows, function(idx, row){
               data.push(grid.dataItem(row));
           });
           options.callbackFunc(data);
           parent.popupWindow.close();
       } else {
           dms.notification.info("<spring:message code='global.lbl.customer' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
       }
    }
    });

    // 탭 TabStrip
    $("#tabstrip").kendoExtTabStrip({
        animation:false
        , select:function(e) {
            var selectTabId = e.item.id;
            var callUrl;
            console.log(selectTabId);
        }
    });




});

 </script>

