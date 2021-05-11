<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- receiveDoc popup -->
    <section id="window" class="pop_wrap">
        <div class="header_area">
            <h1 class="title_center"><spring:message code="par.title.receiveDoc" /></h1>
            <div class="btn_right">
                <!-- <button class="btn_m">조회</button> -->
                <button class="btn_m" id="btnPrint"><spring:message code="par.btn.receivePrint" /></button>
                <button class="btn_m" id="btnClose"><spring:message code="par.btn.close" /></button>
            </div>
        </div>
        <div class="table_form form_width_100per">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:24%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                    <col style="width:10%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="parl.giTp" /></th>
                        <td>
                            <input id="sGiTp" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.parReqDocNo" /></th>
                        <td>
                            <input id="sParReqDocNo" name="sParReqDocNo" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.receiveTime" /></th>
                        <td>
                            <input id="sGiDtTime" name="sGiDtTime" class="form_input" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.carNo" /></th>
                        <td>
                            <input id="sCarNo" name="sCarNo" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.custNm" /></th>
                        <td>
                            <input id="sCustNm" name="sCustNm" class="form_input" maxlength="15" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.giDt" /></th>
                        <td>
                            <input id="sGiDt" name="sGiDt" class="form_input" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="table_grid mt10">
            <!-- targetReqDetailGrid -->
            <div id="targetReqDetailGrid" ></div>
            <!-- targetReqDetailGrid -->
        </div>
        <ul class="txt_input txt_input_v1">
            <li>
                <span class="span_txt"><spring:message code="par.lbl.manager" />:<span id="lblManager"></span> </span>
            </li>
            <li>
                <span class="span_txt"><spring:message code="par.lbl.receiveNm" />:<span id="lblReceiveId"></span> </span>
            </li>
            <li>
                <span class="span_txt"><spring:message code="par.lbl.receiveDocTime" />:<span id="lblReceiveTime"></span> </span>
            </li>
        </ul>
    </section>
    <!-- receiveDoc popup -->
<!-- script -->
<script>
//giStrgeCdList
var giStrgeCdList = [];
<c:forEach var="obj" items="${giStrgeCdList}">
giStrgeCdList.push({
    "strgeCd":"${obj.strgeCd}"
    ,"strgeNm":"${obj.strgeNm}"
});
</c:forEach>
var giStrgeCdMap = {};
$.each(giStrgeCdList, function(idx, obj){
    giStrgeCdMap[obj.strgeCd] = obj.strgeNm;
});
//location Array
var locCdList = [];
<c:forEach var="obj" items="${giLocCdList}">
locCdList.push({
    "locCd":"${obj.locCd}"
    ,"locNm":"${obj.locNm}"
});
</c:forEach>
var locCdMap = {};
$.each(locCdList, function(idx, obj){
    locCdMap[obj.locCd] = obj.locNm;
});

