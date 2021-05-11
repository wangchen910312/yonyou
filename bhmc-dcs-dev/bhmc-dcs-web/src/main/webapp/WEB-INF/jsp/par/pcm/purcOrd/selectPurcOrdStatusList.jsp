<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 구매현황조회 -->
    <section class="group">
        <div class="header_area">
             <h1 class="title_basic"><%-- <spring:message code="par.title.purcStsList" /> --%><!-- 구매현황 조회 --></h1>
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
                    <col style="width:23%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.purcOrdTp" /><!-- 오더유형 --></th>
                        <td>
                            <input id="sPurcOrdTp" data-type="combo" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcOrdNo" /><!-- 구매오더번호 --></th>
                        <td>
                            <input id="sPurcOrdNo" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcReqUsrId" /><!-- 오더등록인 --></th>
                        <td>
                             <div class="form_search">
                                <input type="text" id="sRegUsrId" class="form_input">
                                <a id="searchRegUserId"><!-- 검색 --></a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.bpCd" /><!-- 거래처코드 --></th>
                        <td>
                             <div class="form_search">
                                <input type="text" id="sBpNm" class="form_input">
                                <input type="text" id="sBpCd" class="form_input hidden" required data-name="<spring:message code="par.lbl.bpCd" />" />
                                <a id="searchCustCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부번(부품번호) --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="sItemCd" class="form_input">
                                <a href="javascript:;" id="searchItemCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemDstinCd" /><!-- 품목구분 --></th>
                        <td>
                             <input id="sItemDstinCd" data-type="combo" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.purcRegDt" /><!-- 구매등록일 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sPurcRegDtFr" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sPurcRegDtTo" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 품목명 --></th>
                        <td>
                            <input type="text" id="sItemNm" class="form_input" value="${itemNm}">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcOrdStatCd" /><!-- 구매오더상태 --></th>
                        <td>
                            <input id="sPurcOrdStatCd" type="text" data-type="multicombo" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.abcInd" /><!-- ABC Class --></th>
                        <td>
                            <input id="sAbcInd" data-type="combo" class="form_comboBox" />
                        </td>
                        <th scope="row">含取消</th>
                        <td>
                            <input id="sCnclCd" data-type="combo" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.grEndYn" /><!-- 완료여부 --></th>
                        <td>
                            <input id="sGrEndYn" data-type="combo" class="form_comboBox" />
                        </td>
                        <th/>
                        <td/>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.carLine" /><!-- 차종 --></th>
                        <td>
                            <input id="sCarlineCd" data-type="combo" class="form_comboBox" />
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
            <!-- 구매오더 그리드 -->
            <div id="grid" class="grid"></div>
        </div>
    </section>
    <!-- //구매오더 -->

