<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 구매현황조회 -->
    <section class="group">
        <div class="header_area">
             <h1 class="title_basic"><%-- <spring:message code="par.title.purcSubStsList" /> --%><!-- 구매현황 조회 --></h1>
            <div class="btn_right">
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
            </div>
        </div>

        <div class="table_form form_width_100per" role="search" data-btnid="btnSearch" id="searchForm">
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
                        <th scope="row"><spring:message code="par.lbl.grGiTp" /><!-- 입출고유형 --></th>
                        <td>
                            <input id="sMvtTp" data-type="multicombo" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.grGiDocNo" /><!-- 입출고문서 --></th>
                        <td>
                            <input id="sGrGiDocNo" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.grGiYm" /><!-- 입출고년월 --></th>
                        <td>
                           <input class="form_datepicker" id="sRegYm">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.grGiDt" /><!-- 입출고일자 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sGrGiDtFr" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sGrGiDtTo" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부번(부품번호) --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="sItemCd" class="form_input">
                                <a href="javascript:;" id="searchItemCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 품목명 --></th>
                        <td>
                            <input type="text" id="sItemNm" class="form_input" value="${itemNm}">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.itemDstinCd" /><!-- 품목구분 --></th>
                        <td>
                             <input id="sItemDstinCd" data-type="combo" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.abcInd" /><!-- ABC Class --></th>
                        <td>
                            <input id="sAbcInd" data-type="combo" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.carLine" /><!-- 차종 --></th>
                        <td>
                            <input id="sCarlineCd" data-type="combo" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.strge" /><!-- 창고 --></th>
                        <td>
                            <input id="sStrgeCd" class="form_comboBox" data-type="combo">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.bpCd" /><!-- 공급업체 --></th>
                        <td>
                             <div class="form_search">
                                <input type="text" id="sBpNm" class="form_input">
                                <input type="text" id="sBpCd" class="form_input hidden" />
                                <a id="searchCustCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th/>
                        <td/>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- // tab start-->
        <div id="tabstrip" class="tab_area mt10">
            <ul>
                <li class="k-state-active"><spring:message code="par.lbl.receive" /><!-- 입고 --></li>
                <li><spring:message code="par.lbl.issue" /><!-- 출고 --></li>
            </ul>

            <div>
                <div  class="table_grid">
                    <!-- 입고 그리드 -->
                    <div id="tabGrGrid"></div>
                </div>
            </div>
            <div>
                <div  class="table_grid">
                    <!-- 출고 그리드 -->
                    <div id="tabGiGrid"></div>
                </div>
            </div>
        </div>
    </section>
    <!-- //구매오더 -->

