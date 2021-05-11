<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 기타출고유형 문서조회 -->
<section id="windows" class="pop_wrap">
    <div class="header_area">
        <h1 class="title_basic"></h1>
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_search"><spring:message code="par.btn.search" /></button><!--조회  -->
            <button id="btnSelect" class="btn_m btn_Select"><spring:message code="par.btn.select" /></button><!-- 선택 -->
        </div>
    </div>

    <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
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
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.otherGiTp" /><!-- otherGiTp --></th>
                    <td>
                        <input id="sParGiTp" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.parInnerTp" /><!-- sEtcGiTp --></th>
                    <td>
                        <input id="sEtcGiTp" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.giDocNo" /><!-- giDocNo --></th>
                    <td>
                        <input id="sParReqDocNo" name="sParReqDocNo" class="form_input" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <!-- targetReqHeaderGrid -->
        <div id="grid" ></div>
        <!-- targetReqHeaderGrid -->
    </div>
</section>
<!-- script -->
<script>

//parGiTp
var parGiTpList = [];
<c:forEach var="obj" items="${parGiTpList}">
parGiTpList.push({
    "cmmCd":"${obj.cmmCd}"
    ,"cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
var parGiTpMap = [];
$.each(parGiTpList, function(idx, obj){
    parGiTpMap[obj.cmmCd] = obj.cmmCdNm;
});
//parInnerTp
var parInnerTpList = [];
<c:forEach var="obj" items="${parInnerTpList}">
parInnerTpList.push({
    "cmmCd":"${obj.cmmCd}"
    ,"cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
var parInnerTpMap = [];
$.each(parInnerTpList, function(idx, obj){
    parInnerTpMap[obj.cmmCd] = obj.cmmCdNm;
});
//partsParReqStatCd
var partsParReqStatCdList = [];
<c:forEach var="obj" items="${partsParReqStatCdList}">
partsParReqStatCdList.push({
    "cmmCd":"${obj.cmmCd}"
    ,"cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
var partsParReqStatCdMap = [];
$.each(partsParReqStatCdList, function(idx, obj){
    partsParReqStatCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//roTpCdList
var roTpCdList = [];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
var roTpCdArr = dms.data.arrayToMap(roTpCdList, function(obj){return obj.cmmCd});
//roTpCdGrid Func
roTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = roTpCdArr[val].cmmCdNm;
    }
    return returnVal;
}
//giStrgeCdList
var giStrgeCdList = [];
<c:forEach var="obj" items="${giStrgeCdList}">
giStrgeCdList.push({
    "strgeCd":"${obj.strgeCd}"
    ,"strgeNm":"${obj.strgeNm}"
});
</c:forEach>
var giStrgeCdMap = [];
$.each(giStrgeCdList, function(idx, obj){
    giStrgeCdMap[obj.strgeCd] = obj.strgeNm;
});
//location Array
var locCdList = [];
<c:forEach var="obj" items="${locCdList}">
locCdList.push({
    "locCd":"${obj.locCd}"
    ,"locNm":"${obj.locNm}"
});
</c:forEach>
var locCdMap = [];
$.each(locCdList, function(idx, obj){
    locCdMap[obj.locCd] = obj.locNm;
});

    $(document).ready(function() {

        /************************************************************
                팝업옵션 설정
        *************************************************************/
        /**
        * 팝업 옵션
        */
        var options = parent.searchIssueInnerPopupWin.options.content.data;

        // 그리드 더블 클릭 이벤트.
        $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
            $("#btnSelect").click();
        });

        /************************************************************
                기능버튼 설정
        *************************************************************/

        // 선택 버튼.
        $("#btnSelect").kendoButton({
            click:function(e){
                var grid = $("#grid").data("kendoExtGrid");
                var rows = grid.select();

                if(rows !== null){
                    var data = [];
                    $.each(rows, function(idx, row){
                        data.push(grid.dataItem(row));
                    });

                    options.callbackFunc(data);
                }
            }
        });

        // 조회 버튼.
        $("#btnSearch").kendoButton({
            click:function(e){
                $("#grid").data("kendoExtGrid").dataSource.read();
            }
        });

        //sParGiTp dropdownlist
        $("#sParGiTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:parGiTpList
            ,autoBind:true
            ,index:0
        });
        //sParInnerTp dropdownlist
        $("#sEtcGiTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:parInnerTpList
            ,autoBind:true
            ,index:0
        });

        //출고문서
        $("#sParReqDocNo").focus();
        //issueInner grid
        $("#grid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReq/selectIssueReqes.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sort"] = options.sort;

                            var sParGiTp = $("#sParGiTp").val();
                            params["sParGiTp"] = sParGiTp;                              //sParGiTp
                            params["sParReqDocNo"] = $("#sParReqDocNo").val();          //sParReqDocNo.
                            params["sEtcGiTp"] = $("#sEtcGiTp").val();                  //sEtcGiTp.

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"itemCd"
                        ,fields:{
                            rnum:{ type:"number" , validation:{required:true} }
                            ,dlrCd:{ type:"string" , validation:{required:true} }
                            ,pltCd:{ type:"string" }
                            ,itemCd:{ type:"string" , validation:{required:true} }
                            ,itemNm:{ type:"string" , validation:{required:true} }
                            ,regUsrId:{ type:"string" }
                            ,regDt:{ type:"date" }
                            ,updtUsrId:{ type:"string" }
                            ,updtDt:{ type:"date" }
                        }
                    }
                }
            }
            ,height:288
            ,editable:false
            ,autoBind:false
            ,selectable:"row"
            ,multiSelectWithCheckbox:false
            ,change:function(e){
             }
            ,columns :
                [{ field:"rnum", title:"<spring:message code='par.lbl.line'/>", width:50 }//rnum
                ,{ field:"parReqStatCd", title:"<spring:message code='par.lbl.parReqStatCd'/>"
                    ,width:100
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        switch(dataItem.parReqStatCd){
                            case "02":// ok
                                spanObj = "<span class='txt_label bg_blue'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                            case "03":// cancel
                                spanObj = "<span class='txt_label bg_red'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                            default: // ready:request
                                spanObj = "<span class='txt_label bg_gray'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }//parReqStatCd
                ,{ field:"regDt", title:"<spring:message code='par.lbl.giDt'/>", format:"{0:<dms:configValue code='dateFormat' />}", width:100 }//regDt
                ,{ field:"parGiTp", title:"<spring:message code='par.lbl.otherGiTp'/>"
                    ,width:120
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        switch(dataItem.parGiTp){
                            case "SR"://SR
                                spanObj = "<span class='txt_label bg_yellow'>"+"["+dataItem.parGiTp+"]"+parGiTpMap[dataItem.parGiTp]+"</span>";
                                break;
                            case "RO"://RO
                                spanObj = "<span class='txt_label bg_green'>"+"["+dataItem.parGiTp+"]"+parGiTpMap[dataItem.parGiTp]+"</span>";
                                break;
                            case "SA"://SA(Parts Sale)
                                spanObj = "<span class='txt_label bg_blue'>"+"["+dataItem.parGiTp+"]"+parGiTpMap[dataItem.parGiTp]+"</span>";
                                break;
                            case "IN"://IN
                                spanObj = "<span class='txt_label bg_yellow'>"+"["+dataItem.parGiTp+"]"+parGiTpMap[dataItem.parGiTp]+"</span>";
                                break;
                            default: // ready:request
                                spanObj = "<span class='txt_label bg_gray'>"+"["+dataItem.parGiTp+"]"+parGiTpMap[dataItem.parGiTp]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }//parGiTp
                ,{ field:"parReqDocNo", title:"<spring:message code='par.lbl.giDocNo'/>", width:130
                } //roDocNo
                ,{ title:"" }
            ]
        });

    });
</script>
<!-- //script -->
