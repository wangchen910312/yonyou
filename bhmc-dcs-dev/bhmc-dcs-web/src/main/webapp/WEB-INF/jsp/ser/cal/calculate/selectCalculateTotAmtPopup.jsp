<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<link rel="stylesheet" type="text/css" href="/resources/css/kendo/kendo.common.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/kendo/kendo.rtl.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/kendo/kendo.default.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/kendo/kendo.dataviz.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/kendo/kendo.dataviz.default.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/themes/default/theme.css" type="text/css" />

<script type="text/javascript" src="/resources/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="/resources/js/kendo/kendo.all.min.js"></script>
<script type="text/javascript" src="/resources/js/kendo/cultures/kendo.culture.ko.min.js"></script>
<script type="text/javascript">var _contextPath = "/bhmc-dcs-web";</script>
<script type="text/javascript" src="/resources/js/dms/dms.common-1.0.js"></script>
<script type="text/javascript" src="/cmm/sci/js/selectCultureSettings.do"></script>
<script type="text/javascript" src="/resources/js/dms/kendo.ui.ext-1.0.js"></script>
<script type="text/javascript" src="/resources/js/dms/jquery.ext-1.0.js"></script>
<script type="text/javascript" src="/resources/js/dms/jquery.xml2json.js"></script>

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

$("#grid").kendoExtGrid({
    gridId:"G-SER-1103-000011"
    ,dataSource:{
        transport:{
            read:{
                url:"<c:url value='/ser/cal/calculate/selectCalculateAmt.do' />"
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
                    params["sRoTpList"]   = searchParam.sRoTpList;
                    params["sCalcDocNo"]  = searchParam.sCalcDocNo;
                    params["sRoDocNo"]    = searchParam.sRoDocNo;
                    params["sVinNo"]      = searchParam.sVinNo;
                    params["sRegUsrNm"]   = searchParam.sRegUsrNm;
                    params["sCalcStatCd"] = searchParam.sCalcStatCd;
                    params["sCalcFromDt"] = searchParam.sCalcFromDt;
                    params["sCalcToDt"]   = searchParam.sCalcToDt;
                    params["sRoFromDt"]   = searchParam.sRoFromDt;
                    params["sRoToDt"]     = searchParam.sRoToDt;
                    params["sRoUsrNm"]    = searchParam.sRoUsrNm;
                    params["sCarOwnerNm"] = searchParam.sCarOwnerNm;
                    params["sDlrRoTp"]    = searchParam.sDlrRoTp;

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
            { field:"calcAmt", aggregate:"sum" }
            ,{ field:"calcCancTotAmt", aggregate:"sum" }
            ,{ field:"calcTotAmt", aggregate:"sum" }
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
          {field:"calcAmt", title:"<spring:message code='ser.lbl.arCd' />(+)", width:80, sortable:false, format:"{0:n2}", attributes :{"class":"ar"}
                ,aggregates:["sum"]
                ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
          }
          ,{field:"calcCancTotAmt", title:"<spring:message code='ser.lbl.arCd' />(-)", width:80, sortable:false, format:"{0:n2}", attributes :{"class":"ar"}
                ,aggregates:["sum"]
                ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
          }
          ,{field:"calcTotAmt", title:"<spring:message code='ser.lbl.totRcvAmt' />", width:80, sortable:false, format:"{0:n2}", attributes :{"class":"ar"}
                ,aggregates:["sum"]
                ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
          }
     ]

});

</script>