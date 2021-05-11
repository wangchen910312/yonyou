<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/par/cmm/selectOkPopup.jsp" />
<!-- confirm 팝업 -->

<!-- 부품탐색 팝업 -->
<section id="windows" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <!-- 조회 버튼 -->
            <button id="btnSearch" class="btn_m btn_Search"><spring:message code="par.btn.search" /><!-- 조회 --></button>
            <button id="btnSelect" class="btn_m btn_Select hidden"><spring:message code="par.btn.select" /><!-- 선택 --></button>
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
                <col style="width:23%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.strge" /></th>
                    <td>
                        <input id="sDlrCd" type="hidden" />
                        <input id="sBpCd"  type="hidden"/>
                        <input id="sBpNm"  type="hidden" />
                        <input id="sStrgeCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부품코드 --></th>
                    <td>
                        <input id="sItemCd" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 부품명 --></th>
                    <td>
                        <input id="sItemNm" class="form_input" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.bpTpNm" /><!-- ABC CLASS --></th>
                    <td>
                        <input id="sBpTp" data-type="combo" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.carLine" /><!-- 차종 --></th>
                    <td>
                        <input id="sCarlineCd" data-type="combo" class="form_comboBox" />
                        <input id="sBrandCd" data-type="combo" class="hidden" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemDstinCd" /><!-- 품목유형 --></th>
                    <td>
                        <input id="sItemDstinCd" data-type="combo"  class="form_comboBox"/>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="clfix">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code="par.title.searchPartsList" /><!-- 조회 부품리스트 --></h2>
            <div class="btn_right">
            </div>
        </div>
        <div class="table_grid">
        <!-- 그리드1 -->
            <div id="searchGrid" class="grid"></div>
        <!-- 그리드1 -->
        </div>
    </div>
</section>


<div class="pop_wrap msgDiv2" style="display:none">
    <div class="msg_box" id="messageId2"></div>
    <%-- <spring:message code='global.btn.init' var='init' /><spring:message code='global.info.cnfrmMsg' arguments='${init},' /> --%>
    <div class="btn_bottom">
        <button type="button" class="btn_m ok"><spring:message code='par.btn.confirm'/></button>
        <button type="button" class="btn_m cancel"><spring:message code='par.btn.cancel'/></button>
    </div>
</div>
<div id="confirm2"></div>
<script type="text/javascript">