<!-- script -->
<script>

    var abcIndList      = []
       ,carlineCdList   = []
       ,itemDstinList   = []
       ,itemDstinCdObj  = {}
       ,sessionBpCd     = "${bpCd}"
       ,sessionBpNm     = "${bpNm}"
       ,toDt            = "${toDt}"
       ,sevenDtBf       = "${sevenDtBf}"
       ,mvtTpList       = []//"${mvtTpList}"
       ,unitObj         = {}
       ,strgeTpList     = []
       ,strgeTpObj      = {}
       ,searchItemPopupWindow
       ,venderSearchPopupWin;



    //입출고 유형(수불유형)
    <c:forEach var="obj" items="${mvtTpList}" varStatus="status">
        mvtTpList.push({cmmCd:"${obj.mvtTp}", cmmCdNm:"${obj.mvtTpNm}"});
    </c:forEach>

    //ABC Class선택
    <c:forEach var="obj" items="${abcIndList}" varStatus="status">
        abcIndList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
    </c:forEach>

    //차종선택
    <c:forEach var="obj" items="${carlineCdList}" varStatus="status">
        carlineCdList.push({cmmCd:"${obj.carlineCd}", cmmCdNm:"${obj.carlineNm}"});
    </c:forEach>

    //단위
    <c:forEach var="obj" items="${unitCdList}" varStatus="status">
        unitObj["${obj.unitExtCd}"] = "${obj.unitExtCd}";
    </c:forEach>

    //창고
    strgeTpObj[' '] = "";
    <c:forEach var="obj" items="${storageList}" varStatus="status">
        strgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
        strgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
    </c:forEach>

    //품목구분선택
    <c:forEach var="obj" items="${itemDstinList}" varStatus="status">
      itemDstinList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
      itemDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>


    $(document).ready(function() {

        //일자(입출고등록일)
        $("#sGrGiDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#sGrGiDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        //생성년월
        $("#sRegYm").kendoDatePicker({
            //define the start view
            start:"year"
            //defines when the calendar shoule retrun date
            ,depth:"year"
            //display month and year in the input
            ,format:"yyyyMM"
        });

        //조회조건-입출고구분
        $("#sMvtTp").kendoExtMultiSelectDropDownList({
           dataSource    :mvtTpList
          ,dataTextField :"cmmCdNm"
          ,dataValueField:"cmmCd"
          ,selectedAllText:"All"
          ,dataBound:function(){
              var current = this.value();
              this._savedOld = current.slice(0);
          }
        });

        //조회조건-차종선택
        $("#sCarlineCd").kendoExtDropDownList({
           dataSource    :carlineCdList
          ,dataTextField :"cmmCdNm"
          ,dataValueField:"cmmCd"
          ,optionLabel   :" "
        });

        //조회조건-ABC Class선택
        $("#sAbcInd").kendoExtDropDownList({
           dataSource    :abcIndList
          ,dataTextField :"cmmCdNm"
          ,dataValueField:"cmmCd"
          ,optionLabel   :" "
        });


        //조회조건-품목구분선택
        $("#sItemDstinCd").kendoExtDropDownList({
           dataSource    :itemDstinList
          ,dataTextField :"cmmCdNm"
          ,dataValueField:"cmmCd"
          ,index         :0
        });

      //창고선택
        $("#sStrgeCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:strgeTpList
            ,index:0
        });

        //tab
        $("#tabstrip").kendoExtTabStrip({
            animation:false
            ,select:function(e) {
                var selectTabId = e.item.id;
            }
        });

        $("#searchItemCd").on('click', selectPartsMasterPopupWindow);
        $("#searchCustCd").on('click', selectVenderMasterPopupWindow);

        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                initPage();
            }
        });

        // 조회 버튼
        $("#btnSearch").kendoButton({
            click:function(e){

                $("#tabGrGrid").data("kendoExtGrid").dataSource.read();
                $("#tabGiGrid").data("kendoExtGrid").dataSource.read();
            }
        });


        // 입고 헤더 그리드
        $("#tabGrGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/mvtDoc/selectGrList.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            var sPurcOrdStatCdLst = $("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").value();
                            console.log('sPurcOrdStatCdLst:', sPurcOrdStatCdLst);
                            if(dms.string.isEmpty(sPurcOrdStatCdLst[0])){

                                sPurcOrdStatCdLst.splice(0,1);
                            }
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;

                            // 구매오더 검색조건 코드.
                            params["sBpCd"]              = $("#sBpCd").val();
                            params["sPurcOrdNo"]         = $("#sPurcOrdNo").val();
                            params["sItemCd"]            = $("#sItemCd").val();
                            params["sItemNm"]            = $("#sItemNm").val();
                            params["sGrEndYn"]           = $("#sGrEndYn").data("kendoExtDropDownList").value();
                            params["sAbcInd"]            = $("#sAbcInd").data("kendoExtDropDownList").value();
                            params["sItemDstinCd"]       = $("#sItemDstinCd").data("kendoExtDropDownList").value();
                            params["sPurcOrdTp"]         = $("#sPurcOrdTp").data("kendoExtDropDownList").value();
                            params["sGrGiDtFr"]       = $("#sGrGiDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sGrGiDtTo"]       = $("#sGrGiDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sPurcOrdStatLst"]    = sPurcOrdStatCdLst;
                            console.log('ordStatLst:',JSON.stringify($("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").value()));
                            console.log('params:',JSON.stringify(params));


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
                       id:"purcOrdNo"
                      ,fields:{
                            dlrCd          :{ type:"string", editable:false }
                          , mvtTp          :{ type:"string", editable:false } //오더유형
                          , mvtDocYyMm     :{ type:"string", editable:false } //오더번호
                          , mvtDocNo       :{ type:"string", editable:false } //오더번호
                          , mvtDocLineNo   :{ type:"string", editable:false } //구매오더라인번호
                          , refDocNo       :{ type:"string", editable:false } //오더번호
                          , refDocLineNo   :{ type:"string", editable:false } //구매오더라인번호
                          , itemCd         :{ type:"string", editable:false } //부번
                          , itemNm         :{ type:"string", editable:false } //품명
                          , stmtProcDt     :{ type:"date",   editable:false } //오더일자(구매일자)
                          , bpCd           :{ type:"string", editable:false } //업체
                          , bpNm           :{ type:"string", editable:false } //업체
                          , itemUnitCd     :{ type:"string", editable:false } //단위
                          , purcQty        :{ type:"number", editable:false } //오더수량(구매수량)
                          , grStrgeCd      :{ type:"string", editable:false } //창고
                          , purcPrc        :{ type:"number", editable:false } //단가
                          , purcAmt        :{ type:"number", editable:false } //금액
                          , regUsrId       :{ type:"string", editable:false } //등록인
                          , returnQty       :{ type:"number" }
                          , returnDt        :{ type:"date"   }
                          , returnTime      :{ type:"string" }
                          , returnId        :{ type:"string" }
                          , purcReqRegUsrId:{ type:"string", editable:false } //신청인(구매요청자)
                        }
                    }
                }
            }
            , selectable:"row"
            , scrollable :true
            , autoBind   :false
            , pageable:false
            , columns:[
                  {//딜러코드
                      title     :"<spring:message code='par.lbl.dlrCd' />"
                     ,field     :"dlrCd"
                     ,width     :80
                     ,hidden    :true
                  }
                 ,{//구매오더번호
                      field     :"purcOrdNo"
                     ,title     :"<spring:message code='par.lbl.purcOrdNo' />"
                     ,template  :"<a href ='<c:url value='/par/pcm/purcOrd/selectPurcOrdMain.do?pPurcOrdNo=#= purcOrdNo#'/>'>#= purcOrdNo#</a>"
                     ,width     :100
                   }
                 ,{//구매오더라인번호
                      field     :"purcOrdLineNo"
                     ,title     :"<spring:message code='par.lbl.lineNm' />"
                     ,width     :60
                   }
                 ,{//부품번호
                      field     :"itemCd"
                     ,title     :"<spring:message code='par.lbl.itemCd' />"
                     ,width     :100
                   }
                 ,{//부품명
                      field     :"itemNm"
                     ,title     :"<spring:message code='par.lbl.itemNm' />"
                     ,width     :200
                   }
                 ,{//구매등록일
                      field     :"purcRegDt"
                     ,title     :"<spring:message code='par.lbl.purcRegDt' />"
                     ,attributes:{"class":"ar"}
                     ,format    :"{0:<dms:configValue code='dateFormat' />}"
                     ,width     :90
                   }
                 ,{//오더유형
                      field     :"purcOrdTp"
                     ,title     :"<spring:message code='par.lbl.purcOrdTp' />"
                     ,template  :'#= changePurcOrdTp(purcOrdTp)#'
                     ,attributes:{"class":"ac"}
                     ,width     :140
                   }
                 ,{//거래처 코드
                      field     :"bpCd"
                     ,title     :"<spring:message code='par.lbl.bpCd' />"
                     ,width     :105
                     ,hidden    :true
                   }
                 ,{//공급업체
                     field      :"bpNm"
                    ,title      :"<spring:message code='par.lbl.bpCd' />"
                    ,width      :140
                   }
                 , {//상태
                     field      :"purcItemStatCd"
                    ,title      :"<spring:message code='par.lbl.purcStat' />"
                    ,attributes:{"class":"ar"}
                    ,template   :'#= changePurcOrdStat(purcItemStatCd)#'
                    ,width      :70
                 }
                 , {//단위
                     field      :"purcUnitCd"
                    ,title      :"<spring:message code='par.lbl.unitNm' />"
                    ,attributes :{"class":"ac"}
                    ,template   :'#= changePurcUnit(purcUnitCd)#'
                    ,width      :80
                 }
                 , {//오더수량(구매수량)
                     field      :"purcQty"
                    ,title      :"<spring:message code='par.lbl.purcQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,decimal    :0
                    ,width      :80
                 }
                 , {//확정수량
                     field      :"bmpChkQty"
                    ,title      :"<spring:message code='global.lbl.confirmQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,decimal    :0
                    ,width      :80
                 }
                 , {//B/O수량
                     field      :"boQty"
                    ,title      :"<spring:message code='par.lbl.boQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,decimal    :0
                    ,width      :80
                 }
                 , {//기입고수량(입고수량+입고예정수량)
                     field      :"grQty"
                    ,title      :"<spring:message code='par.lbl.receivedQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,decimal    :0
                    ,width      :80
                 }
                 , {//취소수량
                     field      :"cancQty"
                    ,title      :"<spring:message code='global.lbl.cancQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,decimal    :0
                    ,width      :80
                 }
                 , {//입고창고
                     field      :"grStrgeCd"
                    ,title      :"<spring:message code='par.lbl.grStrgeCd' />"
                    ,template   :'#= changeGrStrgeCd(grStrgeCd)#'
                    ,width      :100
                 }
                 , {//단가
                     field      :"purcPrc"
                    ,title      :"<spring:message code='par.lbl.prc' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,decimals   :2
                    ,width      :120
                 }
               , {//금액
                     field      :"purcAmt"
                    ,title      :"<spring:message code='par.lbl.amt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,decimals   :2
                    ,width      :120
                 }
               , {//등록자ID
                   field:"regUsrId"
                  ,title:"<spring:message code='global.lbl.regUsrId' />"
                  ,width:120
               }
               , {//구매요청자ID
                   field:"purcReqRegUsrId"
                  ,title:"<spring:message code='par.lbl.purcReqUsrId' />"
                  ,width:120
               }
                , { field:"" }
            ]
        });

        // 출고 헤더 그리드
        $("#tabGiGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/mvtDoc/selectGiList.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            var sPurcOrdStatCdLst = $("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").value();
                            console.log('sPurcOrdStatCdLst:', sPurcOrdStatCdLst);
                            if(dms.string.isEmpty(sPurcOrdStatCdLst[0])){

                                sPurcOrdStatCdLst.splice(0,1);
                            }
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;

                            // 구매오더 검색조건 코드.
                            params["sBpCd"]              = $("#sBpCd").val();
                            params["sPurcOrdNo"]         = $("#sPurcOrdNo").val();
                            params["sItemCd"]            = $("#sItemCd").val();
                            params["sItemNm"]            = $("#sItemNm").val();
                            params["sGrEndYn"]           = $("#sGrEndYn").data("kendoExtDropDownList").value();
                            params["sAbcInd"]            = $("#sAbcInd").data("kendoExtDropDownList").value();
                            params["sItemDstinCd"]       = $("#sItemDstinCd").data("kendoExtDropDownList").value();
                            params["sPurcOrdTp"]         = $("#sPurcOrdTp").data("kendoExtDropDownList").value();
                            params["sGrGiDtFr"]          = $("#sGrGiDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sGrGiDtTo"]          = $("#sGrGiDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sPurcOrdStatLst"]    = sPurcOrdStatCdLst;
                            console.log('ordStatLst:',JSON.stringify($("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").value()));
                            console.log('params:',JSON.stringify(params));


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
                       id:"purcOrdNo"
                      ,fields:{
                            dlrCd          :{ type:"string", editable:false }
                          , mvtTp          :{ type:"string", editable:false } //오더유형
                          , mvtDocYyMm     :{ type:"string", editable:false } //오더번호
                          , mvtDocNo       :{ type:"string", editable:false } //오더번호
                          , mvtDocLineNo   :{ type:"string", editable:false } //구매오더라인번호
                          , refDocNo       :{ type:"string", editable:false } //오더번호
                          , refDocLineNo   :{ type:"string", editable:false } //구매오더라인번호
                          , itemCd         :{ type:"string", editable:false } //부번
                          , itemNm         :{ type:"string", editable:false } //품명
                          , stmtProcDt     :{ type:"date",   editable:false } //오더일자(구매일자)
                          , bpCd           :{ type:"string", editable:false } //업체
                          , bpNm           :{ type:"string", editable:false } //업체
                          , itemUnitCd     :{ type:"string", editable:false } //단위
                          , purcQty        :{ type:"number", editable:false } //오더수량(구매수량)
                          , grStrgeCd      :{ type:"string", editable:false } //창고
                          , purcPrc        :{ type:"number", editable:false } //단가
                          , purcAmt        :{ type:"number", editable:false } //금액
                          , regUsrId       :{ type:"string", editable:false } //등록인
                          , returnQty      :{ type:"number" }
                          , returnDt       :{ type:"date"   }
                          , returnTime     :{ type:"string" }
                          , returnId       :{ type:"string" }
                          , purcReqRegUsrId:{ type:"string", editable:false } //신청인(구매요청자)
                        }
                    }
                }
            }
            , selectable:"row"
            , scrollable :true
            , autoBind   :false
            , pageable:false
            , columns:[
                  {//딜러코드
                      title     :"<spring:message code='par.lbl.dlrCd' />"
                     ,field     :"dlrCd"
                     ,width     :80
                     ,hidden    :true
                  }
                 ,{//구매오더번호
                      field     :"purcOrdNo"
                     ,title     :"<spring:message code='par.lbl.purcOrdNo' />"
                     ,template  :"<a href ='<c:url value='/par/pcm/purcOrd/selectPurcOrdMain.do?pPurcOrdNo=#= purcOrdNo#'/>'>#= purcOrdNo#</a>"
                     ,width     :100
                   }
                 ,{//구매오더라인번호
                      field     :"purcOrdLineNo"
                     ,title     :"<spring:message code='par.lbl.lineNm' />"
                     ,width     :60
                   }
                 ,{//부품번호
                      field     :"itemCd"
                     ,title     :"<spring:message code='par.lbl.itemCd' />"
                     ,width     :100
                   }
                 ,{//부품명
                      field     :"itemNm"
                     ,title     :"<spring:message code='par.lbl.itemNm' />"
                     ,width     :200
                   }
                 ,{//구매등록일
                      field     :"purcRegDt"
                     ,title     :"<spring:message code='par.lbl.purcRegDt' />"
                     ,attributes:{"class":"ar"}
                     ,format    :"{0:<dms:configValue code='dateFormat' />}"
                     ,width     :90
                   }
                 ,{//오더유형
                      field     :"purcOrdTp"
                     ,title     :"<spring:message code='par.lbl.purcOrdTp' />"
                     ,template  :'#= changePurcOrdTp(purcOrdTp)#'
                     ,attributes:{"class":"ac"}
                     ,width     :140
                   }
                 ,{//거래처 코드
                      field     :"bpCd"
                     ,title     :"<spring:message code='par.lbl.bpCd' />"
                     ,width     :105
                     ,hidden    :true
                   }
                 ,{//공급업체
                     field      :"bpNm"
                    ,title      :"<spring:message code='par.lbl.bpCd' />"
                    ,width      :140
                   }
                 , {//상태
                     field      :"purcItemStatCd"
                    ,title      :"<spring:message code='par.lbl.purcStat' />"
                    ,attributes:{"class":"ar"}
                    ,template   :'#= changePurcOrdStat(purcItemStatCd)#'
                    ,width      :70
                 }
                 , {//단위
                     field      :"purcUnitCd"
                    ,title      :"<spring:message code='par.lbl.unitNm' />"
                    ,attributes :{"class":"ac"}
                    ,template   :'#= changePurcUnit(purcUnitCd)#'
                    ,width      :80
                 }
                 , {//오더수량(구매수량)
                     field      :"purcQty"
                    ,title      :"<spring:message code='par.lbl.purcQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,decimal    :0
                    ,width      :80
                 }
                 , {//확정수량
                     field      :"bmpChkQty"
                    ,title      :"<spring:message code='global.lbl.confirmQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,decimal    :0
                    ,width      :80
                 }
                 , {//B/O수량
                     field      :"boQty"
                    ,title      :"<spring:message code='par.lbl.boQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,decimal    :0
                    ,width      :80
                 }
                 , {//기입고수량(입고수량+입고예정수량)
                     field      :"grQty"
                    ,title      :"<spring:message code='par.lbl.receivedQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,decimal    :0
                    ,width      :80
                 }
                 , {//취소수량
                     field      :"cancQty"
                    ,title      :"<spring:message code='global.lbl.cancQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,decimal    :0
                    ,width      :80
                 }
                 , {//입고창고
                     field      :"grStrgeCd"
                    ,title      :"<spring:message code='par.lbl.grStrgeCd' />"
                    ,template   :'#= changeGrStrgeCd(grStrgeCd)#'
                    ,width      :100
                 }
                 , {//단가
                     field      :"purcPrc"
                    ,title      :"<spring:message code='par.lbl.prc' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,decimals   :2
                    ,width      :120
                 }
               , {//금액
                     field      :"purcAmt"
                    ,title      :"<spring:message code='par.lbl.amt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,decimals   :2
                    ,width      :120
                 }
               , {//등록자ID
                   field:"regUsrId"
                  ,title:"<spring:message code='global.lbl.regUsrId' />"
                  ,width:120
               }
               , {//구매요청자ID
                   field:"purcReqRegUsrId"
                  ,title:"<spring:message code='par.lbl.purcReqUsrId' />"
                  ,width:120
               }
                , { field:"" }
            ]
        });


    initPage();

    });

    //오더유형
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

    // 구매단위
    changePurcUnit = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = purcUnitObj[val];
        }
        console.log('changePurcUnit:',val, returnVal,purcUnitObj);
        return returnVal;
    };

    // 입고 창고
    changeGrStrgeCd = function(val){
        console.log('changeGrStrgeCd:', strgeTpObj, val);
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = strgeTpObj[val];
        }
        console.log('returnVal:', returnVal);
        return returnVal;
    };



    function fnChkDateValue(e){

        var  elmt  = e.sender.element[0],
             id    = elmt.id,
             toYY,
             toMM,
             toDD,
             frYY,
             frMM,
             frDD;

        console.log("val:" + this.value());
        console.log('id:',id);
        if(this.value() == null){
            if(id === 'sGrGiDtFr'){
                var minDate = new Date(sevenDtBf);
                frYY = minDate.getFullYear();
                frMM = minDate.getMonth();
                frDD = minDate.getDate();
                $("#sGrGiDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                $("#sGrGiDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sGrGiDtTo'){
                var maxDate = new Date(toDt);
                toYY = maxDate.getFullYear();
                toMM = maxDate.getMonth();
                toDD = maxDate.getDate();

                $("#sGrGiDtTo").data("kendoExtMaskedDatePicker").value(toDt);
                $("#sGrGiDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }else{
            if(id === 'sGrGiDtFr'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sGrGiDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sGrGiDtTo'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sGrGiDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }


     }

  //부품 팝업 열기 함수.
    function selectPartsMasterPopupWindow(){

        searchItemPopupWindow = dms.window.popup({
            windowId:"ItemMasterPopup"
            , title:"<spring:message code='par.title.partSearch' />"   // 부품 조회
            , content:{
                url:"<c:url value='/par/cmm/selectSearchItemPopup.do'/>"
                , data:{
                    "type":""
                    , "autoBind":false
                     , "callbackFunc":function(data){
                        $("#sItemCd").val(data[0].itemCd);
                        $("#sItemNm").val(data[0].itemNm);

                        searchItemPopupWindow.close();
                    }
               }
            }
        });
    }

    function selectVenderMasterPopupWindow(){

        venderSearchPopupWin = dms.window.popup({
            windowId:"venderSearchPopupWin"
            ,title:"<spring:message code = 'par.title.venderSelect'/>"   // 거래처 조회
            ,content:{
                url:"<c:url value='/par/pmm/venderMaster/selectVenderMasterPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"bpCd":''
                    ,"bpNm":''
                    ,"callbackFunc":function(data){
                        $("#sBpCd").val(data[0].bpCd);
                        $("#sBpNm").val(data[0].bpNm);
                    }
                }
            }
        });
    }

    function initPage(){
        var minDate = new Date(sevenDtBf),
            maxDate = new Date(toDt),
            toYY,
            toMM,
            toDD,
            frYY,
            frMM,
            frDD;


        $("#tabGrGrid").data("kendoExtGrid").dataSource.data([]);
        $("#tabGiGrid").data("kendoExtGrid").dataSource.data([]);

        $("#sBpCd").val(sessionBpCd);  //공급업체 기본셋팅
        $("#sBpNm").val(sessionBpNm);  //공급업체 기본셋팅

        frYY = minDate.getFullYear();
        frMM = minDate.getMonth();
        frDD = minDate.getDate();

        toYY = maxDate.getFullYear();
        toMM = maxDate.getMonth();
        toDD = maxDate.getDate();

        $("#sGrGiDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
        $("#sGrGiDtTo").data("kendoExtMaskedDatePicker").value(toDt);
        $("#sGrGiDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        $("#sGrGiDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));

        $("#sItemCd").val("");                                     //부품명
        $("#sItemNm").val("");                                     //부품명
        $("#sGrGiDocNo").val("");                                  //구매오더번호
        //$("#sGrEndYn").data("kendoExtDropDownList").value('');        //완료여부
        $("#sAbcInd").data("kendoExtDropDownList").value('');         //ABC Class
        $("#sItemDstinCd").data("kendoExtDropDownList").value('');    //부품대분류
        //$("#sPurcOrdTp").data("kendoExtDropDownList").value('');      //오더유형
        $("#sCarlineCd").data("kendoExtDropDownList").value('');      //차종
       // $("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").value('');
        $("#sMvtTp").data("kendoExtMultiSelectDropDownList").value([]);
    }



</script>
<!-- //script -->

