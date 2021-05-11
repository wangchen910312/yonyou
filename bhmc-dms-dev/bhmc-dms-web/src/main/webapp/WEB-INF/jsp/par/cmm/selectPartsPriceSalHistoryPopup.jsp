<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 판매가 히스토리 -->
<section id="windows" class="pop_wrap">
    <div class="header_area">
        <h1 class="title_basic"><%-- <spring:message code="par.title.salePriceHistoryTarget" /> --%><!-- 판매가 히스토리 --></h1>
        <div class="btn_right">
            <button type="button" id="btnSearch" class="btn_m btn_search"><spring:message code="par.btn.search" /></button><!--조회  -->
        </div>
    </div>

    <div class="table_form" role="search" data-btnid="btnSearch">
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
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.supplyNm" /><!-- 공급업체명 --></th>
                    <td class="required_area">
                        <input type="hidden" id="sBpCd" name="sBpCd" value="${bpCd}" />
                        <input id="sBpNm" name="sBpNm" class="form_input" value="${bpNm}" />

                    </td>
                    <th scope="row"><spring:message code="par.lbl.salePrcTp" /><!-- 판매가유형 --></th>
                    <td>
                        <input id="sPrcTp" name="sPrcTp" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.regUsrId" /><!-- 생성자ID --></th>
                    <td>
                        <input type="hidden" id="sRegUsrId" name="sRegUsrId" value="" />
                        <input id="sRegUsrNm" name="sRegUsrNm" class="form_input" value="" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.itemDstinCd" /><!-- 품목구분코드 --></th>
                    <td>
                        <input id="sItemDstinCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.abcInd" /><!-- ABS Class --></th>
                    <td>
                        <input id="sAbcInd" name="sAbcInd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.carLine" /><!-- 차종 --></th>
                    <td>
                        <input id="sCarlineCd" name="sCarlineCd" class="form_comboBox" />
                    </td>

                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.applyDt" /><!-- 적용일자--></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input data-type="date" id="sApplyStartDt" name="sApplyStartDt" required class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input data-type="date" id="sApplyEndDt" name="sApplyEndDt" required class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부품번호 --></th>
                    <td>
                        <input id="sItemCd" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 부품명 --></th>
                    <td>
                        <input id="sItemNm" class="form_input" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="table_grid mt10">
        <!-- 판매가 대상선정 그리드 -->
        <div id="grid" ></div>
    </div>
    </section>

</section>
<!-- //구매요청 -->

<!-- script -->
<script>

//단위 맵 객체 데이타 바인딩.
var unitCdDs = [];
<c:forEach var="obj" items="${unitCdDs}">
unitCdDs.push({
    "unitCd":"${obj.unitCd}"
    ,"unitNm":"${obj.unitNm}"
});
</c:forEach>
var unitCdMap = {};
$.each(unitCdDs, function(idx, obj){
    unitCdMap[obj.unitCd] = obj.unitNm;
});
//차형 맵 객체 데이타 바인딩.
var partsCarTpDs = [];
<c:forEach var="obj" items="${partsCarTpDs}">
partsCarTpDs.push({
    "carlineCd":"${obj.carlineCd}"
    ,"carlineNm":"${obj.carlineNm}"
});
</c:forEach>

//ABC CLASS 맵 객체 데이타 바인딩.
var abcIndList = [];
<c:forEach var="obj" items="${abcIndList}">
abcIndList.push({
    "abcCd":"${obj.cmmCd}"
    ,"abcCdNm":"${obj.cmmCd}"
});
</c:forEach>

//품목구분 Array
var itemDstinCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${itemDstinCdList}">
itemDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var itemDstinCdMap = {};
$.each(itemDstinCdList, function(idx, obj){
    itemDstinCdMap[obj.cmmCd] = obj.cmmCdNm;
});