<!-- script -->
<script>

    var purcOrdTpList   = []
       ,purcOrdTpObj    = {}
       ,purcOrdStatList = []
       ,purcOrdStatObj  = {}
       ,abcIndList      = []
       ,carlineCdList   = []
       ,itemDstinList = []
       ,itemDstinCdObj  = {}
       ,sessionBpCd     = "${bpCd}"
       ,sessionBpNm     = "${bpNm}"
       ,toDt            = "${toDt}"
       ,sevenDtBf       = "${sevenDtBf}"
       ,pPurcOrdNo      = "${pPurcOrdNo}"
       ,pBpCd           = "${pBpCd}"
       ,pBpNm           = "${pBpNm}"
       ,purcUnitList    = []
       ,purcUnitObj     = {}
       ,grStrgeTpList   = []
       ,grStrgeTpObj    = {}
       ,searchItemPopupWindow
       ,userSearchPopupWin
       ,venderSearchPopupWin;

    //오더유형 선택
    purcOrdTpList.push({cmmCd:" ", cmmCdNm:" "});
    <c:forEach var="obj" items="${purcOrdTpList}" varStatus="status">
        purcOrdTpList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
        purcOrdTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    //구매오더상태 선택
    <c:forEach var="obj" items="${purcOrdStatList}" varStatus="status">
        purcOrdStatList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
        purcOrdStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    //ABC Class선택
    <c:forEach var="obj" items="${abcIndList}" varStatus="status">
      abcIndList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
    </c:forEach>

    //차종선택
    <c:forEach var="obj" items="${carlineCdList}" varStatus="status">
    carlineCdList.push({cmmCd:"${obj.carlineCd}", cmmCdNm:"${obj.carlineNm}"});
        </c:forEach>

    //구매단위
    <c:forEach var="obj" items="${purcUnit}" varStatus="status">
        purcUnitList.push({cmmCd:"${obj.unitExtCd}", cmmCdNm:"${obj.unitExtCd}"});
        purcUnitObj["${obj.unitExtCd}"] = "${obj.unitExtCd}";
    </c:forEach>

    //입고창고
    grStrgeTpObj[' '] = "";
    <c:forEach var="obj" items="${storageList}" varStatus="status">
        grStrgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
        grStrgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
    </c:forEach>

    //품목구분선택
    <c:forEach var="obj" items="${itemDstinList}" varStatus="status">
      itemDstinList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
      itemDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    $(document).ready(function() {


        //오더유형선택
        $("#sPurcOrdTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:purcOrdTpList
            ,index:0
        });

        //구매오더상태선택
        $("#sPurcOrdStatCd").kendoExtMultiSelectDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:purcOrdStatList
            ,dataBound:function(){
                var current = this.value();
                this._savedOld = current.slice(0);
            }
        });

        //오더일자(구매등록일)
        $("#sPurcRegDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#sPurcRegDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        //조회조건-차종선택
        $("#sCarlineCd").kendoExtDropDownList({
           dataSource    :carlineCdList
          ,dataTextField :"cmmCdNm"
          ,dataValueField:"cmmCd"
          ,optionLabel   :" "
        });

        //sCnclCd
        $("#sCnclCd").kendoExtDropDownList({
           dataSource    :[]
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

        //완료여부
        $("#sGrEndYn").kendoExtDropDownList({
           dataSource:[
                 {"cmmCd":"Y", "cmmCdNm":"是"}
                ,{"cmmCd":"N", "cmmCdNm":"否"}
           ]
          ,dataTextField :"cmmCdNm"
          ,dataValueField:"cmmCd"
          ,optionLabel   :" "
        });

        $("#searchItemCd").on('click', selectPartsMasterPopupWindow);
        $("#searchCustCd").on('click', selectVenderMasterPopupWindow);
        $("#searchRegUserId").on('click', userSearchPopup);

        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                pPurcOrdNo = ''; //구매등록 관리 화면에서 넘어온 구매번호 삭제.
                pBpCd = ''; //구매등록 관리 화면에서 넘어온 공급처 삭제.
                pBpNm = ''; //구매등록 관리 화면에서 넘어온 공급처 삭제.
                initPage();
            }
        });

        // 조회 버튼
        $("#btnSearch").kendoButton({
            click:function(e){

                $("#grid").data("kendoExtGrid").dataSource.read();
            }
        });


        // 구매 헤더 그리드
        $("#grid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pcm/purcOrd/selectPurcOrdStatusListByKey.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            var sPurcOrdStatCdLst = $("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").value();
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
                            params["sRegUsrId"]          = $("#sRegUsrId").val();
                            params["sGrEndYn"]           = $("#sGrEndYn").data("kendoExtDropDownList").value();
                            params["sAbcInd"]            = $("#sAbcInd").data("kendoExtDropDownList").value();
                            params["sItemDstinCd"]       = $("#sItemDstinCd").data("kendoExtDropDownList").value();
                            params["sPurcOrdTp"]         = $("#sPurcOrdTp").data("kendoExtDropDownList").value();
                            params["sPurcRegDtFr"]       = $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sPurcRegDtTo"]       = $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sPurcOrdStatLst"]    = sPurcOrdStatCdLst;

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
                          , purcOrdNo      :{ type:"string", editable:false } //오더번호
                          , purcOrdLineNo  :{ type:"string", editable:false } //구매오더라인번호
                          , itemCd         :{ type:"string", editable:false } //부번
                          , itemNm         :{ type:"string", editable:false } //품명
                          , purcRegDt      :{ type:"date",   editable:false } //오더일자(구매일자)
                          , purcOrdTp      :{ type:"string", editable:false } //오더유형
                          , bpCd           :{ type:"string", editable:false } //업체
                          , bpNm           :{ type:"string", editable:false } //업체
                          , purcItemStatCd :{ type:"string", editable:false } //상태
                          , purcUnitCd     :{ type:"string", editable:false } //단위
                          , purcQty        :{ type:"number", editable:false } //오더수량(구매수량)
                          , bmpChkQty      :{ type:"number", editable:false } //확정수량
                          , boQty          :{ type:"number", editable:false } //B/O수량
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
               , {   //할당
                   title:"<spring:message code='par.lbl.alloc' />"
                  ,width:100
               }
               , {   //피킹
                   title:"<spring:message code='par.lbl.picking' />"
                  ,width:100
               }
               , {   //팩킹중
                   title:"<spring:message code='par.lbl.packing' />"
                  ,width:100
               }
               , {   //팩킹완료
                   title:"<spring:message code='par.lbl.packEnd' />"
                  ,width:100
               }
               , {   //송장수량
                   title:"<spring:message code='par.lbl.invcQty' />"
                  ,width:100
               }
               , {   //송장번호
                   title:"<spring:message code='par.lbl.invcDocNo' />"
                  ,width:100
               }
               , {   //운송유형
                   title:"<spring:message code='par.lbl.trsfType' />"
                  ,width:100
               }
               , {   //운송인
                   title:"<spring:message code='par.lbl.trsfPrsn' />"
                  ,width:100
               }
               , {   //ETA
                   title:"<spring:message code='par.lbl.eta' />"
                  ,width:100
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
        return returnVal;
    };

    // 입고 창고
    changeGrStrgeCd = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = grStrgeTpObj[val];
        }
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

        if(this.value() == null){
            if(id === 'sPurcRegDtFr'){
                var minDate = new Date(sevenDtBf);
                frYY = minDate.getFullYear();
                frMM = minDate.getMonth();
                frDD = minDate.getDate();
                $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sPurcRegDtTo'){
                var maxDate = new Date(toDt);
                toYY = maxDate.getFullYear();
                toMM = maxDate.getMonth();
                toDD = maxDate.getDate();

                $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value(toDt);
                $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }else{
            if(id === 'sPurcRegDtFr'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sPurcRegDtTo'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
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

    function userSearchPopup() {
        userSearchPopupWin = dms.window.popup({
            windowId:"userSearchPopupWin"
            ,title:"<spring:message code='cmm.title.user.search'/>"   // 사용자 조회
            ,content:{
                url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
                , data:{
                    "autoBind":false
                    ,"usrNm":""
                    ,"callbackFunc":function(data){
                        if(data.length > 0){
                            $("#sRegUsrId").val(data[0].usrId);
                        }
                    }
                }
            }

        });
    }


    function initPage(){
        var minDate             = new Date(sevenDtBf),
            maxDate             = new Date(toDt),
            pPurcOrdNo          = "${pPurcOrdNo}",
            toYY,
            toMM,
            toDD,
            frYY,
            frMM,
            frDD;


        $("#grid").data("kendoExtGrid").dataSource.data([]);

        $("#sBpCd").val(sessionBpCd);  //공급업체 기본셋팅
        $("#sBpNm").val(sessionBpNm);  //공급업체 기본셋팅

        frYY = minDate.getFullYear();
        frMM = minDate.getMonth();
        frDD = minDate.getDate();

        toYY = maxDate.getFullYear();
        toMM = maxDate.getMonth();
        toDD = maxDate.getDate();

        $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
        $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value(toDt);
        $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));

        $("#sItemCd").val("");                                     //부품명
        $("#sItemNm").val("");                                     //부품명
        $("#sPurcOrdNo").val("");                                  //구매오더번호
        $("#sRegUsrId").val("");                                   //오더등록인
        $("#sGrEndYn").data("kendoExtDropDownList").value('');        //완료여부
        $("#sAbcInd").data("kendoExtDropDownList").value('');         //ABC Class
        $("#sItemDstinCd").data("kendoExtDropDownList").value('');    //부품대분류
        $("#sPurcOrdTp").data("kendoExtDropDownList").value('');      //오더유형
        $("#sCarlineCd").data("kendoExtDropDownList").value('');      //차종
        $("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").value([]);

        //구매오더 관리에서 넘어온 경우
        if(!dms.string.isEmpty(pPurcOrdNo)){
            $("#sPurcOrdNo").val(pPurcOrdNo);
            $("#sBpCd").val(pBpCd);
            $("#sBpNm").val(pBpNm);
            $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value('');
            $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value('');
            $("#grid").data("kendoExtGrid").dataSource.read();
        }

    }



</script>
<!-- //script -->

