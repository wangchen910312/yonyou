<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<%--
    JSP Name :selectProcessMgmtSearch.jsp
    Description :과정관리
    author chibeom.song
    since 2016. 9. 20.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2016. 9. 20.   chibeom.song     최초 생성
--%>
<!-- 과정 모니터링 -->
<section class="group">
    <div class="mt0">
        <div class="header_area">
            <div class="left_area ml0">
                <span class="span_txt"><spring:message code="mis.lbl.dcptdate" /></span>
                <input type="text" id="sDcptProcessDate" name="sDcptProcessDate" style="width:150px;background-color:#EAEAEA;" readonly>&nbsp;&nbsp;
                <span class="span_txt"><spring:message code="mis.lbl.timeprocess" /></span>
                <input type="text" id="sTimeProcessProcess" name="sTimeProcessProcess" style="width:150px;background-color:#EAEAEA;" readonly>&nbsp;&nbsp;
                <span class="span_txt"><spring:message code="mis.lbl.monitordate" /></span>
                <input type="text" id="sMonitorProcessDate" name="sMonitorProcessDate" value="${targetDcptStepSearchVO.sMonitorProcessDate}" style="width:150px;" class="form_comboBox" >
                <dms:access viewId="VIEW-D-10812" hasPermission="${dms:getPermissionMask('READ')}">
                	<button type="button" class="btn_s" id="btnTargetDcptProcessSearch" name="btnTargetDcptProcessSearch"><spring:message code="global.btn.search" /></button>
                </dms:access>
            </div>
        </div>
        <div class="header_area pt0">
            <h2 class="title_basic"><spring:message code="mis.lbl.sale" /></h2>
        </div>
        <!-- 그리드 시작 -->
        <div class="table_info table_info_v2 mt10">
            <div class="table_grid">
                <div id="saleGrid"></div>
            </div>
        </div>
        <!-- 그리드 종료 -->
        <p class="mt5">* <spring:message code="mis.lbl.dateprocessing" />:<spring:message code="mis.lbl.dateprocessingcomment" /></p><!-- * 일진도:판매목표 대비 일진도 미달 시 경고 표시  -->
        <div class="header_area pt0">
            <h2 class="title_basic"><spring:message code="mis.lbl.custrecruit" /></h2>
        </div>
        <!-- 그리드 시작 -->
        <div class="table_info table_info_v2 mt10">
            <div class="table_grid">
                <div id="custGrid"></div>
            </div>
        </div>
        <!-- 그리드 종료 -->
        <p class="mt5">* <spring:message code="mis.lbl.dateprocessing" />:<spring:message code="mis.lbl.datecustcomment" /></p><!-- * 일진도:집객목표 대비 일진도 미달 시 경고 표시  -->
    </div>
