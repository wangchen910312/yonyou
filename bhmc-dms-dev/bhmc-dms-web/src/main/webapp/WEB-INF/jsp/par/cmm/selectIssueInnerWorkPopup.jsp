<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 기타출고유형 문서조회 -->
<div id="resizableContainer">
<section id="windows" class="pop_wrap">
    <div class="header_area">
        <div class="btn_left">
                <button type="button" id="btnInit" name="btnInit" class="btn_m btn_reset btn_m_min"><spring:message code="par.btn.init" /></button>
            </div>
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
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.issueReqInnerDocNo" /><!-- parReqDocNo --></th>
                    <td>
                        <input id="sParReqDocNo" name="sParReqDocNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.receiveNo" /><!-- receiveNo --></th>
                    <td>
                        <input id="sReceiveId" name="sReceiveId" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.receiveNm" /><!-- receiveNm --></th>
                    <td>
                        <input id="sReceiveNm" name="sReceiveNm" class="form_input" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 품목번호 --></th>
                    <td>
                        <input type="text" id="sItemCd" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.giDt" /><!-- giDt --></th>
                    <td colspan="2">
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sGiDocReqStartDt" name="sGiDocReqStartDt" class="form_datepicker"  data-type="maskDate"/>
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sGiDocReqEndDt" name="sGiDocReqEndDt" class="form_datepicker"  data-type="maskDate"/>
                            </div>
                        </div>
                    </td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <!-- targetReqHeaderGrid -->
        <div id="grid" class="resizable_grid"></div>
        <!-- targetReqHeaderGrid -->
    </div>

    <div style="display:none;">
        <input id="sParGiTp" class="form_comboBox" />
        <input id="sEtcGiTp" class="form_comboBox" />
    </div>

</section>
</div>
<!-- script -->
<script>

//parGiTp
var parGiTpList = [];
<c:forEach var="obj" items="${parGiTpList}">
parGiTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var parGiTpMap = {};
$.each(parGiTpList, function(idx, obj){
    parGiTpMap[obj.cmmCd] = obj.cmmCdNm;
});
//parInnerTp
var parInnerTpList = [];
<c:forEach var="obj" items="${parInnerTpList}">
parInnerTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var parInnerTpMap = {};
$.each(parInnerTpList, function(idx, obj){
    parInnerTpMap[obj.cmmCd] = obj.cmmCdNm;
});
//partsParReqStatCd
var partsParReqStatCdList = [];
<c:forEach var="obj" items="${partsParReqStatCdList}">
partsParReqStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var partsParReqStatCdMap = {};
$.each(partsParReqStatCdList, function(idx, obj){
    partsParReqStatCdMap[obj.cmmCd] = obj.cmmCdNm;
});

//page init Func
function pageInit(){

    $("#sParReqDocNo").val("");
    $("#sReceiveId").val("");
    $("#sReceiveNm").val("");
    $("#sItemCd").val("");

    $("#sGiDocReqStartDt").data("kendoExtMaskedDatePicker").value("");
    $("#sGiDocReqEndDt").data("kendoExtMaskedDatePicker").value("");

    $("#grid").data("kendoExtGrid").dataSource.data([]);
}

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
        //btnInit
        $("#btnInit").kendoButton({
            click:function(e){
                //pageInit Func call.
                pageInit();
            }
        });

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
            enable:false
            ,dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:parInnerTpList
            ,autoBind:true
            ,index:0
        });
        //sGiDocReqStartDt datepicker
        $("#sGiDocReqStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        //sGiDocReqEndDt datepicker
        $("#sGiDocReqEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        //issueInner grid
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0803-145201"
           ,dataSource:{
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
                            params["sParReqDocNoLike"] = $("#sParReqDocNo").val();      //sParReqDocNo.
                            params["sEtcGiTp"] = $("#sEtcGiTp").val();                  //sEtcGiTp.
                            params["sReceiveId"] = $("#sReceiveId").val();//sReceiveId
                            params["sReceiveNm"] = $("#sReceiveNm").val();//sReceiveNm
                            params["sItemCd"] = $("#sItemCd").val();//sItemCd
                            params["sGiDocReqStartDt"] = $("#sGiDocReqStartDt").data("kendoExtMaskedDatePicker").value();
                            params["sGiDocReqEndDt"] = $("#sGiDocReqEndDt").data("kendoExtMaskedDatePicker").value();

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
                            ,remark:{ type:"string" }
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
            ,filterable:false
            //,appendEmptyColumn:true           //빈컬럼 적용. default:false
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
                ,{ field:"updtDt", title:"<spring:message code='par.lbl.giDt'/>", format:"{0:<dms:configValue code='dateFormat' />}", width:100 }//regDt
                ,{ field:"parGiTp", title:"<spring:message code='par.lbl.giTp'/>"
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
                }//parGiTp(출고유형)
                ,{ field:"parReqDocNo", title:"<spring:message code='par.lbl.issueReqInnerDocNo'/>", width:130
                } //roDocNo
            ]
        });

        //부품요청상세번호
        if(options.parReqDocNo !== undefined || options.parReqDocNo !== null){
            //출고문서
            $("#sParReqDocNo").val(options.parReqDocNo);
            $("#sParReqDocNo").focus();
        }

    });
</script>
<!-- //script -->
