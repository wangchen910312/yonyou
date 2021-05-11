<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<section class="group">
    <div class="header_area">
        <h1 class="title_basic">DMS-SQL </h1>
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>    <!-- 조회 -->
        </div>
    </div>
    <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:9%;">
                <col style="width:15%;">
                <col style="width:9%;">
                <col style="width:15%;">
                <col style="width:9%;">
                <col style="width:15%;">
                <col style="width:9%;">
                <col>
            </colgroup>
            <tbody>
                    <th scope="row">오픈일자(YYYYMMDD)</th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input type="text" id="sOpenFromDt" class="form_input" value="20170622">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input type="text" id="sOpenToDt" class="form_input" value="${sOpenToDt}">
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="table_form mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.cont" /></th>
                    <td>
                        <textarea id="sCont" class="form_textarea" style="height:250px;"></textarea>
                    </td>
                </tr>
                <tr>
                    <th scope="row">접속안된 IP</th>       <!-- 접속안된 IP -->
                    <td class="readonly_area">
                        <input id="noConnectIp" type="text" value="" readonly class="form_input" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid">
        <div id="grid"></div>
    </div>

<span style="display:none">

</span>
</section>

<script type="text/javascript">


var gridColumns = [];


/******************************************
 * ready ()
 ******************************************/
$(document).ready(function() {

    $("#btnSearch").kendoButton({ // 조회
        enable:true,
        click:function(e){

            if( dms.string.isEmpty($("#sCont").val())){
                // {내용}를(을) 선택해주세요.
                dms.notification.info("<spring:message code='global.lbl.cont' var='globalLblCont' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblCont}' />");
                return false;
            }

            $('#grid').data('kendoExtGrid').dataSource.data([]);
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });


    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0726-093702"
        ,dataSource:{
            requestEnd:function(e) {
                $("#noConnectIp").val(e.response.noConnectIp);

                var colList = e.response.columnList;
                var sColumn = [];
                sColumn = gridColumns.concat(sColumn);
                //sColumn = gridColumns;

                $.each(colList, function(idx, row){
                    var cColumn = {};
                    cColumn["field"] = row;
                    cColumn["title"] = row;
                    cColumn["width"] = 100;
                    cColumn["attributes"] = {"class":"al"};
                    sColumn.push(cColumn);
                });

                $("#grid").data("kendoExtGrid").setOptions({ columns:sColumn } );

           }
           ,transport:{
                read:{
                    url:"<c:url value='/sal/cmm/callSendSQLRun.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sSql"] = $("#sCont").val().replace(/\;/g,'');
                        params["sOpenToDt"] = $("#sOpenToDt").val();
                        params["sOpenFromDt"] = $("#sOpenFromDt").val();

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,batch:false
            ,schema:{
                //data:"dataSet",
                model:{
                    id:"DLR_CD",
                    fields:{
                        DLR_CD    :{type:"string"}   //딜러코드
                    }
                }
            }
           // ,pageSize:50
        }
       ,selectable:false
       ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
       /*
       ,pageable:{
           refresh:false
           ,pageSize:50
           ,pageSizes:[ "50", "100", "200", "400"]
       }
       */
       ,pageable:false
       ,filterable:false
       ,height:539
       ,editable   :false
       ,resizable  :true
       ,autoBind   :false
       ,selectable :"row"
       ,navigatable:true
       ,sortable:false
       ,columns:[
          {field:"DLR_CD", title:"<spring:message code='global.lbl.dlrCd' />", attributes:{"class":"ac"}, width:100}
       ]
   });

    gridColumns = $("#grid").data("kendoExtGrid").columns;

});
/******************************************
 * ready () = End =
 ******************************************/


function convertEscape(str){
     str = str.replace(/</g, "&lt;");
     str = str.replace(/>/g, "&gt;");
     str = str.replace(/\"/g, "&quot;");
     str = str.replace(/\'/g, "&#39;");

     str = str.replace(/&/g, '&amp;');
     str = str.replace(/\(/g, '&#40;');
     str = str.replace(/\)/g, '&#41;');
     return str;
}

function cEscapes(str){
    str = str.replace(/</g, "_");
    str = str.replace(/>/g, "_");
    str = str.replace(/\"/g, "_");
    str = str.replace(/\'/g, "_");
    str = str.replace(/&/g, '_');
    str = str.replace(/\(/g, '_');
    str = str.replace(/\)/g, '_');
    return str;
}



</script>