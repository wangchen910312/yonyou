<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div class="header_area">
    <div class="left_area ml0">
        <span class="span_txt"><spring:message code="mis.lbl.conditionsearchbox" /></span><!-- 조건검색  -->
        <input type="text" id="sDealerStatusYyMmDd" name="sDealerStatusYyMmDd" value="" class="form_comboBox" style="width:150px;"><!-- 조회년도  -->
        <button type="button" class="btn_s" id="btnTargetDcptMgmtDealerStatusSearch" name="btnTargetDcptMgmtDealerStatusSearch"><spring:message code="global.btn.search" /></button><!-- 딜러현황자료조회  -->
    </div>
</div>
<br>
<div class="table_info table_info_v1">
    <!-- 그리드 시작 -->
    <div class="table_grid">
        <div id="firstGrid"></div>
    </div>
    <!-- 그리드 종료 -->
</div>
<br>
<div class="table_info table_info_v2">
    <!-- 그리드 시작 -->
    <div class="table_grid">
        <div id="secondGrid"></div>
    </div>
    <!-- 그리드 종료 -->
</div>

<script type="text/javascript">
    $(document).ready(function() {

        $("#sDealerStatusYyMmDd").kendoDatePicker({
             value:"${sysdate}"
            ,format:"yyyyMMdd"
            ,parseFormats:["yyyyMMdd"]
        });

        $("#sDealerStatusYyMmDd").kendoMaskedTextBox({
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

        $("#sDealerStatusYyMmDd").val(leadingZeros(now.getFullYear(), 4)+leadingZeros(now.getMonth()+1, 2)+leadingZeros(now.getDate(), 2));

        //버튼 - 조회
        $("#btnTargetDcptMgmtDealerStatusSearch").kendoButton({
            click:function(e) {

                if($("#sDealerStatusYyMmDd").val() == ''){
                    alert("<spring:message code='global.info.required.select'/>");
                    return;
                }

                $('#firstGrid').data('kendoExtGrid').dataSource.page(1);
                $('#secondGrid').data('kendoExtGrid').dataSource.page(1);
            }
        });

        //그리드 설정
        $("#firstGrid").kendoExtGrid({
            //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
            gridId:"G-MIS-0831-195900"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/mis/tdm/selectTargetDcptMgmtDealerStatusBasicGrid.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sDealerStatusYyMmDd"] = $("#sDealerStatusYyMmDd").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"stockValue"
                        ,fields:{
                             stockValue:{type:"number", validation:{required:true}, editable:false}
                            ,stockCount:{type:"string", validation:{required:true}, editable:false}
                            ,saleStatus3Month:{type:"number", validation:{required:true}, editable:false}
                            ,salemanCount:{type:"number", validation:{required:true}, editable:false}
                            ,idccPotentialCustomer:{type:"number", validation:{required:true}, editable:false}
                            ,shopPotentialCustomer:{type:"number", validation:{required:true}, editable:false}
                        }
                    }
                }
            }
            ,height:80
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
                {field:"basicvalue", title:"<spring:message code='mis.lbl.basicvalue' />", width:150, sortable:false, attributes:{"class":"ac"}

                }
                ,{field:"stockValue", title:"<spring:message code='mis.lbl.stockvalue' />", width:200, format:"{0:n0}", sortable:false, attributes:{"class":"ac"}

                }
                ,{field:"stockCount", title:"<spring:message code='mis.lbl.stockvaluecnt' />", width:200, attributes:{"class":"ac"}

                }
                ,{field:"saleStatus3Month", title:"<spring:message code='mis.lbl.salestatus3month' />", width:200, format:"{0:n0}", attributes:{"class":"ac"}

                }
                ,{field:"salemanCount", title:"<spring:message code='mis.lbl.salemancount' />", width:200, format:"{0:n0}", attributes:{"class":"ac"}

                }
                ,{field:"idccPotentialCustomer", title:"<spring:message code='mis.lbl.idccpotentialcustomer' />", width:200, format:"{0:n0}", attributes:{"class":"ac"}

                }
                ,{field:"shopPotentialCustomer", title:"<spring:message code='mis.lbl.shoppotentialcustomer' />", width:200, format:"{0:n0}", attributes:{"class":"ac"}

                }
            ]
        });

      //그리드 설정
        $("#secondGrid").kendoExtGrid({
            //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
            gridId:"G-MIS-0831-231500"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/mis/tdm/selectTargetDcptMgmtDealerStatusDetailGrid.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sDealerStatusYyMmDd"] = $("#sDealerStatusYyMmDd").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"channelGubn"
                        ,fields:{
                             channelGubn:{type:"string", validation:{required:true}, editable:false}
                            ,idccCollectCustQty:{type:"number", validation:{required:true}, editable:false}
                            ,idccVisitReqRate:{type:"string", validation:{required:true}, editable:false}
                            ,idccDealQty:{type:"string", validation:{required:true}, editable:false}
                            ,idccVisitDealRate:{type:"number", validation:{required:true}, editable:false}
                            ,idccDealRate:{type:"string", validation:{required:true}, editable:false}
                            ,shopCollectCustQty:{type:"string", validation:{required:true}, editable:false}
                            ,shopPerInfoRate:{type:"string", validation:{required:true}, editable:false}
                            ,shopDealQty:{type:"string", validation:{required:true}, editable:false}
                            ,shopVisitDealRate:{type:"string", validation:{required:true}, editable:false}
                            ,shopDealRate:{type:"string", validation:{required:true}, editable:false}
                        }
                    }
                }
            }
            ,height:93
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
                {field:"channelGubn", title:"<spring:message code='mis.lbl.salechannel' />", width:150, sortable:false, attributes:{"class":"ac"}

                }
                ,{field:"idccCollectCustQty", title:"<spring:message code='mis.lbl.collectcustomerqty' />", width:200, format:"{0:n0}", sortable:false, attributes:{"class":"ac"}

                }
                ,{field:"idccVisitReqRate", title:"<spring:message code='mis.lbl.visitrequestrate' />(%)", width:250, attributes:{"class":"ac"}

                }
                ,{field:"idccDealQty", title:"<spring:message code='mis.lbl.dealqty' />", width:200, format:"{0:n0}", attributes:{"class":"ac"}

                }
                ,{field:"idccVisitDealRate", title:"<spring:message code='mis.lbl.visitdealrate' />(%)", width:200, attributes:{"class":"ac"}

                }
                ,{field:"idccDealRate", title:"<spring:message code='mis.lbl.dealrate' />(%)", width:200, attributes:{"class":"ac"}

                }
            ]
        });

    });
</script>
<!-- //script -->