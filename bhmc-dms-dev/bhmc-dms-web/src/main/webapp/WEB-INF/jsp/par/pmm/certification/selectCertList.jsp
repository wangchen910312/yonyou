<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 부품목록 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <div class="btn_left">
			<dms:access viewId="VIEW-D-11970" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
			</dms:access>
            </div>
            <div class="btn_right">
			<dms:access viewId="VIEW-D-11969" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_link" id="btnReg"><spring:message code="par.btn.create" /><!-- 등록 --></button>
			</dms:access>
			<dms:access viewId="VIEW-D-11968" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
			</dms:access>
            </div>
        </div>
        <div class="table_form form_width_70per"  role="search" data-btnid="btnSearch">
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
                        <th scope="row"><spring:message code="crm.lbl.requestUsrNm" /></th><!-- 신청자 -->
                        <td class="required_area">
                            <div class="form_search">
                                <input id="sCustNo" name="custNo" class="form_input form_readonly hidden" readonly data-json-obj="true" />
                                <input id="sCustNm" name="custNm" class="form_input form_readonly" data-json-obj="true" />
                                <a id="searchCustNo"><!--신청인 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="global.lbl.statNm" /><!-- 합격증상태코드 --></th>
                        <td>
                            <input id="sCertStatCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.type" /><!-- 합격증유형 --></th>
                        <td>
                            <input id="sCertTp" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.regDt" /><!-- 신청시간 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input class="form_datepicker" id="sRegDtFr">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input class="form_datepicker" id="sRegDtTo">
                                </div>
                            </div>
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
    </section>
    <!-- //부품목록 -->
