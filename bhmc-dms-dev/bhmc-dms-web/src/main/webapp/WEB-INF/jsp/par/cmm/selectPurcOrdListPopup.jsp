<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<div id="resizableContainer">
    <!-- 구매오더리스트 팝업 -->
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
                    <col style="width:26%;">
                    <col style="width:10%;">
                    <col style="width:22%;">
                    <col style="width:10%;">
                    <col style="width:22%;">
                    <col >
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
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcOrdStatCd" /><!-- 구매오더상태 --></th>
                        <td>
                            <input id="sPurcOrdStatCd" type="text" data-type="multicombo" class="form_comboBox" />
                        </td>
                        <th/>
                        <td/>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid mt10">
        <!-- 그리드1 -->
            <div id="grid" class="resizable_grid"></div>
        <!-- 그리드1 -->
        </div>
    </section>
    <!-- //부품선택 팝업 -->
</div>
 <script type="text/javascript">

    $(document).ready(function() {

        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         var options             = parent.purcOrdListPopupWindow.options.content.data,
             toDt                ="${toDt}",
             sevenDtBf           ="${sevenDtBf}",
             purcOrdTpList       = [],
             purcOrdTpObj        = {},
             purcOrdStatList     = [],
             purcOrdStatObj      = {},
             minDate = new Date(sevenDtBf),
             maxDate = new Date(toDt),
             toYY,
             toMM,
             toDD,
             frYY,
             frMM,
             frDD,
             pItemDstinCd        = options.itemDstinCd;

         purcOrdTpList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
         <c:forEach var="obj" items="${purcOrdTpList}" varStatus="status">
             purcOrdTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
             purcOrdTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
         </c:forEach>

         purcOrdStatList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
         <c:forEach var="obj" items="${purcOrdStatList}" varStatus="status">
             if(!dms.string.isEmpty(options.excStatCd)){
                 if(options.excStatCd !== "${obj.cmmCd}"){
                     if("${obj.useYn}" !=='N' ){
                         purcOrdStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
                     }
                     purcOrdStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                 }
             }else{
                 if("${obj.useYn}" !=='N' ){
                     purcOrdStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
                 }
                 purcOrdStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
             }
         </c:forEach>

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

                if(rows !== null){
                    var data = [];

                    if(rows.length > 1){
                        dms.notification.warning("<spring:message code='global.info.selectOneRowMsg' />");
                        return false;
                    }
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

      //구매오더상태선택
        $("#sPurcOrdStatCd").kendoExtMultiSelectDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:purcOrdStatList
            ,dataBound:function(){
                var current = this.value();
                this._savedOld = current.slice(0);
            }
            ,select:function(e){
                var selectPurcOrdStatCd = e.dataItem.cmmCd;

                if(dms.string.isEmpty(selectPurcOrdStatCd)){
                    $("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").refresh();
                    $("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").value([]);
                }

            }
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

        $("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").value(options.purcOrdStatCd);
        $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
        $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value(toDt);

        $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));


        /************************************************************
                    그리드 설정
        *************************************************************/
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0519-182803"
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

                            var sPurcOrdStatCdLst = $("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").value();
                            if(dms.string.isEmpty(sPurcOrdStatCdLst[0])){

                                sPurcOrdStatCdLst.splice(0,1);
                            }

                            if(sPurcOrdStatCdLst.length === 0){
                                for(var i = 0; i < purcOrdStatList.length; i = i + 1){
                                    sPurcOrdStatCdLst.push(purcOrdStatList[i].cmmCd);
                                }
                            }

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
                            //params["sPurcOrdStatCd"]     = $("#sPurcOrdStatCd").data("kendoExtDropDownList").value();
                            params["sPurcOrdStatLst"]    = sPurcOrdStatCdLst;
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
                        id:"itemCd"
                        , fields:{
                              dlrCd         :{ type:"string" }
                            , bpCd          :{ type:"string" }
                            , bpNm          :{ type:"string" }
                            , purcOrdNo     :{ type:"string" }
                            , purcOrdTp     :{ type:"string" }
                            , purcOrdStatCd :{ type:"string" }
                            , purcRegDt     :{ type:"date" }
                            , remark        :{ type:"string" }
                        }
                    }
                }
            }
            ,selectable:"row"
            ,editable:false
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,height:280
            ,columns:[
                 {field:"dlrCd"
                     ,title:"<spring:message code='par.lbl.dlrCd' />"
                     ,width:105
                     ,hidden:true}  //딜러 코드
                ,{field:"bpCd"
                     ,title:"<spring:message code='par.lbl.bpCd' />"
                     ,width:105
                     ,hidden:true}  //거래처 코드
                ,{field:"bpNm"
                     ,title:"<spring:message code='par.lbl.bpCd' />"
                     ,width:140 }  //공급업체
                ,{field:"purcOrdNo"
                     ,title:"<spring:message code='par.lbl.purcOrdNo' />"
                     ,width:90 }                //구매오더번호
                ,{field:"purcOrdTp"
                     ,title:"<spring:message code='par.lbl.purcOrdTp' />"
                     ,template:'#= changePurcOrdTp(purcOrdTp)#'
                     ,width:100 }                //오더유형
                ,{field:"purcOrdStatCd"
                     ,title:"<spring:message code='par.lbl.purcOrdStatCd' />"
                     //,template:'#= changePurcOrdStat(purcOrdStatCd)#'
                     ,template:'#if(changePurcOrdStat(purcOrdStatCd) !== undefined){# #= changePurcOrdStat(purcOrdStatCd)# #}#'
                     ,width:100 }                //구매오더상태
                ,{field:"purcRegDt"
                     ,title:"<spring:message code='par.lbl.purcRegDt' />"
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,attributes:{ "class":"ac"}
                     ,width:90 }                //구매등록일
                ,{field:"remark"
                     ,title:"<spring:message code='par.lbl.remark' />"
                     ,width:100 }                //비고
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
                        //$("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                        //$("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                }else if(id === 'sPurcRegDtTo'){
                    var maxDate = new Date(toDt);
                        toYY = maxDate.getFullYear();
                        toMM = maxDate.getMonth();
                        toDD = maxDate.getDate();

                        //$("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value(toDt);
                        //$("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
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

