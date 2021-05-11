<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <div class="btn_left">
			<dms:access viewId="VIEW-D-11967" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_reset btn_m_min" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
			</dms:access>
            </div>
            <div class="btn_right">
			<dms:access viewId="VIEW-D-11966" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnSearch" class="btn_m btn_search"><spring:message code="par.btn.search" /><!-- 조회 --></button>
			</dms:access>
            </div>
        </div>
        <div class="table_form form_width_100per" role="search" data-btnid="btnSearch" id="searchForm">
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
                        <th scope="row"><spring:message code="par.lbl.bpNm" /><!-- 공급업체 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="sBpCd" class="form_input hidden" required data-name="<spring:message code="par.lbl.bpCd" />" />
                                <input type="text" id="sBpNm" class="form_input form_readonly" readonly />
                                <input type="hidden" id="sBpTp" />
                                <a id="searchCustCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.toolCd" /><!-- 공구번호 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="sItemCd" class="form_input">
                                <a id="searchItemCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.toolNm" /><!-- 공구명 --></th>
                        <td>
                            <input type="text" id="sItemNm" class="form_input" value="${itemNm}">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.repairPrsn" /><!-- 수리공 --></th>
                        <td>
                            <div class="form_search">
                                <input type="hidden" id="sTechId" />
                                <input type="text" id="sTechNm" class="form_input form_readonly" readonly />
                                <a id="searchTechId"><!-- 검색 --></a>
                            </div>
                        </td>
                    </tr>
                    <tr class="hidden">
                        <th scope="row"><spring:message code="par.lbl.giDt" /><!-- 출고일 --></th>
                        <td class="readonly_area">
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sGiDtFr" class="form_datepicker" data-type="maskDate">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sGiDtTo" class="form_datepicker" data-type="maskDate">
                                </div>
                            </div>
                        </td>
                        <th/>
                        <td/>
                        <th/>
                        <td/>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid mt10">
        <!-- 그리드1 -->
            <div id="gridHeader" class="grid"></div>
        </div>

        <div class="table_grid mt10">
        <!-- 그리드2 -->
            <div id="gridDetail" class="resizable_grid"></div>
        </div>
    </section>
</div>

 <script type="text/javascript">

 var venderSearchPopupWin;
 function selectVenderMasterPopupWindow(){

     venderSearchPopupWin = dms.window.popup({
         windowId:"venderSearchPopupWin"
         ,title:"<spring:message code = 'par.title.venderSelect'/>"   // 거래처 조회
         ,width : 840
         ,height: 400
         ,content:{
             url:"<c:url value='/par/pmm/venderMaster/selectVenderMasterPopup.do'/>"
             ,data:{
                 "type":"custom1"
                 ,"autoBind":false
                 ,"bpCd":''
                 ,"bpNm":''
                 ,"bpTp":'03'
                 ,"callbackFunc":function(data){

                     existItemChkObj = {};

                     $("#sBpCd").val(data[0].bpCd);  //공급업체 기본셋팅
                     $("#sBpNm").val(data[0].bpNm);
                     $("#sBpTp").val(data[0].bpTp);
                     $("#gridHeader").data("kendoExtGrid").dataSource.data([]);
                     $("#gridDetail").data("kendoExtGrid").dataSource.data([]);

                     venderSearchPopupWin.close();

                 }
             }
         }
     });
 }

//부품 팝업 열기 함수.
 function selectPartsMasterPopupWindow(){

     searchItemPopupWindow = dms.window.popup({
         windowId:"searchItemPopupWindow"
         ,title:"<spring:message code='par.title.partSearch' />"   // 부품 조회
         ,width : 840
         ,height: 400
         ,content:{
             url:"<c:url value='/par/cmm/selectSearchItemPopup.do'/>"
             ,data:{
                 "type":""
                 ,"itemDstinCd":"07"
                 ,"autoBind":false
                 ,"callbackFunc":function(data){
                     $("#sItemCd").val(data[0].itemCd);
                     $("#sItemNm").val(data[0].itemNm);
                     searchItemPopupWindow.close();
                 }
            }
         }
     });
 }

  // 테크니션 팝업
 function fmTechPopup(){

     tecSearchPopup = dms.window.popup({
         windowId:"teckManFnSearchWin"
             ,title:"<spring:message code='ser.title.tecSearch' />"//테크니션 조회
             ,width:840
             ,height:380
             ,content:{
                 url:"<c:url value='/ser/cmm/popup/selectTechManFnPopup.do'/>"
                 ,data:{
                     "autoBind":true
                     ,"callbackFunc":function(jsonObj) {
                         if(jsonObj.length > 0) {
                             $("#sTechId").val(jsonObj[0].tecId);
                             $("#sTechNm").val(jsonObj[0].tecNm);
                         }
                     }
                 }
             }
     });
 }

