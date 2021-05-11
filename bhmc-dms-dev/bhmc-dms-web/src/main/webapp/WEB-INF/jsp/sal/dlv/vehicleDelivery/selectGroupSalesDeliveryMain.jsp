<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>



<!-- 고객인도관리 -->
<div id="resizableContainer">
    <section class="group">
        <!-- 조회 조건 타이틀 시작 -->
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="global.title.groupSalesDeliveryMng" /></h1><!-- 고객인도관리-법인고객 -->
            <div class="btn_right">
                <button class="btn_m" id="btnDelivery"><spring:message code="global.btn.deliveryHandle" /><!-- 인도처리 --></button>
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
            </div>
        </div>
        <!-- 조회 조건 타이틀 종료 -->

        <!-- 조회 조건 시작 -->
        <div class="table_form" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:11%;">
                    <col style="width:10%;">
                    <col style="width:20%;">
                    <col style="width:10%;">
                    <col style="width:10%;">
                    <col style="width:10%;">
                    <col >
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="sal.lbl.grpContractNo" /></th><!-- 그룹계약번호 -->
                        <td>
                            <input id="sGrpContractNo" type="text" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.custNm" /></th> <!-- 고객명 -->
                        <td>
                            <div class="form_float">
                                <div class="form_left">
                                    <div class="form_search">
                                        <input id="sContractCustNm" name="sContractCustNm" type="text" class="form_input onKey_down" placeholder="<spring:message code='par.lbl.custNm' />" onchange="fnOnChange(this.id,this.value);" maxlength="30" />
                                        <a href="#;" class="custSearch"><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></a>
                                    </div>
                                </div>
                                <div class="form_right">
                                    <input id="sContractCustNo" type="text" readonly class="form_input form_readonly">
                                </div>
                           </div>
                        </td>
                        <th scope="row"><spring:message code="sal.lbl.groupContractState" /></th><!-- 그룹계약상태 -->
                        <td>
                            <input id="sGrpContractStatCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row" class="th_form"><spring:message code="global.lbl.contractDate" /></th><!-- 계약일 -->
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sContractStartDt" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sContractEndDt" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- 조회 조건 종료 -->


        <!-- 그리드 시작 -->
        <div class="table_grid mt10">
            <div id="grid" class="resizable_grid"></div>
        </div>
        <!-- 그리드 종료 -->

    </section>
</div>
<!-- script -->
<script>
var toDay = "${toDay}"

//계약상태 Array
var contractStat = [];
<c:forEach var="obj" items="${grpContractStatCdList}">
    contractStat.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//계약상태 Map
var contractStatMap = dms.data.arrayToMap(contractStat, function(obj){ return obj.cmmCd; });


