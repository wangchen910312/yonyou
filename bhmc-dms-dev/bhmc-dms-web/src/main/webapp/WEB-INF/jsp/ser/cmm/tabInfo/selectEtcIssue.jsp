<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div style="min-height:205px;">
    <div class="btn_right_absolute">
        <c:if test="${param.gubun ne 'S'}">
        <button type="button" id="etcIssueAdd" class="btn_s btn_add btn_s_min5" ><spring:message code="global.btn.add" /></button>
        <button type="button" id="etcIssueDel" class="btn_s btn_delete btn_s_min5" ><spring:message code="global.btn.del" /></button>
        </c:if>
    </div>
    <div class="table_grid">
        <div id="etcIssueGrid" class="grid"></div>
    </div>
</div>

<script type="text/javascript">

var preFixId = "${preFixId}";
var preFixTp = "${preFixTp}";

/** 원인현상코드 조회 팝업 **/
var phenCauCodeWin;

var etcIssuePreFixId = "";
var etcIssueJobNo = "";

//공통코드:기타유형(수리유형)
var etcTpCdList = [];
<c:forEach var="obj" items="${etcTpCdList}">
etcTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

var etcTpCdArr = dms.data.arrayToMap(etcTpCdList, function(obj){return obj.cmmCd});

//기타유형
etcTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(etcTpCdArr[val] != undefined)
        returnVal = etcTpCdArr[val].cmmCdNm;
    }
    return returnVal;
};

