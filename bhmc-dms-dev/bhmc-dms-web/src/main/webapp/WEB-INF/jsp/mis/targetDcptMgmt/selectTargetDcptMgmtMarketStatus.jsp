<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div class="header_area">
    <div class="left_area ml0">
        <span class="span_txt"><spring:message code="mis.lbl.conditionsearchbox" /></span><!-- 조건검색  -->
        <input type="text" id="sMarketStatusYyMm" name="sMarketStatusYyMm" value="" class="form_comboBox" style="width:150px;"><!-- 조회년월  -->
        <input type="text" id="sMarketStatusProvince" name="sMarketStatusProvince" value="" class="form_comboBox" style="width:150px;"><!-- 조회 성 -->
        <input type="text" id="sMarketStatusCity" name="sMarketStatusCity" value="" class="form_comboBox" style="width:150px;"><!-- 조회 시  -->
        <button type="button" class="btn_s" id="btnTargetDcptMgmtMarketStatusSearch" name="btnTargetDcptMgmtMarketStatusSearch"><spring:message code="global.btn.search" /></button><!-- 시장현황자료조회  -->
        <!-- <button type="button" class="btn_s" id="btnTargetDcptMgmtMarketStatusFormat" name="btnTargetDcptMgmtMarketStatusFormat"><spring:message code="mis.btn.regformatdownload" /></button> --><!-- 시장현황자료등록포맷다운로드  -->
        <!-- <button type="button" class="btn_s" id="btnMarketStatusDataReg" name="btnMarketStatusDataReg"><spring:message code="mis.btn.marketstatusdatareg" /></button> --><!-- 시장현황자료등록  -->
    </div>
</div>
<br>
<div class="table_info table_info_v2 mt10">
    <!-- 그리드 시작 -->
    <div class="table_grid">
        <div id="grid"></div>
    </div>
    <!-- 그리드 종료 -->
</div>
<!-- script -->
<script type="text/javascript">

    var marketStatusDataRegPopupWin;

    var arrProvinceInfo = [{"provinceCd":"", "provinceNm":""}];
    <c:forEach var="obj" items="${arrProvinceInfo}">
    arrProvinceInfo.push({"provinceCd":"${obj.provinceCd}", "provinceNm":"${obj.provinceNm}"});
    </c:forEach>

    var arrCityInfo = [{"cityCd":"", "cityNm":""}];
    <c:forEach var="obj" items="${arrCityInfo}">
    arrCityInfo.push({"cityCd":"${obj.cityCd}", "cityNm":"${obj.cityNm}"});
    </c:forEach>

    $(document).ready(function() {

        $("#sMarketStatusYyMm").kendoDatePicker({
            value:"${sysdate}"
           ,start:"year"
           ,depth:"year"
           ,format:"yyyyMM"
        });

        $("#sMarketStatusYyMm").kendoMaskedTextBox({
            mask:"######"
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

        $("#sMarketStatusYyMm").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2));

        $("#sMarketStatusProvince").kendoExtDropDownList({
            dataSource:arrProvinceInfo
            ,dataTextField:"provinceNm"
            ,dataValueField:"provinceCd"
            ,index:0
            ,select:function(e){

                var dataItem = this.dataItem(e.item);

                var responseJson = dms.ajax.getJson({
                    url:"<c:url value='/mis/tdm/selectMarketStatusCity.do' />"
                    ,data:JSON.stringify({"provinceCd":dataItem.provinceCd})
                    ,async:false
                });

                $("#sMarketStatusCity").data("kendoExtDropDownList").setDataSource(responseJson.data);
            }
        });

        $("#sMarketStatusCity").kendoExtDropDownList({
            dataSource:arrCityInfo
            ,dataTextField:"cityNm"
            ,dataValueField:"cityCd"
            ,index:0
        });

        //버튼 - 조회
        $("#btnTargetDcptMgmtMarketStatusSearch").kendoButton({
            click:function(e) {

                if($("#sMarketStatusYyMm").val() == ''){
                    alert("<spring:message code='global.info.required.select'/>");
                    return;
                }

                $('#grid').data('kendoExtGrid').dataSource.page(1);
            }
        });

        $("#btnTargetDcptMgmtMarketStatusFormat").kendoButton({
            click:function(e) {
                location.href = "<c:url value='/cmm/sci/selectExcelTemplateDownload.do' />" + "?fileNm=TargetDcptMgmt.xlsx";
            }
        });

        $("#btnMarketStatusDataReg").kendoButton({
            click:function(e) {
                marketStatusDataRegPopupWin = dms.window.popup({
                    title:"<spring:message code='mis.lbl.marketstatusreg' />"
                    ,windowId:"marketStatusDataRegPopupWin"
                    ,content:{
                         url:"<c:url value='/mis/tdm/selectMarketStatusDataRegPopup.do'/>"
                        ,data:{
                            "callbackFunc":function(){
                                $('#grid').data('kendoExtGrid').dataSource.read();
                            }
                        }
                    }
                });
            }
        });

      //그리드 설정
        $("#grid").kendoExtGrid({
            //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
            gridId:"G-MIS-0831-194300"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/mis/tdm/selectTargetDcptMgmtMarketStatusGrid.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sMarketStatusYyMm"] = $("#sMarketStatusYyMm").val();
                            params["sMarketStatusProvince"] = $("#sMarketStatusProvince").val();
                            params["sMarketStatusCity"] = $("#sMarketStatusCity").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"nameArea"
                        ,fields:{
                             nameArea:{type:"string"}
                            ,localPossessionRate:{type:"string"}
                            ,localLastMonthContrast:{type:"string"}
                            ,localLastYearMonth:{type:"string"}
                        }
                    }
                }
            }
            ,height:125
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
                {field:"nameArea", title:"<spring:message code='mis.lbl.possessiondivision' />", width:250, sortable:false, attributes:{"class":"ac"}

                }
                ,{field:"localPossessionRate", title:"<spring:message code='mis.lbl.possessionrate' />", width:250, attributes:{"class":"ac"}

                }
                ,{field:"localLastMonthContrast", title:"<spring:message code='mis.lbl.lastmonthcontrast' />", width:250, attributes:{"class":"ac"}

                }
                ,{field:"localLastYearMonth", title:"<spring:message code='mis.lbl.lastyearmonth' />", width:250, attributes:{"class":"ac"}

                }
            ]
        });



    });
</script>