$(document).ready(function() {

    //조회조건 - 계약일(기간)- START
    $("#sContractStartDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //조회조건 - 계약일(기간)- END
    $("#sContractEndDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 조회조건 - 시작일, 종료일
    $("#sContractStartDt").on('change', {from:$("#sContractStartDt"), to:$("#sContractEndDt")}, fnChkSearchDate);
    $("#sContractEndDt").on('change',   {from:$("#sContractStartDt"), to:$("#sContractEndDt")}, fnChkSearchDate);

    $("#sContractCustNo").on('change', fnCheckCustValue);   // 고객


    //조회조건 - 계약상태
    $("#sGrpContractStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:contractStat
        ,optionLabel:" "
    });



    /*************************** 검색 조건 영역 END **************************************************/

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });



    //버튼 - 인도처리
    $("#btnDelivery").kendoButton({
        click:function(e) {

            //주문그리드
            var grid = $("#grid").data("kendoExtGrid");
            var selectIdx = grid.select().index();
            var data = grid.dataSource.view();
            var rows = grid.select();
            var selectVal = data[selectIdx];
            var arrSave = [];

            if(selectIdx == -1){
                // 인도처리할 계약건을(를) 선택하십시오.
                dms.notification.warning("<spring:message code='global.btn.deliveryHandle' var='globalBtnDeliveryHandle' /><spring:message code='global.lbl.contractHd' var='globalLblContractHd' /><spring:message code='global.info.chkselect' arguments='${globalBtnDeliveryHandle}, ${globalLblContractHd}' />");
                return false;
            }

            var vinNoChk = true;
            var rowNum = 0;
            var contracNo;
            rows.each(function(index, row) {
                var dataItem = grid.dataItem(row);

                if( dataItem.vinNo == null){
                    vinNoChk = false;
                    rowNum = index+1;
                    contractNo = dataItem.contractNo;
                    return false;
                }else {
                    arrSave.push(dataItem);
                }

            });


            if(vinNoChk == false){
                dms.notification.warning("(" + rowNum + ")<spring:message code='global.lbl.contractNo' />:"+ contractNo +" <spring:message code='sal.lbl.contractIsNotVinNo' />");
                return false;
            }


            // 고객인도 를 처리 하시겠습니까?
            if(confirm("<spring:message code='global.lbl.custDelivery' var='globalLblCustDelivery' /><spring:message code='global.lbl.proce' var='globalLblProce' /><spring:message code='global.info.cnfrmsMsg' arguments='${globalLblCustDelivery}, ${globalLblProce}' />") == false ){
                return false;
            }


            var saveData = {"updateList":arrSave};

            $.ajax({
                url:"<c:url value='/sal/dlv/groupSalesDelivery/GroupVehicleDelivery.do' />",
                dataType:"json",
                type:"POST",
                contentType:"application/json",
                data:JSON.stringify(saveData),
                error:function(jqXHR,status,error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                },
                success:function(jqXHR, textStatus){
                    //정상적으로 처리되였습니다.
                    dms.notification.success("<spring:message code='sal.info.deliverySuccessMsg' />");
                    $('#grid').data('kendoExtGrid').dataSource.page(1);
                }
            });

        }
    });



    /*******************  //버튼   *******************************************/



    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-2017-051914"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/dlv/groupSalesDelivery/selectGroupSalesDelivery.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sGrpContractNo"] = $("#sGroupContractNo").val();            // 계약번호
                        params["sCustNo"] = $("#sContractCustNo").val();                    // 고객번호
                        params["sGrpContractStatCd"] = $("#sGrpContractStatCd").val();
                        params["sContractStartDt"]    = $("#sContractStartDt").data("kendoExtMaskedDatePicker").value();   // 검색일자 - 시작일
                        params["sContractEndDt"]      = $("#sContractEndDt").data("kendoExtMaskedDatePicker").value();     // 검색일자 - 종료일

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"grpContractNo"
                    ,fields:{
                        grpContractNo:{type:"string",editable:false}
                        ,contractStatCd:{type:"string",editable:false}
                        ,custNm    :{type:"string",editable:false}
                        ,contractDt:{type:"date",editable:false}
                        ,contractNo:{type:"string",editable:false}
                        ,carlineNm :{type:"string",editable:false}
                        ,modelNm   :{type:"string",editable:false}
                        ,modelCd   :{type:"string",editable:false}
                        ,ocnNm     :{type:"string",editable:false}
                        ,extColorNm:{type:"string",editable:false}
                        ,intColorNm:{type:"string",editable:false}
                        ,vinNo     :{type:"string",editable:false}
                        ,realDlDt  :{type:"date"}
                    }
                }
            }
        }
        //,editable:false
        //,autoBind:false
        ,height:450
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,multiSelectWithCheckbox:true
        ,columns:[
                     {field:"rnum"          ,title:"<spring:message code = 'global.lbl.noName'/>"       ,width:40   ,attributes:{"class":"ac"}} //순번
                    ,{field:"grpContractNo" ,title:"<spring:message code = 'sal.lbl.grpContractNo'/>"   ,width:110  ,attributes:{"class":"ac"}} //그룹계약번호
                    ,{field:"custNm"        ,title:"<spring:message code = 'global.lbl.customer'/>"     ,width:80   ,attributes:{"class":"ac"}} //고객
                    ,{field:"contractDt"    ,title:"<spring:message code = 'global.lbl.contractDt'/>"   ,width:80   ,attributes:{"class":"ac"}  //계약일자
                        ,format:"{0:<dms:configValue code='dateFormat' />}"
                     }
                    ,{field:"contractNo"    ,title:"<spring:message code = 'global.lbl.contractNo'/>"   ,width:110  ,attributes:{"class":"ac"}} //계약번호
                    ,{field:"carlineNm"     ,title:"<spring:message code = 'global.lbl.carLine'/>"      ,width:100  ,attributes:{"class":"al"}} //차종
                    ,{field:"modelNm"       ,title:"<spring:message code = 'global.lbl.model'/>"        ,width:120  ,attributes:{"class":"al"}} //모델
                    ,{field:"ocnNm"         ,title:"<spring:message code = 'global.lbl.ocn' />"         ,width:120  ,attributes:{"class":"al"}} //OCN
                    ,{field:"extColorNm"    ,title:"<spring:message code = 'global.lbl.extColor'/>"     ,width:120  ,attributes:{"class":"al"}} //외장색
                    ,{field:"intColorNm"    ,title:"<spring:message code = 'global.lbl.intColor'/>"     ,width:120  ,attributes:{"class":"al"}} //내장색
                    ,{field:"vinNo"         ,title:"<spring:message code = 'global.lbl.vinNum'/>"       ,width:150  ,attributes:{"class":"al"}}
                    ,{field:"retailContractStatCd"      ,hidden:true  }
                    ,{field:"saleEmpNo"     ,hidden:true  }
                    ,{field:"ordTp"         ,hidden:true  }
                    ,{_field:"_field"              ,title:" "       ,width:30  ,attributes:{"class":"ac"}
                        ,template:"<span><img src='<c:url value="/resources/img/btn_search.png" />' alt=''></span>"
                     } //VIN NO
                    ,{field:"dlrCd"         ,hidden:true  }
                    ,{field:"realDlDt"      ,title:"<spring:message code = 'global.lbl.giDocRegDt'/>"   ,width:80  ,attributes:{"class":"ac"}  //출고일자
                        ,format:"{0:<dms:configValue code='dateFormat' />}"
                     }
                ]
    });



    //그리드 클릭 이벤트.
    $("#grid tbody").on("click", "tr.k-state-selected td", function (e) {
        var row = $(this).closest("tr");
        var colIdx = $("td", row).index(this);

        var grid = $('#grid').data('kendoExtGrid');
        var rows = grid.select();
        var selectedItem = grid.dataItem(rows);

        if( colIdx == 15 ){
            if(selectedItem.retailContractStatCd == '20'){
                selectVinNoWindow();
            }else {
                //확정되지 않은 집단계약건입니다.
                dms.notification.warning('<spring:message code = "sal.info.groupContractNotConfirm" />' );
            }
        }
    });

});


