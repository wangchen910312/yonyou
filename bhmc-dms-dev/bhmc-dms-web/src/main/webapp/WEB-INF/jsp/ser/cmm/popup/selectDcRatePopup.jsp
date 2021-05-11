<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">
    <div class="header_area">
            <div class="btn_right">
                <!-- 조회 버튼 -->
                <button id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /><!-- 조회 --></button>
                <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button>
                <button id="btnCancel" class="btn_m btn_Cancel"><spring:message code="global.btn.cancel" /></button>
            </div>
    </div>
    <div class="table_grid mt10">
        <!-- 그리드1 -->
        <div id="grid" class="grid"></div>
        <!-- 그리드1 -->
   </div>
</section>
<input type="hidden" id="dlrCd" value="${dlrCd}">
<input type="hidden" id="userId" value="${userId}">
<input type="hidden" id="sDcPermTp">
<input type="hidden" id="sCustNo" >
<input type="hidden" id="sDcTp" >

<script type="text/javascript">

var parMaxDcRate;
var lbrMaxDcRate;

//할인구분 Array
var dcTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${dcTpList}">
dcTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//할인구분 Map
var dcTpMap = dms.data.arrayToMap(dcTpList, function(obj){ return obj.cmmCd; });

//할인구분 대상Array
var dcPermTpList = [];
<c:forEach var="obj" items="${dcPermTpList}">
dcPermTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "remark1":"${obj.remark1}", "useYn":"${obj.useYn}"});
</c:forEach>

//할인구분 대상 Map
var dcPermTpMap = dms.data.arrayToMap(dcPermTpList, function(obj){ return obj.cmmCd; });

// DC 구분
dcTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(dcTpMap[val] != undefined)
            returnVal = dcTpMap[val].cmmCdNm;
    }
    return returnVal;
};