</section>
<!-- 과정 모니터링 -->
<script type="text/javascript">

    $(document).ready(function() {

        $("#sMonitorProcessDate").kendoDatePicker({
            value:"${sysdate}"
            ,format:"yyyyMMdd"
            ,parseFormats:["yyyyMMdd"]
        });

        $("#sMonitorProcessDate").kendoMaskedTextBox({
            mask:"########"
        });

        var now = new Date();

        function leadingZeros(n, digits) {
            var zero = '';
            n = n.toString();
            if (n.length < digits) {
                for (i = 0; i < digits - n.length; i++)
                    zero += '0';
            }
            return zero + n;
        }

        if('${targetPcsMnrSearchVO.sMonitorProcessDate}' == "" || '${targetPcsMnrSearchVO.sMonitorProcessDate}' == 'null') {
            $("#sMonitorProcessDate").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2) + leadingZeros(now.getDate(), 2));
        } else {
            $("#sMonitorProcessDate").val('${targetPcsMnrSearchVO.sMonitorProcessDate}');
        }

        var sMonitorDate = $("#sMonitorProcessDate").val();
        var sMonitorYear = sMonitorDate.substr(0,4);
        var sMonitorMonth = sMonitorDate.substr(4,2);
        var sMonitorDay = sMonitorDate.substr(6,2);
        var sMonitorLastDay = (new Date(sMonitorYear,sMonitorMonth, 0)).getDate();

        $("#sDcptProcessDate").val(sMonitorYear + sMonitorMonth + '01');
        $("#sTimeProcessProcess").val(Math.round((sMonitorDay/sMonitorLastDay)*100)+'%');

        //버튼 - 조회
        $("#btnTargetDcptProcessSearch").kendoButton({
            click:function(e) {

                var sMonitorDate = $("#sMonitorProcessDate").val();
                var sMonitorYear = sMonitorDate.substr(0,4);
                var sMonitorMonth = sMonitorDate.substr(4,2);
                var sMonitorDay = sMonitorDate.substr(6,2);
                var sMonitorLastDay = (new Date(sMonitorYear,sMonitorMonth, 0)).getDate();

                $("#sDcptProcessDate").val(sMonitorYear + sMonitorMonth + '01');
                $("#sTimeProcessProcess").val(Math.round((sMonitorDay/sMonitorLastDay)*100)+'%');

                $('#saleGrid').data('kendoExtGrid').dataSource.page(1);
                $('#custGrid').data('kendoExtGrid').dataSource.page(1);
            }
        });

        //그리드 설정
        $("#saleGrid").kendoExtGrid({
            //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
            gridId:"G-MIS-0925-114406"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/mis/tpm/selectDealerSaleProcessGrid.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sMonitorProcessDate"] = $("#sMonitorProcessDate").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"nameGubn"
                        ,fields:{
                             nameGubn:{type:"string"}
                            ,nameChannel:{type:"string"}
                            ,totalDayGoalVal:{type:"number"}
                            ,totalDayDealRate:{type:"number"}
                            ,totalDayGapVal:{type:"string"}
                            ,totalMonthGapVal:{type:"string"}
                            ,totalYearGapVal:{type:"string"}
                        }
                    }
                }
            }
            ,height:110
            ,filterable:false
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
            ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:false               //Tooltip 적용, default:false
            ,editable:false
            ,sortable:false
            ,pageable:false
            ,columns:[
                {field:"nameChannel", title:"<spring:message code='mis.lbl.salechannel' />", width:220, attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        if(dataItem.nameChannel == "I"){
                            return '<spring:message code="mis.lbl.idcc" />';
                        } else if(dataItem.nameChannel == "M"){
                            return '<spring:message code="mis.lbl.market" />';
                        }
                        return '-';
                    }
                }
                ,{field:"totalDayGoalVal", title:"<spring:message code='mis.lbl.salesqty' />", width:220, attributes:{"class":"ac"}

                }
                ,{field:"totalDayDealRate", title:"<spring:message code='mis.lbl.salesrate' />", width:220, attributes:{"class":"ac"}

                }
                ,{field:"totalDayGapVal", title:"<spring:message code='mis.lbl.gapvalue' />", width:220, attributes:{"class":"ac"}

                }
                ,{field:"totalDayGapVal", title:"<spring:message code='mis.lbl.processday' />", width:220, attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                            if (dataItem.totalDayGapVal <= '0') {
                                spanObj = "<span class='ico_circle green'></span>";
                            } else if (dataItem.totalDayGapVal  > '0') {
                                spanObj = "<span class='ico_circle red'></span>";
                            }
                        return spanObj;
                    }
                }
                ,{field:"totalMonthGapVal", title:"<spring:message code='mis.lbl.lastmonth' />", width:220, attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                            if (dataItem.totalMonthGapVal <= '0') {
                                spanObj = "<span class='ico_circle green'></span>";
                            } else if (dataItem.totalMonthGapVal > '0') {
                                spanObj = "<span class='ico_circle red'></span>";
                            }
                        return spanObj;
                    }
                }
            ]
        });

        //그리드 설정
        $("#custGrid").kendoExtGrid({
            //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
            gridId:"G-MIS-0925-131010"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/mis/tpm/selectDealerCustProcessGrid.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sMonitorProcessDate"] = $("#sMonitorProcessDate").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"nameGubn"
                        ,fields:{
                             nameGubn:{type:"string"}
                            ,nameChannel:{type:"string"}
                            ,totalDayGoalVal:{type:"number"}
                            ,totalDayDealRate:{type:"number"}
                            ,totalDayGapVal:{type:"string"}
                            ,totalMonthGapVal:{type:"string"}
                            ,totalYearGapVal:{type:"string"}
                        }
                    }
                }
            }
            ,height:110
            ,filterable:false
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
            ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:false               //Tooltip 적용, default:false
            ,editable:false
            ,sortable:false
            ,pageable:false
            ,columns:[
                {field:"nameChannel", title:"<spring:message code='mis.lbl.salechannel' />", width:220, attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        if(dataItem.nameChannel == "I"){
                            return '<spring:message code="mis.lbl.idcc" />';
                        } else if(dataItem.nameChannel == "M"){
                            return '<spring:message code="mis.lbl.market" />';
                        }
                        return '-';
                    }
                }
                ,{field:"totalDayGoalVal", title:"<spring:message code='mis.lbl.salesqty' />", width:220, attributes:{"class":"ac"}

                }
                ,{field:"totalDayDealRate", title:"<spring:message code='mis.lbl.salesrate' />", width:220, attributes:{"class":"ac"}

                }
                ,{field:"totalDayGapVal", title:"<spring:message code='mis.lbl.gapvalue' />", width:220, attributes:{"class":"ac"}

                }
                ,{field:"totalDayGapVal", title:"<spring:message code='mis.lbl.processday' />", width:220, attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                            if (dataItem.totalDayGapVal <= '0') {
                                spanObj = "<span class='ico_circle green'></span>";
                            } else if (dataItem.totalDayGapVal  > '0') {
                                spanObj = "<span class='ico_circle red'></span>";
                            }
                        return spanObj;
                    }
                }
                ,{field:"totalMonthGapVal", title:"<spring:message code='mis.lbl.lastmonth' />", width:220, attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                            if (dataItem.totalMonthGapVal <= '0') {
                                spanObj = "<span class='ico_circle green'></span>";
                            } else if (dataItem.totalMonthGapVal > '0') {
                                spanObj = "<span class='ico_circle red'></span>";
                            }
                        return spanObj;
                    }
                }
            ]
        });


    });

</script>