//검색조건:고객
fnCheckCustValue = function(){
  if($("#sContractCustNo").val() != vCustNo){
      $("#sContractCustNm").val("");
  }
}


//조회조건:시작일-종료일 날짜 비교
fnChkSearchDate = function(e){
  if(dms.string.isEmpty(e.data.from.val())){return;}
  if(dms.string.isEmpty(e.data.to.val())){return;}

  var startDt = e.data.from.data("kendoExtMaskedDatePicker").value();
  var endDt = e.data.to.data("kendoExtMaskedDatePicker").value();
  if(startDt > endDt){
      dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
      $(this).data("kendoExtMaskedDatePicker").value(new Date(''));
      $(this).focus();
  }
}


var popupWindow;

//고객 팝업 열기 함수.
function selectBpPopupWindow(){

    popupWindow = dms.window.popup({
        windowId:"bpCdPopup"
        ,title:"<spring:message code = 'global.title.custSearch'/>"   // 고객 조회
        ,content:{
            url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
            ,data:{
                "type":"custom1"
                , "closeYn":"Y"
                ,"autoBind":true
                ,"callbackFunc":function(data){
                    $("#sContractCustNo").val(data[0].custNo);
                    $("#sContractCustNm").val(data[0].custNm);

                }
            }
        }
    });
}





//차량마스터팝업 열기 함수.
function selectVinNoWindow(gb){

    var grid = $('#grid').data('kendoExtGrid');
    var rows = grid.select();
    var selectedItem = grid.dataItem(rows);


    var dataInfo = {
            "carlineCd":selectedItem.carlineCd
            ,"carlineNm":selectedItem.carlineNm
            ,"modelCd":selectedItem.modelCd
            ,"modelNm":selectedItem.modelNm
            ,"ocnCd":selectedItem.ocnCd
            ,"ocnNm":selectedItem.ocnNm
            ,"extColorCd":selectedItem.extColorCd
            ,"extColorNm":selectedItem.extColorNm
            ,"intColorCd":selectedItem.intColorCd
            ,"intColorNm":selectedItem.intColorNm
            ,"carStatCd":"60"
            ,"ownStatCd":"O"
            ,"pageGubun":"deleveryVehicle"
     }


    popupWindow = dms.window.popup({
        windowId:"vehicleMasterStsPopupWin"    // 판매 - 차량마스터관리 조회 팝업
        ,title:"<spring:message code='global.title.vehicleMaster' />"
        ,content:{
            url:"<c:url value='/sal/cmm/selectVehicleMasterPopup.do'/>"
            ,data:{
                "type"  :null
                ,"autoBind":false
                ,"dataInfo" :　dataInfo
                ,"callbackFunc":function(data){
                    var grid = $('#grid').data('kendoExtGrid');
                    var dataItems = grid.dataSource._data;
                    var checkVal = true;

                    // 중복값 체크
                    $.each(dataItems, function(idx, obj){
                        if(data[0].vinNo == obj.vinNo){
                            checkVal = false;
                            //이미 선택된 VIN NO 입니다.
                            dms.notification.warning('<spring:message code = "sal.info.selectedVinNo" />');
                        }
                    });

                    if(checkVal){
                        var dataItem = grid.dataItem(grid.select());
                        dataItem.vinNo = data[0].vinNo;
                        dataItem.ordTp = data[0].ordTp;
                        grid.refresh();
                    }
                }
            }
        }
    });



}


fnOnChange = function(id,vl){
    $("#sContractCustNo").val("");
}

// 고객명에서 ObKeyDown
$(".onKey_down").keydown(function(e){
   if (e.keyCode == 13) {
       if($(this).val() != "") {
           if($(this).attr("id") == 'sContractCustNm'){
               $(".custSearch").click();
           }
       }
   }
});

// 고객조회
$(".custSearch").click(function(){

   var custNm = $("#sContractCustNm").val();

   popupWindow = dms.window.popup({
       windowId:"customerSearchPopupMain"
       , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
       , content:{
           url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
           , data:{
               "autoBind":true
               , "closeYn":"Y"
               , "custNm":custNm
               , "type"  :null
               , "callbackFunc":function(data){
                   if (data.length >= 1) {
                       if ( dms.string.isNotEmpty(data[0].custNo) ) {
                           $("#sContractCustNo").val(data[0].custNo);
                           $("#sContractCustNm").val(data[0].custNm);
                       }

                       //popupWindow.close();
                   }
               }
           }
       }
   })
});



</script>
<!-- //script -->