//할인대상구분
setDcPermTpMap = function(value){
    var returnVal = "";
    if( dms.string.strNvl(value) != ""){
        if(dcPermTpMap[value] != undefined)
            returnVal = dcPermTpMap[value].cmmCdNm;
    }

    return returnVal;
};

    /**
    * 팝업 옵션
    */
    var options = parent.dcSearchPopup.options.content.data,
        dcPermTpRemark;

    $(document).ready(function() {

        $("#sDcTp").val(options.dcTp);
        $("#sCustNo").val(options.custNo);

        if(!dms.string.isEmpty(options.dcPermTp)){
            $("#sDcPermTp").val(options.dcPermTp);
        }

        if(dms.string.isEmpty(options.remark)){
            dcPermTpRemark = 'P';
        }else{
            dcPermTpRemark = options.remark;
        }

        $("#btnSearch").kendoButton({
            click:function(){
                $("#grid").data("kendoExtGrid").dataSource.read();
            }
        });

        // 선택 버튼.
        $("#btnSelect").kendoButton({
            click:function(e){
                var grid = $("#grid").data("kendoExtGrid");
                var dataItem = grid.dataItem(grid.select());

                options.callbackFunc(dataItem);
                parent.dcSearchPopup.close();
            }
        });

        // 닫기 버튼.
        $("#btnCancel").kendoButton({
             click:function(e){
                 options.callbackFunc();
                 //parent.dcSearchPopup.close();
             }
        });

        //그리드 설정
        $("#grid").kendoExtGrid({
            gridId:"G-SER-1011-000015"
            ,dataSource:{
                transport:{
                   read:{
                       url:"<c:url value='/ser/svi/dcMaster/selectDcMastersAuths.do' />"
                   }
                   ,parameterMap:function(options, operation) {
                       if (operation === "read") {

                           var params = {},
                               sDcPermTpLst = [],
                               j = 0;

                           for(var i = 0; i < dcPermTpList.length; i = i + 1){
                               if(dcPermTpRemark != dcPermTpList[i].remark1){
                                     sDcPermTpLst[j] = dcPermTpList[i].cmmCd;
                                     j = j + 1;
                               }
                           }

                           params["recordCountPerPage"] = options.pageSize;
                           params["pageIndex"] = options.page;
                           params["firstIndex"] = options.skip;
                           params["lastIndex"] = options.skip + options.take;
                           params["sort"] = options.sort;

                           params["sDcCd"] = $("#sDcCd").val();
                           params["sDcNm"] = $("#sDcNm").val();
                           params["sDlrCd"] = $("#dlrCd").val();
                           params["sUserId"] = $("#userId").val();
                           params["sCustNo"] = $("#sCustNo").val();
                           params["sDcPermTp"] = $("#sDcPermTp").val();
                           params["sDcUseYn"] = "Y";
                           params["sDcDstinCd"] = "PEM";
                           params["sDcPermTpLst"] = sDcPermTpLst;
                           params["sToday"] = new Date("${sysDate}");

                           return kendo.stringify(params);

                       } else if (operation !== "read" && options.models) {
                           return kendo.stringify(options.models);
                       }
                   }
               }
               ,schema:{
                   model:{
                       id:"rnum"
                       ,fields:{
                           dlrCd:{type:"string",editable:false}
                           ,dcCd:{type:"string",editable:false}
                           ,dcTp:{type:"string",editable:false}
                           ,dcNm:{type:"string",editable:false}
                           ,lbrDcRate:{type:"number"}
                           ,lbrDcAmt:{type:"number",editable:false}
                           ,parDcRate:{type:"number"}
                           ,parDcAmt:{type:"number",editable:false}
                           ,subDcRate:{type:"number",editable:false}
                           ,subDcAmt:{type:"number",editable:false}
                           ,totDcRate:{type:"number",editable:false}
                           ,totDcAmt:{type:"number",editable:false}
                           ,dcApplyStartDt:{type:"date",editable:false}
                           ,dcApplyEndDt:{type:"date",editable:false}
                           ,dcScoreVal:{type:"string",editable:false}
                           ,dcUseYn:{type:"string",editable:false}
                           ,parMaxDcRate:{type:"number"}
                           ,lbrMaxDcRate:{type:"number"}
                       }
                   }
                   ,parse:function(d){
                       if(d.data){
                           $.each(d.data, function(idx, elem){
                               elem.parMaxDcRate = elem.parDcRate;
                               elem.lbrMaxDcRate = elem.lbrDcRate;
                           });
                       }
                       return d;
                   }
               }
            }
            ,height:334
            ,selectable:"row"
            ,filterable:false                 // 필터링 기능 사용안함
            ,autoBind:false
            ,change:function(e){
                var dataItem = this.dataItem(this.select());
            }
            ,columns:[
                {field:"dcCd", title:"<spring:message code='ser.lbl.dcCd' />", width:100//할인코드
                    ,attributes:{"class":"ac"}
                }
                ,{field:"dcNm", title:"<spring:message code='ser.lbl.dcNm' />", width:100//할인명
                    ,attributes:{"class":"ac"}
                }
                ,{field:"dcApplyStartDt", title:"<spring:message code='ser.lbl.dcStartDt' />", attributes:{"class":"ac"}, width:100, format:"{0:<dms:configValue code='dateFormat' />}"}    //할인기간
                ,{field:"dcApplyEndDt", title:"<spring:message code='ser.lbl.dcEndDt' />", attributes:{"class":"ac"}, width:100, format:"{0:<dms:configValue code='dateFormat' />}"}
                ,{field:"lbrDcRate", title:"<spring:message code='ser.lbl.lbrDcRate' />(%)", width:100, attributes:{"class":"ar"}
                    ,format:"{0:n2}"
                    ,editor:function(container, options){
                        var grid = $("#grid").data("kendoExtGrid");
                        var rowData = grid.dataItem(grid.select());
                        $('<input name="parDcRate" maxlength=4 data-bind="value:' + options.field + '"  />')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                             min:0
                            ,max:rowData.lbrMaxDcRate
                            ,decimals:2
                            ,spinners:false
                            ,restrictDecimals: true
                        });
                    }
                }    //  공인할인율
                ,{field:"parDcRate", title:"<spring:message code='ser.lbl.parDcRate' />(%)", attributes:{"class":"ar"}, width:100
                    ,format:"{0:n2}"
                    ,editor:function(container, options){
                        var grid = $("#grid").data("kendoExtGrid");
                        var rowData = grid.dataItem(grid.select());
                        $('<input name="parDcRate" maxlength=4 data-bind="value:' + options.field + '"  />')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                             min:0
                            ,max:rowData.parMaxDcRate
                            ,decimals:2
                            ,spinners:false
                            ,restrictDecimals: true
                        });
                    }
                }      //부품할인율
                ,{field:"lbrDcAmt", title:"<spring:message code='ser.lbl.lbrDcAmt' />", attributes:{"class":"ar"}, width:100 ,format:"{0:n2}", hidden:true } //부품할인금액
                ,{field:"parDcAmt", title:"<spring:message code='ser.lbl.parDcAmt' />", attributes:{"class":"ar"}, width:100,format:"{0:n2}", hidden:true} //부품할인금액
                ,{field:"dcTp", title:"<spring:message code='ser.lbl.dcTp' />", width:80, attributes:{"class":"ac"}
                    ,template:"#=dcTpCdGrid(dcTp)#"
                    ,hidden:true
                }   //할인적용방식
                ,{field:"dcPermTp", title:"<spring:message code='ser.lbl.dcPermTp' />", width:80, attributes:{"class":"ac"}
                    ,template:"#=setDcPermTpMap(dcPermTp)#"
                    ,hidden:true
                }   // 할인권한구분
            ]

        });

        $("#grid").data("kendoExtGrid").dataSource.read();
    });
</script>
