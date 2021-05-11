<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 수령권한문서출력  -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="sal.title.receiveAuthorityDocPrint" /></h1> <!-- 수령권한문서출력 -->
            <div class="btn_right">
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                <button type="button" class="btn_m " id="btnPrint"><spring:message code="sal.btn.receiveAuthorityDocPrint" /></button> <!-- 수령권한문서출력  -->
            </div>
        </div>
        <!-- 조회 조건 시작 -->
        <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:12%;">
                    <col style="width:22%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                    <col style="width:10%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="sal.lbl.eMarketCd" /></th> <!-- 전상코드  -->
                        <td>
                            <input id="sEMarketCd" type="text" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="sal.lbl.receiveComNm" /></th> <!-- 수령회사명칭  -->
                        <td>
                            <input id="sReceiveComNm" type="text" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.sung" /></th> <!-- 성 -->
                        <td>
                            <input id="sSungCd" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="sal.lbl.cityCd" /></th> <!-- 시 -->
                        <td>
                            <input id="sCityCd" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="sal.lbl.reqDt"/></th> <!-- 신청일자 -->
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sReqFromDt" class="form_datepicker" />
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sReqToDt" class="form_datepicker" />
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="sal.lbl.receiverNm" /></th> <!-- 수령인명칭 -->
                        <td>
                            <input id="sShipToRecv" type="text" class="form_input" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- 조회 조건 종료 -->

        <!-- 그리드 시작 -->
        <div class="table_grid mt10">
            <div id="grid" class="resizable_grid"></div>
        </div>

    </section>
</div>


<script type="text/javascript">

//성 조회
var shipToProvList = [];
<c:forEach var="obj" items="${shipToProvList}">
    shipToProvList.push({shipToProvNm:"${obj.saleDlrSungNm}", shipToProvCd:"${obj.saleDlrSungCd}"});
</c:forEach>

//심사결과
var evalRsltCdList = [{"evalRsltNm":"", "evalRsltCd":""}];
var evalRsltObj = {};
<c:forEach var="obj" items="${evalRsltCdList}">
    if("${obj.cmmCd}" != '04'){
        evalRsltCdList.push({evalRsltNm:"${obj.cmmCdNm}", evalRsltCd:"${obj.cmmCd}"});
        evalRsltObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    }
</c:forEach>
var evalRsltCdArr = dms.data.arrayToMap(evalRsltCdList, function(obj){return obj.cmmCd;});


/******************************************
 * ready ()
 ******************************************/
