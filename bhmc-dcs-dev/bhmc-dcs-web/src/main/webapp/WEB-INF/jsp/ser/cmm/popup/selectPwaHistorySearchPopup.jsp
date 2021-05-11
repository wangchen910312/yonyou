<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="ser.title.pwaList" /></h1><!-- 고객조회 -->
        <div class="btn_right" style="display:none">
            <button type="button" id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button>
        </div>
    </div>
    <div class="table_grid mt10">
        <div id="grid" class="grid"></div>
    </div>
</section>
<script type="text/javascript">

//PWA 유형코드 pwaTpDs
var pwaTpList = [];
<c:forEach var ="obj" items="${pwaTpDs}">
pwaTpList.push({
    cmmCdNm:"${obj.cmmCdNm}"
    , cmmCd:"${obj.cmmCd}"
});
</c:forEach>
var pwaTpMap = dms.data.arrayToMap(pwaTpList , function(obj){return obj.cmmCd;});

//PWA 상태 코드
var pwaStatCdList = [];
<c:forEach var="obj" items="${pwaStatDs}">
    if("${obj.cmmCd}" != "O" ){ // 미결 상태는 제외
        pwaStatCdList.push({
            cmmCdNm:"${obj.cmmCdNm}"
            , cmmCd:"${obj.cmmCd}"
        });
    }
</c:forEach>
var pwaStatMap = dms.data.arrayToMap(pwaStatCdList, function(obj){return obj.cmmCd;});


$(document).ready( function(){

    setPwaMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
            if(pwaTpMap[value] != undefined)
            resultVal =  pwaTpMap[value].cmmCdNm;
        }
        return resultVal;
    };

    setPwaStatMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
            if(pwaStatMap[value] != undefined)
            resultVal =  pwaStatMap[value].cmmCdNm;
        }
        return resultVal;
    };

    /************************************************************
        팝업옵션 설정
    *************************************************************/

    var parentData = parent.pwaHistoryPopupWindow.options.content.data;

    // 그리드 더블 클릭 이벤트.
    $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
         $("#btnSelect").click();
    });


    /************************************************************
        기능버튼 설정
    *************************************************************/
    // 조회 버튼.
    $("#btnSearch").kendoButton({
        click:function(e){
              $("#grid").data("kendoExtGrid").dataSource.read();
        }
    });

    // 선택 버튼.
    $("#btnSelect").kendoButton({
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();


            if(rows !== null){
                var data = [];
                $.each(rows, function(idx, row){
                    data.push(grid.dataItem(row));
                });

                parentData.callbackFunc(data);
                parent.pwaHistoryPopupWindow.close();
            }
        }
    });

    // 닫기 버튼.
    $("#btnCancel").kendoButton({
        click:function(e){
              parent.pwaHistoryPopupWindow.close();
        }
    });


