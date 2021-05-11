<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 년월간 목표 등록 -->
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic title_basic_v1"><spring:message code="mis.title.targetsearchmgmt" /></h1>
        <div class="btn_right">
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <div class="table_form" role="search" data-btnid="btnSearch">
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
                    <th scope="row"><span class="bu_required"><spring:message code="mis.lbl.targetYear" /></span><!-- 목표년도 --></th>
                    <td><input type="text" id="sGoalYy" name="sGoalYy" class="form_datepicker" maxlength="4"></td>
                    <th scope="row"><spring:message code="mis.lbl.division" /><!-- 사업부 --></th>
                    <td><input type="text" id="sSdptCd" name="sSdptCd" class="form_comboBox"></td>
                    <th scope="row"><spring:message code="mis.lbl.officeNm" /><!-- 사무소 --></th>
                    <td><input type="text" id="sOfficeCd" name="sOfficeCd" class="form_comboBox"></td>
                    <th scope="row"><spring:message code="mis.lbl.dealerNm" /><!-- 딜러사 --></th>
                    <td><input type="text" id="sDealerCd" name="sDealerCd" class="form_comboBox"></td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="header_area">
        <div class="btn_right">
            <button type="button" class="btn_s" id="btnExcelExport"><spring:message code="global.btn.excelExport" /></button>
        </div>
    </div>
    <div class="table_info table_info_v2 mt10">
        <!-- 그리드 시작 -->
        <div class="table_grid">
            <div id="grid"></div>
        </div>
        <!-- 그리드 종료 -->
    </div>
</section>
<!-- //년월간 목표 등록 -->

<script>

var sdptList = [{"sdptCd":"", "sdptNm":""}];
<c:forEach var="obj" items="${sdptList}">
sdptList.push({"sdptCd":"${obj.sdptCd}", "sdptNm":"${obj.sdptNm}"});
</c:forEach>

var officeList = [{"officeCd":"", "officeNm":""}];
<c:forEach var="obj" items="${officeList}">
officeList.push({"officeCd":"${obj.officeCd}", "officeNm":"${obj.officeNm}"});
</c:forEach>

