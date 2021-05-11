<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 클레임 조회 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <div class="btn_left">
			<dms:access viewId="VIEW-D-11802" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_reset" id="btnInit"><spring:message    code="par.btn.init" /><!-- 초기화 --></button>
			</dms:access>
            </div>
            <div class="btn_right">
            <dms:access viewId="VIEW-D-11801" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_link" id="btnInterface"><spring:message code="par.btn.bmpInterface" /><!-- BMP플랫폼 --></button>
            </dms:access>
            <button class="btn_m" id="btnExcelDownload"><spring:message code="par.btn.excelDownload" /><!-- 엑셀다운로드 --></button>
            <dms:access viewId="VIEW-D-11800" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search" id="btnSearch"><spring:message  code="par.btn.search" /><!-- 조회 --></button>
            </dms:access>
            </div>
        </div>

        <div class="table_form form_width_70per"  role="search" data-btnid="btnSearch" id="searchForm">
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
                        <th scope="row"><spring:message code="par.lbl.oversAndShortsClaimNo" /><!-- 클레임번호 --></th>
                        <td>
                            <input id="sClaimantNo" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.claimInvcNo" /><!-- 송장번호 --></th>
                        <td>
                            <input id="sBoxingNo" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.requestDt" /><!-- 보고일자 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sCreateTimeFr" data-type="maskDate" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sCreateTimeTo" data-type="maskDate" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.statNm" /><!-- 클레임 상태 --></th>
                        <td>
                            <input type="text" id="sStatus" data-type="combo" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.sellInventoryNo" /><!-- 판매명세서번호 --></th>
                        <td>
                            <input id="sSellInventoryNo" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.bmpOrdNo" /><!-- BMP 오더번호 --></th>
                        <td>
                            <input id="sOrderNo" class="form_input" />
                        </td>
                        <th scope="row"></th>
                        <td></td>
                        <th scope="row"></th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- // tab start-->
        <div id="tabstrip" class="tab_area">
            <ul>
                <li id ="tabClaimReadyInfo" class="k-state-active"><spring:message code="par.title.claimReadyList" /></li><!-- 클레임대기 -->
                <li id ="tabClaimRequestInfo"><spring:message code="par.lbl.wornDeal" /></li><!-- 클레임처리 -->
            </ul>
            <span class="btn_right_absolute">

            </span>

            <!-- 클레임 대기  -->
            <div>
                <div class="btn_right_absolute">
                    <div class="btn_right">
                        <button class="btn_s btn_s_min5"  id="btnNewItemPop"><spring:message  code="global.btn.new" /></button>
                    </div>
                </div>
                <div class="table_grid mt5">
                    <div id="gridReady" class="resizable_grid"></div>
                </div>
            </div>

            <!-- 클레임신청 -->
            <div>
                <div class="btn_right_absolute">
                    <div class="btn_right">
                        <button class="btn_s btn_s_min5" id="displayNewItemPop"><spring:message  code="global.btn.new" /></button>
                    </div>
                </div>
                <div class="table_grid mt5">
                    <div id="gridRequest" class="resizable_grid"></div>
                </div>
            </div>
        </div>
    </section>
</div>
    <!-- //구매오더 -->

