<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div id="resizableContainer">
    <div class="content">
        <!-- 保险理赔记录  -->
        <section class="group">
            <form id="insForm">
                <div class="header_area">
                    <h1 class="title_basic">保险理赔记录</h1><!-- 보험청구이력 -->
                    <div class="btn_right">
                        <button type="button" class="btn_m" id="btnInit"><spring:message code='global.btn.init' /></button><!-- 초기화 -->
                        <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code='global.btn.search' /></button><!-- 조회 -->
                    </div>
                </div>
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
                            <!-- <tr>
                                <th scope="row">车牌号码</th>번호판번호
                                <td>
                                    <input type="text" class="form_comboBox">
                                </td>
                                <th scope="row">维修委托者</th>RO발행자
                                <td>
                                    <input type="text" class="form_comboBox">
                                </td>
                                <th scope="row">服务结算者</th>서비스정산자
                                <td>
                                    <input type="text" class="form_comboBox">
                                </td>
                                <th scope="row">付款类型</th>결제유형
                                <td>
                                    <input type="text" class="form_comboBox">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">车辆识别码</th>VIN번호
                                <td>
                                    <input type="text" class="form_comboBox">
                                </td>
                                <th scope="row">维修委托时间</th>RO발행시간
                                <td>
                                    <input type="text" class="form_comboBox">
                                </td>
                                <th scope="row">服务结算时间</th>서비스정산시간
                                <td>
                                    <input type="text" class="form_comboBox">
                                </td>
                                <th scope="row">付款者编号</th>결제자번호
                                <td>
                                    <input type="text" class="form_comboBox">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">车辆所有者</th>차량소유자
                                <td>
                                    <input type="text" class="form_comboBox">
                                </td>
                                <th scope="row">维修委托号码</th>RO번호
                                <td>
                                    <input type="text" class="form_comboBox">
                                </td>
                                <th scope="row">服务结算号码</th>서비스정산번호
                                <td>
                                    <input type="text" class="form_comboBox">
                                </td>
                                <th scope="row">付款者</th>결제자
                                <td>
                                    <input type="text" class="form_comboBox">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">送修者</th>방문자
                                <td>
                                    <input type="text" class="form_comboBox">
                                </td>
                                <th scope="row">维修委托类型</th>RO유형
                                <td>
                                    <input type="text" class="form_comboBox">
                                </td>
                                <th scope="row">保险报案号码</th>보험등록번호
                                <td>
                                    <input type="text" class="form_comboBox">
                                </td>
                                <th scope="row">付款期限</th>결제기한
                                <td>
                                    <input type="text" class="form_comboBox">
                                </td>
                            </tr> -->
                            <tr>
                                <th scope="row"><spring:message code='ser.lbl.incCmpCd'/></th><!-- 보험사코드 -->
                                <td>
                                    <input type="text" id="sIncCmpCd" name="sIncCmpCd" class="form_input" />
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.carRegNo' /></th><!-- 번호판번호 -->
                                <td>
                                    <input type="text" id="sCarRegNo" name="sCarRegNo" class="form_input" />
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.incDistin' /></th><!-- 보험구분 -->
                                <td>
                                    <input type="text" id="sIncDstinCd" name="sIncDstinCd" class="form_input">
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.incStartDt' /></th><!-- 보험시작일 -->
                                <td>
                                    <input type="text" id="sIncStartDt" name="sIncStartDt" class="form_datetimepicker ac" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='ser.lbl.incCmpAcronym' /> </th><!-- 보험사약칭 -->
                                <td>
                                    <input type="text" id="sIncCmpShtCd" name="sIncCmpShtCd" class="form_input" />
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.vinNo' /></th><!-- VIN번호 -->
                                <td>
                                    <input type="text" id="sVinNo" name="sVinNo" class="form_input" />
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.bizIncTp' /></th><!-- 상업보험유형 -->
                                <td>
                                    <input type="text" id="sCmcIncTp" name="sCmcIncTp" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.incEndDt' /></th><!-- 보험만료일 -->
                                <td>
                                    <input type="text" id="sIncEndDt" name="sIncEndDt" class="form_datetimepicker ac" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='ser.lbl.incDocNo' /></th><!-- 보험문서번호 -->
                                <td>
                                    <input type="text" id="sIncDocNo" name="sIncDocNo" class="form_input" />
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.insured' /> </th><!-- 피보험자 -->
                                <td>
                                    <input type="text" id="sRincPrsnId" name="sRincPrsnId" class="form_input"/>
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.bizIncTpNm'/></th><!-- 상업보험유형명 -->
                                <td>
                                    <input type="text" id="sCmcIncNm" name="sCmcIncNm" class="form_comboBox">
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.incTotAmt' /> </th><!-- 보험비용 총계 -->
                                <td>
                                    <input type="text" id="sIncTotAmt" name="sIncTotAmt" class="form_numeric ar">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_grid mt10">
                    <div id="grid" class="grid"></div>
                    <%-- <table class="grid" class="resizable_grid">
                        <caption></caption>
                        <thead>
                            <tr>
                                <th scope="col" data-field="data1">车牌号码</th><!-- 번호판번호 -->
                                <th scope="col" data-field="data2">车辆识别码</th><!-- VIN번호 -->
                                <th scope="col" data-field="data3">维修委托者</th><!-- RO발행자 -->
                                <th scope="col" data-field="data4">维修委托时间</th><!-- RO발행시간 -->
                                <th scope="col" data-field="data5">维修委托类型</th><!-- RO유형 -->
                                <th scope="col" data-field="data6">服务结算号码</th><!-- 서비스정산번호 -->
                                <th scope="col" data-field="data7">服务结算时间</th><!-- 서비스정산시간 -->
                                <th scope="col" data-field="data8">服务结算者</th><!-- 서비스정산자 -->
                                <th scope="col" data-field="data9">付款类型</th><!-- 결제유형 -->
                                <th scope="col" data-field="data10">付款者编号</th><!-- 결제자번호 -->
                                <th scope="col" data-field="data11">付款者</th><!-- 결제자 -->
                                <th scope="col" data-field="data12">付款期限</th><!-- 결제기한 -->
                                <th scope="col" data-field="data13">应收工时费</th><!-- 발생공임비 -->
                                <th scope="col" data-field="data14">应收配件费</th><!-- 발생부품비용 -->
                                <th scope="col" data-field="data15">应收其他费</th><!-- 발생기타비용 -->
                                <th scope="col" data-field="data16">应收金额</th><!-- 발생금액 -->
                                <th scope="col" data-field="data17">实收金额</th><!-- 실수금액 -->
                                <th scope="col" data-field="data18">收款完成时间</th><!-- 수납완료시간 -->
                                <th scope="col" data-field="data19">欠收金额</th><!-- 미수금액 -->
                                <th scope="col" data-field="data20">欠款确认时间</th><!-- 미수금확인시간 -->
                                <th scope="col" data-field="data21">发票类型</th><!-- 영수증유형 -->
                                <th scope="col" data-field="data22">发票号码</th><!-- 영수증번호 -->
                                <th scope="col" data-field="data23">发票日期</th><!-- 영수증발행일자 -->
                                <th scope="col" data-field="data24">收款者</th><!-- 수납자 -->
                                <th scope="col" data-field="data25">保险报案号码</th><!-- 보험등록번호 -->
                                <th scope="col" data-field="data26">保险理赔号码</th><!-- 보험청구번호 -->
                                <th scope="col" data-field="data27">保险理赔照片</th><!-- 보험청구이미지 -->
                                <th scope="col" data-field="data28">保险理赔案件</th><!-- 보험청구건 -->
                                <th scope="col" data-field="data29">保险理赔申请时间</th><!-- 보험청구요청시간 -->
                                <th scope="col" data-field="data30">保险理赔完成时间</th><!-- 보험청구완료시간 -->
                                <th scope="col" data-field="data31">保险理赔登记时间</th><!-- 보험청구등록시간 -->
                                <th scope="col" data-field="data32">保险理赔状态</th><!-- 보험청구상태 -->
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table> --%>
                </div>

                <div class="header_area">
                    <div class="btn_right">
                        <button type="button" id="btnInsReg" class="btn_m">保险理赔登记</button><!-- 보험청구등록 -->
                    </div>
                </div>
            </form>
        </section>
        <!-- //保险理赔记录 -->
    </div>
