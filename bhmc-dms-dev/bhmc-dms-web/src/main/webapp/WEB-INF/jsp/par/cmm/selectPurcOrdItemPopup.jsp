<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- 구매품목 팝업 -->
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
                    <col style="width:10%;">
                    <col style="width:24%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.bpCd" /><!-- 거래처코드 --></span></th>
                        <td>
                            <input id="sBpCd" class="hidden" />
                            <input id="sBpNm" readonly class="form_input form_readonly" style="width:150px"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcOrdNo" /><!-- 구매오더번호 --></th>
                        <td>
                            <input id="sPurcOrdNo" class="form_input" style="width:150px"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcOrdTp" /><!-- 오더유형 --></th>
                        <td>
                            <input id="sPurcOrdTp" data-type="combo"/>
                        </td>

                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.purcRegDt" /><!-- 구매등록일 --></th>
                        <td>
                            <input id="sPurcRegDtFr" style="width:110px;" />~
                            <input id="sPurcRegDtTo" style="width:110px;" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcOrdStatCd" /><!-- 구매오더상태 --></th>
                        <td>
                            <input id="sPurcOrdStatCd" data-type="combo"/>
                        </td>
                        <th scope="row">
                        <td>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid mt10">
        <!-- 그리드1 -->
            <div id="grid" class="grid"></div>
        <!-- 그리드1 -->
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
         var options             = parent.purcOrdItemPopupWindow.options.content.data,
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
             minDate = new Date(sevenDtBf),
             maxDate = new Date(toDt),
             toYY,
             toMM,
             toDD,
             frYY,
             frMM,
             frDD;

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

                if(rows !== null){
                    var data = [];

                    $.each(rows, function(idx, row){
                        data.push(grid.dataItem(row));
                    });

                    options.callbackFunc(data);
                }
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

        if(!dms.string.isEmpty(options.purcOrdNo)){
            $("#sPurcOrdNo").val(options.purcOrdNo);
            $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value('');
            $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value('');
        }else{
            $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
            $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value(toDt);

            $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));

        }

        /************************************************************
                    그리드 설정
        *************************************************************/
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0805-204101"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pcm/purcOrd/selectPurcOrdItems.do' />"
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
                            params["sReturnYn"]          = options.returnYn;

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
                            , purcItemStatCd :{ type:"string", editable:false } //상태
                            , purcUnitCd     :{ type:"string", editable:false } //단위
                            , purcQty        :{ type:"number", editable:false } //오더수량(구매수량)
                            , cancQty        :{ type:"number", editable:false } //취소수량
                            , grStrgeCd      :{ type:"string", editable:false } //창고
                            , purcPrc        :{ type:"number", editable:false } //단가
                            , purcAmt        :{ type:"number", editable:false } //금액
                            , regUsrId       :{ type:"string", editable:false } //사용자
                        }
                    }
                }
            }
            ,selectable:"multiple"
            ,editable:false
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,height:300
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
                      field     :"purcTp"
                     ,title     :"<spring:message code='par.lbl.purcOrdTp' />"
                     ,template  :'#= changePurcOrdTp(purcTp)#'
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
                 ,{//구매등록자
                     field      :"regUsrId"
                    ,title      :"<spring:message code='par.lbl.ordRegId' />"
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
            ]
        });


        if(options.autoBind){
            $("#grid").data("kendoExtGrid").dataSource.read();
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

