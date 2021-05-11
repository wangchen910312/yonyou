<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 집객 -->
<section class="group">
    <!-- 목표현황 -->
        <div class="mt0">
            <div class="header_area">
                <div class="left_area ml0">
                    <span class="span_txt"><spring:message code="mis.lbl.conditionsearchbox" /></span><!-- 조건검색1  -->
                    <input type="text" id="sTargetStatusYyMmDd" name="sTargetStatusYyMmDd" value="" class="form_comboBox" style="width:150px;"><!-- 조회년도  -->
                    <button type="button" class="btn_s" id="btnTargetDcptMgmtTargetStatusSearch" name="btnTargetDcptMgmtTargetStatusSearch"><spring:message code="global.btn.search" /></button><!-- 딜러분해자료조회  -->
                </div>
                <div class="btn_right">
                    <button type="button" class="btn_s" id="btnTargetStatusSave"><spring:message code="global.btn.save" /></button><!-- 저장  -->
                    <button type="button" class="btn_s" id="btnTargetStatusComplete"><spring:message code="global.btn.fix" /></button><!-- 확정  -->
                </div>
            </div>
        <div class="header_area pt0">
            <h2 class="title_basic"><spring:message code="crm.lbl.potenCustCnt" />, <spring:message code="mis.lbl.recent3month" /></h2>
        </div>
        <div class="table_info table_info_v2 mt10">
            <!-- 그리드 시작 -->
            <div class="table_grid">
                <div id="grid"></div>
            </div>
            <!-- 그리드 종료 -->
        </div>
        <br>
        <div class="header_area">
            <h2 class="title_basic"><spring:message code="mis.lbl.collectcustomertargetconfig" /></h2>
        </div>
        <div class="table_info table_info_v2 mt10">
            <!-- 그리드 시작 -->
            <div class="table_grid">
                <div id="custGrid"></div>
            </div>
            <!-- 그리드 종료 -->
        </div>
        <br>
        <div class="table_info table_info_v2 mt10">
            <!-- 그리드 시작 -->
            <div class="table_grid">
                <div id="custGridVal"></div>
            </div>
            <!-- 그리드 종료 -->
        </div>

    </div>
</section>

