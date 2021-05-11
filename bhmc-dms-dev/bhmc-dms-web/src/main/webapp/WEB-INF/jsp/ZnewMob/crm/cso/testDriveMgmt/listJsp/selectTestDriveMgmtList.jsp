<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<section id="content_list">
    <div class="content_title conttitlePrev">
        <h2 id="content_list_title"><spring:message code="crm.lbl.testDriveList" /><!-- 시승 목록 --></h2>
    </div>
    <div class="listarea">
        <div class="listhead dlistitem">
            <span style="width:30%"><spring:message code="global.lbl.custNm" /><!-- 고객명 --></span>
            <span style="width:35%"><spring:message code="global.lbl.hpNo" /><!-- 휴대폰번호 --></span>
            <span style="width:35%"><spring:message code="crm.lbl.custCd" /><!-- 잠재/보유 --></span>
            <span class="clboth" style="width:65%"><spring:message code="global.lbl.tdrvResvDt" /><!-- 시승예약일시 --></span>
            <span class="" style="width:35%"><spring:message code="crm.lbl.tdrvHmCd" /><!-- 시승시간 --></span>
            <span class="clboth" style="width:30%"><spring:message code="crm.lbl.custStsfCd" /><!-- 고객만족도 --></span>
            <span style="width:65%"><spring:message code="crm.lbl.scId" /><!-- 판매고문 --></span>
        </div>
        <div>
            <div id="listView" style="height: 300px; overflow: scroll;"></div>
        </div>
    </div>
</section>

<script type="text/x-kendo-template" id="template">
<div class="dlistitem" onclick="javascript:listViewClick(listData._view[#:rnum-1 #]);">
    <span style="width:30%">#:custNm#</span>
    <span style="width:35%">#:hpNo #</span>
    <span style="width:35%">#:custCdNm#</span>
    <span class="clboth" style="width:65%">#:kendo.toString(resvDt, '<dms:configValue code='dateFormat' /> HH:mm') #</span>
    <span class="" style="width:35%">#:tdrvHmCdArrVal(tdrvHmCd) #</span>
    <span class="clboth" style="width:30%">#:custStsfCdArrVal(custStsfCd) #</span>
    <span style="width:70%">#:scNm    #</span>
</div>
</script>

<script>
var viewRow=10;//한번에 조회할 건수
var pageIndex = 0, pageSize = viewRow, rowTotal = 0;
var tempData=[];//데이타를 append 시키기위한 임시데이타 변수

// datasource below is customized for demo purposes.
var listData = new kendo.data.DataSource({

    transport:{
        read:{
            url:"<c:url value='/mob/crm/cso/testDrive/selectTestDriveMgmts.do' />"
            ,dataType:"json"
            ,type:"POST"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {

                var params = {};

                params["firstIndex"] = pageIndex;
                params["lastIndex"] = pageSize;

                params["sCust"] = $("#sCust").val();
                params["sScId"] = $("#sScId").data("kendoExtDropDownList").value();
                params["sModelCd"] = $("#sModelCd").data("kendoExtDropDownList").value();

                if($("#sStartDt").val() == ""){
                    params["sStartDt"] = null;
                }else{
                    params["sStartDt"] = chgDate($("#sStartDt").val());
                }

                if($("#sEndRegDt").val() == ""){
                    params["sEndDt"] = null;
                }else{
                    params["sEndDt"] = chgDate($("#sEndDt").val());
                }

                params["sTdrvVinNo"] = $("#sVin").val();
                params["sCustStsfStatCd"] = $("#sStatus").data("kendoExtDropDownList").value();

                $("#content_list").css("display","block");

                return kendo.stringify(params);

            }
        }
    }
    ,batch:true
    ,pageSize:pageSize
    ,serverPaging:true
    ,schema:{
        data:"data"
        ,total:"total"
        ,model:{
            id:"tdrvSeq"
            ,fields:{
                 tdrvSeq:{type:"number"}
                ,custNm:{type:"string"}
                ,hpNo:{type:"string"}
                ,resvDt:{type:"date"}
                ,tdrvHmCd:{type:"string"}
                ,custStsfCd:{type:"string"}
                ,scNm:{type:"string"}
                ,regDt:{type:"date"}
                ,carRegId:{type:"string"}
                ,custCdNm:{type:"string"}
            }
        }
    },
    change :function(e){
        rowTotal=this._total;
        if(rowTotal == 0){
            tempData=[];
            listData._view=tempData;
        }else{
            tempData.push.apply(tempData, this._data);
            listData._view=tempData;
        }
        $("#content_search, #content_detail").hide();
        $("#content_list").show();
        $("#header_title span").attr("class","search_open");
    }
    ,error:function(e){
      mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
  }
});


