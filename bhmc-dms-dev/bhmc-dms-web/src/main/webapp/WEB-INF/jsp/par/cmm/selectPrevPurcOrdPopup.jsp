<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- 이전 구매등록 팝업 -->
    <section id="windows" class="pop_wrap">
        <div class="header_area">
            <div class="btn_right">
                <!-- 조회 버튼 -->
                <button id="btnSearch" class="btn_m"><spring:message code="par.btn.search" /><!-- 조회 --></button>
                <button id="btnSelect" class="btn_m"><spring:message code="par.btn.select" /><!-- 선택 --></button>
            </div>
        </div>
        <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:22%;">
                    <col style="width:10%;">
                    <col style="width:25%;">
                    <col style="width:10%;">
                    <col style="width:22%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.bpCd" /><!-- 거래처코드 --></span></th>
                        <td>
                            <input id="sBpCd" class="hidden" />
                            <input id="sBpNm" readonly class="form_input form_readonly" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcOrdNo" /><!-- 구매오더번호 --></th>
                        <td>
                            <input id="sPurcOrdNo" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcOrdTp" /><!-- 오더유형 --></th>
                        <td>
                            <input id="sPurcOrdTp" data-type="combo" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.purcOrdStatCd" /><!-- 구매오더상태 --></th>
                        <td>
                            <input id="sPurcOrdStatCd" data-type="combo" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcRegDt" /><!-- 구매등록일 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sPurcRegDtFr" name="sPurcRegDtFr" class="form_datepicker" />
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sPurcRegDtTo" name="sPurcRegDtTo" class="form_datepicker" />
                                </div>
                            </div>
                        </td>
                        <th scope="row"></th>
                        <td>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid mt10">
        <!-- 그리드1 -->
            <div id="gridHeader" class="grid"></div>
        <!-- 그리드1 -->
        </div>
    </section>

    <!-- 상세정보 -->
    <section class="pop_wrap">
        <div class="table_grid mt10">
            <div id="gridDetail" class="grid"></div>
        </div>
    </section>

 <script type="text/javascript">

    $(document).ready(function() {

        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         var options             = parent.prevPurcOrdPopupWindow.options.content.data,
             toDt                ="${toDt}",
             sevenDtBf           ="${sevenDtBf}",
             purcOrdTpList       = [],
             purcOrdTpObj        = {},
             purcOrdStatList     = [],
             purcOrdStatObj      = {},
             purcUnitList        = [],
             purcUnitObj         = {},
             grStrgeTpList       = [],
             grStrgeTpObj        = {},
             trsfTpObj           = {},
             minDate = new Date(sevenDtBf),
             maxDate = new Date(toDt),
             toYY,
             toMM,
             toDD,
             frYY,
             frMM,
             frDD,
             pItemDstinCd        = options.itemDstinCd;


         <c:forEach var="obj" items="${trsfTpList}" varStatus="status">
             trsfTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
         </c:forEach>

         purcOrdTpList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
         <c:forEach var="obj" items="${purcOrdTpList}" varStatus="status">
             purcOrdTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
             purcOrdTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
         </c:forEach>

         purcOrdStatList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
         <c:forEach var="obj" items="${purcOrdStatList}" varStatus="status">
             if("${obj.useYn}" !=='N' ){
                 purcOrdStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
             }
             purcOrdStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
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


        // 그리드디테일 더블 클릭 이벤트.
        $("#gridDetail").on("dblclick", "tr.k-state-selected", function (e) {
            $("#btnSelect").click();
        });


        /************************************************************
                    기능버튼 설정
        *************************************************************/


        // 조회 버튼.
        $("#btnSearch").kendoButton({
            click:function(e){
                $("#gridHeader").data("kendoExtGrid").dataSource.read();
            }
        });

        // 선택 버튼.
        $("#btnSelect").kendoButton({
            click:function(e){
                var grid = $("#gridDetail").data("kendoExtGrid"),
                items = grid.dataSource.view(),
                length = items.length,
                data = [];

                for (i = 0; i < length;i++) {
                    data.push(items[i]);
                }

                options.callbackFunc(data);
            }
        });

        $("#sPurcOrdTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:purcOrdTpList
           ,index:0
       });

        $("#sPurcOrdStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:purcOrdStatList
           ,index:0
       });

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



        /************************************************************
                    조회조건 설정
        *************************************************************/
        frYY = minDate.getFullYear();
        frMM = minDate.getMonth();
        frDD = minDate.getDate();

        toYY = maxDate.getFullYear();
        toMM = maxDate.getMonth();
        toDD = maxDate.getDate();

        // 조회조건 설정
        $("#sBpCd").val(options.bpCd);
        $("#sBpNm").val(options.bpNm);
        $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
        $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value(toDt);

        $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));


        /************************************************************
                    그리드 설정
        *************************************************************/
        $("#gridHeader").kendoExtGrid({
            gridId:"G-PAR-0803-162601"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pcm/purcOrd/selectPurcOrds.do' />"
                        , dataType:"json"
                        , type:"POST"
                        , contentType:"application/json;"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;

                            params["sBpCd"]              = $("#sBpCd").val();
                            params["sPurcOrdNo"]         = $("#sPurcOrdNo").val();
                            params["sPurcOrdTp"]         = $("#sPurcOrdTp").data("kendoExtDropDownList").value();
                            //params["sPurcRegDtFr"]       = $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value();
                            //params["sPurcRegDtTo"]       = $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sPurcRegDtFr"]       = $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sPurcRegDtTo"]       = $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sPurcOrdStatCd"]     = $("#sPurcOrdStatCd").data("kendoExtDropDownList").value();
                            params["sItemDstinCd"]       = pItemDstinCd;

                            return kendo.stringify(params);
                        }
                    }
                }
                ,navigatable:false
                ,serverPaging:true
                ,schema:{
                    data:"data"
                    , total:"total"
                    , model:{
                        id:"purcOrdNo"
                        , fields:{
                              dlrCd         :{ type:"string", editable:false }
                            , bpCd          :{ type:"string", editable:false }
                            , bpNm          :{ type:"string", editable:false }
                            , purcOrdNo     :{ type:"string", editable:false }
                            , bmpOrdNo      :{ type:"string", editable:false }
                            , purcOrdTp     :{ type:"string", editable:false }
                            , trsfTp        :{ type:"string", editable:false }
                            , purcOrdStatCd :{ type:"string", editable:false }
                            , regUsrNm      :{ type:"string", editable:false }
                            , remark        :{ type:"string", editable:false }
                            , purcRegDt     :{ type:"date",   editable:false }
                            , confirmDt     :{ type:"date",   editable:false }
                            , itemCnt       :{ type:"number", editable:false }
                            , totPurcQty    :{ type:"number", editable:false }
                            , totPurcAmt    :{ type:"number", editable:false }
                        }
                    }
                }
            }
            ,selectable:"row"
            ,editable:false
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,height:150
            ,change:function(e){
                var selectedItem = this.dataItem(this.select());

                if( selectedItem != null && selectedItem != 'undefined'){
                    $("#gridDetail").data("kendoExtGrid").dataSource.read();
                }
             }
            ,columns:[
                 {   //딜러코드
                      title:"<spring:message code='par.lbl.dlrCd' />"
                     ,field:"dlrCd"
                     ,width:80
                     ,hidden:true
                  }
                 ,{field:"purcOrdTp"
                      ,title:"<spring:message code='par.lbl.purcOrdTp' />"
                      ,template:'#= changePurcOrdTp(purcOrdTp)#'
                      ,attributes:{ "style":"text-align:center"}
                      ,width:160}                //오더유형
                 ,{field:"purcRegDt"
                      ,title:"<spring:message code='par.lbl.ordReqDt' />"
                      ,format:"{0:<dms:configValue code='dateFormat' />}"
                      ,attributes:{ "style":"text-align:center"}
                      ,width:90 }                //구매신청일
                 ,{field:"purcOrdNo"
                      ,title:"<spring:message code='par.lbl.purcOrdNo' />"
                      ,attributes:{ "style":"text-align:center"}
                     ,width:90 }   //구매오더번호
                 ,{field:"bmpOrdNo"
                      ,title:"<spring:message code='par.lbl.bmpOrdNo' />"
                     ,width:120 }   //bmp오더번호
                 ,{field:"bpCd"
                     ,title:"<spring:message code='par.lbl.bpCd' />"
                     ,width:105
                     ,hidden:true}  //거래처 코드
                 ,{field:"bpNm"
                     ,title:"<spring:message code='par.lbl.supplyNo' />"
                     ,width:140 }  //공급업체
                 ,{field:"itemCnt"
                     ,title:"<spring:message code='par.lbl.itemCnt' />"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                  }      //건수
                 ,{field:"totPurcQty"
                     ,title:"<spring:message code='par.lbl.ordTotQty' />"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                  }      //수량
                 ,{field:"totPurcAmt"
                     ,title:"<spring:message code='par.lbl.ordTotAmt' />"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                  }      //구매총금액
                 ,{field:"purcOrdStatCd"
                     ,title:"<spring:message code='par.lbl.purcOrdStatCd' />"
                     //,template:'#= changePurcOrdStat(purcOrdStatCd)#'
                     ,attributes:{ "style":"text-align:center"}
                     ,width:100
                     ,template:function(dataItem){

                         var spanObj = "";

                         switch(dataItem.purcOrdStatCd)
                         {
                             case "02":// 전송
                                 spanObj = "<span class='txt_label bg_blue'>"+purcOrdStatObj[dataItem.purcOrdStatCd]+"</span>";
                                 break;
                             case "03":// 확정
                                 spanObj = "<span class='txt_label bg_orange'>"+purcOrdStatObj[dataItem.purcOrdStatCd]+"</span>";
                                 break;
                             case "04":// 완료
                                 spanObj = "<span class='txt_label bg_purple'>"+purcOrdStatObj[dataItem.purcOrdStatCd]+"</span>";
                                 break;
                             case "05":// 취소
                                 spanObj = "<span class='txt_label bg_red'>"+purcOrdStatObj[dataItem.purcOrdStatCd]+"</span>";
                                 break;
                             default: // 등록
                                 spanObj = "<span class='txt_label bg_gray'>"+purcOrdStatObj[dataItem.purcOrdStatCd]+"</span>";
                                 break;
                          }
                          return spanObj;
                      }
                  }                //구매오더상태
                 ,{field:"trsfTp"
                     ,title:"<spring:message code='par.lbl.trsfType' />"
                     ,template:'#= changeTrsfTp(trsfTp)#'
                     ,attributes:{ "style":"text-align:center"}
                     ,width:140}                //운송유형
                 ,{field:"confirmDt"
                     ,title:"<spring:message code='par.lbl.ordConfirmDt' />"
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,attributes:{ "style":"text-align:center"}
                     ,width:90 }                //처리일자
                 ,{field:"remark"
                     ,title:"<spring:message code='par.lbl.ordTag' />"
                     ,width:140 }  //오더태그(비고)
                 , {   //오더신청자
                     title:"<spring:message code='par.lbl.ordRegId' />"
                     ,field:"regUsrNm"
                     ,width:120
                   }
            ]
        });

        $("#gridDetail").kendoExtGrid({
            gridId:"G-PAR-0927-162602"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pcm/purcOrd/selectPurcOrdItemByKey.do' />"
                        , dataType:"json"
                        , type:"POST"
                        , contentType:"application/json;"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params  = {},
                                headGrd = $("#gridHeader").data("kendoExtGrid")
                                rows    = headGrd.select();

                            params["sPurcOrdNo"]         = headGrd.dataItem(rows[0]).purcOrdNo;

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    data:"data"
                    , total:"total"
                    , model:{
                         id:"purcOrdNo"
                        ,fields:{
                              dlrCd          :{ type:"string", editable:false }
                            , purcOrdNo      :{ type:"string", editable:false } //오더번호
                            , purcOrdLineNo  :{ type:"string", editable:false } //구매오더라인번호
                            , purcTp         :{ type:"string", editable:false } //구매유형
                            , itemCd         :{ type:"string", editable:false } //부번
                            , itemNm         :{ type:"string", editable:false } //품명
                            , purcRegDt      :{ type:"date",   editable:false } //오더일자(구매일자)
                            , purcTp         :{ type:"string", editable:false } //오더유형
                            , bpCd           :{ type:"string", editable:false } //업체
                            , bpNm           :{ type:"string", editable:false } //업체
                            , purcItemTp     :{ type:"string"}
                            , purcItemStatCd :{ type:"string", editable:false } //상태
                            , purcUnitCd     :{ type:"string", editable:false } //단위
                            , purcQty        :{ type:"number", editable:false } //오더수량(구매수량)
                            , cancQty        :{ type:"number", editable:false } //취소수량
                            , grStrgeCd      :{ type:"string", editable:false } //창고
                            , prcTp          :{ type:"string"}
                            , taxDdctPrc     :{ type:"number" }
                            , taxDdctAmt     :{ type:"number"}
                            , purcPrc        :{ type:"number", editable:false } //단가
                            , purcAmt        :{ type:"number", editable:false } //금액
                            , minPurcQty     :{ type:"number", editable:false } //최소구매수량
                            , avlbStockQty   :{ type:"number", editable:false } //가용수량
                            , resvStockQty   :{ type:"number", editable:false } //예류수량
                            , resvQty        :{ type:"number" }
                            , purcReqQty     :{ type:"number" }
                            , stockQty       :{ type:"number", editable:false } //재고수량
                            , borrowQty      :{ type:"number", editable:false } //차입수량
                            , rentQty        :{ type:"number", editable:false } //차출수량
                            , purcReqNo      :{ type:"string"}
                            , purcReqLineNo  :{ type:"string"}
                            , purcReqDt      :{ type:"date"   }
                            , purcLeadHm     :{ type:"number", editable:false } //리드타임
                            , delYn          :{ type:"string"}
                            , grEndYn        :{ type:"string"}
                            , purcReqRegUsrId:{ type:"string"}
                            , regUsrId       :{ type:"string"}
                            , purcRegDttmStr :{ type:"string"}
                            , purcSendDttmStr:{ type:"string"}
                            , parSpecCd      :{ type:"string"}
                            , sucCd          :{ type:"string"}
                          }
                    }
                }
            }
            ,selectable:"multiple"
            ,editable:false
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,pageable:false
            ,scrollable :true
            ,height:230
            ,columns:[
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
                     ,hidden    :true
                   }
                 ,{//구매오더라인번호
                      field     :"purcOrdLineNo"
                     ,title     :"<spring:message code='par.lbl.no' />"
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
                 ,{title:"<spring:message code='par.lbl.minPackQty' />" ,field:"minPurcQty" ,width:120 ,attributes:{ "style":"text-align:right"} ,format:"{0:n2}"}
                 , {//단가
                     field      :"purcPrc"
                    ,title      :"<spring:message code='par.lbl.purcOrcPrice' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :120
                 }
                 ,{title:"<spring:message code='par.lbl.purcPriceTax' />" ,field:"taxDdctPrc" ,width:120 ,attributes:{ "style":"text-align:right"} ,format:"{0:n2}"}
                 ,{title:"<spring:message code='par.lbl.purcIncTaxAmt' />" ,field:"purcAmt" ,width:130 ,attributes:{ "style":"text-align:right"} ,format:"{0:n2}"}
                 ,{title:"<spring:message code='par.lbl.purcAmt' />" ,field:"taxDdctAmt" ,width:120 ,attributes:{ "style":"text-align:right"} ,format:"{0:n2}"}
                 , {//단위
                     field      :"purcUnitCd"
                    ,title      :"<spring:message code='par.lbl.purcOrdUnitNm' />"
                    ,attributes :{"class":"ac"}
                    ,template   :'#= changePurcUnit(purcUnitCd)#'
                    ,width      :80
                 }
                 , {//오더수량(구매수량)
                     field      :"purcQty"
                    ,title      :"<spring:message code='par.lbl.purcQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,width      :80
                 }
                 ,{title:"<spring:message code='par.lbl.cancQty' />" ,field:"cancQty" ,width:60 ,attributes:{ "style":"text-align:right"} ,format:"{0:n0}"}//취소수량
                 , {//입고창고
                     field      :"grStrgeCd"
                    ,title      :"<spring:message code='par.lbl.grStrgeCd' />"
                    ,template   :'#= changeGrStrgeCd(grStrgeCd)#'
                    ,width      :100
                    ,hidden:true
                 }
               , {   //재고수량
                     title:"<spring:message code='par.lbl.strgeStockQty' />"
                    ,field:"stockQty"
                    ,width:60
                    ,attributes:{ "style":"text-align:right"}
                    ,format:"{0:n2}"
                    ,decimal:2
                    ,hidden:true
                 }
               , {   //가용수량
                     title:"<spring:message code='par.lbl.avlbStockQty' />"
                    ,field:"avlbStockQty"
                    ,width:60
                    ,attributes:{ "style":"text-align:right"}
                    ,format:"{0:n2}"
                    ,decimal:2
                 }
               , {   //예류수량
                     title:"<spring:message code='par.lbl.realResvStockQty' />"
                    ,field:"resvStockQty"
                    ,width:60
                    ,attributes:{ "style":"text-align:right"}
                    ,format:"{0:n2}"
                    ,decimal:2
                 }
                ,{title:"<spring:message code='par.lbl.purcOrdResvQty' />" ,field:"resvQty" ,width:60 ,attributes:{ "style":"text-align:right"} ,format:"{0:n2}"}//예약수량
                ,{title:"<spring:message code='par.lbl.purcOrcRentQty' />" ,field:"rentQty" ,width:60 ,attributes:{ "style":"text-align:right"} ,format:"{0:n2}"}//대여수량
                ,{title:"<spring:message code='par.lbl.borrowQty' />" ,field:"borrowQty" ,width:60 ,attributes:{ "style":"text-align:right"} ,format:"{0:n2}"}//차입수량
                , {   //오더생성일시
                     title:"<spring:message code='par.lbl.ordCreateDttm' />"
                    ,field:"purcRegDttmStr"
                    ,width:140
                    ,attributes:{ "style":"text-align:center"}
                   }
                 , {   //오더발송일시
                      title:"<spring:message code='par.lbl.ordSendDttm' />"
                     ,field:"purcSendDttmStr"
                     ,attributes:{ "style":"text-align:center"}
                     ,width:140
                  }
                 ,{title:"<spring:message code='par.lbl.parSpecCd' />" ,field:"parSpecCd" ,width:60 ,hidden:true}
                 ,{title:"<spring:message code='par.lbl.sucCd' />" ,field:"sucCd" ,width:60 ,hidden:true}
            ]
        });

        if(options.autoBind){
            $("#gridHeader").data("kendoExtGrid").dataSource.read();
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

        // 운송유형
        changeTrsfTp = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = trsfTpObj[val];
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

       // $("#grid").data("kendoExtGrid").dataSource.read();
    });

 </script>