<!-- script -->
<script>

        var  toDt                = "${toDt}"
            ,sevenDtBf           = "${sevenDtBf}"
            ,claimStatCdList     = []
            ,claimStatCdObj      = {}
            ,tabStrip
            ,tabIndex
            ,selectTabId
            ,oversAndShortsClaimPopupWindow;


        claimStatCdObj[' '] = "";
        claimStatCdList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${claimStatCdList}" varStatus="status">
            claimStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            claimStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

    $(document).ready(function() {


        $("#sStatus").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:claimStatCdList
           ,index:0
       });

        $("#sCreateTimeFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#sCreateTimeTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

      //tab
        $("#tabstrip").kendoExtTabStrip({
            animation:false
            ,select:function(e) {
                if(!dms.string.isEmpty(e.item.id)){
                    selectTabId = e.item.id;
                }
                tabStrip = $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip");
                tabIndex = tabStrip.select().index();
            }
        });

        //부품팝업(신규)
        $("#btnNewItemPop").kendoButton({
            click:function(e){
            //dms.notification.warning("<spring:message code='global.info.ready' />");
            selectClaimItemPopupWindow('NEW');
            }
        });

        //부품팝업(신규)
        $("#displayNewItemPop").kendoButton({
            click:function(e){
            }
        });

        //부품팝업
        $("button[name=btnModifyItemPop]").kendoButton({
            click:function(e){
            //dms.notification.warning("<spring:message code='global.info.ready' />");
            selectClaimItemPopupWindow('MDF');
            }
        });

        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                initPage();
            }
        });

        //btnInterface
        $("#btnInterface").kendoButton({
            click:function(e) {
                //window.open("http://svrdev.bmpcn.com", "_blank");
                window.open("http://svr.bmpcn.com", "_blank");

            }
        });

     // 엑셀다운로드버튼
        $("#btnExcelDownload").kendoButton({
            click: function(e){

                var beanName,
                    templateFile,
                    fileName,
                    sRequestClaimYn;


                beanName = "claimService"
                if(selectTabId == "tabClaimReadyInfo"){
                    templateFile = "PartsExcessClaimReady_Tpl.xlsx";
                    fileName = "PartsExcessClaimReady.xlsx";
                    sRequestClaimYn = "N";
                } else {
                    templateFile = "PartsExcessClaimRequest_Tpl.xlsx";
                    fileName = "PartsExcessClaimRequest.xlsx";
                    sRequestClaimYn = "Y";
                }

                dms.ajax.excelExport({
                    "beanName":beanName
                    ,"templateFile":templateFile
                    ,"fileName":fileName
                    ,"jobType":"excessClaimDownload"
                    ,"sStatus":$("#sStatus").data("kendoExtDropDownList").value()
                    ,"sClaimantNo":$("#sClaimantNo").val()
                    ,"sBoxingNo":$("#sBoxingNo").val()
                    ,"sSellInventoryNo":$("#sSellInventoryNo").val()
                    ,"sOrderNo":$("#sOrderNo").val()
                    ,"sCreateTimeFr":$("#sCreateTimeFr").data("kendoExtMaskedDatePicker").value()
                    ,"sCreateTimeTo":$("#sCreateTimeTo").data("kendoExtMaskedDatePicker").value()
                    ,"sRequestClaimYn":sRequestClaimYn
                });
            }
        });

        // 조회 버튼
        $("#btnSearch").kendoButton({
            click:function(e){
                $("#gridReady").data("kendoExtGrid").dataSource.read();
                $("#gridRequest").data("kendoExtGrid").dataSource.read();
            }
        });

        // 그리드 더블 클릭 이벤트.
        $("#gridReady").on("dblclick", "tr.k-state-selected", function (e) {
            selectClaimItemPopupWindow('MDF');
        });

        // 그리드 더블 클릭 이벤트.
        $("#gridRequest").on("dblclick", "tr.k-state-selected", function (e) {
            selectClaimItemPopupWindow('MDF');
        });


         // 클레임 관리 그리드
         $("#gridReady").kendoExtGrid({
             gridId:"G-PAR-0519-195602"
            ,dataSource:{
                 transport:{
                     read:{
                          url:"<c:url value='/par/pcm/claim/selectOversAndShortsClaimByCondition.do' />"
                     }
                     , parameterMap:function(options, operation) {
                         if (operation === "read") {

                             var params = {};

                             params["recordCountPerPage"] = options.pageSize;
                             params["pageIndex"]          = options.page;
                             params["firstIndex"]         = options.skip;
                             params["lastIndex"]          = options.skip + options.take;
                             params["sort"]               = options.sort;

                             // 입고확정대상 검색조건 코드.
                             params["sStatus"]            = $("#sStatus").data("kendoExtDropDownList").value();
                             params["sClaimantNo"]        = $("#sClaimantNo").val();
                             params["sBoxingNo"]          = $("#sBoxingNo").val();
                             params["sSellInventoryNo"]   = $("#sSellInventoryNo").val();
                             params["sOrderNo"]           = $("#sOrderNo").val();
                             params["sCreateTimeFr"]      = $("#sCreateTimeFr").data("kendoExtMaskedDatePicker").value();
                             params["sCreateTimeTo"]      = $("#sCreateTimeTo").data("kendoExtMaskedDatePicker").value();
                             params["sRequestClaimYn"]    = 'N';

                             return kendo.stringify(params);
                         }
                     }
                 }
                 ,schema:{
                      data:function (result){
                          if(result.total === 0){
                              dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                          }
                          return result.data;
                      }
                     ,total:"total"
                     ,model:{
                        id:"claimNo"
                       ,fields:{
                               dlrCd                :{ type:"string" }
                             , claimNo              :{ type:"string" }
                             , claimantNo           :{ type:"string" }
                             , boxingNo             :{ type:"string" }
                             , sellInventoryNo      :{ type:"string" }
                             , arrivedDate          :{ type:"date" }
                             , createTime           :{ type:"date" }
                             , claimantTotalAmount  :{ type:"number" }
                             , invcClaimAmt         :{ type:"number" }
                             , itemQty              :{ type:"number" }
                             , itemCnt              :{ type:"number" }
                             , status               :{ type:"number" }
                             , control              :{ type:"string" }
                         }
                     }
                 }
             }
             , selectable :"row"
             , scrollable :true
             , sortable   :false
             , autoBind   :false
             , filterable:false
             , editable  :false
             , multiSelectWithCheckbox:true
             , visibleCheckAll:false
             , pageable:{
                 refresh:false
                ,pageSize:30
                ,buttonCount:3
                ,input:false
              }
             , columns:[
                   {   //딜러코드
                       title:"<spring:message code='par.lbl.dlrCd' />"
                      ,field:"dlrCd"
                      ,width:80
                      ,hidden:true
                   }
                 , {   //클레임번호
                       title:"<spring:message code='par.lbl.oversAndShortsClaimNo' />"
                      ,field:"claimNo"
                      ,width:120
                      ,hidden:true
                   }
                 , {   //클레임번호
                       title:"<spring:message code='par.lbl.oversAndShortsClaimNo' />"
                      ,field:"claimantNo"
                      ,width:120
                   }
                 , {   //BMP오더번호
                       title:"<spring:message code='par.lbl.bmpOrdNo' />"
                      ,field:"orderNo"
                      ,width:120
                   }
                 , {   //클레임송장번호
                       title:"<spring:message code='par.lbl.claimInvcNo' />"
                      ,field:"boxingNo"
                      ,width:140
                   }
                 , {   //판매명세서번호
                       title:"<spring:message code='par.lbl.sellInventoryNo' />"
                      ,field:"sellInventoryNo"
                      ,width:140
                   }
                 , {   //도착일자
                       title:"<spring:message code='par.lbl.arrvDt' />"
                      ,field:"arrivedDate"
                      ,width:100
                      ,format:"{0:<dms:configValue code='dateFormat' />}"
                      ,attributes:{ "style":"text-align:center"}
                   }
                 , {   //보고일자
                       title:"<spring:message code='par.lbl.requestDt' />"
                      ,field:"createTime"
                      ,width:100
                      ,format:"{0:<dms:configValue code='dateFormat' />}"
                      ,attributes:{ "style":"text-align:center"}
                   }
                 , {
                        field:"itemCnt"
                       ,title:"<spring:message code='par.lbl.claimCnt' />" ,width:90
                       ,attributes:{ "class":"ar"}
                       ,format:"{0:n0}"
                   }//건수
                 , {
                       field:"itemQty"
                       ,title:"<spring:message code='par.lbl.claimTargetQty' />" ,width:90
                       ,attributes:{ "class":"ar"}
                       ,format:"{0:n2}"
                   }//수량
                 , {
                       field:"invcClaimAmt"
                       ,title:"<spring:message code='par.lbl.claimantTargetAmount' />" ,width:90
                       ,attributes:{ "class":"ar"}
                       ,format:"{0:n2}"
                   }//입고클레임금액
                 , {   //클레임총금액
                       title:"<spring:message code='par.lbl.claimantTotalAmount' />"
                      ,field:"claimantTotalAmount"
                      ,width:90
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n2}"
                      ,decimals:2
                      ,hidden:true
                   }
                 , {   //클레임상태
                       title:"<spring:message code='par.lbl.statNm' />"
                      ,field:"status"
                      ,attributes:{ "style":"text-align:center"}
                      ,template:'#= changeStatus(status)#'
                      ,width:90
                   }
                 , {   //상세
                       title:"<spring:message code='par.lbl.detail' />"
                      ,field:"control"
                      ,attributes:{ "style":"text-align:center"}
                      ,template  :function(dataItem){
                          var spanObj = "";
                              spanObj = "<a class='k-link' onclick=\"fn_linkClaim('" + dataItem.claimantNo + "'); \">"+dataItem.control+"</a>";
                          return spanObj;
                      }
                      ,width:140
                   }
             ]
         });

         // 클레임 관리 그리드
         $("#gridRequest").kendoExtGrid({
             gridId:"G-PAR-0519-195601"
            ,dataSource:{
                 transport:{
                     read:{
                          url:"<c:url value='/par/pcm/claim/selectOversAndShortsClaimByCondition.do' />"
                     }
                     , parameterMap:function(options, operation) {
                         if (operation === "read") {

                             var params = {};

                             params["recordCountPerPage"] = options.pageSize;
                             params["pageIndex"]          = options.page;
                             params["firstIndex"]         = options.skip;
                             params["lastIndex"]          = options.skip + options.take;
                             params["sort"]               = options.sort;

                             // 입고확정대상 검색조건 코드.
                             params["sStatus"]            = $("#sStatus").data("kendoExtDropDownList").value();
                             params["sClaimantNo"]        = $("#sClaimantNo").val();
                             params["sBoxingNo"]          = $("#sBoxingNo").val();
                             params["sSellInventoryNo"]   = $("#sSellInventoryNo").val();
                             params["sOrderNo"]           = $("#sOrderNo").val();
                             params["sCreateTimeFr"]      = $("#sCreateTimeFr").data("kendoExtMaskedDatePicker").value();
                             params["sCreateTimeTo"]      = $("#sCreateTimeTo").data("kendoExtMaskedDatePicker").value();
                             params["sRequestClaimYn"]    = 'Y';

                             return kendo.stringify(params);
                         }
                     }
                 }
                 ,schema:{
                      data:function (result){
                          if(result.total === 0){
                              dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                          }
                          return result.data;
                      }
                     ,total:"total"
                     ,model:{
                        id:"claimNo"
                       ,fields:{
                               dlrCd                :{ type:"string" }
                             , claimNo              :{ type:"string" }
                             , claimantNo           :{ type:"string" }
                             , boxingNo             :{ type:"string" }
                             , sellInventoryNo      :{ type:"string" }
                             , arrivedDate          :{ type:"date" }
                             , createTime           :{ type:"date" }
                             , claimantTotalAmount  :{ type:"number" }
                             , invcClaimAmt         :{ type:"number" }
                             , itemQty              :{ type:"number" }
                             , itemCnt              :{ type:"number" }
                             , status               :{ type:"number" }
                             , control              :{ type:"string" }
                         }
                     }
                 }
             }
             , selectable :"row"
             , scrollable :true
             , sortable   :false
             , autoBind   :false
             , filterable:false
             , editable  :false
             , multiSelectWithCheckbox:true
             , visibleCheckAll:false
             , resizable:false
             , pageable:{
                 refresh:false
                ,pageSize:30
                ,buttonCount:3
                ,input:false
              }
             , columns:[
                   {   //딜러코드
                       title:"<spring:message code='par.lbl.dlrCd' />"
                      ,field:"dlrCd"
                      ,width:80
                      ,hidden:true
                   }
                 , {   //클레임번호
                       title:"<spring:message code='par.lbl.oversAndShortsClaimNo' />"
                      ,field:"claimNo"
                      ,width:120
                      ,hidden:true
                   }
                 , {   //클레임번호
                       title:"<spring:message code='par.lbl.oversAndShortsClaimNo' />"
                      ,field:"claimantNo"
                      ,width:120
                   }
                 , {   //BMP오더번호
                       title:"<spring:message code='par.lbl.bmpOrdNo' />"
                      ,field:"orderNo"
                      ,width:120
                   }
                 , {   //클레임송장번호
                       title:"<spring:message code='par.lbl.claimInvcNo' />"
                      ,field:"boxingNo"
                      ,width:140
                   }
                 , {   //판매명세서번호
                       title:"<spring:message code='par.lbl.sellInventoryNo' />"
                      ,field:"sellInventoryNo"
                      ,width:140
                   }
                 , {   //도착일자
                       title:"<spring:message code='par.lbl.arrvDt' />"
                      ,field:"arrivedDate"
                      ,width:100
                      ,format:"{0:<dms:configValue code='dateFormat' />}"
                      ,attributes:{ "style":"text-align:center"}
                   }
                 , {   //보고일자
                       title:"<spring:message code='par.lbl.requestDt' />"
                      ,field:"createTime"
                      ,width:100
                      ,format:"{0:<dms:configValue code='dateFormat' />}"
                      ,attributes:{ "style":"text-align:center"}
                   }
                 , {
                        field:"itemCnt"
                       ,title:"<spring:message code='par.lbl.claimCnt' />" ,width:90
                       ,attributes:{ "class":"ar"}
                       ,format:"{0:n0}"
                   }//건수
                 , {
                       field:"itemQty"
                       ,title:"<spring:message code='par.lbl.claimTargetQty' />" ,width:90
                       ,attributes:{ "class":"ar"}
                       ,format:"{0:n2}"
                   }//수량
                 , {
                       field:"invcClaimAmt"
                       ,title:"<spring:message code='par.lbl.claimantTargetAmount' />" ,width:90
                       ,attributes:{ "class":"ar"}
                       ,format:"{0:n2}"
                       ,hidden:true
                   }//입고클레임금액
                 , {   //클레임총금액
                       title:"<spring:message code='par.lbl.claimantTotalAmount' />"
                      ,field:"claimantTotalAmount"
                      ,width:90
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n2}"
                      ,decimals:2
                   }
                 , {   //클레임상태
                       title:"<spring:message code='par.lbl.statNm' />"
                      ,field:"status"
                      ,attributes:{ "style":"text-align:center"}
                      ,template:'#= changeStatus(status)#'
                      ,width:90
                   }
                 , {   //상세
                       title:"<spring:message code='par.lbl.detail' />"
                      ,field:"control"
                      ,attributes:{ "style":"text-align:center"}
                      ,template  :function(dataItem){
                          var spanObj = "";
                              spanObj = "<a class='k-link' onclick=\"fn_linkClaim('" + dataItem.claimantNo + "'); \">"+dataItem.control+"</a>";
                          return spanObj;
                      }
                      ,width:140
                   }
             ]
         });


         // 클레임상태
         changeStatus = function(val){
             var returnVal = "";
             if(!dms.string.isEmpty(val)){
                 if(!dms.string.isEmpty(claimStatCdObj[val])){
                     returnVal = claimStatCdObj[val];
                 }
             }
             return returnVal;
         };

        initPage();
    });

    $(document).on("click", ".grid-checkAll", function(e){
        var grid;
        if(selectTabId === 'tabClaimReadyInfo'){
            grid = $("#gridReady").data("kendoExtGrid");
        }else{
            grid = $("#gridRequest").data("kendoExtGrid");
        }
        var checked = $(this).is(":checked");
        var rows = grid.tbody.find("tr");

        if(checked){
            rows.each(function(index, row) {
                grid.select($(this));
                $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", true);
            });
        }else{
            grid.clearSelection();

            rows.each(function(index, row) {
                $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);
            });
        }
    });

    function initPage(){
        var minDate = new Date(sevenDtBf),
            maxDate = new Date(toDt),
            toYY,
            toMM,
            toDD,
            frYY,
            frMM,
            frDD;


        //if (!partsJs.validate.getAllPluginObjInfo($("#genInfoForm")[0])) {
        //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        if (!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])) {
            return false;
        }

        // 품목 정보 Reset
        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        partsJs.validate.groupObjAllDataInit();

        //$("#gridReady").data("kendoExtGrid").dataSource.data([]);

        $("#gridReady").data("kendoExtGrid").dataSource.data([]);
        $("#gridRequest").data("kendoExtGrid").dataSource.data([]);

        popItemObj = {};

        frYY = minDate.getFullYear();
        frMM = minDate.getMonth();
        frDD = minDate.getDate();

        toYY = maxDate.getFullYear();
        toMM = maxDate.getMonth();
        toDD = maxDate.getDate();

        //$("#sCreateTimeFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
        //$("#sCreateTimeTo").data("kendoExtMaskedDatePicker").value(toDt);

        //$("#sCreateTimeFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        //$("#sCreateTimeTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));

        selectTabId = "tabClaimReadyInfo";      // 실운전자

        $("#displayNewItemPop").data("kendoButton").enable(false);

    }

    function fnChkDateValue(e){

        var  elmt  = e.sender.element[0],
             id    = elmt.id,
             toYY,
             toMM,
             toDD,
             frYY,
             frMM,
             frDD;

        if(this.value() == null){
            if(id === 'sCreateTimeFr'){
                var minDate = new Date(sevenDtBf);
                frYY = minDate.getFullYear();
                frMM = minDate.getMonth();
                frDD = minDate.getDate();
                $("#sCreateTimeFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                $("#sCreateTimeTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sCreateTimeTo'){
                var maxDate = new Date(toDt);
                toYY = maxDate.getFullYear();
                toMM = maxDate.getMonth();
                toDD = maxDate.getDate();

                $("#sCreateTimeTo").data("kendoExtMaskedDatePicker").value(toDt);
                $("#sCreateTimeFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }else{
            if(id === 'sCreateTimeFr'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sCreateTimeTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sCreateTimeTo'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sCreateTimeFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }
    }

    //부품 팝업 열기 함수
    function selectClaimItemPopupWindow(pType){

        var grid,
            rows,
            gridData,
            claimNo;

        if(selectTabId === 'tabClaimReadyInfo'){
            grid = $("#gridReady").data("kendoExtGrid");
        }else{
            grid = $("#gridRequest").data("kendoExtGrid");
        }
        rows     = grid.select();
        gridData = grid.dataItem(rows[0]);

        //신규모드
        if(pType === 'NEW'){
            claimNo = '';
        //수정모드
        }else{
            if(rows.length === 0 || dms.string.isEmpty(rows)){
                // 선택값이 없습니다.
                   dms.notification.warning("<spring:message code='global.info.unselected' />");
                   return false;
            }else{
                claimNo = gridData.claimNo;
            }

        }

        oversAndShortsClaimPopupWindow = dms.window.popup({
           windowId:"ItemMasterPopup"
           ,title  :"<spring:message code='par.title.partExcessClaim' />" // 과부족 클레임
           ,width:900
           ,height:450
           ,content:{
               url :"<c:url value='/par/cmm/selectOversAndShortsClaimPopup.do' />"
              ,data:{
                  "type"        :""
                 ,"autoBind"    :true
                 ,"claimNo"     :claimNo
                 ,"selectable"  :"single"
                 ,"callbackFunc":function(data){
                     grid.dataSource.read();
                     oversAndShortsClaimPopupWindow.close();
                 }

              }
           }
        });
    }

    //과부족 클레임 수신 팝업 열기 함수
    function fn_linkClaim(pClaimantNo){

        if(dms.string.isEmpty(pClaimantNo)){
           return false;
        }

        oversAndShortsClaimInfcPopupWindow = dms.window.popup({
           windowId:"ItemMasterPopup"
           ,title  :"<spring:message code='par.title.partExcessClaim' />" // 과부족 클레임
           , width:900
           , height:320
           ,content:{
               url :"<c:url value='/par/cmm/selectOversAndShortsClaimInfcPopup.do' />"
              ,data:{
                  "type"        :""
                 ,"autoBind"    :true
                 ,"claimantNo"  :pClaimantNo
                 ,"selectable"  :"single"
                 ,"callbackFunc":function(data){
                     oversAndShortsClaimPopupWindow.close();
                 }

              }
           }
        });
    }


</script>
<!-- //script -->

