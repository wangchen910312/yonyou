<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
        <div id="resizableContainer">
            <!-- 고객등록 현황(개인) -->
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code="crm.menu.custRegReportPer" /></h1><!-- 고객등록 현황 -->
                    <div class="btn_right">
                        <button class="btn_m btn_link" id="btnTagLink"><spring:message code='global.title.tagMng' /></button><!-- 태그관리 -->
                        <button class="btn_m btn_modify" id="btnModify"><spring:message code='global.btn.update' /></button><!-- 수정 -->
                        <button class="btn_m btn_search" id="btnCustSearch"><spring:message code='global.btn.search' /></button><!-- 조회 -->
                    </div>
                </div>
                <div class="table_form" role="search" data-btnid="btnCustSearch">
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
                                <th scope="row"><spring:message code='global.lbl.custNm' /></th><!-- 고객명 -->
                                <td>
                                    <input type="text" id="sCustNm" name="sCustNm" class="form_input" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code='global.lbl.custTp' /></th><!-- 고객유형 개인/법인 -->
                                <td>
                                    <input id="sCustTp" name="sCustTp" class="form_comboBox" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.scId' /></th><!-- 담당 SC -->
                                <td>
                                    <input id="sMngScId" name="sMngScId" class="form_comboBox" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code="global.lbl.custCd" /></th><!-- 잠재/보유 -->
                                <td>
                                    <input type="text" id="sCustCd" name="sCustCd" class="form_comboBox" data-json-obj="true">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.hpNo' /></th><!-- 핸드폰 -->
                                <td>
                                    <input type="text" id="sHpNo" name="sHpNo" value="" class="form_input numberic" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code='global.lbl.emailNm' /></th><!--  이메일 -->
                                <td>
                                    <input type="email" id="sEmailNm" name="sEmailNm"  value="" class="form_input" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.saleDt" /></th><!-- 등록일자 -->
                                <td colspan="2">
                                    <div class="form_float">
                                    <div class="date_left">
                                        <input id="sSaleDtFrom" name="sSaleDtFrom" class="form_datepicker" data-json-obj="true">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sSaleDtTo" name="sSaleDtTo" class="form_datepicker" data-json-obj="true">
                                    </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.tag" /></th><!-- 태그 -->
                                <td>
                                    <select id="sCustTags" name="sCustTags" multiple="multiple" ></select>
                                </td>
                                <!-- BHMC여부
                                <th scope="row"><spring:message code="global.lbl.bhmcyn" /></th>
                                <td>
                                    <input id="sBhmcYn" name="sBhmcYn" class="form_comboBox"  data-json-obj="true" />
                                </td>
                                 -->
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table_grid mt10">
                    <div id="customerGrid" class="resizable_grid"></div>
                </div>

            </section>
            <!-- //고객등록 현황(법인) -->
        </div>

<!-- script start  -->
<script type="text/javascript" charset="UTF-8">
    var userList = [];
    var custCdList = [];
    var custCdMap = [];
    var custTpList = [];
    var custTpMap = [];
    var custTags = [];

    var ynCdList = [];
    var ynCdMap = [];
    ynCdList.push({"cmmCd":"Y" , "cmmCdNm":"<spring:message code='global.lbl.yes' />"});
    ynCdList.push({"cmmCd":"N" , "cmmCdNm":"<spring:message code='global.lbl.n' />"});
    ynCdMap["Y"] = "<spring:message code='global.lbl.yes' />";
    ynCdMap["N"] = "<spring:message code='global.lbl.n' />";

    <c:forEach var="obj" items="${userList}">
    userList.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${custCdList}" >
    custCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    custCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${custTpList}" >
    custTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    custTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${custTags}">
    custTags.push({"grpSeq":"${obj.grpSeq}", "grpNm":"${obj.grpNm}"});
    </c:forEach>

    var defaultTagDatasourceSetting = function(e){
        tagDS = [];
        var selectedTags = $("#sCustTags").data("kendoMultiSelect").value();

        if(selectedTags.length == 0){
            return;
        }

        $.each(custTags, function(index, data){
            if(selectedTags.indexOf(data.grpSeq) > -1){
                tagDS.push({"grpSeq":data.grpSeq,"grpTp":"002"});
            }
        });

    };

    /**
    * hyperlink in grid event
    */
    $(document).on("click", ".linkCust", function(e){

         var grid = $("#customerGrid").data("kendoExtGrid"),
         row = $(e.target).closest("tr");
         var dataItem = grid.dataItem(row);

         window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />?custNo="+dataItem.custNo, "VIEW-D-10271"); // CUST NO
    });

    // 그리드 더블클릭 이벤트 ( 그리드 아이디 변경 )
    $("#customerGrid").on("dblclick", "tr.k-state-selected", function (e) {
         var grid = $("#customerGrid").data("kendoExtGrid")
             , dataItem = grid.dataItem(grid.select())
         ;

         window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />?custNo="+dataItem.custNo, "VIEW-D-10271"); // CUST NO

    });