var dealerList = [{"dlrCd":"", "dlrNm":""}];
<c:forEach var="obj" items="${dealerList}">
dealerList.push({"dlrCd":"${obj.dlrCd}", "dlrNm":"${obj.dlrNm}"});
</c:forEach>

    $(document).ready(function() {

        //목표년도
        $("#sGoalYy").kendoDatePicker({
            value:"${sysdate}"
            ,start:"decade"
            ,depth:"decade"
            ,format:"yyyy"
            ,parseFormats:["yyyy"]
        });

        $("#sGoalYy").kendoMaskedTextBox({
            mask:"####"
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

        $("#sGoalYy").val(leadingZeros(now.getFullYear(), 4));

        $(".form_comboBox").kendoExtDropDownList();

        $("#sSdptCd").kendoExtDropDownList({
            dataSource:sdptList
            ,dataTextField:"sdptNm"
            ,dataValueField:"sdptCd"
            ,index:0
            ,select:function(e){

                var dataItem = this.dataItem(e.item);
                var responseJson = dms.ajax.getJson({
                    url:"<c:url value='/mis/tmp/selectTargetSearchMgmtOfficeCd.do' />"
                    ,data:JSON.stringify({"sSdptCd":dataItem.sdptCd})
                    ,async:false
                });

                $("#sOfficeCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
            }
        });

        $("#sOfficeCd").kendoExtDropDownList({
            dataSource:officeList
            ,dataTextField:"officeNm"
            ,dataValueField:"officeCd"
            ,index:0
            ,select:function(e){

                var dataItem = this.dataItem(e.item);
                dataItem.sdptCd
                var responseJson = dms.ajax.getJson({
                    url:"<c:url value='/mis/tmp/selectTargetSearchMgmtDealerCd.do' />"
                    ,data:JSON.stringify({"officeCd":dataItem.officeCd})
                    ,async:false
                });

                $("#sDealerCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
            }
        });

        $("#sDealerCd").kendoExtDropDownList({
            dataSource:dealerList
            ,dataTextField:"dlrNm"
            ,dataValueField:"dlrCd"
            ,index:0
        });

        //버튼 - 조회
        $("#btnSearch").kendoButton({
            click:function(e) {

                if($("#sGoalYy").val() == ''){
                    alert('목표 년도를 선택하세요!');
                    return;
                }

                $('#grid').data('kendoExtGrid').dataSource.page(1);
            }
        });

        //버튼 - 엑셀저장
        $("#btnExcelExport").kendoButton({
            click:function(e) {

                dms.ajax.excelExport({
                    "beanName":"targetSearchMgmtService"
                    ,"templateFile":"TargetSearchMgmt_Tpl.xlsx"
                    ,"fileName":"TargetSearchMgmt.xlsx"
                    ,"sGoalYy":$("#sGoalYy").val()
                    ,"sSdptCd":$("#sSdptCd").val()
                    ,"sOfficeCd":$("#sOfficeCd").val()
                    ,"sDealerCd":$("#sDealerCd").val()
                });

            }
        });

        //그리드 설정
        $("#grid").kendoExtGrid({
            //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
            gridId:"G-MIS-0821-150538"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/mis/tmp/selectTargetSearchMgmt.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sGoalYy"] = $("#sGoalYy").val();
                            params["sSdptCd"] = $("#sSdptCd").val();
                            params["sOfficeCd"] = $("#sOfficeCd").val();
                            params["sDealerCd"] = $("#sDealerCd").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"rnum"
                        ,fields:{
                             rnum:{type:"number", editable:false}
                            ,goalYy:{type:"string"}
                            ,sdptNm:{type:"string"}
                            ,officeNm:{type:"string"}
                            ,dlrNm:{type:"string"}
                            ,sumYear:{type:"number"}
                            ,sumMonth:{type:"number"}
                            ,querterQ01:{type:"number"}
                            ,monthM01:{type:"number"}
                            ,monthM02:{type:"number"}
                            ,monthM03:{type:"number"}
                            ,querterQ02:{type:"number"}
                            ,monthM04:{type:"number"}
                            ,monthM05:{type:"number"}
                            ,monthM06:{type:"number"}
                            ,querterQ03:{type:"number"}
                            ,monthM07:{type:"number"}
                            ,monthM08:{type:"number"}
                            ,monthM09:{type:"number"}
                            ,querterQ04:{type:"number"}
                            ,monthM010:{type:"number"}
                            ,monthM011:{type:"number"}
                            ,monthM012:{type:"number"}
                        }
                    }
                }
            }
            ,height:650
            ,filterable:false
            ,editable:false
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
            ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:false
            ,sortable:false
            ,columns:[
                {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, attributes:{"class":"ac"}

                }
                ,{field:"goalYy", title:"<spring:message code='mis.lbl.goalYy' />", width:60, attributes:{"class":"ac"}

                }
                ,{field:"sdptNm", title:"<spring:message code='mis.lbl.division' />", width:80

                }
                ,{field:"officeNm", title:"<spring:message code='mis.lbl.officeNm' />", width:100

                }
                ,{field:"dlrNm", title:"<spring:message code='mis.lbl.dlrNm' />", width:150

                }
                ,{field:"sumYear", title:"<spring:message code='mis.lbl.sumYear' />", width:80, format:"{0:n0}", attributes:{"class":"ar"}

                }
                ,{field:"sumMonth", title:"<spring:message code='mis.lbl.sumMonth' />", width:80, format:"{0:n0}", attributes:{"class":"ar"}

                }
                ,{field:"querterQ01", title:"<spring:message code='mis.lbl.querterQ01' />", width:80, format:"{0:n0}", attributes:{"class":"ar"}

                }
                ,{field:"monthM01", title:"<spring:message code='mis.lbl.monthM01' />", width:80, format:"{0:n0}", attributes:{"class":"ar"}

                }
                ,{field:"monthM02", title:"<spring:message code='mis.lbl.monthM02' />", width:80, format:"{0:n0}", attributes:{"class":"ar"}

                }
                ,{field:"monthM03", title:"<spring:message code='mis.lbl.monthM03' />", width:80, format:"{0:n0}", attributes:{"class":"ar"}

                }
                ,{field:"querterQ02", title:"<spring:message code='mis.lbl.querterQ02' />", width:80, format:"{0:n0}", attributes:{"class":"ar"}

                }
                ,{field:"monthM04", title:"<spring:message code='mis.lbl.monthM04' />", width:80, format:"{0:n0}", attributes:{"class":"ar"}

                }
                ,{field:"monthM05", title:"<spring:message code='mis.lbl.monthM05' />", width:80, format:"{0:n0}", attributes:{"class":"ar"}

                }
                ,{field:"monthM06", title:"<spring:message code='mis.lbl.monthM06' />", width:80, format:"{0:n0}", attributes:{"class":"ar"}

                }
                ,{field:"querterQ03", title:"<spring:message code='mis.lbl.querterQ03' />", width:80, format:"{0:n0}", attributes:{"class":"ar"}

                }
                ,{field:"monthM07", title:"<spring:message code='mis.lbl.monthM07' />", width:80, format:"{0:n0}", attributes:{"class":"ar"}

                }
                ,{field:"monthM08", title:"<spring:message code='mis.lbl.monthM08' />", width:80, format:"{0:n0}", attributes:{"class":"ar"}

                }
                ,{field:"monthM09", title:"<spring:message code='mis.lbl.monthM09' />", width:80, format:"{0:n0}", attributes:{"class":"ar"}

                }
                ,{field:"querterQ4", title:"<spring:message code='mis.lbl.querterQ04' />", width:80, format:"{0:n0}", attributes:{"class":"ar"}

                }
                ,{field:"monthM10", title:"<spring:message code='mis.lbl.monthM10' />", width:80, format:"{0:n0}", attributes:{"class":"ar"}

                }
                ,{field:"monthM11", title:"<spring:message code='mis.lbl.monthM11' />", width:80, format:"{0:n0}", attributes:{"class":"ar"}

                }
                ,{field:"monthM12", title:"<spring:message code='mis.lbl.monthM12' />", width:80, format:"{0:n0}", attributes:{"class":"ar"}

                }
            ]
        });

    });
</script>