function initPage(){

    //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
    if (!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])) {
        return false;
    }

    // 품목 정보 Reset
    partsJs.validate.groupObjAllDataInit();

    $("#sBpCd").val("");
    $("#sBpNm").val("");
    $("#sBpTp").val("");
    $("#sItemCd").val("");
    $("#sItemNm").val("");
    $("#sTechId").val("");
    $("#sTechNm").val("");

    $("#gridHeader").data("kendoExtGrid").dataSource.data([]);
    $("#gridDetail").data("kendoExtGrid").dataSource.data([]);

}

    $(document).ready(function() {

        var toDt = "${toDt}",
            sevenDtBf = "${sevenDtBf}",
            toolGiTpChkObj = {},
            toolGiTpList = [],
            toolGiTpObj = {},
            unitList = [],
            unitObj = {},
            strgeTpObj = {},
            strgeTpList = [],
            minDate = new Date(sevenDtBf),
            maxDate = new Date(toDt),
            toYY,
            toMM,
            toDD,
            frYY,
            frMM,
            frDD;

        //공구출고유형 : GI(工具借用:공구출고), RT(工具归还:공구반환), 65(工具报损:공구폐기)
        <c:forEach var="obj" items="${toolGiTpList}" varStatus="status">
            toolGiTpList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            toolGiTpChkObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        //단위
        <c:forEach var="obj" items="${unitList}" varStatus="status">
            unitList.push({cmmCd:"${obj.unitExtCd}", cmmCdNm:"${obj.unitExtCd}"});
            unitObj["${obj.unitExtCd}"] = "${obj.unitExtCd}";
        </c:forEach>
        strgeTpObj[' '] = "";
        <c:forEach var="obj" items="${storageList}" varStatus="status">
            strgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
            strgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
        </c:forEach>

        /************************************************************
                    기능버튼 설정
        *************************************************************/

        $("#searchCustCd").on('click', selectVenderMasterPopupWindow);
        $("#searchItemCd").on('click', selectPartsMasterPopupWindow);
        $("#searchTechId").on('click', fmTechPopup);

        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                initPage();
            }
        });

        // 조회 버튼.
        $("#btnSearch").kendoButton({
            click:function(e){
                $("#gridHeader").data("kendoExtGrid").dataSource.read();
            }
        });

        /************************************************************
                    그리드 설정
        *************************************************************/
        $("#gridHeader").kendoExtGrid({
            gridId:"G-PAR-0816-091302"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/stm/toolMaster/selectToolItemByConditions.do' />"
                        ,dataType:"json"
                        ,type:"POST"
                        ,contentType:"application/json;"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sBpCd"] = $("#sBpCd").val();
                            params["sItemCd"] = $("#sItemCd").val();
                            params["sItemNm"] = $("#sItemNm").val();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,navigatable:false
                ,serverPaging:true
                ,schema:{
                    data:"data"
                    ,total:"total"
                    ,model:{
                        id:"itemCd"
                        ,fields:{
                            dlrCd:{ type:"string" }
                            ,bpCd:{ type:"string" }
                            ,bpNm:{ type:"string" }
                            ,itemCd:{ type:"string" }
                            ,itemNm:{ type:"string" }
                            ,stockQty:{ type:"number" }
                            ,giQty:{ type:"number" }
                            ,returnQty:{ type:"number" }
                            ,disuseQty:{ type:"number" }
                        }
                    }
                }
            }
            ,selectable:"row"
            ,editable:false
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true //빈컬럼 적용. default:false
            ,height:300
            ,change:function(e){
                var selectedItem = this.dataItem(this.select());

                if( selectedItem != null && selectedItem != 'undefined'){
                    $("#gridDetail").data("kendoExtGrid").dataSource.read();
                }
             }
            ,columns:[
                 { field:"dlrCd", title:"<spring:message code='par.lbl.dlrCd' />", width:105, hidden:true }  //딜러 코드
                ,{ field:"bpCd", title:"<spring:message code='par.lbl.bpCd' />", width:105, hidden:true }  //거래처 코드
                ,{ field:"bpNm", title:"<spring:message code='par.lbl.bpNm' />", width:140 }  //공급업체
                ,{ field:"itemCd", title:"<spring:message code='par.lbl.itemCd' />", width:100 }//부품번호
                ,{ field:"itemNm", title:"<spring:message code='par.lbl.itemNm' />", width:200 }//부품명
                ,{ field:"stockQty", title:"<spring:message code='par.lbl.strgeStockQty' />", attributes:{"class":"ar"}, format:"{0:n2}", decimal:2, width:80 }//재고수량
                ,{ field:"giQty", title:"<spring:message code='par.lbl.giQty' />", attributes:{"class":"ar"}, format:"{0:n0}", decimal:0, width:80 }//출고수량
                ,{ field:"returnQty", title:"<spring:message code='par.lbl.returnQty' />", attributes:{"class":"ar"}, format:"{0:n0}", decimal:0, width:80 }//반환수량
                ,{ field:"disuseQty", title:"<spring:message code='par.lbl.disuseQty' />", attributes:{"class":"ar"}, format:"{0:n0}", decimal:0, width:80 }//폐기수량
            ]
        });

        $("#gridDetail").kendoExtGrid({
            gridId:"G-PAR-0816-091301"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/stm/toolMaster/selectToolGiItemListByKey.do' />"
                        ,dataType:"json"
                        ,type:"POST"
                        ,contentType:"application/json;"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params  = {},
                                headGrd = $("#gridHeader").data("kendoExtGrid"),
                                rows    = headGrd.select();

                            params["sItemCd"] = headGrd.dataItem(rows[0]).itemCd;
                            params["sBpCd"] = headGrd.dataItem(rows[0]).bpCd;
                            params["sTechId"] = $("#sTechId").val();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    data:"data"
                    ,total:"total"
                    ,model:{
                        id:"toolGiDocNo"
                        ,fields:{
                            dlrCd:{ type:"string", editable:false }
                            ,toolGiTp:{ type:"string", editable:false } //출고유형
                            ,toolGiDocNo:{ type:"string", editable:false } //공구출고번호
                            ,toolGiDocLineNo:{ type:"string", editable:false } //공구출고라인번호
                            ,roDocNo:{ type:"string", editable:false } //RO번호
                            ,bpCd:{ type:"string", editable:false } //업체
                            ,bpNm:{ type:"string", editable:false } //업체
                            ,itemCd:{ type:"string", editable:false } //부번
                            ,itemNm:{ type:"string", editable:false } //품명
                            ,refDocNo:{ type:"string", editable:false } //참조번호
                            ,refDocLineNo:{ type:"string", editable:false } //참조라인번호
                            ,techCd:{ type:"string", editable:false } //수리공
                            ,techNm:{ type:"string", editable:false } //수리공명
                            ,prsnNm:{ type:"string", editable:false } //담당자
                            ,qty:{ type:"number", editable:false } //판매수량
                            ,giDt:{ type:"date", editable:false } //판매일자
                            ,unitCd:{ type:"string", editable:false } //단위
                            ,strgeCd:{ type:"string", editable:false } //창고
                            ,locCd:{ type:"string", editable:false } //로케이션
                            ,returnQty:{ type:"number", editable:false } //반환수량
                            ,returnDt:{ type:"date", editable:false } //반환일자
                            ,disuseQty:{ type:"number", editable:false } //폐기수량
                            ,disuseDt:{ type:"date", editable:false } //폐기일자
                        }
                    }
                }
            }
            ,selectable:"multiple"
            ,editable:false
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true //빈컬럼 적용. default:false
            ,pageable:false
            ,scrollable :true
            ,height:280
            ,columns:[
                 { field:"dlrCd", title:"<spring:message code='par.lbl.dlrCd' />", width:80, hidden:true }//딜러코드
                ,{ field:"toolGiTp", title:"<spring:message code='par.lbl.toolGiTp' />", template:'#= changeToolGiTp(toolGiTp)#', attributes:{"class":"ac"}, width:140, hidden:true }//공구출고유형
                ,{ field:"toolGiDocNo",title:"<spring:message code='par.lbl.purcOrdNo' />", width:100, hidden:true }//공구출고번호
                ,{ field:"toolGiDocLineNo", title:"<spring:message code='par.lbl.lineNm' />", width:60, hidden:true }//공구출고라인번호
                ,{ field:"refDocNo", title:"<spring:message code='par.lbl.purcOrdNo' />", width:100, hidden:true }//참조번호
                ,{ field:"refDocLineNo", title:"<spring:message code='par.lbl.lineNm' />", width:60, hidden:true }//참조라인번호
                ,{ field:"roDocNo", title:"<spring:message code='par.lbl.invRoDocNo' />", width:100, hidden:true }//RO번호
                ,{ field:"bpCd", title:"<spring:message code='par.lbl.bpCd' />", width:100, hidden:true }//업체코드
                ,{ field:"bpNm", title:"<spring:message code='par.lbl.bpNm' />", width:200, hidden:true }//업체번호
                ,{ field:"itemCd", title:"<spring:message code='par.lbl.itemCd' />", width:100 }//부품번호
                ,{ field:"itemNm", title:"<spring:message code='par.lbl.itemNm' />", width:200 }//부품명
                ,{ field:"techCd", title:"<spring:message code='par.lbl.repairPrsn' />", width:100, hidden:true }//수리공
                ,{ field:"techNm", title:"<spring:message code='par.lbl.repairPrsn' />", width:200 }//수리공명
                ,{ field:"qty", title:"<spring:message code='par.lbl.giQty' />", attributes:{"class":"ar"}, format:"{0:n0}", decimal:0, width:80 }//공구판매수량
                ,{ field:"giDt", title:"<spring:message code='par.lbl.toolGiDt' />", attributes:{"class":"ar"}, format:"{0:<dms:configValue code='dateFormat' />}", width:90 }//공구출고일일
                ,{ field:"returnQty", title:"<spring:message code='par.lbl.returnQty' />", attributes:{"class":"ar"}, format:"{0:n0}", decimal:0, width:80 }//반환수량
                ,{ field:"returnDt", title:"<spring:message code='par.lbl.toolReturnDt' />", attributes:{"class":"ar"}, format:"{0:<dms:configValue code='dateFormat' />}", width:90 }//반환일
                ,{ field:"disuseQty", title:"<spring:message code='par.lbl.disuseQty' />", attributes:{"class":"ar"}, format:"{0:n0}", decimal:0, width:80 }//폐기수량
                ,{ field:"disuseDt", title:"<spring:message code='par.lbl.disuseDt' />", attributes:{"class":"ar"}, format:"{0:<dms:configValue code='dateFormat' />}", width:90 }//폐기일
                ,{ field:"prsnNm", title:"<spring:message code='par.lbl.prsNm' />", width:140 }//담당자
                ,{ field:"unitCd", title:"<spring:message code='par.lbl.unitNm' />", attributes:{"class":"ac"}, template:'#= changeUnit(unitCd)#', width:80, hidden:true }//단위
                ,{ field:"strgeCd", title:"<spring:message code='par.lbl.strgeCd' />", template:'#= changeStrgeCd(strgeCd)#', width:100, hidden:true }//창고
            ]
        });

        //공구출고유형
        changeToolGiTp = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = toolGiTpChkObj[val];
            }
            return returnVal;
        };

        // 단위
        changeUnit = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = unitObj[val];
            }
            return returnVal;
        };

        // 창고
        changeStrgeCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = strgeTpObj[val];
            }
            return returnVal;
        };
    });
 </script>