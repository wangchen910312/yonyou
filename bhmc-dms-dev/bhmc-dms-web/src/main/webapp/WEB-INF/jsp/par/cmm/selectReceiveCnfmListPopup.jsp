<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- 송장리스트 팝업 -->
    <section id="windows" class="pop_wrap">
        <div class="header_area">
            <div class="btn_right">
                <!-- 조회 버튼 -->
                <button id="btnSearch" class="btn_m btn_Search"><spring:message code="par.btn.search" /><!-- 조회 --></button>
                <button id="btnSelect" class="btn_m btn_Select"><spring:message code="par.btn.select" /><!-- 선택 --></button>
            </div>
        </div>
        <div class="table_form" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:22%;">
                    <col style="width:10%;">
                    <col style="width:26%;">
                    <col style="width:10%;">
                    <col style="width:22%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                       <th scope="row"><spring:message code="par.lbl.bpTp" /><!-- 업체 --></th>
                       <td>
                           <input type="text" id="sBpCd" class="form_input form_readonly" readonly />
                        </td>
                       <th scope="row"><spring:message code="par.lbl.bpNm" /><!-- 업체 --></th>
                       <td>
                           <input type="text" id="sBpNm" class="form_input form_readonly" readonly />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.supplyTp" /><!-- 공급업체유형 --></th>
                        <td>
                            <input id="sBpTp" class="form_comboBox" data-type="combo" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.grDocNo" /><!-- 입고문서번호 --></th>
                        <td>
                            <input id="sInvcDocNo" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.grDt" /><!-- 입고일자 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sInvcGrDtFr" class="form_datepicker" data-type="maskDate"/>
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sInvcGrDtTo" class="form_datepicker" data-type="maskDate"/>
                                </div>
                            </div>
                        </td>
                        <th scope="row"></th>
                        <td></td>
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
    <!-- //송장리스트 팝업 -->

 <script type="text/javascript">
        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         var options             = parent.receiveCnfmListPopupWindow.options.content.data,
             toDt                = "${toDt}",
             sevenDtBf           = "${sevenDtBf}",
             invcTpList          = [],
             invcTpObj           = {},
             invcStatList        = [],
             invcStatCdList      = [],
             invcStatCdMap       = {},
             invcStatObj         = {},
             vatCdObj            = {},
             bpTpList            = [],
             minDate = new Date(sevenDtBf),
             maxDate = new Date(toDt),
             rowNumber           = 0, //그리드 목록 번호
             toYY,
             toMM,
             toDD,
             frYY,
             frMM,
             frDD;


         <c:forEach var="obj" items="${invcTpList}" varStatus="status">
             invcTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
             invcTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
         </c:forEach>

         <c:forEach var="obj" items="${bpTpList}" varStatus="status">
             if("01" === "${obj.remark2}"){
                 bpTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
             }
         </c:forEach>

         <c:forEach var="obj" items="${invcStatCdList}">
             invcStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         </c:forEach>

         $.each(invcStatCdList, function(idx, obj){
             invcStatCdMap[obj.cmmCd] = obj.cmmCdNm;
         });

    $(document).ready(function() {

        //거래처구분
        $("#sBpTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:bpTpList
            ,optionLabel:" "
            ,index:0
        });

        //송장입고일자
        $("#sInvcGrDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        //송장입고일자
        $("#sInvcGrDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

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

                    if(rows.length < 1){
                        dms.notification.warning("<spring:message code='global.info.unselected' />");
                        return false;
                    }
                    $.each(rows, function(idx, row){
                        data.push(grid.dataItem(row));
                    });

                    options.callbackFunc(data);
                }
            }
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

        if(!dms.string.isEmpty(options.bpTp)){ //거래처 유형이 지정된 경우.
            $("#sBpTp").data("kendoExtDropDownList").value(options.bpTp);
            $("#sBpTp").data("kendoExtDropDownList").enable(false);
        }

        $("#sInvcGrDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
        $("#sInvcGrDtTo").data("kendoExtMaskedDatePicker").value(toDt);

        $("#sInvcGrDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        $("#sInvcGrDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));



        /************************************************************
                    그리드 설정
        *************************************************************/
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0317-144501"
           ,dataSource:{
                transport:{
                    read:{
                       url:"<c:url value='/par/pcm/receive/selectReceivesByConditionForPopup.do' />"
                       //url:"<c:url value='/par/pcm/receive/selectReceivesByCondition.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {},
                                sBpCdList =  $("#sBpCd").val().split('|');

                            if(dms.string.isEmpty(sBpCdList[0])){

                                sBpCdList.splice(0,1);
                            }

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;
                            // 구매오더 검색조건 코드.
                            params["sBpCdList"]         = sBpCdList;
                            params["sInvcDocNo"]        = $("#sInvcDocNo").val();
                            params["sBpTp"]             = $("#sBpTp").data("kendoExtDropDownList").value();
                            params["sBpCd"]             = $("#sBpCd").val();
                            params["sBpNm"]             = $("#sBpNm").val();
                            params["sInvcGrDtFr"]       = $("#sInvcGrDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sInvcGrDtTo"]       = $("#sInvcGrDtTo").data("kendoExtMaskedDatePicker").value();


                            return kendo.stringify(params);
                        }
                    }
                }
                ,navigatable:false
                ,serverPaging:true
                ,schema:{
                    data:function (result){
                        if(result.total === 0){
                            dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                        }

                        return result.data;
                    }
                    ,total:"total"
                    ,model:{
                       id:"mobisInvcNo"
                      ,fields:{
                            dlrCd         :{ type:"string", editable:false }
                          , invcTp        :{ type:"string", editable:false }
                          , invcDocNo     :{ type:"string", editable:false } //입고번호
                          , invcStatCd    :{ type:"string", editable:false } //입고상태
                          , mobisInvcNo   :{ type:"string", editable:false } //송장번호
                          , invcGrDt      :{ type:"date",   editable:false }
                          , itemQty       :{ type:"number", editable:false }
                          , itemCnt       :{ type:"number", editable:false }
                          , bpCd          :{ type:"string", editable:false }
                          , bpNm          :{ type:"string", editable:false }
                          , regUsrId      :{ type:"string", editable:false }
                          , regUsrNm      :{ type:"string", editable:false }
                          , dcRate        :{ type:"number", editable:false }
                          , vatAmt        :{ type:"number", editable:false }
                          , grTotAmt      :{ type:"number", editable:false }
                          , grTotIncTaxAmt:{ type:"number", editable:false }
                        }
                    }
                }
            }
            ,selectable:"row"
            ,editable:false
            ,autoBind:false
            ,height:280
            ,filterable:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,multiSelectWithCheckbox:true
            , columns:[
                 {field:"invcTp" ,title:"<spring:message code='par.lbl.grGubun' />" ,attributes:{ "class":"ac"} ,width:140
                    ,template:'#= changeInvcTp(invcTp)#'
                    ,hidden:true
                }//입고방식
                ,{field:"invcDocNo" ,title:"<spring:message code='par.lbl.grDocNo' />" ,width:140}//입고문서번호
                ,{field:"invcStatCd" ,title:"<spring:message code='par.lbl.grStatCd' />"
                    ,width:80
                    ,attributes:{ "class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        switch(dataItem.invcStatCd){
                            case "02"://확정.
                                spanObj = "<span class='txt_label bg_yellow'>"+invcStatCdMap[dataItem.invcStatCd]+"</span>";
                                break;
                            case "03"://입고확정.
                                spanObj = "<span class='txt_label bg_blue'>"+invcStatCdMap[dataItem.invcStatCd]+"</span>";
                                break;
                            default: //등록.
                                spanObj = "<span class='txt_label bg_gray'>"+invcStatCdMap[dataItem.invcStatCd]+"</span>";
                                break;
                        }
                        return spanObj;
                    }


                }//입고상태(송장상태)
                ,{field:"invcGrDt" ,title:"<spring:message code='par.lbl.grDt' />" ,format:"{0:<dms:configValue code='dateFormat' />}" ,attributes:{ "class":"ac"} ,width:90 }//입고일
                ,{field:"itemQty" ,title:"<spring:message code='par.lbl.grQty' />" ,width:90 ,attributes:{ "class":"ar"} ,format:"{0:n2}"}//수량
                ,{field:"itemCnt" ,title:"<spring:message code='par.lbl.invcGrCnt' />" ,width:90 ,attributes:{ "class":"ar"} ,format:"{0:n2}"}//건수
                ,{field:"mobisInvcNo" ,title:"<spring:message code='par.lbl.mobisInvcDocNo' />" ,width:180}//BMP송장번호
                ,{field:"regUsrId" ,title:"<spring:message code='par.lbl.ordRegNm' />" ,width:120,hidden:true}//오더인
                ,{field:"regUsrNm" ,title:"<spring:message code='par.lbl.ordRegNm' />" ,width:120}//오더인
                ,{field:"bpNm" ,title:"<spring:message code='par.lbl.bpTp' />" ,width:140 }//업체
                ,{field:"dcRate" ,title:"<spring:message code='par.lbl.taxRate' />" ,width:90 ,attributes:{ "class":"ar"} ,format:"{0:n2}"}//세율
                ,{field:"vatAmt" ,title:"<spring:message code='par.lbl.taxAmt' />" ,width:90 ,attributes:{ "class":"ar"} ,format:"{0:n2}"}//세액
                ,{field:"grTotAmt" ,title:"<spring:message code='par.lbl.grAmt' />" ,width:120 ,attributes:{ "class":"ar"} ,format:"{0:n2}"}//입고금액(세금제외)
                ,{field:"grTotIncTaxAmt" ,title:"<spring:message code='par.lbl.grAmtAddTax' />" ,width:120 ,attributes:{ "class":"ar"} ,format:"{0:n2}"}//입고금액(세금포함)
           ]
        });

        if(options.autoBind){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }

        //  송장유형
        changeInvcTp = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = invcTpObj[val];
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
                if(id === 'sInvcGrDtFr'){
                    var minDate = new Date(sevenDtBf);
                    frYY = minDate.getFullYear();
                    frMM = minDate.getMonth();
                    frDD = minDate.getDate();
                    $("#sInvcGrDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                    $("#sInvcGrDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                }else if(id === 'sInvcGrDtTo'){
                    var maxDate = new Date(toDt);
                    toYY = maxDate.getFullYear();
                    toMM = maxDate.getMonth();
                    toDD = maxDate.getDate();

                    $("#sInvcGrDtTo").data("kendoExtMaskedDatePicker").value(toDt);
                    $("#sInvcGrDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
                }
            }else{
                if(id === 'sInvcGrDtFr'){
                    frYY = this.value().getFullYear();
                    frMM = this.value().getMonth();
                    frDD = this.value().getDate();
                    $("#sInvcGrDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                }else if(id === 'sInvcGrDtTo'){
                    toYY = this.value().getFullYear();
                    toMM = this.value().getMonth();
                    toDD = this.value().getDate();
                    $("#sInvcGrDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
                }
            }


         }

       // $("#grid").data("kendoExtGrid").dataSource.read();
    });

 </script>

