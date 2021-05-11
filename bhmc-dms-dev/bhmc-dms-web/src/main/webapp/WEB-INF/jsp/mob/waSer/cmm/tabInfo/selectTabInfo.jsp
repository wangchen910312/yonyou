<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div>
    <div class="table_grid">
        <div id="custRemarkGrid" class="grid"></div>
    </div>
</div>

<script type="text/javascript">


$(document).ready(function(){


    // 고객요청사항 그리드
    $("#custRemarkGrid").kendoExtGrid({
        dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/cmm/tabInfo/selectCustDemands.do' />"
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

                         params["sPreFixId"] = tabInfoPreFixId;
                         params["sJobNo"] = tabInfoJobNo;

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
                        lineNo:{type:"number", editable:false }
                       ,custReqCont:{type:"string", editable:true }
                       ,preFixId:{type:"string", editable:false }
                       ,dlrCd:{type:"string", editable:false }
                    }

                 }//model
           }//schema
        }//dataSource
        ,editable:false
        ,height:166
        ,pageable:false
        ,autoBind:false
        ,sortable:false
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,resizable:false
        ,dataBound:function(){
            var grid = $("#custRemarkGrid").data("kendoExtGrid").dataSource;
            if(grid.data().length <= 0){
                custDemandAdd();
            }
        }
        
        ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
        ,appendEmptyColumn:false           //빈컬럼 적용. default:false
        ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
        
        ,columns:[
             {field:"lineNo", title:"<spring:message code='ser.lbl.custReqCd' />", width:50}
            ,{field:"custReqCont", title:"<spring:message code='ser.lbl.reqCont' />", width:400}
            ,{field:"preFixId" ,title:"preFixId", hidden:true, width:100}
            ,{field:"dlrCd" ,title:"dlrCd", hidden:true, width:100}
        ]
    });

    
    trobleDescInfo = function(jobNo, listType){
        tabInfoPreFixId = dms.string.strNvl(listType) == "" ? $("#preFixId").val():listType;
        tabInfoJobNo = jobNo;
    };
        
   /** 고객요구사항 정보**/
   custDemandParam = function(e){
     //고객요구사항
       var custDemandGrid = $("#custRemarkGrid").data("kendoExtGrid");
       var custSaveData = custDemandGrid.dataSource.data();

       return custSaveData;
   };



    var grid = $("#custRemarkGrid").data("kendoExtGrid").dataSource;
    if(grid.data().length <= 0){
        custDemandAdd();
    }
    
    
    
});

custDemandAdd = function() {
    var grid = $("#custRemarkGrid").data("kendoExtGrid").dataSource;
    grid.insert(0,{
        "lineNo":""
       ,"custReqCont" :""
   });
}

</script>