//판매단가유형 Array
var salePrcTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${salePrcTpList}">
salePrcTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//판매단가유형 Map
var salePrcTpMap = {};
$.each(salePrcTpList, function(idx, obj){
    salePrcTpMap[obj.cmmCd] = obj.cmmCdNm;
});

    $(document).ready(function() {

        /************************************************************
                팝업옵션 설정
        *************************************************************/
        /**
        * 팝업 옵션
        */
        var options = parent.searchSalPriceHistoryPopupWindow.options.content.data;

        // 그리드 더블 클릭 이벤트.
        $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
            $("#btnSelect").click();
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

        // 조회 버튼
        $("#btnSearch").kendoButton({
            click:function(e){
                var vBpCd = $("#sBpCd").val();
                var vBpNm = $("#sBpNm").val();
                if(vBpCd === ""){
                    // 공급업체는 필수 입력사항입니다.
                    dms.notification.info("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.required.field' arguments='${bpCd}' />");
                    $("#sBpNm").focus();

                    return false;
                }
                $("#grid").data("kendoExtGrid").dataSource.read();
            }
        });

        $("#sBpCd").val(options.bpCd);
        $("#sBpNm").val(options.bpNm);
        $("#sItemCd").val(options.itemCd);
        $("#sItemNm").val(options.itemNm);

        // 품목코드 focus
        $("#sItemCd").focus();

        // 차종 드랍다운 리스트.
        $("#sCarlineCd").kendoExtDropDownList({
            dataTextField:"carlineNm"
            ,dataValueField:"carlineCd"
            ,optionLabel:" "
            ,dataSource:partsCarTpDs
            ,autoBind:false
            ,index:0
        });

        $("#sCarlineCd").data("kendoExtDropDownList").value(options.carlineCd);

        // ABC Class 드랍다운 리스트.
        $("#sAbcInd").kendoExtDropDownList({
            dataTextField:"abcCdNm"
            ,dataValueField:"abcCd"
            ,optionLabel:" "
            ,dataSource:abcIndList
            ,autoBind:false
            ,index:0
        });

        $("#sAbcInd").data("kendoExtDropDownList").value(options.abcInd);

        // 판매가 유형.
        $("#sPrcTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:salePrcTpList
            ,autoBind:false
            ,index:0
        });

        $("#sPrcTp").data("kendoExtDropDownList").value(options.prcTp);

        // 품목구분 드랍다운 리스트.
        $("#sItemDstinCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:itemDstinCdList
            ,autoBind:false
            ,index:0
        });

        $("#sItemDstinCd").data("kendoExtDropDownList").value(options.itemDstinCd);

        // 적용시작일자
        $("#sApplyStartDt").kendoExtMaskedDatePicker({
            value:new Date("${sysDate}")
            ,format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        // 적용종료일자
        $("#sApplyEndDt").kendoExtMaskedDatePicker({
            value:new Date("${sysDate}")
            ,format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        // 판매가 히스토리 그리드
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0803-162501"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/partsPriceMaster/selectPartsVenderSalPriceTargetHistorys.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            // 공급처 검색조건 코드.
                            params["sBpCd"] = $("#sBpCd").val();
                            params["sItemCd"] = $("#sItemCd").val();
                            params["sItemNm"] = $("#sItemNm").val();
                            params["sPrcTp"] = $("#sPrcTp").val();
                            params["sAbcInd"] = $("#sAbcInd").val();
                            params["sItemDstinCd"] = $("#sItemDstinCd").val();
                            params["sCarlineCd"] = $("#sCarlineCd").val();
                            params["sApplyStartDt"] = $("#sApplyStartDt").data("kendoExtMaskedDatePicker").value();
                            params["sApplyEndDt"] = $("#sApplyEndDt").data("kendoExtMaskedDatePicker").value();
                            params["sRegUsrId"] = $("#sRegUsrId").val();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"itemCd"
                        ,fields:{
                            dlrCd:{ type:"string" ,validation:{required:true} }
                            ,applyDt:{ type:"date" , editable:false}
                            ,itemCd:{ type:"string" , editable:false}
                            ,itemNm:{ type:"string" , editable:false}
                            ,itemDstinCd:{ type:"string" , editable:false}
                            ,carlineCd:{ type:"string" , editable:false}
                            ,abcInd:{ type:"string" , editable:false}
                            ,prcTp:{ type:"string" , editable:false}
                            ,salePrcAmt:{ type:"number" , editable:false}
                            ,regUsrId:{ type:"string" , editable:false}
                        }
                    }
                }
            }
            ,height:260
            ,editable:true
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,columns :
                [{field:"applyDt", title:"<spring:message code='par.lbl.applyDt' />", format:"{0:<dms:configValue code='dateFormat' />}", width:70}    //applyDt
                ,{field:"prcTp", title:"<spring:message code='par.lbl.salePrcTp' />", width:60
                    ,template:'#if(prcTp !== ""){# #= salePrcTpMap[prcTp]# #}#'
                }//prcTp
                ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd' />", width:100}  //itemCd
                ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm' />", width:150}  //itemNm
                ,{field:"itemDstinCd", title:"<spring:message code='par.lbl.itemDstinCd' />", width:80
                    ,template:'#if(itemDstinCd !== ""){# #= itemDstinCdMap[itemDstinCd]# #}#'
                }//itemDstinCd
                ,{field:"carlineCd", title:"<spring:message code='par.lbl.carLine' />", width:70}    //carlineCd
                ,{field:"abcInd", title:"<spring:message code='par.lbl.abcInd' />", width:50}           //ABCInd
                ,{field:"salePrcAmt", title:"<spring:message code='par.lbl.salePrcAmt' />", width:70, attributes:{"class":"ar"}, format:"{0:n2}"}      //salePrcAmt
                ,{field:"regUsrId", title:"<spring:message code='par.lbl.regUsrId' />", width:70}       //regUsrId
            ]
        });

    });
</script>
<!-- //script -->

