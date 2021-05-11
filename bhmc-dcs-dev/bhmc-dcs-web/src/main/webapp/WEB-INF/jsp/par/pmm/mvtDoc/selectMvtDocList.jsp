<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

   <!-- 수불문서 조회 -->
   <section class="group">
       <div class="header_area">
           <h1 class="title_basic"><%-- <spring:message code="par.title.selectMvtDocList" /> --%><!-- 수불문서조회 --></h1>
           <div class="btn_right">
               <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
               <button class="btn_m btn_search"  id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
           </div>
       </div>
       <div class="table_form form_width_70per"  role="search" data-btnid="btnSearch">
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
                       <th scope="row"><spring:message code="par.lbl.mvtTp" /><!-- 수불유형 --></th>
                       <td>
                           <input type="text" id="sMvtTp" class="form_comboBox">
                       </td>
                       <th scope="row"><spring:message code="par.lbl.mvtNo" /><!-- 수불문서번호 --></th>
                       <td>
                           <input type="text" id="sMvtDocNo" class="form_input">
                       </td>
                       <th scope="row"><spring:message code="par.lbl.mvtYm" /><!-- 수불년월 --></th>
                       <td>
                           <input class="form_datepicker" id="sMvtDocYyMm">
                       </td>
                   </tr>
                   <tr>
                       <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부품번호 --></th>
                       <td>
                           <div class="form_search">
                               <input type="text" id="sItemCd" class="form_input">
                               <a id="searchItemCd"></a>
                           </div>
                       </td>
                       <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 부품명 --></th>
                       <td>
                           <input type="text" id="sItemNm" class="form_input">
                       </td>
                       <th scope="row"><span class="bu_required"><spring:message code="par.lbl.regDt" /><!-- 생성일 --></span></th>
                       <td class="required_area">
                           <div class="form_float">
                               <div class="date_left">
                                   <input class="form_datepicker" id="sMvtDocYyMmFr">
                                   <span class="txt_from">~</span>
                               </div>
                               <div class="date_right">
                                   <input class="form_datepicker" id="sMvtDocYyMmTo">
                               </div>
                           </div>
                       </td>
                   </tr>
                   <tr>
                       <th scope="row"><spring:message code="par.lbl.itemDstinCd" /><!-- 품목구분 --></th>
                       <td>
                           <input type="text" id="sItemDstinCd" class="form_comboBox">
                       </td>
                       <th scope="row"><spring:message code="par.lbl.abcInd" /><!-- ABC Class --></th>
                       <td>
                           <input type="text" id="sAbcInd"  class="form_comboBox">
                       </td>
                       <th scope="row"><spring:message code="par.lbl.customer" /><!-- 고객 --></th>
                       <td>
                           <div class="form_float">
                               <div class="form_left">
                                   <div class="form_search">
                                       <input type="text" id="sCustNo" class="form_input">
                                       <a id="searchCustNo"></a>
                                   </div>
                               </div>
                               <div class="form_right">
                                   <input type="text" id="sCustNm" class="form_input form_readonly" readonly>
                               </div>
                           </div>
                   </tr>
                   <tr>
                       <th scope="row"><spring:message code="par.lbl.strge" /><!-- 창고 --></th>
                       <td>
                           <input type="text" id="sStrgeCd" class="form_comboBox">
                       </td>
                       <th scope="row"><spring:message code="par.lbl.carLine" /><!-- 차종 --></th>
                       <td>
                           <input type="text" id="sCarlineCd" class="form_comboBox">
                       </td>
                       <th scope="row"><spring:message code="par.lbl.bpCd" /><!-- 거래처  --></th>
                       <td>
                           <div class="form_float">
                               <div class="form_left">
                                   <div class="form_search">
                                       <input type="text" id="sBpCd" class="form_input">
                                       <a id="searchBpCd"></a>
                                   </div>
                               </div>
                               <div class="form_right">
                                   <input type="text" id="sBpNm" class="form_input form_readonly" readonly>
                               </div>
                           </div>
                       </td>
                   </tr>
               </tbody>
           </table>
       </div>

       <div class="table_grid mt10">
           <div id="grid" class="grid"></div>
       </div>
   </section>

   <!-- script -->
    <script type="text/javascript">

    var itemDstinList    = []
        ,abcIndList      = []
        ,mvtTpList       = []
        ,carlineCdList   = []
        ,storageList     = []
        ,rowNumber       = 0  //그리드 목록 번호
        ,mvtTpObj        = {}
        ,storageObj      = {}
        ,itemDstinObj    = {}
        ,sevenDtBf        = "${sevenDtBf}"
        ,toDt             = "${toDt}"
        ,searchItemPopupWindow
        ,venderSearchPopupWin
        ,popupWindow
        ,chkDateValue;


    /************************************************************
          조회옵션 설정
     *************************************************************/

    //ITEM_DSTIN_CD(model)
    <c:forEach var="obj" items="${itemDstinList}">
        itemDstinList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
        itemDstinObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    //ABC_IND,ABC CLASS(model)
    <c:forEach var="obj" items="${abcIndList}">
        abcIndList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
    </c:forEach>

    //MVT_TP, 수불유형(model)
    <c:forEach var="obj" items="${mvtTpList}">
        mvtTpList.push({cmmCd:"${obj.mvtTp}", cmmCdNm:"${obj.mvtTpNm}"});
        mvtTpObj["${obj.mvtTp}"] = "${obj.mvtTpNm}";
    </c:forEach>

    //CARLINE_CD, 차종(model)
    <c:forEach var="obj" items="${carlineCdList}" varStatus="status">
    carlineCdList.push({cmmCd:"${obj.carlineCd}", cmmCdNm:"${obj.carlineCd}"});
    </c:forEach>

    //STRGE_CD, 창고(model)
    <c:forEach var="obj" items="${storageList}" varStatus="status">
    storageList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
    storageObj["${obj.strgeCd}"] = "${obj.strgeNm}";
    </c:forEach>

    $(document).ready(function(){

    /************************************************************
           조회조건 설정
     *************************************************************/

    //조회조건-품목구분선택
    $("#sItemDstinCd").kendoExtDropDownList({
         dataSource     :  itemDstinList
        ,dataTextField  :  "cmmCdNm"
        ,dataValueField :  "cmmCd"
        ,optionLabel    :  " "
    });
    //조회조건-ABC CLASS선택
    $("#sAbcInd").kendoExtDropDownList({
         dataSource     :  abcIndList
        ,dataTextField  :  "cmmCdNm"
        ,dataValueField :  "cmmCd"
        ,optionLabel    :  " "
    });
    //조회조건-수불유형선택
    $("#sMvtTp").kendoExtDropDownList({
         dataSource     :  mvtTpList
        ,dataTextField  :  "cmmCdNm"
        ,dataValueField :  "cmmCd"
        ,optionLabel    :  " "
    });
    //조회조건-차종선택
    $("#sCarlineCd").kendoExtDropDownList({
         dataSource     :  carlineCdList
        ,dataTextField  :  "cmmCdNm"
        ,dataValueField :  "cmmCd"
        ,optionLabel    :  " "
    });
    //조회조건-창고선택
    $("#sStrgeCd").kendoExtDropDownList({
         dataSource     :  storageList
         ,dataTextField :  "cmmCdNm"
         ,dataValueField:  "cmmCd"
         ,optionLabel   :  " "
    });
    //조회조건-생성일From
    $("#sMvtDocYyMmFr").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
       ,change:fnChkDateValue
     });

    //조회조건-생성일To
    $("#sMvtDocYyMmTo").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
       ,change:fnChkDateValue
     });

    //수불년월
    $("#sMvtDocYyMm").kendoDatePicker({
        //define the start view
        start:"year"
        //defines when the calendar shoule retrun date
        ,depth:"year"
        //display month and year in the input
        ,format:"yyyyMM"
    });

    $("#searchItemCd").on('click', selectPartsMasterPopupWindow);
    $("#searchBpCd").on('click', selectVenderMasterPopupWindow);
    $("#searchCustNo").on('click', selectCustomerMasterPopupWindow);

    /************************************************************
            기능버튼 설정
     *************************************************************/

    //초기화 버튼
    $("#btnInit").kendoButton({
        click:function(e){
            initPage();
        }
    });

    //조회 버튼
    $("#btnSearch").kendoButton({
      click:function(e){
          console.log("kendobutton click");

          if(dms.string.isEmpty($("#sMvtDocYyMmFr").val())){
              //생성일이 없습니다.
              dms.notification.warning("<spring:message code='par.lbl.regDt' var='sMvtDocYyMmFr' /><spring:message code='global.info.emptyParamInfo' arguments='${sMvtDocYyMmFr}'/>");
              return false;
          }

          $("#grid").data("kendoExtGrid").dataSource.read();
      }
    });

    /************************************************************
            그리드 설정
     *************************************************************/
    $("#grid").kendoExtGrid({
      dataSource:{
          transport:{
              read:{
                  url:"<c:url value='/par/pmm/mvtDoc/selectMvtDocList.do' />"
              }
             ,parameterMap:function(options, operation ){
               if(operation === "read"){

                   var params = {};

                   //수불문서조회 검색조건
                   params["sort"]                 = options.sort;
                   params["sBpCd"]                = $("#sBpCd").val();                                             //거래처
                   params["sCustNo"]              = $("#sCustNo").val();                                           //고객
                   params["sItemCd"]              = $("#sItemCd").val();                                           //부품번호
                   params["sItemNm"]              = $("#sItemNm").val();                                           //부품명
                   params["sMvtDocNo"]            = $("#sMvtDocNo").val();                                         //수불문서번호
                   params["sMvtDocYyMm"]          = $("#sMvtDocYyMm").val();                                       //수불년월
                   params["sMvtTp"]               = $("#sMvtTp").data("kendoExtDropDownList").value();                //수불유형
                   params["sAbcInd"]              = $("#sAbcInd").data("kendoExtDropDownList").value();               //ABC Class
                   params["sStrgeCd"]             = $("#sStrgeCd").data("kendoExtDropDownList").value();              //창고
                   params["sCarlineCd"]           = $("#sCarlineCd").data("kendoExtDropDownList").value();            //차종
                   params["sItemDstinCd"]         = $("#sItemDstinCd").data("kendoExtDropDownList").value();          //품목구분
                   params["sMvtDocYyMmFr"]        = $("#sMvtDocYyMmFr").data("kendoExtMaskedDatePicker").value();  //생성일Fr
                   params["sMvtDocYyMmTo"]        = $("#sMvtDocYyMmTo").data("kendoExtMaskedDatePicker").value();  //생성일To

                   console.log('검색조건 파라미터:',JSON.stringify(params));

                   return kendo.stringify(params);
               }
              }
          }
         ,schema :{
             data:function(result){
                  if(result.total === 0){
                      dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                  }
                  return result.data;
              }
         ,model:{
              id:"mvtList"
             ,fields:{
              rnum              :{type :"string"} //No
             ,dlrCd             :{type :"string"} //딜러코드
             ,mvtDocYyMm        :{type :"string"} //수불문서년월일자
             ,mvtDocNo          :{type :"string"} //수불문서번호
             ,mvtDocLineNo      :{type :"number"} //수불문서라인번호
             ,mvtTp             :{type :"string"} //수불유형
             ,cancStmtYn        :{type :"string"} //취소전표여부
             ,autoCreYn         :{type :"string"} //자동생성여부
             ,pltCd             :{type :"string"} //센터코드
             ,strgeCd           :{type :"string"} //창고코드
             ,locCd             :{type :"string"} //로케이션
             ,debitCreditDstinCd:{type :"string"} //차변대변구분코드
             ,itemCd            :{type :"string"} //품목코드
             ,itemNm            :{type :"string"} //품목명
             ,itemDstinCd       :{type :"string"} //품목구분
             ,itemQty           :{type :"number"} //품목수량
             ,itemUnitCd        :{type :"string"} //품목단위코드
             ,refDocTp          :{type :"string"} //참조문서유형
             ,refDocNo          :{type :"string"} //참조문서번호
             ,refDocLineNo      :{type :"number"} //참조문서라인번호
             ,cancMvtDocNo      :{type :"string"} //취소수불문서번호
             ,cancMvtDocYyMm    :{type :"date"  } //취소수불문서년월일자
             ,cancMvtDocLineNo  :{type :"number"} //취소수불라인번호
             ,currCd            :{type :"string"} //통화코드
             ,stdPrc            :{type :"number"} //표준단가
             ,stdAmt            :{type :"number"} //표준금액
             ,salePrc           :{type :"number"} //판매단가
             ,saleAmt           :{type :"number"} //판매금액
             ,movingAvgPrc      :{type :"number"} //이동평균단가
             ,movingAvgAmt      :{type :"number"} //이동평균금액
             ,purcPrc           :{type :"number"} //구매단가
             ,purcAmt           :{type :"number"} //구매금액
             ,ddlnYn            :{type :"string"} //마감여부
             ,mvtReasonCont     :{type :"string"} //수불사유내용
             ,stmtTxt           :{type :"string"} //전표텍스트
             ,bpCd              :{type :"string"} //거래처
             ,custNo            :{type :"string"} //고객
             }
           }
         }
      }
    , selectable:"row"
    , scrollable :true
    , autoBind   :false
    , pageable   :false
    , editable   :false
    , dataBinding:function(e){
        rowNumber = 0;
    }
    , columns    :[
                     {//No
                          field     :"rnum"
                         ,title     :"<spring:message code='par.lbl.line'  />"
                         ,attributes:{"class":"ac"}
                         ,sortable  :false
                         ,template  :"#= ++rowNumber #"
                         ,width     :40 }
                    ,{//딜러코드
                          field     :"dlrCd"
                         ,title     :"<spring:message code='par.lbl.dlrCd'  />"
                         ,hidden    :true
                         ,width     :100 }
                    ,{//수불문서년월
                          field     :"mvtDocYyMm"
                         ,title     :"<spring:message code='par.lbl.mvtYm'  />"
                         ,attributes:{"class":"ac"}
                         ,width     :100 }
                    ,{//수불문서번호
                          field     :"mvtDocNo"
                         ,title     :"<spring:message code='par.lbl.mvtNo'  />"
                         ,attributes:{"class":"ac"}
                         ,width     :100 }
                    ,{//수불문서라인번호
                          field     :"mvtDocLineNo"
                         ,title     :"<spring:message code='par.lbl.lineNm'  />"
                         ,attributes:{"class":"ac"}
                         ,width     :45 }
                    ,{//수불유형
                          field     :"mvtTp"
                         ,title     :"<spring:message code='par.lbl.mvtTp'  />"
                         ,attributes:{ "style":"text-align:left"}
                         ,template  :'#= changeMvtTp(mvtTp)#'
                         ,width     :170 }
                    ,{//취소전표여부
                          field     :"cancStmtYn"
                         ,title     :"<spring:message code='par.lbl.cancStmtYn'  />"
                         ,attributes:{"class":"ac"}
                         ,width     :100 }
                    ,{//자동생성여부
                          field     :"autoCreYn"
                         ,title     :"<spring:message code='par.lbl.autoCreYn'  />"
                         ,attributes:{"class":"ac"}
                         ,width     :100 }
                    ,{//센터코드
                          field     :"pltCd"
                         ,title     :"<spring:message code='par.lbl.pltCd'  />"
                         ,attributes:{"class":"ac"}
                         ,hidden    :true
                         ,width     :100 }
                    ,{//창고코드
                          field     :"strgeCd"
                         ,title     :"<spring:message code='par.lbl.strgeCd'  />"
                         ,attributes:{"class":"ac"}
                         ,width     :100 }
                    ,{//창고명
                          field     :"strgeCd"
                         ,title     :"<spring:message code='global.lbl.strgeNm'  />"
                         ,attributes:{"class":"ac"}
                         ,template  :'#= changeStrgeCd(strgeCd)#'
                         ,width     :80 }
                    ,{//위치코드, 로케이션
                          field     :"locCd"
                         ,title     :"<spring:message code='par.lbl.location'  />"
                         ,width     :100 }
                    ,{//차변대변구분코드
                          field     :"debitCreditDstinCd"
                         ,title     :"<spring:message code='par.lbl.debitCreditDstinCd'  />"
                         ,attributes:{"class":"ac"}
                         ,width     :100 }
                    ,{//품목코드
                          field     :"itemCd"
                         ,title     :"<spring:message code='par.lbl.itemCd'  />"
                         ,width     :120 }
                    ,{//품목명
                          field     :"itemNm"
                         ,title     :"<spring:message code='par.lbl.itemNm'  />"
                         ,width     :160 }
                    ,{//품목구분
                          field     :"itemDstinCd"
                         ,title     :"<spring:message code='par.lbl.itemDstinCd'  />"
                         ,template  :'#= changeItemDstinCd(itemDstinCd)#'
                         ,width     :80 }
                    ,{//품목수량
                          field     :"itemQty"
                         ,title     :"<spring:message code='par.lbl.itemQty'  />"
                         ,attributes:{"class":"ar"}
                         ,width     :65 }
                    ,{//품목단위코드
                          field     :"itemUnitCd"
                         ,title     :"<spring:message code='par.lbl.unit'  />"
                         ,attributes:{"class":"ac"}
                         ,width     :60 }
                    ,{//참조문서유형
                          field     :"refDocTp"
                         ,title     :"<spring:message code='par.lbl.refDocTp'  />"
                         ,width     :100 }
                    ,{//참조문서번호
                          field     :"refDocNo"
                         ,title     :"<spring:message code='par.lbl.refDocNo'  />"
                         ,width     :120 }
                    ,{//참조문서라인번호
                          field     :"refDocLineNo"
                         ,title     :"<spring:message code='par.lbl.lineNm'  />"
                         ,attributes:{"class":"ac"}
                         ,width     :45 }
                    ,{//취소수불문서번호
                          field     :"cancMvtDocNo"
                         ,title     :"<spring:message code='par.lbl.cancMvtDocNo'  />"
                         ,width     :120 }
                    ,{//취소수불라인번호
                          field     :"cancMvtDocLineNo"
                         ,title     :"<spring:message code='par.lbl.lineNm'  />"
                         ,attributes:{"class":"ac"}
                         ,width     :45 }
                    ,{//취소수불문서년월일자
                          field     :"cancMvtDocYyMm"
                         ,title     :"<spring:message code='par.lbl.cancMvtDocYyMm'  />"
                         ,attributes:{"class":"ac"}
                         ,width     :140 }
                    ,{//통화코드
                          field     :"currCd"
                         ,title     :"<spring:message code='par.lbl.currency'  />"
                         ,attributes:{"class":"ac"}
                         ,hidden    :true
                         ,width     :100 }
                    ,{//표준단가
                          field     :"stdPrc"
                         ,title     :"<spring:message code='par.lbl.stdPrc'  />"
                         ,attributes:{"class":"ar"}
                         ,width     :100 }
                    ,{//표준금액
                          field     :"stdAmt"
                         ,title     :"<spring:message code='par.lbl.stdAmt'  />"
                         ,attributes:{"class":"ar"}
                         ,width     :100 }
                    ,{//판매단가
                          field     :"salePrc"
                         ,title     :"<spring:message code='par.lbl.salePrcAmt'  />"
                         ,attributes:{"class":"ar"}
                         ,width     :100 }
                    ,{//판매금액
                          field     :"saleAmt"
                         ,title     :"<spring:message code='par.lbl.salAmt'  />"
                         ,attributes:{"class":"ar"}
                         ,width     :100 }
                    ,{//이동평균단가
                          field     :"movingAvgPrc"
                         ,title     :"<spring:message code='par.lbl.movingAvgPrc'  />"
                         ,attributes:{"class":"ar"}
                         ,width     :100 }
                    ,{//이동평균금액
                          field     :"movingAvgAmt"
                         ,title     :"<spring:message code='par.lbl.movingAvgAmt'  />"
                         ,attributes:{"class":"ar"}
                         ,width     :100 }
                    ,{//구매단가
                          field     :"purcPrc"
                         ,title     :"<spring:message code='par.lbl.purcPrc'  />"
                         ,attributes:{"class":"ar"}
                         ,width     :100 }
                    ,{//구매금액
                          field     :"purcAmt"
                         ,title     :"<spring:message code='par.lbl.purcAmt'  />"
                         ,attributes:{"class":"ar"}
                         ,width     :100 }
                    ,{//마감여부
                          field     :"ddlnYn"
                         ,title     :"<spring:message code='par.lbl.ddlnYn'  />"
                         ,attributes:{"class":"ac"}
                         ,width     :60   }
                    ,{//수불사유내용
                          field     :"mvtReasonCont"
                         ,title     :"<spring:message code='par.lbl.mvtReasonCont'  />"
                         ,width     :100 }
                    ,{//전표텍스트
                          field     :"stmtTxt"
                         ,title     :"<spring:message code='par.lbl.stmtTxt'  />"
                         ,width     :100 }
                     ]
    });

   /************************************************************
        그리드옵션 설정
   *************************************************************/
    //수불유형그리드 콤보
    changeMvtTp = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = mvtTpObj[val];
        }
        return returnVal;
    };

    //품목구분그리드 콤보
    changeItemDstinCd = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = itemDstinObj[val];
        }
        return returnVal;
    };

     //창고그리드 콤보
    changeStrgeCd = function(val){
         var returnVal = "";

         if(val != null && val != ""){
             returnVal = storageObj[val];
         }
         return returnVal;
     };
     //날짜 검증
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
             if(id === 'sMvtDocYyMmFr'){
                var minDate = new Date(sevenDtBf);
                    frYY = minDate.getFullYear();
                    frMM = minDate.getMonth();
                    frDD = minDate.getDate();
                    $("#sMvtDocYyMmFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                    $("#sMvtDocYyMmTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sMvtDocYyMmTo'){
                var maxDate = new Date(toDt);
                    toYY = maxDate.getFullYear();
                    toMM = maxDate.getMonth();
                    toDD = maxDate.getDate();
                    $("#sMvtDocYyMmTo").data("kendoExtMaskedDatePicker").value(toDt);
                    $("#sMvtDocYyMmFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }}
            else{
            if(id === 'sMvtDocYyMmFr'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sMvtDocYyMmTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sMvtDocYyMmTo'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sMvtDocYyMmFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
             }
            }
     }
    initPage();

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
         //그리드 reset
         $("#grid").data("kendoExtGrid").dataSource.data([]);
         //조회조건reset
         console.log('mvtTpList:', mvtTpList);
         console.log('mvtTpList[""]:', mvtTpList[""]);

         $("#sBpCd").val('');                                                       //거래처코드
         $("#sBpNm").val('');                                                       //거래처명
         $("#sItemCd").val('');                                                     //부품번호
         $("#sItemNm").val('');                                                     //부품명
         $("#sCustNo").val('');                                                     //고객코드
         $("#sCustNm").val('');                                                     //고객명
         $("#sMvtDocNo").val('');                                                   //수불문서번호
         $("#sMvtTp").data("kendoExtDropDownList").value(" ");                         //수불유형
         $("#sAbcInd").data("kendoExtDropDownList").value("");                         //ABC Class
         $("#sStrgeCd").data("kendoExtDropDownList").value("");                        //창고
         $("#sCarlineCd").data("kendoExtDropDownList").value("");                      //차종
         $("#sMvtDocYyMm").data("kendoDatePicker").value("");                       //수불년월
         $("#sItemDstinCd").data("kendoExtDropDownList").value("");                    //품목구분

         frYY = minDate.getFullYear();
         frMM = minDate.getMonth();
         frDD = minDate.getDate();

         toYY = maxDate.getFullYear();
         toMM = maxDate.getMonth();
         toDD = maxDate.getDate();

         $("#sMvtDocYyMmFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
         $("#sMvtDocYyMmTo").data("kendoExtMaskedDatePicker").value(toDt);
         $("#sMvtDocYyMmFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
         $("#sMvtDocYyMmTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
    }



    //부품 팝업 열기 함수
    function selectPartsMasterPopupWindow(){

        searchItemPopupWindow = dms.window.popup({
           windowId:"ItemMasterPopup"
           ,title  :"<spring:message code='par.title.partSearch' />" // 부품 조회
           ,content:{
               url :"<c:url value='/par/cmm/selectSearchItemPopup.do' />"
              ,data:{
                  "type"        :""
                 ,"autoBind"    :false
                 ,"callbackFunc":function(data){
                        $("#sItemCd").val(data[0].itemCd);
                        $("#sItemNm").val(data[0].itemNm);

                        searchItemPopupWindow.close();
                 }

              }
           }
        });
    }

    //거래처 팝업 열기 함수
    function selectVenderMasterPopupWindow(){

        venderSearchPopupWin = dms.window.popup({
            windowId:"searchVendorPopupWindow"
            ,title  :"<spring:message code = 'par.title.venderSelect'/>" // 거래처 조회
            ,content:{
                url :"<c:url value='/par/pmm/venderMaster/selectVenderMasterPopup.do'/>"
               ,data:{
                   "type"        :""
                  ,"autoBind"    :false
                  ,"callbackFunc":function(data){
                      $("#sBpCd").val(data[0].bpCd);
                      $("#sBpNm").val(data[0].bpNm);
                  }
                  }
               }
        })
    }

    //고객 팝업 열기 함수
    function selectCustomerMasterPopupWindow(){

        popupWindow = dms.window.popup({
            windowId:"customerSearchPopup"
            ,title  :"<spring:message code='par.title.custSearch' />"   // 고객 조회
            ,content:{
                url  :"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
               ,data:{
                   "type"        :""
                  ,"autoBind"    :false
                  ,"callbackFunc":function(data){
                      $("#sCustNo").val(data[0].custNo);
                      $("#sCustNm").val(data[0].custNm);
                  }
                  }
               }
        })
    }


    </script>
   <!-- /script -->
