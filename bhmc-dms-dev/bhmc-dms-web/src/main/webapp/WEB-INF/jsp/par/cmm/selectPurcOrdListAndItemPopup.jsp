<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- 구매오더리스트 상세 팝업 -->
    <section id="windows" class="pop_wrap">
        <div class="header_area">
            <div class="btn_right">
                <!-- 조회 버튼 -->
                <button id="btnSearch" class="btn_m btn_Search"><spring:message code="par.btn.search" /><!-- 조회 --></button>
                <button id="btnSelect" class="btn_m btn_Select"><spring:message code="par.btn.select" /><!-- 선택 --></button>
            </div>
        </div>
        <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:15%;">
                    <col style="width:21%;">
                    <col style="width:15%;">
                    <col style="width:21%;">
                    <col style="width:15%;">
                    <col style="width:21%;">
                    <col style="width:15%;">
                    <col >
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.purcOrdNo" /><!-- 구매오더번호 --></th>
                        <td>
                            <input id="sPurcOrdNo" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부품코드 --></th>
                        <td>
                            <input id="sItemCd" class="form_input" />
                        </td>
                        <th scope="row"></th>
                        <td></td>
                        <th scope="row"></th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid mt5">
        <!-- 그리드1 -->
            <div id="gridDetail" class="grid"></div>
        <!-- 그리드1 -->
        </div>
    </section>
    <!-- //부품선택 팝업 -->

 <script type="text/javascript">

function gridDetailHeight(){
    var grid = $("#gridDetail").data("kendoExtGrid");
    var contentHeight = grid.content.height();
    var footerHeight = grid.wrapper.find(".k-grid-footer").height();
    grid.content.height(contentHeight - (footerHeight + 1));
}

//품목구분 그리드 콤보
function setSumData(val){
    var returnData  = Math.round(val * 1000)/1000,
        returnCalData = Math.round(returnData * 100)/100,
        returnVal = kendo.toString(returnData,'n2');

    return returnVal;
};