/************************************************************
    그리드 설정
*************************************************************/

     $("#grid").kendoExtGrid({
        gridId:"G-SER-0111-000001"
        ,dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/wac/pwaAppr/selectPwaHistory.do' />"
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


                         params["sPwaDocNo"] = parentData.pwaDocNo;
                         params["sVinNo"] = parentData.vinNo;
                         params["sDlrCd"] = parentData.dlrCd;


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
                        rnum:{type:"number" }
                       ,pwaStatCd:{type:"string" }
                       ,dlrCd:{type:"string" }
                       ,dlrNm:{type:"string" }
                       ,vinNo:{type:"string" }
                       ,pwaDocNo:{type:"string" }
                       ,pwaApproveNo:{type:"string" }
                       ,dlrSignReqDt:{type:"date" }
                       ,hqApproveDt:{type:"date"}
                       ,itemOccrAmt:{type:"number"}
                       ,lbrOccrAmt:{type:"number"}
                       ,subLbrOccrAmt:{type:"number"}
                       ,occrAmtSum:{type:"number"}
                    }

                 }//model
           }//schema
        }//dataSource
        ,editable:false
        ,scrollable:true
        ,autoBind:true
        ,selectable:"row"
        ,height:280
        ,sortable:false
        ,appendEmptyColumn:true
        ,filterable:false                 // 필터링 기능 사용안함
        ,columns:[
            {field:"rnum",title:"<spring:message code='ser.lbl.no' />", width:50,sortable:false, attributes:{"class":"ac"}}
           ,{field:"pwaStatNm",title:"<spring:message code='ser.lbl.statNm' />", width:100,attributes :{"class":"ac"}}//상태
           ,{field:"dlrCd",title:"<spring:message code='ser.lbl.dlrCd' />", width:80,sortable:false, attributes :{"class":"ac"}  }//딜러코드
           ,{field:"dlrNm",title:"<spring:message code='sal.lbl.dlrNm' />", width:180,sortable:false, attributes :{"class":"ac"}  }//딜러이름
           ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />" ,width:150 , attributes :{"class":"ac"}}//VIN
           ,{field:"pwaApproveNo",title:"<spring:message code='ser.lbl.pwaApprovalNo' />", width:100, attributes :{"class":"ac"} }//PWA승인번호
           ,{field:"carOwnerNm",title:"<spring:message code='ser.lbl.custNm' />", width:100,sortable:false, attributes :{"class":"al"}}//고객명
           ,{field:"dlrSignReqDt" , title:"<spring:message code='par.lbl.requestDt' />", width:120
               ,attributes :{"class":"ac"}
               ,format:"{0:<dms:configValue code='dateFormat' />  HH:mm}"
            }//신청일자
            ,{field:"hqApproveDt",title:"<spring:message code='global.lbl.evalDt' />", width:120,sortable:false
                , attributes :{"class":"ac"}
                , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
            }//심사일자
            ,{field:"cauOperAtcCd",title:"<spring:message code='ser.lbl.cauOperActCd' />", width:80,sortable:false, attributes :{"class":"ac"}}//주조작코드
            ,{field:"cauItemCd",title:"<spring:message code='ser.lbl.cauItemCd' />", width:120,sortable:false, attributes :{"class":"al"}}//원인부품
            ,{field:"pwaTpCd1",title:"<spring:message code='ser.lbl.pwaTpCd1' />", width:80,sortable:false, attributes :{"class":"ac"}}//PWA유형1
            ,{field:"pwaTpCd2",title:"<spring:message code='ser.lbl.pwaTpCd2' />", width:80,sortable:false, attributes :{"class":"ac"}}//PWA유형2
            ,{field:"itemOccrAmt",title:"<spring:message code='ser.lbl.itemAmt' />", width:80,sortable:false, attributes :{"class":"ar"}}//부품금액
            ,{field:"lbrOccrAmt",title:"<spring:message code='ser.lbl.confirmLbrAmt' />", width:80,sortable:false, attributes :{"class":"ar"}}//공임금액
            ,{field:"subLbrOccrAmt",title:"<spring:message code='ser.lbl.subLbrAmt' />", width:80,sortable:false, attributes :{"class":"ar"}}//외주금액
            ,{field:"occrAmtSum",title:"<spring:message code='global.lbl.total' />", width:100,sortable:false, attributes :{"class":"ar"}}//합계
            ,{field:"hqApproveNm",title:"<spring:message code='ser.lbl.hqApproveNm' />", width:80,sortable:false, attributes :{"class":"ac"}}//판정자이름
            ,{field:"returnReasonCont",title:"<spring:message code='ser.lbl.returnReasonCont' />", width:150, attributes :{"class":"al"} }//미승인원인
            ,{field:"returnCnt", title:"<spring:message code='ser.lbl.returnCnt' />",  width:80 , attributes :{"class":"ar"}}//리턴횟수
        ]
    });

    if(parentData.autoBind){
      $("#grid").data("kendoExtGrid").dataSource.read();
    }

});
</script>