$(document).ready(function() {


    // 숫자
    var onlyNum = new RegExp("[^0-9]","i");
    $(".numberic").keyup(function(e)
    {
        var content = $(this).val();

        if(content.match(onlyNum)){
            console.log($(this).val());
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


    $("#sMngScId").kendoExtDropDownList({
       dataTextField:"usrNm"
       , dataValueField:"usrId"
       , dataSource:userList
       , optionLabel:" "
    });

    $("#sCustTp").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , dataSource:custTpList
       , optionLabel:" "
    });

    $("#sCustCd").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , dataSource:custCdList
       , optionLabel:" "
    });

    // 태그
    $("#sCustTags").kendoMultiSelect({
        dataSource:custTags,
        valuePrimitive:true,
        placeholder:"",
        dataTextField:"grpNm",
        dataValueField:"grpSeq",
        dataBound:defaultTagDatasourceSetting,
        change:defaultTagDatasourceSetting
    });

    // bhmc여부(검색).   sBhmcYn
    $("#sBhmcYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:ynCdList
        , index:0
    });

    // 등록일 From - To
//     $("#sRegDtFrom").kendoExtMaskedDatePicker({
//         format:"<dms:configValue code='dateFormat' />"
//         ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
//     });
//     $("#sRegDtTo").kendoExtMaskedDatePicker({
//         format:"<dms:configValue code='dateFormat' />"
//         ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
//     });

    // 판매일 From - To
    $("#sSaleDtFrom").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
    $("#sSaleDtTo").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 검색 버튼.
    $("#btnCustSearch").kendoButton({
        click:function(e){
//             var regDtFrom = $("#sRegDtFrom").data("kendoExtMaskedDatePicker").value();
//             var regDtTo = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();

            var saleDtFrom = $("#sSaleDtFrom").data("kendoExtMaskedDatePicker").value();
            var saleDtTo = $("#sSaleDtTo").data("kendoExtMaskedDatePicker").value();

            if ( dms.string.isEmpty(saleDtFrom)){
                if (dms.string.isNotEmpty(saleDtTo)) {
                    dms.notification.warning("<spring:message code='sal.lbl.saleDt' var='returnMsg' /><spring:message code='global.info.emptyParamInfo' arguments='${returnMsg}' />");
                    $("#sSaleDtFrom").focus();
                    return false;
                }
            }
            if ( dms.string.isEmpty(saleDtTo)){
                if (dms.string.isNotEmpty(saleDtFrom)) {
                    dms.notification.warning("<spring:message code='sal.lbl.saleDt' var='returnMsg' /><spring:message code='global.info.emptyParamInfo' arguments='${returnMsg}' />");
                    $("#sSaleDtTo").focus();
                    return false;
                }
            }

            $("#customerGrid").data("kendoExtGrid").dataSource.page(1);
        }
    });

    // 고객상세화면
    $("#btnModify").kendoButton({
        click:function(e){
            var grid = $("#customerGrid").data("kendoExtGrid")
            , dataItem = grid.dataItem(grid.select())
            ;
            window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />?custNo="+dataItem.custNo, "VIEW-D-10271"); // CUST NO
        }
    });

    // 태그관리링크
    $("#btnTagLink").kendoButton({
        click:function(e){
            window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.tagMng' />", "<c:url value='/crm/cif/customerGroup/selectCustomerTagMain.do' />", "VIEW-D-10281"); // 태그관리
        }
    });

    //그리드 설정 (그룹 CRUD)
    $("#customerGrid").kendoExtGrid({
        gridId:"G-CRM-0816-141760"
        , dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/crm/cif/customerRegistPresent/customerListSearch.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        //var sRegDtFrom = $("#sRegDtFrom").data("kendoExtMaskedDatePicker").value();
                        //var sRegDtTo = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();

                        var sSaleDtFrom = $("#sSaleDtFrom").data("kendoExtMaskedDatePicker").value();
                        var sSaleDtTo = $("#sSaleDtTo").data("kendoExtMaskedDatePicker").value();

                        params["recordCountPerPage"]    = options.pageSize;
                        params["pageIndex"]             = options.page;
                        params["firstIndex"]            = options.skip;
                        params["lastIndex"]             = options.skip + options.take;
                        params["sort"]                  = options.sort;

                        params["sMngScId"]              = $("#sMngScId").data("kendoExtDropDownList").value();
                        params["sCustNm"]               = $("#sCustNm").val();
                        params["sCustCd"]               = $("#sCustCd").data("kendoExtDropDownList").value();
                        params["sHpNo"]                 = $("#sHpNo").val();
                        params["sEmailNm"]              = $("#sEmailNm").val();
                        //params["sBhmcYn"]               = $("#sBhmcYn").data("kendoExtDropDownList").value();

                        params["tagDS"]                 = $("#sCustTags").data("kendoMultiSelect").value();
                        if ( dms.string.isNotEmpty($("#sCustTags").data("kendoMultiSelect").value())){
                            params["sCommand"]          = "TAGSEARCH";
                        }

                        //params["sRegDtFrom"]            = sRegDtFrom;
                        //params["sRegDtTo"]              = sRegDtTo;
                        params["sSaleDtFrom"]            = sSaleDtFrom;
                        params["sSaleDtTo"]              = sSaleDtTo;
                        params["sCustTp"]               = $("#sCustTp").data("kendoExtDropDownList").value();

                        if ( (dms.string.isNotEmpty(sSaleDtFrom) && dms.string.isEmpty(sSaleDtTo)) ||
                                (dms.string.isEmpty(sSaleDtFrom) && dms.string.isNotEmpty(sSaleDtTo))
                        ){
                            dms.notification.warning("<spring:message code='sal.lbl.saleDt' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                            return false;
                        }
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
                        //, bhmcYn       :{type:"string", editable:false}
                        , regDt        :{type:"date", editable:false}
                        , zipCd        :{type:"string", editable:false}
                        , sungCd       :{type:"string", editable:false}
                        , cityCd       :{type:"string", editable:false}
                        , distCd       :{type:"string", editable:false}
                        , sungNm       :{type:"string", editable:false}
                        , cityNm       :{type:"string", editable:false}
                        , distNm       :{type:"string", editable:false}
                        , addr1        :{type:"string", editable:false}
                        , addrDetlCont :{type:"string", editable:false}
                        , mathDocTp    :{type:"string", editable:false}
                        , ssnCrnNo     :{type:"string", editable:false}
                        , addrFull     :{type:"string", editable:false}
                        , regDtFormat:{type:"date"}
                        , saleDtFormat:{type:"date"}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                            elem.saleDtFormat = kendo.parseDate(elem.saleDt, "<dms:configValue code='dateFormat' />");
                        });
                    }
                    return d;
                }
            }

        }
        ,columns:[
                    {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:40, sortable:false
                                ,attributes:{"class":"ac"}
                    }
                    , {field:"custTpNm" , title:"<spring:message code='global.lbl.custTp' />", width:80, attributes:{"class":"ac"} }
                    , {field:"custNo" , title:"<spring:message code='global.lbl.custNo' />",  width:140, attributes:{"class":"ac"}
                    }
                    , {field:"custNm" , title:"<spring:message code='global.lbl.custNm' />",  width:120, attributes:{"class":"ac"}
                    }
                    , {field:"sexNm"   , title:"<spring:message code='global.lbl.sex' />", width:30, attributes:{"class":"ac"}
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
                    , {field:"birthDt"  , title:"<spring:message code='global.lbl.birthday' />", width:70, attributes:{"class":"ac"}
                    } // 생일
                    , {field:"custCdNm" , title:"<spring:message code='global.lbl.custCd' />", width:100, attributes:{"class":"ac"} }
                    , {field:"hpNo"   , title:"<spring:message code='global.lbl.hpNo' />", width:120, attributes:{"class":"ac"}}
                    , {field:"officeTelNo"  , title:"<spring:message code='global.lbl.officeTelNo' />", width:120, attributes:{"class":"ac"}}
                    , {field:"mathDocTpNm"  , title:"<spring:message code='global.lbl.mathDocTp' />", width:100, attributes:{"class":"ac"}} // 증거유형
                    , {field:"ssnCrnNo"  , title:"<spring:message code='global.lbl.ssnCrnNo' />", width:120, attributes:{"class":"ac"}}  // 증거번호
                    //, {field:"emailNm"  , title:"<spring:message code='global.lbl.emailNm' />", width:200, attributes:{"class":"al"}}
                    , {field:"sungNm", title:"<spring:message code='global.lbl.sungNm' />", width:100, attributes:{"class":"al"}}       // 성
                    , {field:"cityNm", title:"<spring:message code='global.lbl.cityNm' />", width:100, attributes:{"class":"al"}}       // 도시
                    , {field:"distNm", title:"<spring:message code='global.lbl.distNm' />", width:100, attributes:{"class":"al"}}       // 지역
                    , {field:"addrDetlCont", title:"<spring:message code='global.lbl.detlAddr' />", width:150, attributes:{"class":"al"}}       // 상세주소
                    //, {field:"addrFull"  , title:"<spring:message code='global.title.addr' />", width:300, attributes:{"class":"al"}}
                    , {field:"regDtFormat"  , title:"<spring:message code='global.lbl.regDt' />", width:130, attributes:{"class":"ac"}
                        ,template:"#if (regDtFormat !== null ){# #= kendo.toString(data.regDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
                    }
                    , {field:"saleDtFormat"  , title:"<spring:message code='sal.lbl.saleDt' />", width:130, attributes:{"class":"ac"}
                        ,template:"#if (saleDtFormat !== null ){# #= kendo.toString(data.saleDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
                    }
//                     , {field:"custNo" , title:"<spring:message code='global.lbl.custNo' />",  width:150, attributes:{"class":"ac"}
//                         ,template:function(dataItem){
//                             var spanObj = "<a href='#' class='linkCust'>"+dataItem.custNo+"</a>";
//                             return spanObj;
//                         }
//                     }
//                     , {field:"custNm" , title:"<spring:message code='global.lbl.custNm' />",  width:100, attributes:{"class":"ac"}
//                         ,template:function(dataItem){
//                             var spanObj = "<a href='#' class='linkCust'>"+dataItem.custNo+"</a>";
//                             return spanObj;
//                         }
//                     }
//                     , {field:"bhmcYn", title:"<spring:message code='global.lbl.bhmcyn' />", width:70
//                         ,attributes:{"class":"ac"}
//                         , template:'#if (bhmcYn !== null){# #= ynCdMap[bhmcYn]# #}#'
//                     }
                ]
//         ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
             ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
             ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
             ,appendEmptyColumn:false           //빈컬럼 적용. default:false
             ,enableTooltip:true               //Tooltip 적용, default:false
             ,navigatable:false
             ,sortable:true
             ,editable:false
             ,selectable:"row"
             ,autoBind:true
//            ,indvColumnVisible:true             //컬럼 보이기/감추기 개인화 적용. default:true
//            ,indvColumnReorderable:true         //컬럼순서 변경 개인화 적용. default:true
//            ,indvColumnRows:10                  //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
//            ,multiSelectWithCheckbox:true       //멀티선택 적용. default:false
//            ,multiSelectLocked:false            //멀티선택 컬럼 틀고정 default:false
//            ,enableTooltip:true                 //Tooltip 적용, default:false
//            ,visibleFilterRow:false             //필터로우 출력여부, default:false
    });

});

</script>
<!-- //script end -->