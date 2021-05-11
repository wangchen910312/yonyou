<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">

    <div class="header_area">
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /></button>
            <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button>
            <%-- <button id="btnCancel" class="btn_m btn_Cancel"><spring:message code="global.btn.cancel" /></button> --%>
        </div>
    </div>

    <div class="table_form" role="search" data-btnid="btnSearch">
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
                    <th scope="row"><spring:message code="ser.lbl.bayNo" /><!-- BAY NO --></th>
                    <td>
                        <input id="sBayNo" type="text" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.bayMngNm" /><%-- BAY 관리자 --%></th>
                    <td>
                        <input id="sAdmSaNm" type="text" class="form_input" />
                    </td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <div id="grid" class="grid"></div>
    </div>

</section>

<script type="text/javascript">

    //공통코드:BAY상세구분
    var bayTpCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${bayTpCdList}">
    bayTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var bayTpCdArr = dms.data.arrayToMap(bayTpCdList, function(obj){return obj.cmmCd});

    //공통코드:BAY상태코드
    var bayStatCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${bayStatCdList}">
    bayStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var bayStatCdMap = dms.data.arrayToMap(bayStatCdList, function(obj){return obj.cmmCd;});

    //공통코드:사용여부
    var useYnList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${userYnList}">
    useYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var useYnMap = dms.data.arrayToMap(useYnList, function(obj){return obj.cmmCd;});

    // 공통코드:수리유형
    var rpirTpCdList = [];
    <c:forEach var="obj" items="${rpirTpCdList}">
    rpirTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var rpirTpCdMap = dms.data.arrayToMap(rpirTpCdList, function(obj){return obj.cmmCd;});



    // BAY 구분
    bayTpCdGrid = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(bayTpCdArr[val] != undefined)
                returnVal = bayTpCdArr[val].cmmCdNm;
        }
        return returnVal;
    };
    // 수리유형
    setRpirTpCd = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(rpirTpCdMap[val] != undefined)
            returnVal = rpirTpCdMap[val].cmmCdNm;
        }
        return returnVal;
    };
    // BAY상태코드
    setBayStatCd = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(bayStatCdMap[val] != undefined)
            returnVal = bayStatCdMap[val].cmmCdNm;
        }
        return returnVal;
    };
    // BAY가상여부
    setUseYnCd = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(useYnMap[val] != undefined)
            returnVal = useYnMap[val].cmmCdNm;
        }
        return returnVal;
    };

    $(document).ready(function() {

        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         var options = parent.bayManagePopup.options.content.data;


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
                    parent.bayManagePopup.close();
                }
            }
        });

        // 닫기 버튼.
        $("#btnCancel").kendoButton({
            click:function(e){
                parent.bayManagePopup.close();
            }
        });

        /************************************************************
                    조회조건 설정
        *************************************************************/
        if (options.tecId) {
            $("#sTecId").val(options.tecId);
        }
        if (options.tecNm) {
            $("#sTecNm").val(options.tecNm);
        }

        /************************************************************
                    그리드 설정
        *************************************************************/
        //그리드 설정
        $("#grid").kendoExtGrid({
            gridId:"G-SER-170519-174014"
            ,dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/ser/svi/bayManage/selectBayManages.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sDlrCd"] = $("#dlrCd").val();
                            params["sBayNo"] = $("#sBayNo").val();
                            params["sAdmSaNm"] = $("#sAdmSaNm").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,navigatable:false
                ,serverPaging:false
                ,pageSize:0
                ,schema:{
                    model:{
                       id:"rnum"
                       ,fields:{
                           rnum:{type:"number"}
                           ,bayNo:{ type:"string" }
                           ,dlrCd:{ type:"string" }
                           ,bayNm:{ type:"string" }
                           ,rpirTp:{ type:"string" }
                           ,modNm:{ type:"string" }
                           ,bayTp:{ type:"string" }
                           ,bayTpNm:{ type:"string" }
                           ,useYn:{ type:"string" }
                           ,strgeCd:{ type:"string" }
                           ,strgeNm:{ type:"string" }
                           ,admSaId:{ type:"string" }
                           ,admSaNm:{ type:"string" }
                           ,vrYn:{ type:"string" }
                      }
                   }
                }
            }
            ,selectable:options.selectable === "multiple"? "multiple,row":"row"
            ,editable:false
            ,pageable:false
            ,height:280
            ,filterable:false                 // 필터링 기능 사용안함
            ,columns:[
                {field:"bayTp"
                 ,title:"<spring:message code='ser.lbl.gubun' />", width:80      // 구분
                 ,template:"#=bayTpCdGrid(bayTp)#"
                 ,hidden:true
                }
                ,{field:"bayNo", title:"<spring:message code='ser.lbl.bayNo' />", width:60}
                ,{field:"bayNm", title:"<spring:message code='ser.lbl.dtiInfo' />", width:100}
                ,{field:"admSaNm", title:"<spring:message code='ser.lbl.bayMngNm' />", width:100}
                ,{field:"bayStatCd", title:"<spring:message code='ser.lbl.bayStatCd' />", width:100
                    ,attributes:{"class":"ac"}
                    ,template:"#=setBayStatCd(bayStatCd)#"
                } //BAY 상태
                ,{field:"vrYn", title:"<spring:message code='ser.lbl.resvBay' />", width:100
                    ,attributes:{"class":"ac"}
                    ,template:"#=setUseYnCd(vrYn)#"
                } //예약BAY
                ,{field:"rpirTp", title:"<spring:message code='ser.lbl.lbrTp' />", width:100
                    ,attributes:{"class":"ac"}
                    ,template:"#=setRpirTpCd(rpirTp)#"
                } //수리유형
            ]
        });

        if(options.autoBind){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }
    });
</script>