$(document).ready(function() {

    /************************************************************
        팝업옵션 설정
    *************************************************************/
    /**
    * 팝업 옵션
    */
    var options = parent.issueReceivePrintPopupButtonWindow.options.content.data;

    //확인 버튼.
    $("#btnPrint").kendoButton({
        click:function(e){
            // ready message
            dms.notification.info("<spring:message code='global.info.ready' />");
        }
    });
    //닫기 버튼.
    $("#btnClose").kendoButton({
        click:function(e){
            parent.issueReceivePrintPopupButtonWindow.close();
        }
    });

    //sGiTp dropdownlist
    $("#sGiTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:[{cmmCd:"01",cmmCdNm:"出库" }] //TODO:[InBoShim] common code defined.
        ,autoBind:true
        ,index:0
    });

    $("#sParReqDocNo").val(options.parReqDocNo);
    $("#sCarNo").val(options.carNo);
    $("#sCustNm").val(options.custNm);

    //targetReqDetailGrid.
    $("#targetReqDetailGrid").kendoExtGrid({
        gridId:"G-PAR-0808-152497"
       ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/ism/issueReq/selectIssueReqDetailes.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["sort"] = options.sort;

                        var parReqDocNo = $("#sParReqDocNo").val() == "" ? "X":$("#sParReqDocNo").val();
                        params["sParReqDocNo"] = parReqDocNo;
                        params["sCancYn"] = "N";

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"parReqDocLineNo"
                    ,fields:{
                        rnum:{ type:"number", validation:{required:true}, editable:false }
                        ,dlrCd:{ type:"string", validation:{required:true}, editable:false }
                        ,pltCd:{ type:"string", validation:{required:true}, editable:false }
                        ,parReqDocNo:{ type:"string" , validation:{required:true}, editable:false }
                        ,parReqDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                        ,parReqStatCd:{ type:"string" , validation:{required:true}, editable:false }
                        ,purcReqNo:{ type:"string" , validation:{required:true}, editable:false }
                        ,reqStrgeCd:{ type:"string" , validation:{required:true} }
                        ,cancYn:{ type:"string" , validation:{required:true}, editable:false }
                        ,parGiTp:{ type:"string" , validation:{required:true}, editable:false }
                        ,roDocNo:{ type:"string" , validation:{required:true}, editable:false }
                        ,roLineNo:{ type:"number" , validation:{required:true}, editable:false }
                        ,resvDocNo:{ type:"string" , validation:{required:true}, editable:false }
                        ,resvDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                        ,grStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                        ,giStrgeCd:{ type:"string" , validation:{required:true}, editable:true }
                        ,giLocCd:{ type:"string" , validation:{required:true}, editable:true }
                        ,dbItemCd:{ type:"string" , validation:{required:true}, editable:true }
                        ,pkgItemCd:{ type:"string", editable:false }
                        ,itemCd:{ type:"string" , validation:{required:true}, editable:true }
                        ,itemNm:{ type:"string" , validation:{required:true}, editable:false }
                        ,unitCd:{ type:"string" , validation:{required:true}, editable:false }
                        ,reqQty:{ type:"number" , validation:{required:true}, editable:false }
                        ,endQty:{ type:"number" , validation:{required:true}, editable:false }
                        ,avlbStockQty:{ type:"number", editable:false }
                        ,resvStockQty:{ type:"number", editable:false }
                        ,clamStockQty:{ type:"number", editable:false }
                        ,grScheQty:{ type:"number", editable:false }
                        ,giScheQty:{ type:"number", editable:false }
                        ,resvQty:{ type:"number", editable:true }
                        ,purcReqDt:{ type:"date" , editable:false }
                        ,giDt:{ type:"date" , editable:false }
                        ,giDocNo:{ type:"string" , editable:false }
                        ,giDocTp:{ type:"string" , editable:false }
                        ,giDocStatCd:{ type:"string" , editable:false }
                        ,dbYn:{ type:"string" , editable:false }
                        ,itemPrc:{ type:"number" , editable:false }
                        ,itemAmt:{ type:"number" , editable:false }
                        ,taxDdctAmt:{ type:"number" , editable:false }
                        ,taxAmt:{ type:"number" , editable:false }
                        ,receiveDt:{ type:"date" , editable:false }
                        ,receiveId:{ type:"string" , editable:false }
                        ,returnPartsQty:{ type:"number" , editable:false }
                        ,returnDt:{ type:"date" , editable:false }
                        ,returnId:{ type:"string" , editable:false }
                    }
                }
            }
        }
        ,height:260
        ,pageable:false
        ,autoBind:true
        ,filterable:false
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,multiSelectWithCheckbox:false
        ,dataBound:function(e){

            var giDt = null;
            var receiveId = "";
            var receiveDt = null;

            var rows = e.sender.tbody.children();
            $.each(rows, function(idx, row){
                var row = $(rows[idx]);
                var dataItem = e.sender.dataItem(row);

                if( dataItem != null && dataItem != 'undefined'){
                    if(giDt === null){
                        giDt = dataItem.giDt;
                    }
                    if(receiveId === ""){
                        receiveId = dataItem.receiveId;
                    }
                    if(receiveDt === null){
                        receiveDt = dataItem.receiveDt;
                    }
                }

            });

            if(giDt !== null){
                $("#sGiDt").val(kendo.toString(kendo.parseDate(giDt), "<dms:configValue code='dateFormat' />"));
                $("#sGiDtTime").val(kendo.toString(kendo.parseDate(giDt), "HH:mm"));
            }
            if(receiveId !== ""){
                $("#lblReceiveId").text(receiveId);
            }
            if(receiveDt !== null){
                $("#lblReceiveTime").text(kendo.toString(kendo.parseDate(receiveDt), "<dms:configValue code='dateFormat' />"));
            }
        }
        ,columns :
            [{field:"rnum", title:"<spring:message code='par.lbl.line'/>", width:40 }
            ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd'/>",width:100 }
            ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm'/>", width:150 }
            ,{field:"giStrgeCd", title:"<spring:message code='par.lbl.strge' />/<spring:message code='par.lbl.locId' />", width:120
                ,template:'#if(giStrgeCdMap[giStrgeCd] !== undefined){# #= giStrgeCdMap[giStrgeCd]# / #} if(locCdMap[giLocCd] !== undefined){# #= locCdMap[giLocCd]# #} #'
            }
            ,{field:"endQty", title:"<spring:message code='par.lbl.reqQty'/>", attributes:{"class":"ar"}, width:60 }
            ,{field:"itemPrc", title:"<spring:message code='par.lbl.prc' />", attributes:{"class":"ar"}, format:"{0:n2}", width:90 }
            ,{field:"taxDdctAmt", title:"<spring:message code='par.lbl.amt' />", attributes:{"class":"ar"}, format:"{0:n2}", width:90 }
            ,{field:"taxAmt", title:"<spring:message code='par.lbl.taxAmt' />", attributes:{"class":"ar"}, width:80 }
        ]
    });

});
</script>
<!-- //script -->