$(document).ready(function(){

    var editYn = true;
    if(preFixTp == "ROSTATUS"){
        editYn = false;
    }

    var hiddenColYn = (preFixId == "RE") ? true : false;

    // 기타사항 그리드
    $("#etcIssueGrid").kendoExtGrid({
        dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/cmm/tabInfo/selectEtcIssues.do' />"
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

                         params["sPreFixId"] = etcIssuePreFixId;
                         params["sJobNo"] = etcIssueJobNo;

                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"lineNo"
                    ,fields:{
                        etcTpCd:{type:"string", editable:false, validation:{required:true}}
                       ,etcTpNm:{type:"string", editable:false, validation:{required:true}}
                       ,etcReqCont:{type:"string"}
                       ,etcReqPrc:{type:"number",  validation:{required:true}}
                    }

                 }//model
           }//schema
        }//dataSource
        ,height:180
        ,pageable:false
        ,autoBind:false
        ,sortable:false
        ,editable:editYn
        ,editable:{
            confirmation:false
        }
        ,reorderable:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,resizable:false
        ,edit:function(e){
            if(preFixTp == "ROSTATUS"){
                this.closeCell();
            }
        }
        ,columns:[
            {field:"etcTpCd", title:"<spring:message code='ser.lbl.etcCdTp' />", width:80}                      // 기타유형코드
            ,{field:"etcTpNm", title:"<spring:message code='ser.lbl.etcCdNm' />", width:100}                    // 기타사항명
            ,{field:"etcAtcTpCd", title:"<spring:message code='ser.lbl.etcIssueTp' />", width:100        // 기타사항유형
                ,hidden :true
            }
            ,{field:"etcReqPrc", title:"<spring:message code='ser.lbl.etcAmt' />", width:120
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        min:0,
                        max:100000000,
                        decimals:0,
                        spinner:false,
                        change:changeTotalAmt
                    });
                }
            } // 금액
            ,{field:"paymTp", title:"<spring:message code='ser.lbl.payTp' />", width:100
                ,attributes:{"class":"ac"}
                ,template:"#=paymTpCdGrid(paymTp)#"
                ,editor:function(container, options){
                    $('<input required name="paymTp" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        valuePrimitive:true
                        ,dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:paymTpCdList
                        ,change:function(){
                            var grid = $("#etcIssueGrid").data("kendoExtGrid");
                            var selectedVal = grid.dataItem(grid.select());
                            chagePayTp(grid);
                        }
                    });
                },hidden :hiddenColYn
            }   // 결제유형
            ,{field:"paymCd", title:"<spring:message code='ser.lbl.payerCd' />", width:100,hidden :hiddenColYn}       // 결제자번호
            ,{field:"paymUsrNm", title:"<spring:message code='ser.lbl.payer' />", width:100 ,hidden :hiddenColYn}     // 결제자
            ,{field:"preFixId", hidden:true}
            ,{field:"dlrCd", hidden:true}
        ]
    });

    var etcIssueGrid = $("#etcIssueGrid").data("kendoExtGrid");

    /**############################ 버튼 설정##################################**/
    /** 요청사항 추가  **/
    $("#etcIssueAdd").kendoButton({
        click:function (e){

            // 기타사항 팝업
            etcIssuePopup = dms.window.popup({
                windowId:"etcIssuePopup"
                , title:"<spring:message code='ser.lbl.othDetail' />"   // 기타사항
                , height:350
                , content:{
                    url:"<c:url value='/ser/cmm/popup/selectEtcIssuePopup.do'/>"
                    , data:{
                        "autoBind":true
                        , "callbackFunc":function(jsonObj) {

                             if(jsonObj.length > 0) {

                                 var paymTp;
                                 var paymCd;
                                 var paymUsrNm;

                                 var roTpCd;
                                 var campaignYn = "N";

                                 if(preFixId == "RE" || preFixId == "PRE"){   // 예약접수, 부품예약
                                     roTpCd = (campaignYn == "Y") ? "02":"01";
                                 }else if(preFixId == "PRC") {
                                     roTpCd = $("#preRoTp").data("kendoExtDropDownList").value(); //RO 유형 코드
                                 }else if(preFixId == "RES") {  // 구원서비스
                                     roTpCd = "01";
                                 }else if(preFixId == "ET") {  // 부품수령견적
                                     roTpCd = "01";
                                 }
                                 else {
                                     roTpCd = $("#roTp").data("kendoExtDropDownList").value(); //RO 유형 코드
                                 }

                                 //01 보증 , 02 보험 , 03 기타고객 , 04 고객 , 05 딜러
                                 if(preFixId == "CA" || preFixId == "RO" || preFixId == "ET"  || preFixId == "PRC"){
                                     if(roTpCd == "01"){ //일반
                                         var custNm = (dms.string.isEmpty($("#driverNm").val()))? $("#carOwnerNm").val() : $("#driverNm").val();
                                         var custNo = (dms.string.isEmpty($("#driverId").val()))? $("#carOwnerId").val() : $("#driverId").val();
                                         paymTp    = "04";       //기타고객 , 고객
                                         paymCd     = custNo;
                                         paymUsrNm = custNm;

                                     }else if(roTpCd == "02"){//보증
                                         paymTp    = "01";       //보증
                                         paymCd     = "A07AA";
                                         paymUsrNm = "BHMC";
                                     }else if(roTpCd == "03"){//보험
                                         paymTp = "02";
                                     }else{
                                         paymTp    = "05";       // 딜러
                                         paymCd     = "${dlrCd}";
                                         paymUsrNm = "${dlrNm}";
                                     }
                                 }

                                var grid = etcIssueGrid.dataSource;
                                grid.insert(0,{
                                     "etcTpCd":jsonObj[0].etcCd
                                    ,"etcTpNm":jsonObj[0].etcCdNm
                                    ,"etcReqPrc":jsonObj[0].etcAmt
                                    ,"preFixId":preFixId
                                    ,"paymTp":paymTp
                                    ,"paymCd":paymCd
                                    ,"paymUsrNm":paymUsrNm
                                });

                                changeTotalAmt();
                            }
                        }
                    }
                }
            });
        }
    });

    /** 요청사항 삭제  **/
     $("#etcIssueDel").kendoButton({
         click:function (e){
             var rows = etcIssueGrid.select();

             rows.each(function(index, row) {
                 etcIssueGrid.removeRow(row);
             });

             changeTotalAmt();
         }
     });

    //기타사항  결과값 세팅
    etcIssueSet = function(jobNo, listType){
        etcIssuePreFixId = dms.string.strNvl(listType) == "" ? preFixId:listType;
        etcIssueJobNo = jobNo;

        etcIssueGrid.dataSource.read();
    };

    getEtcIssueData = function() {
        var etcIssueData = etcIssueGrid.dataSource.data();

        return etcIssueData;
    };

    // 서비스알람에서 추가
    etcIssueSerAlramAdd = function(jsonObj){

        var etcIssueGrid = $("#etcIssueGrid").data("kendoExtGrid");
        var etcIssueGridData = etcIssueGrid.dataSource._data;

        if(jsonObj.total > 0){
            $.each(jsonObj.data, function(idx, data){

                var copyData;
                var checkVal = true;

                // 중복값 체크
                $.each(etcIssueGridData , function(idx, obj){
                    if(data.etcTpCd == obj.etcTpCd){
                        checkVal = false;
                    }
                });

                if(checkVal && preFixId == "RO"){
                    etcIssueGrid.dataSource.add(data);
                }
            });
        }
    }

});

</script>