$(document).ready(function() {

    /************************************************************
                팝업옵션 설정
    *************************************************************/
    /**
     * 팝업 옵션
     */
     var options             = parent.purcOrdListAndItemPopupWindow.options.content.data,
         purcOrdTpList       = [],
         purcOrdTpObj        = {},
         purcOrdStatList     = [],
         purcOrdStatObj      = {};

     purcOrdTpList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
     <c:forEach var="obj" items="${purcOrdTpList}" varStatus="status">
         purcOrdTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         purcOrdTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>

     purcOrdStatList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
     <c:forEach var="obj" items="${purcOrdStatList}" varStatus="status">
         if(!dms.string.isEmpty(options.excStatCd)){
             if(options.excStatCd !== "${obj.cmmCd}"){
                 if("${obj.useYn}" !=='N' ){
                     purcOrdStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
                 }
                 purcOrdStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
             }
         }else{
             if("${obj.useYn}" !=='N' ){
                 purcOrdStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
             }
             purcOrdStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
         }
     </c:forEach>

    // 그리드 더블 클릭 이벤트.
    $("#gridDetail").on("dblclick", "tr.k-state-selected", function (e) {
        $("#btnSelect").click();
    });


    /************************************************************
                기능버튼 설정
    *************************************************************/


    // 조회 버튼.
    $("#btnSearch").kendoButton({
        click:function(e){
            $("#gridDetail").data("kendoExtGrid").dataSource.read();
        }
    });

    // 선택 버튼.
    $("#btnSelect").kendoButton({
        click:function(e){
            var grid = $("#gridDetail").data("kendoExtGrid");
            var rows = grid.select();

            if(rows !== null){
                var data = [];

                if(rows.length > 1){
                    dms.notification.warning("<spring:message code='global.info.selectOneRowMsg' />");
                    return false;
                }
                $.each(rows, function(idx, row){
                    data.push(grid.dataItem(row));
                });

                options.callbackFunc(data);
            }
        }
    });

    /************************************************************
                조회조건 설정
    *************************************************************/

    /************************************************************
                그리드 설정
    *************************************************************/

    //구매 명세 그리드
    $("#gridDetail").kendoExtGrid({
        gridId:"G-PAR-0131-095801"
       ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/pcm/purcOrd/selectPurcOrdStatusListByCondition.do' />"
                }
                , parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        // 구매오더 검색조건 코드.
                        params["sBmpOrdNo"] = $("#sPurcOrdNo").val();
                        params["sItemCd"]   = $("#sItemCd").val();
                        params["sDelYn"]    = 'Y'; //삭제된 구매오더 제외.


                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                data:function (result){
                    if(result.total === 0){
                        //dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                    }

                    return result.data;
                }
                ,total:"total"
                ,model:{
                   id:"purcOrdNo"
                  ,fields:{
                        dlrCd          :{ type:"string", editable:false }
                      , purcOrdNo      :{ type:"string", editable:false } //오더번호
                      , bmpOrdNo      :{ type:"string", editable:false } //BMP오더번호
                      , purcOrdLineNo  :{ type:"string", editable:false } //구매오더라인번호
                      , mobisInvcNo    :{ type:"string", editable:false } //송장번호
                      , mobisInvcLineNo:{ type:"string", editable:false } //송장라인번호
                      , itemCd         :{ type:"string", editable:false } //부번
                      , confirmParNo   :{ type:"string", editable:false } //부번
                      , itemNm         :{ type:"string", editable:false } //품명
                      , confirmParNm   :{ type:"string", editable:false } //품명
                      , purcRegDt      :{ type:"date",   editable:false } //오더일자(구매일자)
                      , arrvDt         :{ type:"date",   editable:false } //도착예정일자
                      , purcOrdTp      :{ type:"string", editable:false } //오더유형
                      , bpCd           :{ type:"string", editable:false } //업체
                      , bpNm           :{ type:"string", editable:false } //업체
                      , purcItemStatCd :{ type:"string", editable:false } //상태
                      , purcUnitCd     :{ type:"string", editable:false } //단위
                      , purcQty        :{ type:"number", editable:false } //오더수량(구매수량)
                      , bmpChkQty      :{ type:"number", editable:false } //확정수량
                      , boQty          :{ type:"number", editable:false } //B/O수량
                      , odrAlcQt       :{ type:"number", editable:false } //할당수량
                      , odrOpicQt      :{ type:"number", editable:false } //픽킹중수량
                      , odrOpacQt      :{ type:"number", editable:false } //팩킹중수량
                      , odrPakdQt      :{ type:"number", editable:false } //팩킹완료수량
                      , odrInvQt       :{ type:"number", editable:false } //인보이스수량
                      , grQty          :{ type:"number", editable:false } //기입고수량(입고수량)
                      , cancQty        :{ type:"number", editable:false } //취소수량
                      , grStrgeCd      :{ type:"string", editable:false } //창고
                      , purcPrc        :{ type:"number", editable:false } //단가
                      , purcAmt        :{ type:"number", editable:false } //금액
                      , regUsrId       :{ type:"string", editable:false } //등록인
                      , purcReqRegUsrId:{ type:"string", editable:false } //신청인(구매요청자)
                    }
                }
            }
            ,aggregate:[
                {field:"purcQty", aggregate:"sum"}
                ,{field:"purcPrc", aggregate:"sum"}
                ,{field:"purcAmt", aggregate:"sum"}
            ]
        }
        ,selectable:"row"
        ,scrollable :true
        ,autoBind:false
        ,filterable:false
        ,height:230
        ,appendEmptyColumn:true//empty column. default:false
        ,columns:[
              {field:"purcOrdNo" ,title:"<spring:message code='par.lbl.purcOrdNo' />" ,width:120, hidden:true}//구매오더번호
             ,{field:"bmpOrdNo" ,title:"<spring:message code='par.lbl.purcOrdNo' />" ,width:120}//구매오더번호
             ,{field:"purcOrdLineNo" ,title:"<spring:message code='par.lbl.lineNm' />" ,width:60}//구매오더라인번호
             ,{field:"purcOrdTp" ,title:"<spring:message code='par.lbl.purcOrdTp' />" ,attributes:{"class":"al"} ,width:150
                 ,template:'#= changePurcOrdTp(purcOrdTp)#'
              }//오더유형
             ,{field:"bpNm" ,title:"<spring:message code='par.lbl.spyrCd' />" ,width:180}//공급업체
             ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd'/>" ,width:140}//부품번호
             ,{field:"itemNm" ,title:"<spring:message code='par.lbl.itemNm'/>" ,width:200}//부품명
             ,{field:"purcQty" ,title:"<spring:message code='par.lbl.purcQty' />" ,width:100
                 ,attributes:{ "class":"ar"}
                 ,format:"{0:n0}"
                 ,aggregates:["sum"]
                 ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n0')#</div>"
             }
             ,{field:"purcPrc", title:"<spring:message code='par.lbl.purcBasePrc' />" ,width:120
                 ,attributes:{ "class":"ar"}
                 ,format:"{0:n2}"
                 ,aggregates:["sum"]
                 ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
             }//단가
             ,{field:"purcAmt", title:"<spring:message code='par.lbl.purcAmt' />" ,width:120
                 ,attributes:{ "class":"ar"}
                 ,format:"{0:n2}"
                 ,aggregates:["sum"]
                 ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
             }//금액
             ,{field:"purcRegDt" ,title:"<spring:message code='par.lbl.ordReqDt' />" ,attributes:{"class":"ac"} ,format    :"{0:<dms:configValue code='dateFormat' />}" ,width:100}//구매등록일
             ,{field:"mobisInvcNo" ,title:"<spring:message code='par.lbl.invcDocNo' />" ,width:150}//송장번호
        ]
    });

    gridDetailHeight();

    if(options.purcOrdNo != "undefined"){
        $("#sPurcOrdNo").val(options.purcOrdNo);
    }

    if(options.itemCd != "undefined"){
        $("#sItemCd").val(options.itemCd);
    }

    if(options.purcOrdNo != "undefined" || options.itemCd != "undefined"){
        $("#gridDetail").data("kendoExtGrid").dataSource.read();
    }

    if(options.autoBind){
        $("#gridDetail").data("kendoExtGrid").dataSource.read();
    }

    //  오더유형
    changePurcOrdTp = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = purcOrdTpObj[val];
        }
        return returnVal;
    };

    // 구매상태
    changePurcOrdStat = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = purcOrdStatObj[val];
        }
        return returnVal;
    };

});

 </script>