</div>
<!-- script -->
<script>


//공통코드:상업보험유형명
var cmcIncTpNmList = [];
<c:forEach var="obj" items="${cmcIncTpNmDs}">
cmcIncTpNmList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var cmcIncTpNmMap = dms.data.arrayToMap(cmcIncTpNmList, function(obj){return obj.cmmCd;});

//공통코드:상업보험유형
var cmcIncTpList = [];
<c:forEach var="obj" items="${cmcIncTpDs}">
cmcIncTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var cmcIncTpMap = dms.data.arrayToMap(cmcIncTpList, function(obj){return obj.cmmCd;});

$(document).ready(function() {

    setCmcIncTpNmMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
           if(cmcIncTpNmMap[value] != undefined)
            resultVal =  cmcIncTpNmMap[value].cmmCdNm;
        }
        return resultVal;
    };

    setCmcIncTpMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
           if(cmcIncTpMap[value] != undefined)
            resultVal =  cmcIncTpMap[value].cmmCdNm;
        }
        return resultVal;
    };


    //보험 시작일자
    $("#sIncStartDt").kendoExtMaskedDatePicker({
        format:"{0:<dms:configValue code='dateFormat' />}"
       ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //보험종료일자
    $("#sIncEndDt").kendoExtMaskedDatePicker({
        format:"{0:<dms:configValue code='dateFormat' />}"
       ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    /**보험비용총계**/
    $("#sIncTotAmt").kendoExtNumericTextBox({
       min:0.00
      ,value:0.00
      ,format:"n2" //"{0:##,###}"
      ,spinners:false             // 증,감 화살표

    });


    // 상업보험유형
    $("#sCmcIncTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:cmcIncTpList
        ,optionLabel:" "
    });

    // 상업보험명
    $("#sCmcIncNm").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:cmcIncTpNmList
        ,optionLabel:" "
    });



  //초기화
    $("#btnInit").kendoButton({

       click:function(e){

           $("#insForm").get(0).reset();

           $("#grid").data("kendoExtGrid").dataSource.data([]);


       }
    });

    //보험 등록화면 이동
    $("#btnInsReg").kendoButton({

       click:function(e){

           var grid = $("#grid").data("kendoExtGrid");
           var selectedVal = grid.dataItem(grid.select());
           var vinNo = (selectedVal == null) ? "" : selectedVal.vinNo ;
           var incDocNo = (selectedVal == null) ? "" : selectedVal.incDocNo;

           parent._createOrReloadTabMenu("<spring:message code='ser.title.incReg'/>", "<c:url value='/ser/ins/insurance/selectInsRegManageMain.do'/>?vinNo="+vinNo+"&incDocNo="+incDocNo, "VIEW-D-10194"); //

       }
    });

    //조회
    $("#btnSearch").kendoButton({

       click:function(e){
           var grid = $("#grid").data("kendoExtGrid");
           grid.dataSource.read();

       }
    });

    $("#grid").kendoExtGrid({
        gridId:"G-SER-1014-000001"
        ,dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/ins/insurance/selectInRegManageList.do' />"
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sIncCmpCd"] = $("#sIncCmpCd").val();
                         params["sCarRegNo"] = $("#sCarRegNo").val();
                         params["sIncDstinCd"] = $("#sIncDstinCd").val();
                         params["sIncCmpShtCd"] = $("#sIncCmpShtCd").val();
                         params["sVinNo"] = $("#sVinNo").val();
                         params["sCmcIncTp"] = $("#sCmcIncTp").val();
                         params["sIncDocNo"] = $("#sIncDocNo").val();
                         params["sRincPrsnId"] = $("#sRincPrsnId").val();
                         params["sCmcIncNm"] = $("#sCmcIncNm").val();
                         params["sIncTotAmt"] = $("#sIncTotAmt").data("kendoExtNumericTextBox").value();
                         params["sIncStartDt"] = $("#sIncStartDt").data("kendoExtMaskedDatePicker").value();
                         params["sIncEndDt"] = $("#sIncEndDt").data("kendoExtMaskedDatePicker").value();

                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                        rnum:{type:"number", editable:false }
                       ,carRegNo:{type:"string" } // 번호판번호
                       ,vinNo:{type:"string"} // VIN번호
                       ,rincPrsnId:{type:"string" }//피보험자
                       ,incCmpCd:{type:"string"}//보험사코드
                       ,incCmpShtCd:{type:"string"}//보험사약칭
                       ,incDocNo:{type:"string", editable:false }//보험문서번호
                       ,incCmpShtCd:{type:"string" }//보험구분
                       ,incTotAmt:{type:"number" }//보험비용합계
                       ,incStartDt:{type:"date"}//보험시작일
                       ,incEndDt:{type:"date"}//보험만료일
                       ,regDt:{type:"date", editable:false }//보험등록일
                       ,regUsrId:{type:"string", editable:false }//보험등록작성자
                       ,cmcIncCd:{type:"string" }//상업보험코드
                       ,cmcIncTp:{type:"string" }//상업보험유형
                       ,cmcIncNm:{type:"string"}//상업보험명칭
                       ,cmcIncRemark:{type:"string" }//상업보험비고
                    }

                 }//model
           }//schema
        }//dataSource
        ,pageable:true
        ,editable:false
        ,filterable:true
        ,autoBind:false
        ,height:400
        ,resizable:true
        ,filterable:false                 // 필터링 기능 사용안함
        ,appendEmptyColumn:true           //빈컬럼 적용
        ,multiSelectWithCheckbox:true
        ,editableOnlyNew:true
        ,editableOnlyNewExcludeColumns:["carRegNo","rincPrsnId","incDstinCd","incCmpCd","incCmpShtCd","incTotAmt","incStartDt","incEndDt","cmcIncCd","cmcIncTp","cmcIncNm","cmcIncRemark"]
        ,change:function(e){

            var selectedVal = this.dataItem(this.select());
            $("#incDocNo").val(selectedVal.incDocNo);
            if(dms.string.isNotEmpty($("#incDocNo").val())){
                setButtonEnable("Y");
                $("#gridDetail").data("kendoExtGrid").dataSource.read();
            }

        }
        ,columns:[
                {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, attributes:{"class":"ac"}}
               ,{field:"carRegNo", title:"<spring:message code='ser.lbl.carRegNo' />", width:100,attributes :{"class":"al"}}//차량등록번호
               ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:200,attributes :{"class":"al"}}//vinNo
               ,{field:"rincPrsnId", title:"<spring:message code='ser.lbl.insured' />", width:100,attributes :{"class":"al"}}//피보험자
               ,{field:"incDstinCd", title:"<spring:message code='ser.lbl.incDistin' />", width:100,attributes :{"class":"al"}}//보험구분코드
               ,{field:"incCmpCd", title:"<spring:message code='ser.lbl.incCmpCd' />", width:100,attributes :{"class":"al"}}//보험회사코드
               ,{field:"incCmpShtCd", title:"<spring:message code='ser.lbl.incCmpAcronym' />", width:100,attributes :{"class":"al"}}//보험사약칭
               ,{field:"incDocNo", title:"<spring:message code='ser.lbl.incDocNo' />", width:100, attributes :{"class":"al"}}//보험문서번호
               ,{field:"incTotAmt", title:"<spring:message code='ser.lbl.incTotAmt' />", width:80, attributes :{"class":"ar"}
                   , format:"{0:n0}"
               }//보험비용총계
               ,{field:"incStartDt", title:"<spring:message code='ser.lbl.incStartDt' />", width:100,attributes:{"class":"ac"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
               }//보험시작일
               ,{field:"incEndDt", title:"<spring:message code='ser.lbl.incEndDt' />", width:100,attributes:{"class":"ac"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
               }//보험종료일
               ,{field:"regDt", title:"<spring:message code='ser.lbl.incRegDt' />", width:100,attributes :{"class":"ac"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
               }//보험등록일
               ,{field:"regUsrId", title:"<spring:message code='ser.lbl.incRegNm' />", width:100, attributes :{"class":"al"}}//보험등록자
               ,{field:"cmcIncCd", title:"<spring:message code='ser.lbl.cmcIncCd' />", width:100,attributes :{"class":"al"}}
               ,{field:"cmcIncTp", title:"<spring:message code='ser.lbl.bizIncTp' />", width:100, attributes :{"class":"ac"}
                   , template:"#= setCmcIncTpMap(cmcIncTp) #"
               }//상업 보험 유형
               ,{field:"cmcIncNm", title:"<spring:message code='ser.lbl.bizIncTpNm' />", width:150, attributes :{"class":"ac"}
                   , template:"#= setCmcIncTpNmMap(cmcIncNm) #"
               }//상업 보험 유형명
               ,{field:"cmcIncRemark", title:"<spring:message code='ser.lbl.cmcIncRemark' />", width:300
                   ,attributes :{"class":"al"}
                   ,editor:function(container, options){
                       $('<input id="cmcIncRemark" name="cmcIncRemark" maxLength=300 class="form_input" data-name="<spring:message code="ser.lbl.cmcIncRemark" />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       $('<span class="k-invalid-msg" data-for="cmcIncRemark"></span>')
                       .appendTo(container);
                   }
               }
               ,{field:"chgAmtRate", title:"<spring:message code='ser.lbl.chgAmtRate' />", width:100, attributes :{"class":"ar"}               }
               ,{field:"incAmt", title:"<spring:message code='ser.lbl.incAmt' />", width:100, attributes :{"class":"ar"}}
               ,{field:"incCostSumAmt", title:"<spring:message code='ser.lbl.incCostSumAmt' />", width:100, attributes :{"class":"ar"}}
               ,{field:"incDcRate", title:"<spring:message code='ser.lbl.incDcRate' />", width:100, attributes :{"class":"ar"}}
               ,{field:"incFeeAmt", title:"<spring:message code='ser.lbl.incFeeAmt' />", width:100, attributes :{"class":"ar"}}
             ]

    });


});
</script>
<!-- //script -->

<style>
    #slide-in-share { width:600px; margin-right:-600px;}
</style>
