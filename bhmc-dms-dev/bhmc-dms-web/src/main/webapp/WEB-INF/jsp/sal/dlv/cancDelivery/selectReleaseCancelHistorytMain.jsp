<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div id="resizableContainer">
    <!-- 출고취소이력 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="sal.title.releaseCancelHistory" /></h1> <!-- 출고취소이력조회 -->
            <div class="btn_right">
                <dms:access viewId="VIEW-D-12795" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                </dms:access>
            </div>
        </div>
        <!-- 조회 조건 시작 -->
        <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.vinNum' /></th><!-- VIN NO -->
                        <td>
                            <input id="sVinNo" type="text" class="form_input" maxlength="17">
                        </td>
                        <th scope="row" class="bor_none"></th>
                        <td></td>
                        <th scope="row" class="bor_none"></th>
                        <td></td>
                        <th scope="row" class="bor_none"></th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- 조회 조건 종료 -->

        <div class="table_grid mt10">
            <div id="grid" class="resizable_grid"></div>
        </div>
    </section>
</div>

<script  type="text/javascript">
    /**
     * 조작 콤보박스
     */
    var optList = [];
    <c:forEach var="obj" items="${kmoptDS}">
        optList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
    </c:forEach>
    //조작 Map
    var optMap = dms.data.arrayToMap(optList, function(obj){ return obj.cmmCd; });

    /**
     * 취소사유
     */
    var cnclList = [];
    <c:forEach var="obj" items="${cnclDs}">
      cnclList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
    </c:forEach>
    //조작 Map
    var cnclMap = dms.data.arrayToMap(cnclList, function(obj){ return obj.cmmCd; });

    $(document).ready(function () {
    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    	//그리드 1번
    	$("#grid").kendoExtGrid({
    	    gridId:"G-SAL-1022-155233"
           	,dataSource:{
           	 transport:{
                 read:{
                     url:"<c:url value='/sal/dlv/cancelHistory/selectReleaseCancelHistory.do' />"
                 }
                ,parameterMap:function(options, operation) {
                     if (operation === "read") {

                         var params = {};

                         /*Paging Param Start~!*/
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         /*Paging Param End~!*/

                         params["sort"] = options.sort;
                         params["vinNo"] = $("#sVinNo").val();
                         params["contractCustNo"] = $("#sContractCustNo").val();

                         return kendo.stringify(params);
                     }else if (operation !== "read" && options.models) {
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,error:function(e){

             }
             ,schema:{
                 data:"data"
                ,model:{
                     id:"cancelHistory"
                    ,fields:{
                         ronum:{type:"string", editable:false}         //No
                        ,kmopt:{type:"string", editable:false}        //조작
                        ,optDt:{type:"string", editable:false}        //조작일자
                        ,kmvin:{type:"string", editable:false}        //VIN_NO
                        ,carlineNm:{type:"string", editable:false}    //차종
                        ,modelNm:{type:"string", editable:false}      //차관
                        ,custnm:{type:"string", editable:false}       //고객명
                        ,kmuser:{type:"string", editable:false}       //조작인
                        ,kmcncd:{type:"string", editable:false}       //취소사유
                     }
                 }
             }
           }
            ,dataBound:function(e) {
                var rows = e.sender.tbody.children();

                var qty = 0;

                $.each(rows, function(idx, row){
                    var dataItem = e.sender.dataItem(row);

                    if(dataItem.ordpVapr != null){
                        qty += Number(dataItem.ordpVapr);
                    }
                });
            }
           ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
           ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
           ,appendEmptyColumn:false          //빈컬럼 적용. default:false
           ,enableTooltip:true               //Tooltip 적용, default:false
           ,autoBind:true
           ,scrollable:true
           ,editable:false
           ,pageable :{
               refresh :true
               ,pageSize :100
               ,pageSizes :[ "200", "300", "400", "500"]
           }
           ,columns:[
                  {field:"ronum", title:"<spring:message code='global.lbl.no' />"
                    ,width:60
                    ,sortable:false, attributes:{"class":"ac"}} //번호

                 ,{field:"kmopt", title:"<spring:message code='par.lbl.itemOper' />"
                     ,width:130
                     ,headerAttributes:{style:"text-align:center;"}
                     ,template:"# if(optMap[kmopt] != null){# #= optMap[kmopt].cmmCdNm# #}#"
                     ,attributes:{"class":"al"}
                 } // 조작
/*
                 ,{field:"kmcncd", title:"<spring:message code='global.lbl.cancReasonCd' />"
                     ,width:130
                     ,headerAttributes:{style:"text-align:center;"}
                     ,template:"# if(cnclMap[kmcncd] != null){# #= cnclMap[kmcncd].cmmCdNm# #}#"
                     ,attributes:{"class":"al"}
                 } // 취소사유
 */
                 ,{field:"kmdate", title:"<spring:message code='global.lbl.operDt' />"
                     ,width:100
                     ,headerAttributes:{style:"text-align:center;"}
                     ,attributes:{"class":"ac"}
                 } // 조작일자

                 ,{field:"kmvin", title:"<spring:message code='global.lbl.vinNum' />"
                    ,width:150
                    ,headerAttributes:{style:"text-align:center;"}
                } // VIN_NO

                ,{field:"carlineNm",   title:"<spring:message code='global.lbl.carLine' />"
                    ,width:150
                    ,headerAttributes:{style:"text-align:center;"} ,attributes:{"class":"al"}
                } // 차종
                ,{field:"modelNm", title:"<spring:message code='global.lbl.model' />"
                    ,width:200
                    ,headerAttributes:{style:"text-align:center;"}
                } // 차관
                ,{field:"custnm", title:"<spring:message code='global.lbl.custNm' />"
                    ,width:100
                    ,headerAttributes:{style:"text-align:center;"}
                    ,attributes:{"class":"al"}
                } //고객명
                ,{field:"kmuser", title:"<spring:message code='global.lbl.handler' />"
                    ,width:100
                    ,headerAttributes:{style:"text-align:center;"}
                    ,attributes:{"class":"al"}
                } //조작인
            ]
    	});
	}); //document.ready End

</script>