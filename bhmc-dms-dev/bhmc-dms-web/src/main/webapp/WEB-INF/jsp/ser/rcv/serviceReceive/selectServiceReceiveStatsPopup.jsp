<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 수납통계 팝업화면 -->
<section id="window" class="pop_wrap">
    <div class="table_grid mt10">
        <!-- 그리드1 -->
         <div id="grid" class="grid"></div>
        <!-- 그리드1 -->
    </div>
</section>

<script type="text/javascript">

var parentData = parent.selectRcvStatsPopup.options.content.data;
var searchParam = parentData.searchParam;

//지불방식 Array
var paymMthCdList = [];
<c:forEach var="obj" items="${paymMthCdList}">
paymMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//지불방식 Map
var paymMthCdMap = dms.data.arrayToMap(paymMthCdList, function(obj){ return obj.cmmCd; });

//지불방식
paymMthCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(paymMthCdMap[val] != undefined)
        returnVal = paymMthCdMap[val].cmmCdNm;
    }
    return returnVal;
};

$("#grid").kendoExtGrid({
    gridId:"G-SER-0318-000011"
    ,dataSource:{
        transport:{
            read:{
                url:"<c:url value='/ser/rcv/serviceReceive/selectServiceReceiveStats.do' />"
            }
            ,parameterMap:function( options, operation ){

                if(operation == "read"){

                 // 검색 조건을 파라미터로 담는다.
                    var params = {};

                    params["recordCountPerPage"] = options.pageSize;
                    params["pageIndex"] = options.page;
                    params["firstIndex"] = options.skip;
                    params["lastIndex"] = options.skip + options.take;
                    params["sort"] = options.sort;

                    params["sDlrCd"]      = searchParam.sDlrCd;
                    params["sCarRegNo"]   = searchParam.sCarRegNo;
                    params["sPaymYn"]     = searchParam.sPaymYn;
                    params["sPaymUsrNm"]  = searchParam.sPaymUsrNm;

                    params["sVinNo"]      = searchParam.sVinNo;
                    params["sRoTp"]       = searchParam.sRoTp;
                    params["sPaymTp"]     = searchParam.sPaymTp;
                    params["sPaymMthTp"]  = searchParam.sPaymMthTp;

                    //params["sCarOwnerNm"] = searchParam.sCarOwnerNm;
                    params["sDriverNm"] = searchParam.sDriverNm;
                    params["sPaymPrid"]   = searchParam.sPaymPrid;
                    params["sRcvStatCd"]  = searchParam.sRcvStatCd;
                    params["sRcvHistStatCd"]  = searchParam.sRcvHistStatCd;

                    params["sRcvCpltFromDt"]    = searchParam.sRcvCpltFromDt;
                    params["sRcvCpltToDt"]      = searchParam.sRcvCpltToDt;
                    params["sSerParDstinCd"]    = searchParam.sSerParDstinCd;

                    return kendo.stringify(params);
                }else if(operation !="read" && options.models){

                    return kendo.stringify(optios.models);

                }
            }//parameterMap
        }//transport
        ,schema:{
            model:{
                 id:"rnum"
                ,fields:{
                    rnum:{ type:"number"}
                }

            }//model
        }//schema
        ,aggregate:[
            { field:"rcvAmt", aggregate:"sum" }
            ,{ field:"refdAmt", aggregate:"sum" }
            ,{ field:"realTotAmt", aggregate:"sum" }
        ]
    }//dataSource
    ,selectable:"row"
    ,height:260
    ,scrollable:true
    ,editable:false
    ,filterable:false                 // 필터링 기능 사용안함
    ,autoBind:true
    ,pageable:false
    ,columns:[
          {field:"paymMthCd", title:"<spring:message code='ser.lbl.payMethod' />", width:80
              ,sortable:false
              ,attributes :{"class":"ac"}
              ,template:"#=paymMthCdGrid(paymMthCd)#"
          }
          ,{field:"rcvAmt", title:"<spring:message code='par.lbl.dpstAmt' />", width:80, sortable:false, format:"{0:n2}", attributes :{"class":"ar"}
                ,aggregates:["sum"]
                ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
          }
          ,{field:"refdAmt", title:"<spring:message code='ser.lbl.refdAmt' />", width:80, sortable:false, format:"{0:n2}", attributes :{"class":"ar"}
                ,aggregates:["sum"]
                ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
          }
          ,{field:"realTotAmt", title:"<spring:message code='ser.lbl.totRepairAmt' />", width:80, sortable:false, format:"{0:n2}", attributes :{"class":"ar"}
                ,aggregates:["sum"]
                ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
          }
     ]

});

</script>