$(document).ready(function(){

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            $("#grid").data("kendoExtGrid").dataSource.page(1);
        }
    });

    //버튼 - 수령권한문서출력(미리보기)
    $("#btnPrint").kendoButton({
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var row = grid.select();

            if(row.length == 0){
                //목록을 선택하여 주십시오.
                dms.notification.warning("<spring:message code='global.info.required.select' />");
                return;
            }

            var dataItem = grid.dataItem(row);
            dms.fileManager.preview(dataItem.fileDocNo, dataItem.fileNo);
//             dms.fileManager.preview(dataItem.fileDocNo, dataItem.fileNo, 500, 600, "popupTitle");
        }
    });

    //성
    $("#sSungCd").kendoExtDropDownList({
        dataTextField:"shipToProvNm"
        ,dataValueField:"shipToProvCd"
        ,dataSource:shipToProvList
        ,optionLabel:" "    // 전체
        ,select:function(e){
            var dataItem = this.dataItem(e.item);

            $("#sCityCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sCityCd").data("kendoExtDropDownList").enable(true);

            if(dataItem.sungCd == ""){
                $("#sCityCd").data("kendoExtDropDownList").setDataSource([]);
                $("#sCityCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/cmm/selectDealerCity.do' />"
                ,data:JSON.stringify({"sSaleDlrSungCd":dataItem.shipToProvCd})
                ,async:false
            });
            $("#sCityCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });

    //시
    $("#sCityCd").kendoExtDropDownList({
        dataTextField:"saleDlrCityNm"
        ,dataValueField:"saleDlrCityCd"
        ,optionLabel:" "   // 전체
    });
    $("#sCityCd").data("kendoExtDropDownList").enable(false);


    //신청일자 시작일
    var sStartDtPicker = $("#sReqFromDt").kendoExtMaskedDatePicker({
        format:"{0:<dms:configValue code='dateFormat' />}"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:function(){
            sEndDtPicker.min(kendo.parseDate(this.value(), "{0:<dms:configValue code='dateFormat' />}"));
        }
    }).data("kendoExtMaskedDatePicker");

    //신청일자 종료일
    var sEndDtPicker = $("#sReqToDt").kendoExtMaskedDatePicker({
        format:"{0:<dms:configValue code='dateFormat' />}"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:function(){
            if(dms.string.isEmpty($("#sReqFromDt").data("kendoDatePicker").value())){
                dms.notification.warning("<spring:message code='global.info.fromDate.input' />");
                this.value("");
                return;
            }else{
                sStartDtPicker.max(kendo.parseDate(this.value(), "{0:<dms:configValue code='dateFormat' />}"));
            }
        }
    }).data("kendoExtMaskedDatePicker");

    //그리드 설정
    $("#grid").kendoExtGrid({
        gridID:"G-SAL-0303-173742"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/ond/selectReceiveAuthorityDocPrintList.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sEMarketCd"] = $("#sEMarketCd").val();
                         params["sReceiveComNm"] = $("#sReceiveComNm").val();
                         params["sSungCd"] = $("#sSungCd").data("kendoExtDropDownList").value();
                         params["sCityCd"] = $("#sCityCd").data("kendoExtDropDownList").value();
                         params["sReqFromDt"] = $("#sReqFromDt").data("kendoExtMaskedDatePicker").value();
                         params["sReqToDt"] = $("#sReqToDt").data("kendoExtMaskedDatePicker").value();
                         params["sShipToRecv"] = $("#sShipToRecv").val();

                        //console.log(kendo.stringify(params));

                        return kendo.stringify(params);

                    } else if (operation != "read" && options.models){
                        return kendo.stringify(options.models);
                    }

                }
            }
        ,schema:{
            model:{
                   id:"reqNo"
                   ,fields:{
                       reqNo:{type:"string"}                //신청번호
                       ,dlrCd:{type:"string"}               //전상코드
                       ,dlrNm:{type:"string"}               //전상명칭
                       ,is4sYn:{type:"string"}              //4s딜러여부
                       ,shipToDlrCd:{type:"string"}         //딜러코드
                       ,shipToDlrNm:{type:"string"}         //수령회사명칭
                       ,shipToAddr:{type:"string"}          //접수주소
                       ,shipToProvNm:{type:"string"}        //성
                       ,shipToCityNm:{type:"string"}        //시
                       ,shipToRecv:{type:"string"}          //수령인
                       ,shipToIdno:{type:"string"}          //수령인증서번호
                       ,shipToRecvTel:{type:"string"}       //수령인전화
                       ,shipToRecvDoc:{type:"string"}       //수령권한문서
                       ,fileDocNo:{type:"string"}           //fileDocNo
                       ,fileNo:{type:"string"}              //fileNo
                       ,shipToAdocNo:{type:"string"}        //수령권한문서번호
                       ,reqDt:{type:"date"}                 //신청일자
                       ,evalRsltCd:{type:"string"}          //심사결과
                       ,evalDt:{type:"date"}                //심사일자
                       ,pevalName:{type:"string"}           //심사인
                   }
                }
           ,parse:function(d) {
              if(d.data){
                  $.each(d.data, function(idx, elem) {
                      elem.reqDt = kendo.parseDate(elem.reqDt, "<dms:configValue code='dateFormat' />");
                      elem.evalDt = kendo.parseDate(elem.evalDt, "<dms:configValue code='dateFormat' />");
                  });
              }
              return d;
          }
             }
        }
        ,selectable:"row"
        ,columns:[
            {field:"reqNo", title:"<spring:message code='global.lbl.applNumber' />", width:50, attributes:{"class":"ac"}} //신청번호
            ,{field:"dlrCd", title:"<spring:message code='sal.lbl.eMarketCd' />", width:50, attributes:{"class":"ac"}} //전상코드
            ,{field:"dlrNm", title:"<spring:message code='sal.lbl.eMarketNm' />", width:160} //전상명칭
            ,{field:"is4sYn", title:"<spring:message code='sal.lbl.4sDlrYn' />", width:80, attributes:{"class":"ac"}} //4s딜러여부
            ,{field:"shipToDlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:60, attributes:{"class":"ac"}} //딜러코드
            ,{field:"shipToDlrNm", title:"<spring:message code='sal.lbl.receiveComNm' />", width:160} //수령회사명칭
            ,{field:"shipToAddr", title:"<spring:message code='sal.lbl.acceptAddr' />", width:160} //접수주소
            ,{field:"shipToProvNm", title:"<spring:message code='global.lbl.sung' />", width:45, attributes:{"class":"ac"}} //성
            ,{field:"shipToCityNm", title:"<spring:message code='sal.lbl.cityCd' />", width:45, attributes:{"class":"ac"}} //시
            ,{field:"shipToRecv", title:"<spring:message code='sal.lbl.receiverNm' />", width:140} //수령인
            ,{field:"shipToIdno", title:"<spring:message code='sal.lbl.receiverSsnCrnNo' />", width:90, attributes:{"class":"ac"}} //수령인증서번호
            ,{field:"shipToRecvTel", title:"<spring:message code='sal.lbl.receiverTelNo' />", width:80} //수령인전화
            ,{field:"shipToRecvDoc", title:"<spring:message code='sal.lbl.receiveAuthDoc' />", width:60, attributes:{"class":"ac"}
                ,template:"<span class='txt_label bg_yellow' onClick='dms.fileManager.download(\"#=fileDocNo#\",\"#=fileNo#\")'><spring:message code='global.btn.download' /></span>"
            }
            ,{field:"shipToAdocNo", title:"<spring:message code='sal.lbl.receiveAuthDocNo' />", width:60, attributes:{"class":"ac"}} //수령권한문서번호
            ,{field:"reqDt", title:"<spring:message code='sal.lbl.reqDt' />", width:70, attributes:{"class":"ac"}
                ,template:"#if (reqDt !== null ){# #= kendo.toString(reqDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
            } //신청일자
            ,{field:"evalRsltCd", title:"<spring:message code='global.lbl.evalRslt' />", width:50
                ,attributes:{"class":"ac"}
                ,template:"#= dms.string.strNvl(evalRsltObj[evalRsltCd]) #"
                ,editor:function(container, options) {
                    $('<input required name="evalRsltCd" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        valuePrimitive:true
                        ,dataSource:evalRsltCdList
                        ,dataTextField:"evalRsltNm"
                        ,dataValueField:"evalRsltCd"
                    });
                    $('<span class="k-invalid-msg" data-for="evalRsltCd"></span>').appendTo(container);
                }
            } //심사결과
            ,{field:"evalDt", title:"<spring:message code='global.lbl.evalDt' />", width:70, attributes:{"class":"ac"}
                ,template:"#if (evalDt !== null ){# #= kendo.toString(evalDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
            } //심사일자
            ,{field:"pevalName", title:"<spring:message code='global.lbl.pevalId' />", width:60, attributes:{"class":"ac"}} //심사인
        ]
        ,editable:false
        ,navigatable:false
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:true     //멀티선택 적용. default:false
        ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10 // 재확인 ★
        ,appendEmptyColumn:false          //빈컬럼 적용. default:false
        ,enableTooltip:true               //Tooltip 적용, default:false

    });

});

</script>