<!-- //부품탐색 팝업 -->

     $("#confirm2").kendoWindow({
         modal: true
         ,title: false
         ,width: 400
         ,pinned: true
         ,visible: false
         ,resizable:false
     });
     var conformKendoWindow2 = $("#confirm2").data("kendoWindow");
     conformKendoWindow2.center();

     var abcIndList = [],
         brandCdList = [],
         abcIndObj = {},
         carlineCdList = [],
         carlineCdObj = {},
         popItemObj = {},
         giStrgeCdList = [],
         giStrgeCdMap = {},
         bpTpList = [],
         bpTpObj = {},
         itemDstinCdList = [],
         itemDstinCdObj = {},
         changeGiEditor = {},
         itemCdAutoCompleteEditor,
         gGridItemCdOrgVal,
         avlbStockQtyZeroYn;

     /************************************************************
         팝업옵션 설정
    *************************************************************/
    /**
    * 팝업 옵션
    */
    var currentWin = parent.selectStockGiItemForServicePopupWindow;
    var options = parent.selectStockGiItemForServicePopupWindow.options.content.data,
    pageTp = "";

    pageTp = options.pageTp;

    //giStrgeCdList
    <c:forEach var="obj" items="${giStrgeCdList}">
    if(pageTp == "IN"){//내부수령
      if("${obj.strgeTp}" == "09" || "${obj.strgeTp}" == "10"){//페인트,보조부품 창고유형만
          giStrgeCdList.push({"strgeCd":"${obj.strgeCd}" ,"strgeNm":"${obj.strgeNm}"});
      }
    }else{
      giStrgeCdList.push({"strgeCd":"${obj.strgeCd}" ,"strgeNm":"${obj.strgeNm}"});
    }
    giStrgeCdMap["${obj.strgeCd}"] = "${obj.strgeNm}";
    </c:forEach>

     abcIndObj[""] = "";
     <c:forEach var="obj" items="${abcIndList}" varStatus="status">
         abcIndList.push({itemCd:"${obj.cmmCd}", itemNm:"${obj.cmmCd}"});
         abcIndObj["${obj.cmmCd}"] = "${obj.cmmCd}";
     </c:forEach>

     <c:forEach var="obj" items="${carlineCdList}" varStatus="status">
         carlineCdList.push({itemCd:"${obj.carlineCd}", itemNm:"${obj.carlineNm}"});
         carlineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
     </c:forEach>

     //brandCdList
     brandCdList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
     <c:forEach var="obj" items="${brandCdList}" varStatus="status">
       if("${obj.useYn}" === "Y"){
           brandCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
       }
     </c:forEach>

     <c:forEach var="obj" items="${bpTpList}" varStatus="status">
     if("01" === "${obj.remark2}"){
         bpTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         bpTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     }
     </c:forEach>

     <c:forEach var="obj" items="${itemDstinCdList}" varStatus="status">
         itemDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         itemDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
     </c:forEach>


    $(document).ready(function() {

        //changeItemDstinCd Func
        changeItemDstinCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                if(itemDstinCdObj[val] != undefined){
                    returnVal = itemDstinCdObj[val];
                }
            }
            return returnVal;
        };

        // 그리드 더블 클릭 이벤트.
        $("#searchGrid").on("dblclick", "tr.k-state-selected", function (e) {
            $("#btnSelect").click();
        });

        // 그리드 Key in 이벤트.
        $("#searchGrid").on("keydown", function (e) {
            //그리트 포커스 상태에서 컨트롤키 눌렀을 경우
            if(e.keyCode === 17){
                var data      = [],
                    grid      = $("#searchGrid").data("kendoExtGrid"),
                    cursorRow = grid.content.find(".k-state-selected-ext"),
                    hasChk    = cursorRow.hasClass("k-state-selected");

                //체크되지 않은 로우 선택 시 체크및 selection 변경
                if(!hasChk){
                    grid.clearSelection();
                    grid.select(cursorRow[0]);
                //체크된 로우 선택 시 데이터 insert
                }else{
                    data.push(grid.dataItem(cursorRow[0]));
                    $("#btnSelect").click();
                }
            }
        });

        /************************************************************
                    기능버튼 설정
        *************************************************************/

        //tabstrip
        $("#tabstrip").kendoExtTabStrip({
            animation:false
        });

        // 조회 버튼.
        $("#btnSearch").kendoButton({
            click:function(e){
                $("#searchGrid").data("kendoExtGrid").dataSource.read();
            }
        });

        // 선택 버튼.
        $("#btnSelect").kendoButton({
            click:function(e){
                var grid = $("#searchGrid").data("kendoExtGrid"),
                    rows = grid.select();

                if(rows !== null)
                {
                    if(rows.length < 1){
                        // 선택값이 없습니다.
                        dms.notification.warning("<spring:message code='global.info.unselected' />");
                        return false;
                    }

                    var data = [];
                    $.each(rows, function(idx, row){
                        grid.dataItem(row).giQty = 1;
                        data.push(grid.dataItem(row));
                    });
                    options.callbackFunc(data);

                    $("#sItemCd").select();
                }
            }
        });

        $("#sBpTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:bpTpList
           ,optionLabel:" "
           ,index:0
        });
        //sStrgeCd
        $("#sStrgeCd").kendoExtDropDownList({
            dataTextField:"strgeNm"
            ,dataValueField:"strgeCd"
            ,dataSource:giStrgeCdList
            ,optionLabel:" "
            ,autoBind:true
            ,index:0
        });
        //sCarlineCd
        $("#sCarlineCd").kendoExtDropDownList({
            dataTextField:"itemNm"
           ,dataValueField:"itemCd"
           ,dataSource:carlineCdList
           ,optionLabel:" "
           ,index:0
        });
        //sBrandCd
        $("#sBrandCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:brandCdList
            ,index:0
        });

        //조회조건 - 품목구분선택
        $("#sItemDstinCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:dms.data.cmmCdFilter(itemDstinCdList)
            ,optionLabel:"<spring:message code='global.lbl.check' />"
            ,index:0
        });

        /************************************************************
                    조회조건 설정
        *************************************************************/

        if(options.hasOwnProperty("avlbStockQtyZeroYn")){
            if(options.avlbStockQtyZeroYn === "N"){
                avlbStockQtyZeroYn = options.avlbStockQtyZeroYn;
            }else{
                avlbStockQtyZeroYn = null;
            }
            avlbStockQtyZeroYn = options.avlbStockQtyZeroYn;
        }else{
            avlbStockQtyZeroYn = null;
        }

        /**
         * grid 단가&수량
         */
         changeGiEditor = function(container, options) {
             var input = $("<input/>"),
                 pValue;

             input.attr("name", options.field);

             input.keyup(function(){

             });

             input.appendTo(container);
             input.kendoExtNumericTextBox({
                 format: "n2"
                 ,decimals:2
                 ,restrictDecimals: true
                 ,min:0
                 ,spinners:false
             });
         };

        /************************************************************
                    조회 그리드 설정
        *************************************************************/
        $("#searchGrid").kendoExtGrid({
            gridId:"G-PAR-0320-143268"
           ,height:290
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/cmm/selectItemSalePrcForServicePopupByCondition.do' />"
                        , dataType:"json"
                        , type:"POST"
                        , contentType:"application/json;"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            // 품목구분코드.
                            params["sDlrCd"]       = $("#sDlrCd").val();
                            params["sBpCd"]        = $("#sBpCd").val();
                            params["sItemCd"]      = $("#sItemCd").val();
                            params["sItemNm"]      = $("#sItemNm").val();
                            params["sBpTp"]        = $("#sBpTp").data("kendoExtDropDownList").value();
                            params["sCarlineCd"]   = $("#sCarlineCd").data("kendoExtDropDownList").value();
                            params["sBrandCd"]     = $("#sBrandCd").data("kendoExtDropDownList").value();
                            params["sAvlbStockQtyZeroYn"]= avlbStockQtyZeroYn;
                            params["sGrStrgeCd"]   = $("#sStrgeCd").data("kendoExtDropDownList").value();
                            params["sItemDstinCd"] = $("#sItemDstinCd").data("kendoExtDropDownList").value();
                            params["sPageTp"]      = pageTp;//페이지구분

                            return kendo.stringify(params);
                        }
                    }
                }
                ,navigatable:false
                ,serverPaging:true
                ,schema:{
                      data:function (result){
                          if(result.total === 1){
                              //부품번호로 검색 시에만 적용.
                              if(!dms.string.isEmpty($("#sItemCd").val())){
                                  var data = [];
                                  result.data[0].giQty = 1;
                                  data.push(result.data[0]);
                                  options.callbackFunc(data);

                                  $("#sItemCd").select();
                              }
                          }
                          return result.data;
                      }
                    , total:"total"
                    , model:{
                        id:"itemCd"
                        , fields:{
                              dlrCd          :{ type:"string"  , editable:false}
                            , itemCd         :{ type:"string"  , editable:false}
                            , itemNm         :{ type:"string"  , editable:false}
                            , stockUnitCd    :{ type:"string"  , editable:false}
                            , giStrgeCd      :{ type:"string"  , editable:false}
                            , retlPrc        :{ type:"number"  , editable:false}
                            , whslPrc        :{ type:"number"  , editable:false}
                            , incPrc         :{ type:"number"  , editable:false}
                            , grtePrc        :{ type:"number"  , editable:false}
                            , taxDdctGrtePrc :{ type:"number"  , editable:false}
                            , stockQty       :{ type:"number"  , editable:false}
                            , avlbStockQty   :{ type:"number"  , editable:false}
                            , resvStockQty   :{ type:"number"  , editable:false}
                            , rentQty        :{ type:"number"  , editable:false}
                            , borrowQty      :{ type:"number"  , editable:false}
                            , movingAvgPrc   :{ type:"number"  , editable:false}
                            , abcInd         :{ type:"string"  , editable:false}
                            , carlineCd      :{ type:"string"  , editable:false}
                            , purcLeadHm     :{ type:"number"  , editable:false}
                            , grStrgeCd      :{ type:"string"  , editable:false}
                            , locCd          :{ type:"string"  , editable:false}
                            , locNm          :{ type:"string"  , editable:false}
                            , bpTp           :{ type:"string"  , editable:false}
                            , bpCd           :{ type:"string"  , editable:false}
                            , bpNm           :{ type:"string"  , editable:false}
                        }
                    }
                }
            }
            ,selectable:options.selectable === "multiple"? "multiple,row":"row"
            ,dataBound:function(e) {

                var sender = e.sender,
                    rows = sender.tbody.children(),
                    rowLen = rows.length;

                if(rowLen > 1){
                    this.select(rows[0]);
                    sender.table.focus();
                }
            }
            , edit:function(e){
                var eles         = e.container.find("input"),
                    grid         = this,
                    selectRows   = e.sender.select(),
                    selectedItem = e.sender.dataItem(selectRows[0]),
                    input        = e.container.find(".k-input"),
                    rows,
                    pValue,
                    tDate,
                    lPurcPrc  = 0,
                    fieldName = grid.columns[e.container.index()].field;
            }
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,multiSelectWithCheckbox:true
            ,columns:[
                 {field:"dlrCd",title:" ",width:15, hidden:true}
                ,{field:"itemCd",title:"<spring:message code='par.lbl.itemCd' />",width:110,sortable:false }//부품번호
                ,{field:"itemNm",title:"<spring:message code='par.lbl.itemNm' />",width:140,sortable:false }//부품명
                ,{field:"giStrgeCd" ,title:"<spring:message code='par.lbl.strge' />" ,width:120
                    ,template:'#= changeGiStrgeCd(giStrgeCd)#'
                    ,sortable:false
                }//부품창고
                ,{field:"stockQty" ,title:"<spring:message code='par.lbl.docStockQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,width:80}
                ,{field:"avlbStockQty",title:"<spring:message code='par.lbl.avlbStockQty' />",attributes:{ "class":"ar"},format:"{0:n2}",width:70 }                //가용재고
                ,{field:"bpTp",title:"<spring:message code='par.lbl.bpTpNm' />",width:60
                    ,template:'#= changeBpTp(bpTp)#'
                    ,sortable:false
                 }//공급처유형
                ,{field:"bpCd", title:"<spring:message code='par.lbl.bpTp' />" ,width:120, hidden:true}//공급업체
                ,{field:"bpNm", title:"<spring:message code='par.lbl.bpTp' />" ,width:120}//공급업체
                ,{field:"resvStockQty" ,title:"<spring:message code='par.lbl.readyQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,width:80,sortable:false}//예류수량
                ,{field:"rentQty" ,title:"<spring:message code='par.lbl.avlbOutQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,width:80,sortable:false}//차출수량
                ,{field:"borrowQty" ,title:"<spring:message code='par.lbl.borrowItemQty' />",attributes:{"class":"ar"} ,format:"{0:n2}" ,width:80,sortable:false}//차입수량
                ,{field:"stockUnitCd",title:"<spring:message code='par.lbl.unitNm' />",attributes:{ "class":"ac"},width:70, hidden:true }//단위
                ,{field:"retlPrc"
                    ,title:"<spring:message code='par.lbl.salePriceCost01' />"
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,editor:changeGiEditor
                    ,width:100
                    ,sortable:false}                //소매가
                ,{field:"whslPrc"
                    ,title:"<spring:message code='par.lbl.salePriceCost02' />"
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,editor:changeGiEditor
                    ,width:100
                    ,sortable:false}                //도매가
                ,{field:"incPrc"
                    ,title:"<spring:message code='par.lbl.salePriceCost03' />"
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,editor:changeGiEditor
                    ,width:100
                    ,sortable:false}                //보험가
                ,{field:"grtePrc"
                    ,title:"<spring:message code='par.lbl.salePriceCost04' />"
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,editor:changeGiEditor
                    ,width:100
                    ,sortable:false}                //보증가
                ,{field:"taxDdctGrtePrc"
                    ,title:"<spring:message code='par.lbl.salePriceCost04' />"
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,editor:changeGiEditor
                    ,width:100
                    ,sortable:false
                    ,hidden:true }                //보증가(세금제외)
                ,{field:"movingAvgPrc"
                    ,title:"<spring:message code='par.lbl.movingAvgAmt' />"
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,editor:changeGiEditor
                    ,width:100
                    ,sortable:false
                    //,template:function(data){return ""}
                 }                //이동평균단가
                ,{field:"abcInd",title:"<spring:message code='par.lbl.abcInd' />",width:60 ,sortable:false}//ABC CLASS
                ,{field:"carlineCd",title:"<spring:message code='par.lbl.carLine' />" ,width:100
                    ,template:'#= changeCarlineCd(carlineCd)#'
                    ,sortable:false
                }
                ,{field:"locCd", title:"<spring:message code='par.lbl.giLocCd' />", width:100, hidden:true}//giLocCd
                ,{field:"locNm", title:"<spring:message code='par.lbl.giLocCd' />", width:100, hidden:true}//locNm
            ]
        });


        //  공급처유형
        changeBpTp = function(val){
            var returnVal = "";
            if(!dms.string.isEmpty(val)){
                if(!dms.string.isEmpty(bpTpObj[val])){
                    returnVal = bpTpObj[val];
                }
            }
            return returnVal;
        };
        //  ABC CLASS
        changeAbcInd = function(val){
            var returnVal = "";
            if(!dms.string.isEmpty(val)){
                if(!dms.string.isEmpty(abcIndObj[val])){
                    returnVal = abcIndObj[val];
                }
            }
            return returnVal;
        };
        // 차형
        changeCarlineCd = function(val){
            var returnVal = "";
            if(!dms.string.isEmpty(val)){
                if(!dms.string.isEmpty(carlineCdObj[val])){
                    returnVal = carlineCdObj[val];
                }
            }
            return returnVal;
        };
        //창고
        changeGiStrgeCd = function(val){
            var returnVal = "";
            if(!dms.string.isEmpty(val)){
                if(!dms.string.isEmpty(giStrgeCdMap[val])){
                    returnVal = giStrgeCdMap[val];
                }
            }

            return returnVal;
        };


       // $("#searchGrid").data("kendoExtGrid").dataSource.read();

    });

 </script>