</div>
    <!-- script -->
    <script>
    var pCertNo
        ,rowNumber = 0 //그리드 목록 번호
        ,certTpList = []
        ,certTpMap = {}
        ,certStatList = []
        ,certStatMap = {}
        ,sessionDlrCd = "${dlrInfo.dlrCd}"
        ,sessionDlrNm = "${dlrInfo.dlrNm}";

    //certTpList
    <c:forEach var="obj" items="${certTpList}">
       certTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    //certTpMap
    $.each(certTpList, function(idx, obj){
       certTpMap[obj.cmmCd] = obj.cmmCdNm;
    });
    //certStatList
    <c:forEach var="obj" items="${certStatList}">
       if("${obj.useYn}" !== 'N'){
           certStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
       }
    </c:forEach>
    //certStatMap
    $.each(certStatList, function(idx, obj){
       certStatMap[obj.cmmCd] = obj.cmmCdNm;
    });
    //페이지 초기화.
    function initPage(){
        var minDate = new Date('1999-12-31'),
            maxDate = new Date('9999-12-31'),
            toYY,
            toMM,
            toDD,
            frYY,
            frMM,
            frDD;

        frYY = minDate.getFullYear();
        frMM = minDate.getMonth();
        frDD = minDate.getDate();

        toYY = maxDate.getFullYear();
        toMM = maxDate.getMonth();
        toDD = maxDate.getDate();
        //그리드 reset
        $("#grid").data("kendoExtGrid").dataSource.data([]);
        //그리드 reset
        $("#sCustNo").val("");
        $("#sCustNm").val("");
        $("#sCertStatCd").data("kendoExtDropDownList").value("");
        $("#sRegDtFr").data("kendoExtMaskedDatePicker").value("");
        $("#sRegDtTo").data("kendoExtMaskedDatePicker").value("");
        $("#sCertTp").data("kendoExtDropDownList").value("");
        $("#sRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        $("#sRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));


    }
    //신청자 팝업
    function selectCustSearchPopupWindow(){

        popupWindow = dms.window.popup({
            windowId:"customerSearchPopup"
            ,title:"<spring:message code='par.title.custSearch' />"//고객조회
            ,content:{
                url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                ,data:{
                    "autoBind":true
                    ,"type"  :null
                    ,"callbackFunc":function(data){
                        if(data.length >= 1) {
                            $("#sCustNo").val(data[0].custNo);
                            $("#sCustNm").val(data[0].custNm);

                            popupWindow.close();

                        }
                    }
                }
            }
        });
    }

   /**
   * hyperlink in grid event
   */
    $(document).on("click", ".linkCertNo", function(e){
        var thisName = $(this).data("name");
        var grid = $("#grid").data("kendoExtGrid"),
        row = $(e.target).closest("tr");
        //k-state-selected remove all
        grid.tbody.find('>tr').each(function(){
            $(this).removeClass("k-state-selected");
        });
        //k-state-selected add
        row.addClass("k-state-selected");
        var dataItem = grid.dataItem(row);
        //partCertReq tab window open
        window.parent._createOrReloadTabMenu("<spring:message code='par.menu.partCertReq' />", "<c:url value='/par/pmm/certification/selectCertReqMain.do' />?pCertNo="+dataItem.certNo, "VIEW-D-10539", true); //합격증신청
    });

    $(document).ready(function() {
        //조회조건-상태
        $("#sCertStatCd").kendoExtDropDownList({
            dataSource:certStatList
            ,dataTextField :"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,optionLabel:" "
        });
        //조회조건-유형
        $("#sCertTp").kendoExtDropDownList({
            dataSource:certTpList
            ,dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,optionLabel:" "
        });
        //조회조건-신청일
        $("#sRegDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });
        //조회조건-종료일
        $("#sRegDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });
        //조회조건-신청자
        $("#searchCustNo").on('click', selectCustSearchPopupWindow);
        // 등록 버튼
        $("#btnReg").kendoButton({
            click:function(e) {
                window.parent._createOrReloadTabMenu("<spring:message code='par.menu.partCertReq' />", "<c:url value='/par/pmm/certification/selectCertReqMain.do' />","VIEW-D-10539", true); //합격증신청
            }
        });
        //초기화버튼
        $("#btnInit").kendoButton({
            click:function(e){
                initPage();
            }
        });
        //조회 버튼.
        $("#btnSearch").kendoButton({
            click:function(e){
                $("#grid").data("kendoExtGrid").dataSource.read();
            }
        });
        //그리드
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0712-210497"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/certification/selectCertListByCondition.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sCustNo"] = $("#sCustNo").val();
                            params["sCertStatCd"] = $("#sCertStatCd").data("kendoExtDropDownList").value();
                            params["sRegDtFr"] = $("#sRegDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sRegDtTo"] = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sCertTp"] = $("#sCertTp").data("kendoExtDropDownList").value();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    data:function (result){
                        return result.data;
                    }
                    ,model:{
                        id:"certNo"
                        ,fields:{
                            dlrCd:{ type:"string" }
                            ,rnum:{ type:"string" }
                            ,certNo:{ type:"string" }
                            ,certReqNo:{ type:"string" }
                            ,certTp:{ type:"string" }
                            ,certStatCd:{ type:"string" }
                            ,custNm:{ type:"string" }
                            ,regDt:{ type:"date" }
                        }
                    }
                }
            }
            ,selectable:"row"
            ,scrollable:true
            ,autoBind:false
            ,appendEmptyColumn:true//빈컬럼 적용. default:false
            ,editable:false
            ,dataBinding :function(e){
            }
            ,columns:[
                {field:"rnum" ,title:"<spring:message code='par.lbl.no'  />" ,attributes:{"class":"ac"} ,sortable:false ,width:30}//No
                ,{field:"certNo" ,title:"<spring:message code='par.lbl.certDocNo' />" ,width:140
                    ,template:function(dataItem){
                         var spanObj = "<a href='#' class='linkCertNo'>"+dataItem.certNo+"</a>";
                         return spanObj;
                    }
                }//신청번호
                ,{field:"certReqNo" ,title:"<spring:message code='par.lbl.certReqNo' />" ,width:150}//합격증신청번호
                ,{field:"certStatCd" ,attributes:{"class":"ac"} ,title:"<spring:message code='global.lbl.statNm' />" ,width:120
                    ,template:function(dataItem){
                        var spanObj = "";
                        switch(dataItem.certStatCd){
                            case "02"://심사
                                spanObj = "<span class='txt_label bg_green'>"+certStatMap[dataItem.certStatCd]+"</span>";
                                break;
                            case "03"://처리완료
                                spanObj = "<span class='txt_label bg_blue'>"+certStatMap[dataItem.certStatCd]+"</span>";
                                break;
                            case "04"://수정
                                spanObj = "<span class='txt_label bg_yellow'>"+certStatMap[dataItem.certStatCd]+"</span>";
                                break;
                            case "05"://삭제
                                spanObj = "<span class='txt_label bg_red'>"+certStatMap[dataItem.certStatCd]+"</span>";
                                break;
                            default: // ready:request
                                spanObj = "<span class='txt_label bg_gray'>"+certStatMap[dataItem.certStatCd]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }//합격증상태
                ,{field:"custNm" ,title:"<spring:message code='sal.lbl.requestUsr' />" ,attributes:{"class":"ac"} ,width:120}//신청인
                ,{field:"regDt" ,title:"<spring:message code='sal.lbl.reqDt' />" ,attributes:{"class":"ac"} ,format:"{0:<dms:configValue code='dateFormat' />}" ,width:100}//입력시간
                ,{field:"certTp" ,title:"<spring:message code='global.lbl.type' />" ,attributes:{"class":"ac"} ,width:100
                    ,template:function(dataItem){
                        var spanObj = spanObj = "<span class='txt_label bg_gray'>"+certTpMap[dataItem.certTp]+"</span>"
                        return spanObj;
                    }
                }//유형
            ]
        });

        initPage();

    });

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
            if(id === 'sRegDtFr'){
                var minDate = new Date(sevenDtBf);
                frYY = minDate.getFullYear();
                frMM = minDate.getMonth();
                frDD = minDate.getDate();
                $("#sRegDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                $("#sRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sRegDtTo'){
                var maxDate = new Date(toDt);
                toYY = maxDate.getFullYear();
                toMM = maxDate.getMonth();
                toDD = maxDate.getDate();

                $("#sRegDtTo").data("kendoExtMaskedDatePicker").value(toDt);
                $("#sRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }else{
            if(id === 'sRegDtFr'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sRegDtTo'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }


     }

</script>
<!-- //script -->

