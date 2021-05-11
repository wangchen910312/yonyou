<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="window" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
            <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button> <!-- 선택 -->
        </div>
    </div>

    <!-- 조회 조건 시작 -->
    <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
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
                    <th scope="row"><spring:message code="sal.lbl.goodsTp" /><!-- 용품업무유형 --></th>
                    <td>
                        <input type="text" id="sGoodsTp" name="sGoodsTp" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.contractNo" /><!-- 계약번호 --></th>
                    <td>
                        <input type="text" id="sSaleContractNo" name="sSaleContractNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.goodsStat" /><!-- 용품주문상태 --></th>
                    <td>
                        <input type="text" id="sContractStatCd" name="sContractStatCd" class="form_comboBox" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->
    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid"></div>
    </div>
    <!-- 그리드 종료 -->
</section>

<!-- script -->
<script>
//용품업무유형
var goodsTpList = [];
<c:forEach var="obj" items="${goodsTpList}">
goodsTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var goodsTpMap = dms.data.arrayToMap(goodsTpList, function(obj){ return obj.cmmCd; });

//용품판매상태
var contractStatCdList = [];
<c:forEach var="obj" items="${contractStatCdList}">
contractStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var contractStatCdMap = dms.data.arrayToMap(contractStatCdList, function(obj){ return obj.cmmCd; });

$(document).ready(function() {

    // 팝업 설정값
    var options = parent.popupWindow.options.content.data;

    //조회조건 - 용품업무유형
    $("#sGoodsTp").kendoExtDropDownList({
         dataSource:dms.data.arrayFilter(goodsTpList, function(obj){
             return obj.cmmCd == "03"? false:true;
         })
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,optionLabel:" "
        ,index:0
    });

    //조회조건 - 용품판매상태
    $("#sContractStatCd").kendoExtDropDownList({
         dataSource:dms.data.arrayFilter(contractStatCdList, function(obj){
             return obj.cmmCd == "60"? false:true;
         })
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,optionLabel:" "
        ,index:0
    });
    

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    // 선택 버튼.
    $("#btnSelect").kendoButton({
        click:function(e){
            var grid = $('#grid').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());
            var rows = grid.select();
            if (rows.length >= 1){
                var data = [];
                //data.push(selectedItem);
                $.each(rows, function(idx, row){
                    data.push(grid.dataItem(row));
                });
                options.callbackFunc(data);
            } else {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
            }
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/acc/itemSales/selectAccessoryItemSales.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"]  = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"]  = options.skip + options.take;
                        params["sort"]       = options.sort;

                        params["sGoodsTp"] = $("#sGoodsTp").data("kendoExtDropDownList").value();                                      //용품업무유형
                        params["sSaleContractNo"] = $("#sSaleContractNo").val();                                                    //계약번호(완성차판매)
                        params["sContractStatCd"] = $("#sContractStatCd").data("kendoExtDropDownList").value();                        //용품주문상태

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,requestEnd:function(e) {
                if (e.type == "read") {
                    //조회가 완료 되였습니다.
                   // dms.notification.info("<spring:message code='global.info.searchSuccess' />");
                }
            }
            ,schema:{
                model:{
                    id:"goodsContractNo"
                    ,fields:{
                        finDocNo:{type:"string"}          //수납문서번호
                        ,contractStatCd:{type:"string"}    //용품상태
                        ,goodsTp:{type:"string"}            //업무유형
                        ,contractCustNm:{type:"string"}    //고객명
                        ,carlineCd:{type:"string"}          //차종
                        ,goodsContractNo:{type:"string"}    //용품계약번호
                        ,goodsNm:{type:"string"}            //용품명칭
                        ,goodsCnt:{type:"number"}           //용품수
                        ,saleContractNo:{type:"string"}    //계약번호
                        ,telNo:{type:"string"}              //고객전화번호
                        ,vinNo:{type:"string"}              //vinNo
                        ,goodsContractDt:{type:"date"}      //오더일자
                         
                    }
                }
            }
        }
        ,multiSelectWithCheckbox:false
        ,editable:false
        ,sortable:false
        ,autoBind:true
        ,selectable:"row"
        ,height  :302
        ,columns:[
          {field:"contractStatCd", title:"<spring:message code='sal.lbl.goodStat'/>", width:80
              ,attributes:{"class":"ac"}
              ,template:function(dataItem){
                  var contractStatCdNm = "";
    
                  if(!dms.string.isEmpty(contractStatCdMap[dataItem.contractStatCd])){
                      contractStatCdNm = contractStatCdMap[dataItem.contractStatCd].cmmCdNm;
                  }
    
                  if(dataItem.contractStatCd == "10"){
                      return "<span class='txt_label bg_green'>" + contractStatCdNm + "</span>";
                  }else if(dataItem.contractStatCd == "20"){
                      return "<span class='txt_label bg_yellow'>" + contractStatCdNm + "</span>";
                  }else if(dataItem.contractStatCd == "30"){
                      return "<span class='txt_label bg_orange'>" + contractStatCdNm + "</span>";
                  }else if(dataItem.contractStatCd == "40"){
                      return "<span class='txt_label bg_blue'>" + contractStatCdNm + "</span>";
                  }else if(dataItem.contractStatCd == "50"){
                      return "<span class='txt_label bg_red'>" + contractStatCdNm + "</span>";
                  }else if(dataItem.contractStatCd == "60"){
                      return "<span class='txt_label bg_purple'>" + contractStatCdNm + "</span>";
                  }
    
                  return contractStatCdNm;
              }
          } //용품문서상태
          ,{field:"goodsContractDt", title:"<spring:message code='sal.lbl.orderDate' />", width:80                                    //오더일자
              ,format:"{0:<dms:configValue code='dateFormat' />}"
          }
          ,{field:"goodsTp", title:"<spring:message code='sal.lbl.goodsTp' />", width:90
              ,attributes:{"class":"ac"}
              ,template:"# if(goodsTpMap[goodsTp] != null) { # #= goodsTpMap[goodsTp].cmmCdNm# # }#"
          }
          ,{field:"contractCustNm", title:"<spring:message code='global.lbl.custNm' />", width:130}                                   //고객명
          ,{field:"carlineCd", title:"<spring:message code='global.lbl.carlineCd' />", width:100}                                       //차종
          ,{field:"goodsContractNo", title:"<spring:message code='sal.lbl.goodsContractNo' />", width:140, attributes:{"class":"ac"}} //용품오더번호
          ,{field:"goodsNm", title:"<spring:message code='sal.lbl.goodsNm' />"}                                                       //용품명
          ,{field:"goodsCnt", title:"<spring:message code='sal.lbl.goodsCnt' />", width:80, attributes:{"class":"ar"}, format:"{0:n0}", decimal:0}//용품수
          ,{field:"saleContractNo", title:"<spring:message code='global.lbl.contractNo' />", width:120, attributes:{"class":"ac"}}    //계약번호
          ,{field:"vinNo", title:"<spring:message code='sal.lbl.carVinNo' />", width:150, attributes:{"class":"ac"}}                  //VIN
          ,{field:"telNo", title:"<spring:message code='sal.lbl.telNo' />", width:100}                                                //고객전화번호
          ,{field:"carRegNo", title:"<spring:message code='global.lbl.carNo' />", width:100}                                          //차량번호
          ,{field:"expcGiEndDt", title:"<spring:message code='sal.lbl.expcGiEndDt' />", width:80                                      //출고예정일자
              ,format:"{0:<dms:configValue code='dateFormat' />}"
          }
       ]
    });

    // 그리드 더블클릭.
    $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
        $("#btnSelect").click();
    });

});
</script>
<!-- //script -->