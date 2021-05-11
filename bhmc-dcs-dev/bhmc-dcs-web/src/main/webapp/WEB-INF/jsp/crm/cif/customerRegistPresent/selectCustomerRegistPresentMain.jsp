<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

            <!-- 고객등록 현황(개인) -->
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code="crm.menu.custRegReportPer" /></h1><!-- 고객등록 현황 -->
                    <div class="btn_right">
			        <dms:access viewId="VIEW-I-12519" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m btn_search" id="btnCustSearch"><spring:message code='global.btn.search' /></button><!-- 조회 -->
			        </dms:access>
                    </div>
                </div>
                <div class="table_form" role="search" data-btnid="btnCustSearch">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:24%;">
                            <col style="width:10%;">
                            <col style="width:23%;">
                            <col style="width:10%;">
                            <col style="width:23%;">
                        </colgroup>
                        <tbody>
                            <tr>
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
                                <th scope="row"><spring:message code='global.lbl.custNm' /></th><!-- 고객명 -->
                                <td>
                                    <input type="text" id="sCustNm" name="sCustNm" class="form_input" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code='global.lbl.hpNo' /></th><!-- 핸드폰 -->
                                <td>
                                    <input type="text" id="sHpNo" name="sHpNo" value="" class="form_input numberic" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code='global.lbl.emailNm' /></th><!--  이메일 -->
                                <td>
                                    <input type="email" id="sEmailNm" name="sEmailNm"  value="" class="form_input" data-json-obj="true">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.regDt" /></th><!-- 등록일자 -->
                                <td>
                                    <div class="form_float">
                                    <div class="date_left">
                                        <input id="sRegDtFrom" name="sRegDtFrom" class="form_datepicker" data-json-obj="true">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sRegDtTo" name="sRegDtTo" class="form_datepicker" data-json-obj="true">
                                    </div>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code="global.lbl.tag" /></th><!-- 태그 -->
                                <td colspan="3">
                                    <select id="sCustTags" name="sCustTags" multiple="multiple" ></select>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table_grid mt10">
                    <div id="customerGrid"></div>
                </div>

            </section>
            <!-- //고객등록 현황(법인) -->

<!-- script start  -->
<script type="text/javascript" charset="UTF-8">
    var userList = [];
    var custCdList = [];
    var custCdMap = [];
    var custTpList = [];
    var custTpMap = [];
    var custTags = [];

    <c:forEach var="obj" items="${userList}">
    userList.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${custCdList}" >
    custCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    custCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${custTpList}" >
    custTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
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

         window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />?custNo="+dataItem.custNo, "VIEW-I-10232"); // CUST NO
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



    // 등록일 From - To
    $("#sRegDtFrom").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
    $("#sRegDtTo").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 검색 버튼.
    $("#btnCustSearch").kendoButton({
        click:function(e){
            var regDtFrom = $("#sRegDtFrom").data("kendoExtMaskedDatePicker").value();
            var regDtTo = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();

            if ( dms.string.isEmpty(regDtFrom)){
                if (dms.string.isNotEmpty(regDtTo)) {
                    dms.notification.warning("<spring:message code='global.lbl.regDt' var='returnMsg' /><spring:message code='global.info.emptyParamInfo' arguments='${returnMsg}' />");
                    $("#sRegDtFrom").focus();
                    return false;
                }
            }
            if ( dms.string.isEmpty(regDtTo)){
                if (dms.string.isNotEmpty(regDtFrom)) {
                    dms.notification.warning("<spring:message code='global.lbl.regDt' var='returnMsg' /><spring:message code='global.info.emptyParamInfo' arguments='${returnMsg}' />");
                    $("#sRegDtTo").focus();
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
                    url:"<c:url value='/crm/cif/customerRegistPresent/customerListSearch.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        var sRegDtFrom = $("#sRegDtFrom").data("kendoExtMaskedDatePicker").value();
                        var sRegDtTo = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();

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

                        params["tagDS"]                 = $("#sCustTags").data("kendoMultiSelect").value();
                        if ( dms.string.isNotEmpty($("#sCustTags").data("kendoMultiSelect").value())){
                            params["sCommand"]          = "TAGSEARCH";
                        }

                        params["sRegDtFrom"]            = sRegDtFrom;
                        params["sRegDtTo"]              = sRegDtTo;
                        params["sCustTp"]               = $("#sCustTp").data("kendoExtDropDownList").value();

                        if ( (dms.string.isNotEmpty(sRegDtFrom) && dms.string.isEmpty(sRegDtTo)) ||
                                (dms.string.isEmpty(sRegDtFrom) && dms.string.isNotEmpty(sRegDtTo))
                        ){
                            dms.notification.warning("<spring:message code='global.lbl.regDt' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
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
                            , bhmcYn       :{type:"string", editable:false}
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
                        }
                    }
            }

        }
        ,autoBind:false
        ,selectable:"row"
        ,columns:[
                    {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:40, sortable:false
                                ,attributes:{"class":"ac"}
                    }
                    , {field:"custTp" , title:"<spring:message code='global.lbl.custTp' />", width:120, attributes:{"class":"ac"}
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
                    , {field:"custNo" , title:"<spring:message code='global.lbl.custNo' />",  width:150, attributes:{"class":"ac"}
                        ,template:function(dataItem){
                            var spanObj = "<a href='#' class='linkCust'>"+dataItem.custNo+"</a>";
                            return spanObj;
                        }
                    }
                    , {field:"custNm" , title:"<spring:message code='global.lbl.custNm' />",  width:100, attributes:{"class":"ac"}
                        ,template:function(dataItem){
                            var spanObj = "<a href='#' class='linkCust'>"+dataItem.custNm+"</a>";
                            return spanObj;
                        }
                    }
                    , {field:"custCd" , title:"<spring:message code='global.lbl.custCd' />", width:120, attributes:{"class":"ac"}
                        , editor:function(container, options){
                            $('<input data-bind="value:' + options.field + '"  />')
                            .appendTo(container)
                            .kendoExtDropDownList({
                                dataTextField:"cmmCdNm"
                                , dataValueField:"cmmCd"
                                , dataSource:custCdList
                            });
                        }
                        , template:'#if (custCd !== ""){# #= custCdMap[custCd]# #}#'
                    }
                    , {field:"hpNo"   , title:"<spring:message code='global.lbl.hpNo' />", width:120, attributes:{"class":"ac"}}
                    , {field:"officeTelNo"  , title:"<spring:message code='global.lbl.officeTelNo' />", width:120, attributes:{"class":"ac"}}
                    , {field:"emailNm"  , title:"<spring:message code='global.lbl.emailNm' />", width:200, attributes:{"class":"al"}}
                    , {field:"addrFull"  , title:"<spring:message code='global.title.addr' />", width:300, attributes:{"class":"al"}}
                    , {field:"regDt"  , title:"<spring:message code='global.lbl.regDt' />", width:100, attributes:{"class":"ac"}
                        , format:"{0:<dms:configValue code='dateFormat' />}"
                      }
                    ,{title:""}
                ]
        ,navigatable:false
        ,sortable:true
        ,editable:false
    });

});

</script>
<!-- //script end -->