<script type="text/javascript">

    $(document).ready(function() {

        $("#sTargetStatusYyMmDd").kendoDatePicker({
            value:"${sysdate}"
           ,format:"yyyyMMdd"
           ,parseFormats:["yyyyMMdd"]
        });

        $("#sTargetStatusYyMmDd").kendoMaskedTextBox({
            mask:"########"
        });

        var now = new Date();

        function leadingZeros(n, digits) {
            var zero = '';
            n = n.toString();
            if (n.length < digits) {
                for (i = 0; i < digits - n.length; i++)
                    zero += '0';
            }
            return zero + n;
        }

        if('${sTargetStatusYyMmDd}' == "" || '${sTargetStatusYyMmDd}' == 'null') {
            $("#sTargetStatusYyMmDd").val(leadingZeros(now.getFullYear(), 4)+leadingZeros(now.getMonth()+1, 2)+leadingZeros(now.getDate(), 2));
        } else {
            $("#sTargetStatusYyMmDd").val('${sTargetStatusYyMmDd}');
        }



        //버튼 - 조회
        $("#btnTargetDcptMgmtTargetStatusSearch").kendoButton({
            click:function(e) {

                if($("#sTargetStatusYyMmDd").val() == ''){
                    alert("<spring:message code='global.info.required.select'/>");
                    return;
                }

                $('#grid').data('kendoExtGrid').dataSource.page(1);
                $('#custGrid').data('kendoExtGrid').dataSource.page(1);
                $('#custGridVal').data('kendoExtGrid').dataSource.page(1);
            }
        });

      //버튼 - 저장
        $("#btnTargetStatusSave").kendoButton({
            click:function(e){


                if (!confirm($("#sTargetStatusYyMmDd").val().substr(0,4) + "년 " + $("#sTargetStatusYyMmDd").val().substr(4,2) + "월  집객목표를 저장하시겠습니까?")) return;

                $.ajax({
                    type     :'post',
                    dataType :'json',
                    url      :'<c:url value="/mis/tdm/multiTargetCustConfigRegTempSave.do" />',
                    cache    :false,
                    async    :false,
                    data     :$('#frmTargetStatus').serialize(),
                    success:function(data) {

                    },
                    error:function(xhr, textStatus) {

                    },
                    complete:function() {
                        alert('저장되었습니다.');
                    }
                });

           }
        });

      //버튼 - 저장
        $("#btnTargetStatusComplete").kendoButton({
            click:function(e){

                if (!confirm($("#sTargetStatusYyMmDd").val().substr(0,4) + "년 " + $("#sTargetStatusYyMmDd").val().substr(4,2) + "월 집객목표를 확정하시겠습니까?")) return;

                $.ajax({
                    type     :'post',
                    dataType :'json',
                    url      :'<c:url value="/mis/tdm/updateTargetDcptMgmtDealerDcptCustComplete.do" />',
                    cache    :false,
                    async    :false,
                    data     :$('#frmTargetStatus').serialize(),
                    success:function(data) {

                    },
                    error:function(xhr, textStatus) {

                    },
                    complete:function() {
                        alert('확정되었습니다.');
                        location.reload(true);
                    }
                });

           }
        });

        //그리드 설정
        $("#grid").kendoExtGrid({
            //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
            gridId:"G-MIS-0913-194300"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/mis/tdm/selectTargetDcptMgmtProcessMgmtGrid.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sTargetStatusYyMmDd"] = $("#sTargetStatusYyMmDd").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"nameGubn"
                        ,fields:{
                             nameGubn:{type:"string"}
                            ,nameChannel:{type:"string"}
                            ,potenCustCnt1:{type:"string"}
                            ,potenCustCnt2:{type:"string"}
                            ,potenCustCnt3:{type:"string"}
                            ,potenCustCnt4:{type:"string"}
                            ,potenCustCnt5:{type:"string"}
                            ,potenCustCnt6:{type:"string"}
                            ,potenCustCnt7:{type:"string"}
                            ,potenCustCnt8:{type:"string"}
                            ,potenCustCnt9:{type:"string"}
                            ,potenCustCnt10:{type:"string"}
                            ,potenCustCnt11:{type:"string"}
                            ,potenCustCnt12:{type:"string"}
                            ,potenCustCnt13:{type:"string"}
                            ,potenCustCnt14:{type:"string"}
                            ,potenCustCnt15:{type:"string"}
                            ,potenCustCnt16:{type:"string"}
                            ,potenCustCnt17:{type:"string"}
                            ,potenCustCnt18:{type:"string"}
                            ,potenCustCnt19:{type:"string"}
                            ,potenCustCnt20:{type:"string"}
                            ,potenCustCnt21:{type:"string"}
                        }
                    }
                }
            }
            ,height:192
            ,filterable:false
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
            ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:false               //Tooltip 적용, default:false
            ,editable:false
            ,sortable:false
            ,pageable:false
            ,columns:[
                {field:"nameGubn", title:"<spring:message code='mis.lbl.gubn' />", width:200, sortable:false, attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        if(dataItem.nameGubn == "1"){
                            return '<spring:message code="crm.lbl.potenCustCnt" /><br>(H-B)';
                        } else if(dataItem.nameGubn == "2"){
                            return '<spring:message code="mis.lbl.dealrate" /><br>(<spring:message code="mis.lbl.recent3month" />)';
                        } else if(dataItem.nameGubn == "3"){
                            return '<spring:message code="mis.lbl.custinfoinputrate" /><br>(<spring:message code="mis.lbl.recent3month" />)';
                        }
                        return '-';
                    }
                }
                ,{field:"nameChannel", title:"<spring:message code='mis.lbl.salechannel' />", width:80, attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        if(dataItem.nameChannel == "I"){
                            return '<spring:message code="mis.lbl.idcc" />';
                        } else if(dataItem.nameChannel == "M"){
                            return '<spring:message code="mis.lbl.market" />';
                        }
                        return '-';
                    }
                }
                ,{field:"potenCustCnt1", title:"2C", width:70, attributes:{"class":"ac"}

                }
                ,{field:"potenCustCnt2", title:"B3", width:70, attributes:{"class":"ac"}

                }
                ,{field:"potenCustCnt3", title:"BX", width:70, attributes:{"class":"ac"}

                }
                ,{field:"potenCustCnt4", title:"C3", width:70, attributes:{"class":"ac"}

                }
                ,{field:"potenCustCnt5", title:"C7", width:70, attributes:{"class":"ac"}

                }
                ,{field:"potenCustCnt6", title:"C9", width:70, attributes:{"class":"ac"}

                }
                ,{field:"potenCustCnt7", title:"CE", width:70, attributes:{"class":"ac"}

                }
                ,{field:"potenCustCnt8", title:"CH", width:70, attributes:{"class":"ac"}

                }
                ,{field:"potenCustCnt9", title:"CP", width:70, attributes:{"class":"ac"}

                }
                ,{field:"potenCustCnt10", title:"DC", width:70, attributes:{"class":"ac"}

                }
                ,{field:"potenCustCnt11", title:"DZ", width:70, attributes:{"class":"ac"}

                }
                ,{field:"potenCustCnt12", title:"E5", width:70, attributes:{"class":"ac"}

                }
                ,{field:"potenCustCnt13", title:"ES", width:70, attributes:{"class":"ac"}

                }
                ,{field:"potenCustCnt14", title:"F0", width:70, attributes:{"class":"ac"}

                }
                ,{field:"potenCustCnt15", title:"F8", width:70, attributes:{"class":"ac"}

                }
                ,{field:"potenCustCnt16", title:"F9", width:70, attributes:{"class":"ac"}

                }
                ,{field:"potenCustCnt17", title:"ID", width:70, attributes:{"class":"ac"}

                }
                ,{field:"potenCustCnt18", title:"IK", width:70, attributes:{"class":"ac"}

                }
                ,{field:"potenCustCnt19", title:"IV", width:70, attributes:{"class":"ac"}

                }
                ,{field:"potenCustCnt20", title:"IZ", width:70, attributes:{"class":"ac"}

                }
                ,{field:"potenCustCnt21", title:"TE", width:70, attributes:{"class":"ac"}

                }
            ]
        });

      //그리드 설정
        $("#custGrid").kendoExtGrid({
            //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
            gridId:"G-MIS-0913-195500"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/mis/tdm/selectTargetDcptMgmtProcessCustConfig.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sTargetStatusYyMmDd"] = $("#sTargetStatusYyMmDd").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"custGubn"
                        ,fields:{
                             custGubn:{type:"string"}
                            ,custChannel:{type:"string"}
                            ,targetconfig1:{type:"string"}
                            ,targetconfig2:{type:"string"}
                            ,targetconfig3:{type:"string"}
                            ,targetconfig4:{type:"string"}
                            ,targetconfig5:{type:"string"}
                            ,targetconfig6:{type:"string"}
                            ,targetconfig7:{type:"string"}
                            ,targetconfig8:{type:"string"}
                            ,targetconfig8:{type:"string"}
                            ,targetconfig10:{type:"string"}
                            ,targetconfig11:{type:"string"}
                            ,targetconfig12:{type:"string"}
                            ,targetconfig13:{type:"string"}
                            ,targetconfig14:{type:"string"}
                            ,targetconfig15:{type:"string"}
                            ,targetconfig16:{type:"string"}
                            ,targetconfig17:{type:"string"}
                            ,targetconfig18:{type:"string"}
                            ,targetconfig19:{type:"string"}
                            ,targetconfig20:{type:"string"}
                            ,targetconfig21:{type:"string"}
                        }
                    }
                }
            }
            ,height:156
            ,filterable:false
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
            ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:false               //Tooltip 적용, default:false
            ,editable:false
            ,sortable:false
            ,pageable:false
            ,columns:[
                {field:"custGubn", title:"<spring:message code='mis.lbl.gubn' />", width:200, sortable:false, attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        if(dataItem.custGubn == "1"){
                            return '<spring:message code="mis.lbl.saletargetmonth" />';
                        } else if(dataItem.custGubn == "2"){
                            return '<spring:message code="mis.lbl.collectcustomertarget" />(<spring:message code="mis.lbl.opinionvalue" />)';
                        }
                        return '-';
                    }
                }
                ,{field:"custChannel", title:"<spring:message code='mis.lbl.salechannel' />", width:80, attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        if(dataItem.custChannel == "I"){
                            return '<spring:message code="mis.lbl.idcc" />';
                        } else if(dataItem.custChannel == "M"){
                            return '<spring:message code="mis.lbl.market" />';
                        }
                        return '-';
                    }
                }
                ,{field:"targetconfig1", title:"2C", width:70, attributes:{"class":"ac"}

                }
                ,{field:"targetconfig2", title:"B3", width:70, attributes:{"class":"ac"}

                }
                ,{field:"targetconfig3", title:"BX", width:70, attributes:{"class":"ac"}

                }
                ,{field:"targetconfig4", title:"C3", width:70, attributes:{"class":"ac"}

                }
                ,{field:"targetconfig5", title:"C7", width:70, attributes:{"class":"ac"}

                }
                ,{field:"targetconfig6", title:"C9", width:70, attributes:{"class":"ac"}

                }
                ,{field:"targetconfig7", title:"CE", width:70, attributes:{"class":"ac"}

                }
                ,{field:"targetconfig8", title:"CH", width:70, attributes:{"class":"ac"}

                }
                ,{field:"targetconfig9", title:"CP", width:70, attributes:{"class":"ac"}

                }
                ,{field:"targetconfig10", title:"DC", width:70, attributes:{"class":"ac"}

                }
                ,{field:"targetconfig11", title:"DZ", width:70, attributes:{"class":"ac"}

                }
                ,{field:"targetconfig12", title:"E5", width:70, attributes:{"class":"ac"}

                }
                ,{field:"targetconfig13", title:"ES", width:70, attributes:{"class":"ac"}

                }
                ,{field:"targetconfig14", title:"F0", width:70, attributes:{"class":"ac"}

                }
                ,{field:"targetconfig15", title:"F8", width:70, attributes:{"class":"ac"}

                }
                ,{field:"targetconfig16", title:"F9", width:70, attributes:{"class":"ac"}

                }
                ,{field:"targetconfig17", title:"ID", width:70, attributes:{"class":"ac"}

                }
                ,{field:"targetconfig18", title:"IK", width:70, attributes:{"class":"ac"}

                }
                ,{field:"targetconfig19", title:"IV", width:70, attributes:{"class":"ac"}

                }
                ,{field:"targetconfig20", title:"IZ", width:70, attributes:{"class":"ac"}

                }
                ,{field:"targetconfig21", title:"TE", width:70, attributes:{"class":"ac"}

                }
            ]
        });

      //그리드 설정
        $("#custGridVal").kendoExtGrid({
            //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
            gridId:"G-MIS-0913-121200"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/mis/tdm/selectTargetDcptMgmtProcessCustConfigVal.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sTargetStatusYyMmDd"] = $("#sTargetStatusYyMmDd").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"custGubnVal"
                        ,fields:{
                             custGubnVal:{type:"string", editable:false}
                            ,custChannelVal:{type:"string", editable:false}
                            ,custCnt1:{type:"string"}
                            ,custCnt2:{type:"string"}
                            ,custCnt3:{type:"string"}
                            ,custCnt4:{type:"string"}
                            ,custCnt5:{type:"string"}
                            ,custCnt6:{type:"string"}
                            ,custCnt7:{type:"string"}
                            ,custCnt8:{type:"string"}
                            ,custCnt9:{type:"string"}
                            ,custCnt10:{type:"string"}
                            ,custCnt11:{type:"string"}
                            ,custCnt12:{type:"string"}
                            ,custCnt13:{type:"string"}
                            ,custCnt14:{type:"string"}
                            ,custCnt15:{type:"string"}
                            ,custCnt16:{type:"string"}
                            ,custCnt17:{type:"string"}
                            ,custCnt18:{type:"string"}
                            ,custCnt19:{type:"string"}
                            ,custCnt20:{type:"string"}
                            ,custCnt21:{type:"string"}
                        }
                    }
                }
            }
            ,height:94
            ,filterable:false
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
            ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:false               //Tooltip 적용, default:false
            ,sortable:false
            ,pageable:false
            ,columns:[
                {field:"custGubnVal", title:"<spring:message code='mis.lbl.gubn' />", width:200, sortable:false, attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        if(dataItem.custGubnVal == "1"){
                            return '<spring:message code="mis.lbl.collectcustomertarget" />(<spring:message code="mis.lbl.prefVal" />)';
                        }
                        return '-';
                    }
                }
                ,{field:"custChannelVal", title:"<spring:message code='mis.lbl.salechannel' />", width:80, attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        if(dataItem.custChannelVal == "I"){
                            return '<spring:message code="mis.lbl.idcc" />';
                        } else if(dataItem.custChannelVal == "M"){
                            return '<spring:message code="mis.lbl.market" />';
                        }
                        return '-';
                    }
                }
                ,{field:"custCnt1", title:"2C", width:70, attributes:{"class":"ac"}

                }
                ,{field:"custCnt2", title:"B3", width:70, attributes:{"class":"ac"}

                }
                ,{field:"custCnt3", title:"BX", width:70, attributes:{"class":"ac"}

                }
                ,{field:"custCnt4", title:"C3", width:70, attributes:{"class":"ac"}

                }
                ,{field:"custCnt5", title:"C7", width:70, attributes:{"class":"ac"}

                }
                ,{field:"custCnt6", title:"C9", width:70, attributes:{"class":"ac"}

                }
                ,{field:"custCnt7", title:"CE", width:70, attributes:{"class":"ac"}

                }
                ,{field:"custCnt8", title:"CH", width:70, attributes:{"class":"ac"}

                }
                ,{field:"custCnt9", title:"CP", width:70, attributes:{"class":"ac"}

                }
                ,{field:"custCnt10", title:"DC", width:70, attributes:{"class":"ac"}

                }
                ,{field:"custCnt11", title:"DZ", width:70, attributes:{"class":"ac"}

                }
                ,{field:"custCnt12", title:"E5", width:70, attributes:{"class":"ac"}

                }
                ,{field:"custCnt13", title:"ES", width:70, attributes:{"class":"ac"}

                }
                ,{field:"custCnt14", title:"F0", width:70, attributes:{"class":"ac"}

                }
                ,{field:"custCnt15", title:"F8", width:70, attributes:{"class":"ac"}

                }
                ,{field:"custCnt16", title:"F9", width:70, attributes:{"class":"ac"}

                }
                ,{field:"custCnt17", title:"ID", width:70, attributes:{"class":"ac"}

                }
                ,{field:"custCnt18", title:"IK", width:70, attributes:{"class":"ac"}

                }
                ,{field:"custCnt19", title:"IV", width:70, attributes:{"class":"ac"}

                }
                ,{field:"custCnt20", title:"IZ", width:70, attributes:{"class":"ac"}

                }
                ,{field:"custCnt21", title:"TE", width:70, attributes:{"class":"ac"}

                }
            ]
        });



    });

</script>