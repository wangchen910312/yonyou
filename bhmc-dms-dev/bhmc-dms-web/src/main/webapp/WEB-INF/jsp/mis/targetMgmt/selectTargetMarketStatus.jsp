<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 년간 목표 등록 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="mis.title.marketstatus" /></h1>
        <div class="btn_right">
			<dms:access viewId="VIEW-D-10773" hasPermission="${dms:getPermissionMask('READ')}">
            	<button class="btn_m btn_search" id="btnTargetDcptMgmtMarketStatusSearch"><spring:message code="global.btn.search" /></button>
			</dms:access>
        </div>
    </div>
    <div class="table_form">
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
                    <th scope="row"><spring:message code="mis.lbl.regyearmonth" /></th>
                    <td>
                        <input type="text" id="sMarketStatusYyMm" name="sMarketStatusYyMm" value="" class="form_comboBox" style="width:150px;"><!-- 조회년월  -->
                    </td>
                    <th scope="row"><spring:message code="mis.lbl.sung" /></th>
                    <td>
                        <input type="text" id="sMarketStatusProvince" name="sMarketStatusProvince" value="" class="form_comboBox" style="width:150px;"><!-- 조회 성 -->
                    </td>
                    <th scope="row"><spring:message code="mis.lbl.city" /></th>
                    <td><input type="text" id="sMarketStatusCity" name="sMarketStatusCity" value="" class="form_comboBox" style="width:150px;"><!-- 조회 시  --></td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="header_area">
        <div class="left_area left_area_v1 ml0">
        </div>
        <div class="btn_right">
		<dms:access viewId="VIEW-D-10772" hasPermission="${dms:getPermissionMask('READ')}">
	        <button type="button" class="btn_s" id="btnTargetDcptMgmtMarketStandardFormat" name="btnTargetDcptMgmtMarketStandardFormat"><spring:message code="mis.btn.standardformatdownload" /></button><!-- 시장현황표준포맷다운로드  -->
		</dms:access>
		<dms:access viewId="VIEW-D-10775" hasPermission="${dms:getPermissionMask('READ')}">
	        <button type="button" class="btn_s" id="btnTargetDcptMgmtMarketStatusFormat" name="btnTargetDcptMgmtMarketStatusFormat"><spring:message code="mis.btn.regformatdownload" /></button><!-- 시장현황자료등록포맷다운로드  -->
		</dms:access>
		<dms:access viewId="VIEW-D-10774" hasPermission="${dms:getPermissionMask('READ')}">
	        <button type="button" class="btn_s" id="btnMarketStatusDataReg" name="btnMarketStatusDataReg"><spring:message code="mis.btn.marketstatusdatareg" /></button><!-- 시장현황자료등록  -->
		</dms:access>
        </div>
    </div>
    <div class="table_info table_info_v2 mt10">
    <!-- 그리드 시작 -->
        <div class="table_grid">
            <div id="grid"></div>
        </div>
    <!-- 그리드 종료 -->
    </div>
    <div class="table_info table_info_v2 mt10">
    <!-- 그리드 시작 -->
        <div class="table_grid">
            <div id="detailGrid"></div>
        </div>
    <!-- 그리드 종료 -->
    </div>
</section>
<!-- //년간 목표 등록 -->


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
                    url:"<c:url value='/mis/tmp/selectManuMarketStatusCity.do' />"
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
            ,optionLabel:" "
        });

        //버튼 - 조회
        $("#btnTargetDcptMgmtMarketStatusSearch").kendoButton({
            click:function(e) {

                if($("#sMarketStatusYyMm").val() == ''){
                    alert("<spring:message code='global.info.required.select'/>");
                    return;
                }

                $('#grid').data('kendoExtGrid').dataSource.page(1);
                $('#detailGrid').data('kendoExtGrid').dataSource.page(1);
            }
        });

        $("#btnTargetDcptMgmtMarketStatusFormat").kendoButton({
            click:function(e) {
                location.href = "<c:url value='/cmm/sci/selectExcelTemplateDownload.do' />" + "?fileNm=TargetDcptMgmt.xlsx";
            }
        });

        $("#btnTargetDcptMgmtMarketStandardFormat").kendoButton({
            click:function(e) {
                location.href = "<c:url value='/cmm/sci/selectExcelTemplateDownload.do' />" + "?fileNm=TargetDcptMgmtStandard.xlsx";
            }
        });

        $("#btnMarketStatusDataReg").kendoButton({
            click:function(e) {
                marketStatusDataRegPopupWin = dms.window.popup({
                    title:"<spring:message code='mis.lbl.marketstatusreg' />"
                    ,windowId:"marketStatusDataRegPopupWin"
                    ,content:{
                         url:"<c:url value='/mis/tmp/selectManuMarketStatusDataRegPopup.do'/>"
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
            gridId:"G-MIS-0910-120000"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/mis/tmp/selectManuMarketStatusGrid.do' />"
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
                        id:"searchDate"
                        ,fields:{
                             searchDate:{type:"string"}
                            ,nameArea:{type:"string"}
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
            ,selectable:false
            ,columns:[
                {field:"searchDate", title:"<spring:message code='mis.lbl.carRegDt' />", width:100, sortable:false, attributes:{"class":"ac"}

                }
                ,{field:"nameArea", title:"<spring:message code='mis.lbl.possessiondivision' />", width:250, sortable:false, attributes:{"class":"ac"}

                }
                ,{field:"localPossessionRate", title:"<spring:message code='mis.lbl.possessionrate' />", width:250, attributes:{"class":"ac"}

                }
                ,{field:"localLastMonthContrast", title:"<spring:message code='mis.lbl.lastmonthcontrast' />", width:250, attributes:{"class":"ac"}

                }
                ,{field:"localLastYearMonth", title:"<spring:message code='mis.lbl.lastyearmonth' />", width:250, attributes:{"class":"ac"}

                }
            ]
        });

        //그리드 설정
        $("#detailGrid").kendoExtGrid({
            //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
            gridId:"G-MIS-0910-120000"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/mis/tmp/selectManuMarketDetailGrid.do' />"
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
                        id:"marketRegYy"
                        ,fields:{
                             marketRegYy:{type:"string"}
                            ,marketRegMm:{type:"string"}
                            ,marketSungCd:{type:"string"}
                            ,marketSungNm:{type:"string"}
                            ,marketCityCd:{type:"string"}
                            ,marketCityNm:{type:"string"}
                            ,refVal:{type:"string"}
                        }
                    }
                }
            }
            ,height:500
            ,filterable:false
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
            ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:false               //Tooltip 적용, default:false
            ,sortable:false
            ,editable:false
            ,columns:[
                {field:"marketSungCd", title:"<spring:message code='mis.lbl.provinceCd' />", width:100, attributes:{"class":"ac"}

                }
                ,{field:"marketSungNm", title:"<spring:message code='mis.lbl.provinceNm' />", width:150

                }
                ,{field:"marketCityCd", title:"<spring:message code='mis.lbl.cityCd' />", width:100, attributes:{"class":"ac"}

                }
                ,{field:"marketCityNm", title:"<spring:message code='mis.lbl.cityNm' />", width:150

                }
                ,{field:"marketRegYy", title:"<spring:message code='mis.lbl.regyear' />", width:80, attributes:{"class":"ac"}

                }
                ,{field:"marketRegMm", title:"<spring:message code='mis.lbl.regmonth' />", width:80, attributes:{"class":"ac"}

                }
                ,{field:"refVal", title:"<spring:message code='mis.lbl.sharerate' />(%)", width:100, attributes:{"class":"ac"}

                }
            ]
        });

    });
</script>
<!-- //script -->