function listViewClick(dataItem)
{
    $("#content_list, #content_search").hide();
    $("#content_detail").show();
    $("#header_title span").removeAttr("class");
    if(dataItem != null){
        var param =   {
                "sTdrvSeq":dataItem.tdrvSeq
        };

        mob.loading.show();
        $.ajax({
            url:"<c:url value='/crm/cso/testDrive/selectTestDriveResvByKey.do' />",
            data:JSON.stringify(param),
            type:"POST",
            dataType:"json",
            contentType:"application/json",
            error:function(jqXHR,status,error) {
                mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
            }

        }).done(function(body) {
            mob.loading.hide();
            console.log("body",body)

            //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
            if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
                return false;
            }

            $("span[name='tdrvTpCd']").each(function(){
                $(this).removeClass("on");
            });

            //시승 상세정보
            $("#modelNm").val(body.modelNm);
            $("#modelNm").prop("disable",true);

            $("#tdrvSeq").val(body.tdrvSeq);
            $("#tdrvStatCd").val(body.tdrvStatCd);
            $("#custNm").val(body.custNm);
            $("#custNm").prop("disable",true);
            $("#custNo").val(body.custNo);
            $("#hpNo").val(body.hpNo);
            $("#hpNo").prop("disable",true);
            $("#resvDt").val(chgServerDateTime2Str2(body.resvDt));
            $("#resvDt").prop("disable",true);
            $("#tdrvHmCd").val(tdrvHmCdArr[body.tdrvHmCd]);        //시승시간

            $("#tdrvVinNo").val(body.tdrvVinNo);
            $("#tdrvClineCd").val(tdrvClineCdArr[body.tdrvClineCd]);      //시승노선
            $("#tdrvPathCd").val(tdrvPathCdArr[body.tdrvPathCd]);        //시승출처
            $("#scId").val(body.scId);
            $("#scNm").val(body.scNm);
            $("#tdrvTpCd_"+body.tdrvTpCd).addClass("on");
            $("#remark").val(body.remark);
            $("#regDt").val(chgServerDate2Str(body.regDt));
            $("#carRegId").val(body.carRegNo);

            //시승일지
            //입력폼 초기화
            initForm("rvlog");

            $("#tdrvSeq").val(body.tdrvSeq);
            $("#tdrvVinNo").val(body.tdrvVinNo);
            $("#tdrvContractDocNo").val(body.tdrvContractDocNo);

            $("#custStsfCd").data("kendoExtDropDownList").value(body.custStsfCd);
            $("#saleFcstCd").data("kendoExtDropDownList").value(body.saleFcstCd);

            $("#befRunDistVal").val(body.befRunDistVal);
            $("#aftRunDistVal").val(body.aftRunDistVal);
            $("#befRfuelQty").val(body.befRfuelQty);
            $("#aftRfuelQty").val(body.aftRfuelQty);

            $("input:radio[id='intPblmYn_"+body.intPblmYn+"']").prop("checked", true);
            $("input:radio[id='extPblmYn_"+body.extPblmYn+"']").prop("checked", true);

            $("#remark2").val(body.remark);

            //시승 상세정보 class변경(f_disabled 추가)
            $(".f_text>input, .f_item01>input, .f_item01>span, .form_comboBox").each(function(index, item){
                if(item.isDisabled){
                    item.parentNode.className += " f_disabled";
                }else{
                    item.parentNode.className.replace("f_disabled","");
                }
            });
        });
    }
}

tdrvHmCdArrVal = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = tdrvHmCdArr[val];
    }
    return returnVal;
};

custStsfCdArrVal = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = custStsfCdArr[val];
    }
    return returnVal;
};

custCdVal = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = custCdMap[val];
    }
    return returnVal;
};

</script>
