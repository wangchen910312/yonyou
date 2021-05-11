<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- 그룹선택 팝업 -->
    <section id="windows" class="pop_wrap">
        <!-- 탭메뉴 -->
        <div class="header_area">
            <div class="btn_right">
                <button id="btnCustSearch" class="btn_s btn_Search"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                <button id="btnCustSelect" class="btn_s btn_Select"><spring:message code="global.btn.select" /></button> <!-- 선택 -->
            </div>
        </div>
        <div class="table_grid mt0">
            <input type="hidden" id="custNo" name="custNo" >
            <div id="haveCarGrid" class="grid"></div>
        </div>
    </section>
    <!-- //그룹선택 팝업 -->

<script type="text/javascript">


    var ncarDstinCdMap = [];
    <c:forEach var="obj" items="${ncarDstinCdList}">
        ncarDstinCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

$(document).ready(function() {


    var options = parent.popupWindow.options.content.data;
    if (options.custNo != null && options.telNo != ""){
        $("#custNo").val(options.custNo);
    }

    // 선택 버튼.
    $("#btnCustSelect").kendoButton({
        click:function(e){
            var grid = $('#haveCarGrid').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());
            var rows = grid.select();
            if (rows.length >= 1){
                var data = [];
                $.each(rows, function(idx, row){
                    data.push(grid.dataItem(row));
                })
                console.log("Customer Having Car");
                console.log(data);
                options.callbackFunc(data);
                if(options.closeYn == undefined || options.closeYn == "Y"){
                    parent.popupWindow.close();
                }
            } else {
                dms.notification.info("<spring:message code='global.lbl.haveCar' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
            }
        }
    });

    // 닫기 버튼.
    $("#btnCancel").kendoButton({
        click:function(e){
            parent.popupWindow.close();
        }
    });

    // 보유차량 - selectCustomerInfoMain.jsp, selectCallCenterActionPopup.jsp, selectCustHaveCarSearchPopup.do
    $("#haveCarGrid").kendoExtGrid({
        gridId:"G-CRM-0519-172108"
        , dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/crm/cmm/selectHaveCar.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        // 고객번호
                        if ( dms.string.isEmpty($("#custNo").val()) ) {
                            dms.notification.warning("<spring:message code='global.lbl.customer' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                            return false;
                        };

                        var params = {};
                        params["sort"]                 = options.sort;

                        params["sCustNo"] = $("#custNo").val();
                        //params["sDlrCd"] = $("#dlrCd").val();
                        params["sUseYn"] = "Y";  // 소유자만만
                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                errors:"error"
                    ,data:"data"
                    ,total:"total"
                    ,model:{
                        id:"vinNo"
                           ,fields:{
                              vinNo               :{type:"string"}
                            , ncarDstinCd         :{type:"string"}
                            , dlrCd               :{type:"string"}
                            , carRegNo            :{type:"string"}
                            , carlineCd           :{type:"string"}
                            , carlineNm           :{type:"string"}
                            , modelCd             :{type:"string"}
                            , modelNm             :{type:"string"}
                            , ocnCd               :{type:"string"}
                            , ocnNm               :{type:"string"}
                            , extColorCd          :{type:"string"}
                            , extColorNm          :{type:"string"}
                            , intColorCd          :{type:"string"}
                            , intColorNm          :{type:"string"}
                            , corpCarDstinCd      :{type:"string"}
                            , carBrandCd          :{type:"string"}
                            , carNm               :{type:"string"}
                            , enginNo             :{type:"string"}
                            , custSaleDt          :{type:"date"}
                            , invcPublDt          :{type:"date"}
                            , dlrNm               :{type:"string"}
                            , custRegDt           :{type:"date"}
                        }
                    }
            }
        }
        ,editable:false
        ,autoBind:true
        ,filterable:false
        ,navigatable:false
        ,pageable:false
        ,height:280
        ,sortable:false
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,columns:[
            {field:"useYn",  title:"<spring:message code='global.lbl.gubun' />",   width:130, attributes:{"class":"ac"}
                ,template:function(dataItem){
                    return (dataItem.useYn == "Y")?"<spring:message code='global.lbl.haveCar' />":"<spring:message code='global.lbl.historyCar' />";
                }
            }
            ,{field:"ncarDstinCd",  title:"<spring:message code='sal.lbl.carBrand' />",   width:130, attributes:{"class":"ac"}
                ,template:'#if (ncarDstinCd !== ""){# #= ncarDstinCdMap[ncarDstinCd]# #}#'
            }
            ,{field:"carlineNm", title:"<spring:message code='global.lbl.carlineNm' />",     width:130, attributes:{"class":"ac"}} //차종
            ,{field:"modelNm", title:"<spring:message code='global.lbl.modelNm' />",     width:130, attributes:{"class":"ac"}} //모델
            ,{field:"vinNo", title:"<spring:message code='global.lbl.vinNo' />", width:150, attributes:{"class":"ac"}
                ,template:function(dataItem){
                    var spanObj = "<a href='#' class='linkVin'>"+dataItem.vinNo+"</a>";
                    return spanObj;
                }
            } //VIN
            ,{field:"enginSerialNo", title:"<spring:message code='global.lbl.enginNo' />", width:130, attributes:{"class":"ac"}} //엔진번호
            ,{field:"carRegNo", title:"<spring:message code='global.lbl.licensePlt' />",     width:130, attributes:{"class":"al"}} //번호판
            ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColorNm' />",     width:130, attributes:{"class":"ac"}} //외장색
            ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColorNm' />",     width:130, attributes:{"class":"ac"}} //내장색
            //,{field:"ordDlrNm", title:"<spring:message code='global.lbl.purcDlrComp' />",     width:130, attributes:{"class":"ac"}} //구매 딜러사
            ,{field:"custSaleDt", title:"<spring:message code='sal.lbl.saleDt' />", width:130, attributes:{"class":"ac"} // 구입일자자
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            } //구매일자
            ,{field:"invcPublDt", title:"<spring:message code='sal.lbl.invoiceDt' />", width:130, attributes:{"class":"ac"} // 구입일자자
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            } //영수증일자
            ,{field:"custRegDt", title:"<spring:message code='global.lbl.regDt' />", width:130, attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            } //등록일
        ]
    });
    // 보유차량 그리드 종료

    // 그리드 더블 클릭 이벤트.
    $("#haveCarGrid").on("dblclick", "tr.k-state-selected", function (e) {
        $("#btnCustSelect").click();
    });

    console.log("search Popup Option ##########");
    console.log(options.autoBind);

//     if (options.autoBind) {
//         $("#custNo").val(options.custNo);
//     }
});
 </script>