<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<div id="resizableContainer">
    <!-- 기출고 렌탈 팝업 -->
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
                    <col style="width:12%;">
                    <col style="width:17%;">
                    <col style="width:12%;">
                    <col style="width:30%;">
                    <col style="width:10%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span id="titleGiDocNo"><spring:message code="par.lbl.etcGiDocNo" /><!-- 기타출고문서번호 --></span></th>
                        <td>
                            <input type="text" id="sEtcGiDocNo" class="form_input" />
                        </td>
                        <th scope="row"><span id="titleGiDt"><spring:message code="par.lbl.regDt" /><!-- 등록일 --></span></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sRegDtFr" data-type="maskDate" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sRegDtTo" data-type="maskDate" class="form_datepicker">
                                </div>
                            </div>

                        </td>
                        <th scope="row"><span id="titleGiStat"><spring:message code="par.lbl.docStatCd" /><!-- 문서상태 --></span></th>
                        <td>
                            <input id="sStatCd" data-type="combo" class="form_comboBox" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid mt10">
        <!-- 그리드1 -->
            <div id="grid" class="resizable_grid"></div>
        <!-- 그리드1 -->
        </div>
    <div class="hidden">
        <input type="hidden" id="sBpCd" />
        <input type="hidden" id="sBpNm" />
        <input id="sMvtTp" readonly data-type="combo" class="form_comboBox" />
    </div>
    </section>

</div>

    <!-- //부품선택 팝업 -->

 <script type="text/javascript">

    $(document).ready(function() {

        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         var options             = parent.issueEtcListPopupWindow.options.content.data,
             mvtTpList           = [],
             mvtTpObj            = {},
             statCdList          = [],
             statCdObj           = {};

             <c:forEach var="obj" items="${mvtTpList}">
             mvtTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
             </c:forEach>
             <c:forEach var="obj" items="${statCdList}">
             statCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
             statCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
             </c:forEach>


             $.each(mvtTpList, function(idx, obj){
                 mvtTpObj[obj.cmmCd] = obj.cmmCdNm;
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

                    $.each(rows, function(idx, row){
                        data.push(grid.dataItem(row));
                    });

                    options.callbackFunc(data);
                }
            }
        });

        //기타출고유형선택
        $("#sMvtTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,optionLabel:" "
            ,dataSource:mvtTpList
            ,index:0
        });

        //기타출고상태선택
        $("#sStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,optionLabel:" "
            ,dataSource:statCdList
            ,index:0
        });

        $("#sRegDtFr").kendoExtMaskedDatePicker({
            dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#sRegDtTo").kendoExtMaskedDatePicker({
            dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        /************************************************************
                    조회조건 설정
        *************************************************************/

        // 조회조건 설정
        $("#sEtcGiDocNo").val(options.etcGiDocNo);
        $("#sBpCd").val(options.bpCd);
        $("#sBpNm").val(options.bpNm);
        $("#sMvtTp").data("kendoExtDropDownList").value(options.mvtTp);
        //$("#sStatCd").data("kendoExtDropDownList").value(options.statCd);
        $("#sMvtTp").data("kendoExtDropDownList").enable(false);

        /************************************************************
                    그리드 설정
        *************************************************************/
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0803-145001"
           ,dataSource:{
                transport:{
                    read:{
                          url:"<c:url value='/par/ism/issue/selectIssueEtcs.do' />"
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
                            params["sMvtTp"]             = $("#sMvtTp").data("kendoExtDropDownList").value();
                            params["sEtcGiDocNo"]        = $("#sEtcGiDocNo").val();
                            params["sRegDtFr"]           = $("#sRegDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sRegDtTo"]           = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sStatCd"]            = $("#sStatCd").val();

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
                        id:"etcGiDocNo"
                        , fields:{
                              dlrCd         :{ type:"string" }
                            , bpCd          :{ type:"string" }
                            , bpNm          :{ type:"string" }
                            , etcGiDocNo    :{ type:"string" }
                            , itemCnt       :{ type:"number" }
                            , mvtTp         :{ type:"string" }
                            , regDt         :{ type:"date"   }
                            , statCd        :{ type:"string" }
                            , remark        :{ type:"string" }
                        }
                    }
                }
            }
            ,selectable:"row"
            ,editable:false
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true
            ,height:280
            ,columns:[
                {field:"bpCd"
                     ,title:"<spring:message code='par.lbl.bpCd' />"
                     ,width:105}  //거래처 코드
                ,{field:"bpNm"
                     ,title:"<spring:message code='par.lbl.bpNm' />"
                     ,width:140}  //공급업체
                ,{field:"etcGiDocNo"
                     ,title:"<spring:message code='par.lbl.giDocNo' />"
                     ,width:120}//출고문서번호
                ,{field:"statCd" ,title:"<spring:message code='par.lbl.docStatCd' />" ,width:100
                     ,template:'#= changeStatCd(statCd)#'
                    }//문서상태
                ,{field:"itemCnt"
                     ,title:"<spring:message code='par.lbl.itemCnt' />"
                     ,attributes:{ "style":"text-align:right"}
                     ,width:100} //품목수
                ,{field:"mvtTp"
                     ,title:"<spring:message code='par.lbl.otherGiTp' />"
                     ,template:'#= changeMvtTp(mvtTp)#'
                     ,width:100 }                //기타출고유형
                ,{field:"regDt"
                     ,title:"<spring:message code='par.lbl.regDt' />"
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,attributes:{ "class":"ac"}
                     ,width:90 }                //등록일
                ,{field:"remark"
                     ,title:"<spring:message code='par.lbl.remark' />"
                     ,width:100
                     ,hidden:true}              //비고
            ]
        });
        //  기타출고유형
        changeMvtTp = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = mvtTpObj[val];
            }
            return returnVal;
        };

        //  기타출고상태
        changeStatCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = statCdObj[val];
            }
            return returnVal;
        };

        if(!dms.string.isEmpty(options.mvtTp) && options.mvtTp === '61'){//조달출고 시
            $("#grid thead [data-field=bpCd]").text("<spring:message code='global.lbl.dlrCd' />");
            $("#grid thead [data-field=bpNm]").text("<spring:message code='par.lbl.dealer' />");
            $("#grid thead [data-field=etcGiDocNo]").text("<spring:message code='par.lbl.obtGiDocNo' />");
            $("#grid thead [data-field=regDt]").text("<spring:message code='par.lbl.obtGiDt' />");

            $("#titleBpCd").text("<spring:message code='global.lbl.dlrCd' />");
            $("#titleGiDocNo").text("<spring:message code='par.lbl.obtGiDocNo' />");
            $("#titleGiDt").text("<spring:message code='par.lbl.obtGiDt' />");

        }else if(!dms.string.isEmpty(options.mvtTp) && options.mvtTp === '47'){//차출출고 시
            $("#titleGiDocNo").text("<spring:message code='par.lbl.giDocNo' />");
            $("#titleGiDt").text("<spring:message code='par.lbl.giDt' />");
            $("#titleGiStat").text("<spring:message code='par.lbl.giStatNm' />");
            $("#grid thead [data-field=mvtTp]").text("<spring:message code='par.lbl.giTp' />");
            $("#grid thead [data-field=statCd]").text("<spring:message code='par.lbl.giStatNm' />");
            $("#grid thead [data-field=regDt]").text("<spring:message code='par.lbl.giDt' />");
        }
    });

 </script>

