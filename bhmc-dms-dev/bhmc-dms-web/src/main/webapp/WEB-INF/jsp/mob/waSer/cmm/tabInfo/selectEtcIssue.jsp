<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div>
    <div class="table_grid">
        <div id="etcIssueGrid" class="grid"></div>
    </div>
</div>

<script type="text/javascript">

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
}

$(document).ready(function(){

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
        ,height:166
        ,pageable:false
        ,autoBind:false
        ,sortable:false
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,resizable:false
        ,editable:false
        
        ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
        ,appendEmptyColumn:false           //빈컬럼 적용. default:false
        ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
        ,columns:[
             {field:"etcTpCd", title:"<spring:message code='ser.lbl.etcCdTp' />", width:80}   // 기타코드유형
            ,{field:"etcTpNm", title:"<spring:message code='ser.lbl.etcCdNm' />", width:120}  // 기타코드명
            ,{field:"etcReqCont", title:"<spring:message code='ser.lbl.etcReqCont' />", width:120}    // 기타내용
            ,{field:"etcReqPrc", title:"<spring:message code='ser.lbl.etcAmt' />", width:120
                ,format:"{0:n2}"
            } // 금액
            ,{field:"preFixId", hidden:true}
            ,{field:"dlrCd", hidden:true}
        ]
    });

    /** 기타사항 정보**/
    etcIssueParam = function(e){
      //고객요구사항
        var etcIssueGrid = $("#etcIssueGrid").data("kendoExtGrid");
        var etcIssueSaveData = etcIssueGrid.dataSource.data();

        return etcIssueSaveData;
    };

    //기타사항  결과값 세팅
    etcIssueSet = function(jobNo, listType){
        etcIssuePreFixId = dms.string.strNvl(listType) == "" ? preFixId:listType;
        etcIssueJobNo = jobNo;

        $("#etcIssueGrid").data("kendoExtGrid").dataSource.read();
    };

    getEtcIssueData = function() {
        var etcIssueData = $("#etcIssueGrid").data("kendoExtGrid").dataSource.data();

        return etcIssueData;
    };

});

</script>