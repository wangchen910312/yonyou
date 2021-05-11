<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<%--
    JSP Name :selectDealerCustAchieveSearch.jsp
    Description :딜러현황(집객달성현황)
    author chibeom.song
    since 2016. 9. 20.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2016. 9. 20.   chibeom.song     최초 생성
--%>
<!-- 딜러현황(집객달성현황) -->
<section class="group">
    <div class="mt0">
        <div class="header_area">
            <div class="left_area ml0">
                <span class="span_txt"><spring:message code="mis.lbl.dcptdate" /></span>
                <input type="text" id="sDcptAchieveDate" name="sDcptAchieveDate" style="width:150px;background-color:#EAEAEA;" readonly>&nbsp;&nbsp;
                <span class="span_txt"><spring:message code="mis.lbl.timeprocess" /></span>
                <input type="text" id="sTimeAchieveProcess" name="sTimeAchieveProcess" style="width:150px;background-color:#EAEAEA;" readonly>&nbsp;&nbsp;
                <span class="span_txt"><spring:message code="mis.lbl.monitordate" /></span>
                <input type="text" id="sMonitorAchieveDate" name="sMonitorAchieveDate" value="${targetDcptStepSearchVO.sMonitorAchieveDate}" style="width:150px;" class="form_comboBox" >
                <dms:access viewId="VIEW-D-10813" hasPermission="${dms:getPermissionMask('READ')}">
                	<button type="button" class="btn_s" id="btnTargetDcptAchieveSearch" name="btnTargetDcptAchieveSearch"><spring:message code="global.btn.search" /></button>
                </dms:access>
            </div>
        </div>
        <div class="header_area pt0">
            <h2 class="title_basic"><spring:message code="mis.lbl.custprocessmnr" /></h2>
        </div>
    <div class="table_info table_info_v2 mt5">
        <!-- 그리드 시작 -->
        <div class="table_grid">
            <div id="achieveGrid"></div>
        </div>
        <!-- 그리드 종료 -->
    </div>
    <p class="mt5">* <spring:message code="mis.lbl.processday" />:<spring:message code="mis.lbl.datecustcomment" /></p>
    </div>
</section>
<script type="text/javascript">

    $(document).ready(function() {

        $("#sMonitorAchieveDate").kendoDatePicker({
            value:"${sysdate}"
            ,format:"yyyyMMdd"
            ,parseFormats:["yyyyMMdd"]
        });

        $("#sMonitorAchieveDate").kendoMaskedTextBox({
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

        if('${targetPcsMnrSearchVO.sMonitorAchieveDate}' == "" || '${targetPcsMnrSearchVO.sMonitorAchieveDate}' == 'null') {
            $("#sMonitorAchieveDate").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2) + leadingZeros(now.getDate(), 2));
        } else {
            $("#sMonitorAchieveDate").val('${targetPcsMnrSearchVO.sMonitorAchieveDate}');
        }

        var sMonitorDate = $("#sMonitorAchieveDate").val();
        var sMonitorYear = sMonitorDate.substr(0,4);
        var sMonitorMonth = sMonitorDate.substr(4,2);
        var sMonitorDay = sMonitorDate.substr(6,2);
        var sMonitorLastDay = (new Date(sMonitorYear,sMonitorMonth, 0)).getDate();

        $("#sDcptAchieveDate").val(sMonitorYear + sMonitorMonth + '01');
        $("#sTimeAchieveProcess").val(Math.round((sMonitorDay/sMonitorLastDay)*100)+'%');

        //버튼 - 조회
        $("#btnTargetDcptAchieveSearch").kendoButton({
            click:function(e) {

                var sMonitorDate = $("#sMonitorAchieveDate").val();
                var sMonitorYear = sMonitorDate.substr(0,4);
                var sMonitorMonth = sMonitorDate.substr(4,2);
                var sMonitorDay = sMonitorDate.substr(6,2);
                var sMonitorLastDay = (new Date(sMonitorYear,sMonitorMonth, 0)).getDate();

                $("#sDcptAchieveDate").val(sMonitorYear + sMonitorMonth + '01');
                $("#sTimeAchieveProcess").val(Math.round((sMonitorDay/sMonitorLastDay)*100)+'%');

                $('#achieveGrid').data('kendoExtGrid').dataSource.page(1);
            }
        });

        //그리드 설정
        $("#achieveGrid").kendoExtGrid({
            //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
            gridId:"G-MIS-0925-103559"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/mis/tpm/selectDealerCustAchieveGrid.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sMonitorAchieveDate"] = $("#sMonitorAchieveDate").val();
                            //params["sCustChannel"] = $("sCustChannel").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"targetAchieveCarlineCd"
                        ,fields:{
                             targetAchieveCarlineCd:{type:"string"}
                            ,sumAllCustVsitCnt:{type:"string"}
                            ,monthGoalPrefVal:{type:"string"}
                            ,dayGoalPrefVal:{type:"string"}
                            ,gapTodatCUstVsitCnt:{type:"number"}
                            ,sumCustVsitCnt:{type:"number"}
                            ,gapCustVsitCnt:{type:"number"}
                            ,lastMonthGoalPrefVal:{type:"number"}
                            ,lastMonthCustVsitCnt:{type:"number"}
                            ,gapMonthCustVsitCnt:{type:"number"}
                            ,prosMonthCustVsitPer:{type:"string"}
                            ,lastYearGoalPrefVal:{type:"number"}
                            ,lastYearCustVsitCnt:{type:"number"}
                            ,gapYearCustVsitCnt:{type:"number"}
                            ,prosYearCustVsitPer:{type:"string"}
                            ,lastMonthName:{type:"string"}
                            ,lastYearhName:{type:"string"}

                        }
                    }
                }
            }
            ,height:600
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
                {field:"targetAchieveCarlineCd", title:"<spring:message code='mis.lbl.dealermodel' />", width:100, sortable:false, attributes:{"class":"ac"}

                }
                ,{field:"sumAllCustVsitCnt", title:"<spring:message code='mis.lbl.attractiondaycnt' />", width:150, format:"{0:n0}", sortable:false, attributes:{"class":"ac"}

                }
                ,{field:"sumCustVsitCnt", title:"<spring:message code='mis.lbl.attractiondaytotalcnt' />", width:150, format:"{0:n0}", attributes:{"class":"ac"}

                }
                ,{field:"gapTodatCUstVsitCnt", title:"<spring:message code='mis.lbl.gap' />", width:150, format:"{0:n0}", attributes:{"class":"ac"}

                }
                ,{field:"prosMonthCustVsitPers", title:"<spring:message code='mis.lbl.totalprocessing' />", width:150, format:"{0:n0}", attributes:{"class":"ac"}

                }
                ,{field:"dayGoalPrefVal", title:"<spring:message code='mis.lbl.processday' />", width:200, attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                            if (dataItem.gapTodatCUstVsitCnt <= '0') {
                                spanObj = "<span class='ico_circle green'></span>";
                            } else if (dataItem.gapTodatCUstVsitCnt  > '0') {
                                spanObj = "<span class='ico_circle red'></span>";
                            }
                        return spanObj;
                    }
                }
            ]
        });


    });

</script>
<!-- 딜러현황(집객달성현황) -->