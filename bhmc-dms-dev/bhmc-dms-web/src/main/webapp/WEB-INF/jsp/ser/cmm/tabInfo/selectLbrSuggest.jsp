<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div style="min-height:205px;">
    <div class="btn_right_absolute">
        <c:if test="${param.gubun ne 'S'}">
        <button type="button" id="moveRepair" class="btn_s btn_add btn_s_min5" ><spring:message code="ser.btn.repair" /></button>
        <button type="button" id="lbrSuggestAdd" class="btn_s btn_add btn_s_min5" ><spring:message code="global.btn.add" /></button>
        <button type="button" id="lbrSuggestDel" class="btn_s btn_delete btn_s_min5" ><spring:message code="global.btn.del" /></button>
        </c:if>
    </div>
    <div class="table_grid">
        <div id="lbrSuggestGrid" class="grid"></div>
    </div>
</div>

<script type="text/javascript">

var preFixId = "${preFixId}";
var preFixTp = "${preFixTp}";

var lbrSuggestPreFixId;
var lbrSuggestJobNo;


$(document).ready(function(){

    var editYn = true;
    /* if(preFixTp == "ROSTATUS"){
        editYn = false;
    } */

    // 수리건의 그리드
    $("#lbrSuggestGrid").kendoExtGrid({
        dataSource:{
            transport:{
                   read :{
                       url: "<c:url value='/ser/cmm/tabInfo/selectLbrSuggest.do' />"
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"]          = options.page;
                         params["firstIndex"]         = options.skip;
                         params["lastIndex"]          = options.skip + options.take;
                         params["sort"]               = options.sort;

                         params["sPreFixId"] = lbrSuggestPreFixId;
                         params["sJobNo"]    = lbrSuggestJobNo;
                         params["sKanbanYn"] = "N";

                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                         dlrCd:{type:"string" , editable:false}
                        ,lbrCd:{type:"string" , editable:false}
                        ,lbrNm:{type:"string" , editable:false , validation:{required:true}}
                        ,lbrTp:{type:"string" , editable:false}
                        ,lbrHm:{type:"number"}
                        ,serCnt:{type:"number"}
                        ,dstinCd:{type:"string"}
                        ,regDt:{type:"date"}
                    }

                 }//model
           }//schema
        }//dataSource
        ,height:180
        ,pageable:false
        ,autoBind:false
        ,sortable:false
        ,editable:editYn
        ,editable:{
            confirmation:false
        }
        ,appendEmptyColumn:false
        ,reorderable:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,resizable:true
        ,edit:function(e){
            if(preFixTp == "ROSTATUS"){
                this.closeCell();
            }
        }
        ,columns:[
              {field:"lbrCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:100}// 공임코드
             ,{field:"lbrNm", title:"<spring:message code='ser.lbl.rpirNm' />", width:200
                 ,editor:function(container, options) {
                     $('<input required type="text" name="lbrNm" data-name="<spring:message code="ser.lbl.rpirNm" />" data-bind="value:' + options.field + '"  maxLength="200" class="form_input"  />')
                     .appendTo(container);
                     $('<span class="k-invalid-msg" data-for="lbrNm"></span>')
                     .appendTo(container);
                  }
              }// 공임명
             ,{field:"lbrTp", title:"<spring:message code='ser.lbl.lbrTp' />", width:100
                 ,attributes:{"class":"ac"}
                 ,template:"#=lbrTpCdGrid(lbrTp)#"
             } // 공임유형(정비유형)
             ,{field:"lbrHm", title:"<spring:message code='ser.lbl.rpirDt' />", width:100
                 ,attributes:{"class":"ar"}
                 ,format:"{0:n1}"
                 ,editor:function(container, options){
                     $('<input name="lbrHm" data-bind="value:' + options.field + '"  />')
                     .appendTo(container)
                     .kendoExtNumericTextBox({
                          min:0.0
                         ,max:100000
                         ,spinners:false
                     });
                 }
             } // 수리시간
             ,{field:"serCnt", title:"<spring:message code='ser.lbl.serCnt' />", width:100, attributes:{"class":"ar"}
                 ,format:"{0:n0}"
                 ,editor:function(container, options){
                     $('<input name="serCnt" data-bind="value:' + options.field + '"  />')
                     .appendTo(container)
                     .kendoExtNumericTextBox({
                          min:0
                         ,max:100
                         ,spinners:false
                     });
                 }

             }// 정비건수
             ,{field:"remark", title:"<spring:message code='ser.lbl.lbrSuggestRemark' />", width:580, attributes:{"class":"al"} }// 비고
             ,{field:"dstinCd", title:"dstinCd", width:100, hidden:true}
             ,{field:"vinNo", title:"vinNo", width:100, hidden:true}
         ]
    });

    var lbrSuggestGrid = $("#lbrSuggestGrid").data("kendoExtGrid");

    /**############################ 버튼 설정##################################**/

    $("#moveRepair").kendoButton({
        click:function (e){
            var grid = $("#lbrSuggestGrid").data("kendoExtGrid");
            var selectedVal = grid.dataItem(grid.select());
            var params = [];
            var jsonData = {};

            if(preFixId == "RO"){
                if(selectedVal==null||selectedVal==""){
                    dms.notification.info("<spring:message code='global.info.selectEmptyRowMsg'  />");
                    return false;
                } else {
                    grid.select().each(function(i, row){
                        params.push({
                            "lbrCd":grid.dataItem(row).lbrCd
                            ,"lbrNm":grid.dataItem(row).lbrNm
                            ,"lbrTp":grid.dataItem(row).lbrTp
                            ,"lbrHm":grid.dataItem(row).lbrHm
                            ,"lbrOrgHm":grid.dataItem(row).lbrHm
                            ,"serCnt":grid.dataItem(row).serCnt
                            ,"dstinCd":grid.dataItem(row).dstinCd
                            ,"paymTp":""
                            ,"crTp":""
                            ,"roTp":$("#roTp").val()
                            ,"lbrQty":1
                            ,"dcAmt":0.00
                            ,"dcRate":0.0
                        });
                    });
                }
                jsonData = {
                    data : params
                    ,total : params.length
                };

                var lbrCd = jsonData.data[0].lbrCd;
                var dstinCd = jsonData.data[0].dstinCd;
                var roTpVal = $("#roTp").val();

                var ttChkYn = (lbrCd.length > 3 && lbrCd.substr(lbrCd.length-2,lbrCd.length)== "TT") ? false : true;
                var dlrDstinCd = (dstinCd == "D" || dstinCd == "E") ? true : false; // 일반공임일경우
                var wtyDstinCd = (dstinCd == "G" || dstinCd == "Z") ? true : false; // 보증공임일경우

                if(roTpVal == '02'){ //보증
                    if(dlrDstinCd && ttChkYn){
                        var msg = lbrCd + "<spring:message code='ser.lbl.cmpnLbrCd' var='cmpnLbrCd' />"+
                                  "<spring:message code='ser.lbl.lbrCd' var='lbrCd' />"+
                                  "<spring:message code='ser.info.checkLbrTp' arguments='${cmpnLbrCd} , ${lbrCd}' />";

                        dms.notification.warning(msg);
                        chkRsultYn = false;
                        return false;
                    }
                }else{
                    if(wtyDstinCd){ //은 {0}만 사용가능한 {1} 입니다
                        var msg = lbrCd + "<spring:message code='ser.lbl.wartEx' var='wartEx' />"+
                                  "<spring:message code='ser.lbl.lbrCd' var='lbrCd' />"+
                                  "<spring:message code='ser.info.checkCmnpLbrTp' arguments='${wartEx} , ${lbrCd}' />";
                        dms.notification.warning(msg);
                        chkRsultYn = false;
                        return false;
                    }
                }

                lbrSerAlramAdd(jsonData,"");

                var gridRows = grid.select();
                gridRows.each(function(index, row) {
                    grid.removeRow(row);
                });

            }
        }
        ,enable:false
    });

    /** 수리건의 추가  **/
    $("#lbrSuggestAdd").kendoButton({
        click:function (e){

            var roTp = "";
            var goodwillYn = "";
            if( ( $("#preRoTp").val() != undefined ) || ($("#roTp").val() != undefined)){
                if($("#roTp").val() == undefined){
                    if($("#preRoTp").val() == undefined ){
                        roTp =  $("#preRoTp").data("kendoExtDropDownList").value();   //RO 유형 코드
                    }else{
                        roTp = "01";
                    }
                }else {
                    if($("#roTp").val() != undefined ){
                          roTp = $("#roTp").val();      //RO 유형 코드
                          if(preFixId == "RO" && roTp == "02"){
                              goodwillYn = $("#goodwillYn").data("kendoExtDropDownList").value();
                          }
                    }else if($("#preRoTp").val() != undefined ){
                        roTp =  $("#preRoTp").val();   //RO 유형 코드
                    }else{
                        roTp = "01";
                    }
                }

                if( dms.string.isEmpty(roTp) ){ //global.info.validation.pattern
                    dms.notification.warning( "<spring:message code='ser.lbl.roTp' var='roTp' />"+
                                              "<spring:message code='global.info.validation.select' arguments='${roTp}' />");
                    $("#roTp").focus();
                    return false;
                }
            }

            var _selectable;
            if(isTablet == true || isTablet == "true"){
                _selectable="row";
            }else{
                _selectable="multiple";
            }

            // 공임 팝업 열기 함수.
            laborSearchPopup = dms.window.popup({
                windowId:"partsMasterPopup"
                ,height:420 //400 khs
                ,modal:true
                ,title:"<spring:message code='ser.lbl.lbrNm' />"
                ,content:{
                    url:"<c:url value='/ser/cmm/popup/selectLaborCodePopup.do'/>"
                    ,data:{
                        "autoBind":false
                        ,"selectable":_selectable
                        ,"sRoTp": roTp
                        ,"sGoodwillYn":goodwillYn
                        ,"sLtsModelCd":$("#ltsModelCd").val()
                        ,"callbackFunc":function(lbrData){
                            if(lbrData.length > 0) {
                                lbrSuggestAdd(lbrData);
                            }
                        }
                    }
                }
            });
        }
        ,enable:false
    });

     // 공임추가 공통
    lbrSuggestAdd = function(lbrData){

        $.each(lbrData, function(idx, data){

            var copyData;
            var checkVal = true;
            var campaignCnt = 0; // 그리드이 캠페인 입력된 갯수
            var popTzCdCnt = 0; // 공임팝업에서 선택한 TT,ZZ CODE 수
            var gridTzCnt=0;    //그리드에 입력된 TT,ZZ 코드 수
            var pupLbrCd = data.lbrCd; //팝업 공임 코드
            var popSubLbrCd =  pupLbrCd.substring(pupLbrCd.length-2 , pupLbrCd.length); // 공임코드 뒷2 자리
            var totLbrHm = 0;


            // 중복값 체크
            $.each(getLbrSuggestData(), function(idx, obj){
                var gridLbrCd = obj.lbrCd; //그리드 공임 코드
                var subLbrCd =  gridLbrCd.substring(gridLbrCd.length-2 , gridLbrCd.length); //그리드에 있는 공임 뒤 코드 2자리

                if(data.lbrCd == obj.lbrCd){
                    checkVal = false;
                }
                totLbrHm += obj.lbrHm;

                if(subLbrCd == "ZZ" || subLbrCd == "TT") gridTzCnt++; // TT , ZZ 코드 체크
            });


            var lbrRate = data.lbrRate;
            var roTpCd = "01";
            //수리건의선택시 RO유형이 자동으로 보증으로 세팅 되는 현상 정확한 업무 협의 필요 20170613
            //var wartRoTp = (data.dstinCd == "H" && (checkVal)) ? true : false;
            var wartRoTp = false;

            if(preFixId == "RE" || preFixId == "RES" || preFixId == "PC"){           // 예약접수
                roTpCd = (wartRoTp) ? "02" : roTpCd;
            } else if(preFixId == "PRC") {  // 정비미리점검
                roTpCd = $("#preRoTp").data("kendoExtDropDownList").value();
                roTpCd = (wartRoTp) ? "02" : roTpCd;
                $("#preRoTp").data("kendoExtDropDownList").value(roTpCd);
                if(wartRoTp){
                    $("#preRoTp").data("kendoExtDropDownList").enable((roTpCd == "02") ? false :true);
                }
            }else if(preFixId == "CA"){
                roTpCd = $("#roTp").val();      //RO 유형 코드
                roTpCd = (wartRoTp) ? "02" : roTpCd;
            }else {
                roTpCd = $("#roTp").data("kendoExtDropDownList").value();      //RO 유형 코드
                roTpCd = (wartRoTp) ? "02" : roTpCd;
                $("#roTp").data("kendoExtDropDownList").value(roTpCd);
                if(wartRoTp){
                    $("#roTp").data("kendoExtDropDownList").enable((roTpCd == "02") ? false :true);
                }
            }

            // ZZ CODE , TT CODE 는 1개만 입력 가능하게 체크
            if(popSubLbrCd == "ZZ" || popSubLbrCd == "TT") popTzCdCnt++;
            if( (gridTzCnt >= 1 && popTzCdCnt > 0) &&
                    (popSubLbrCd == "ZZ" || popSubLbrCd == "TT")) checkVal = false;
            if(popSubLbrCd == "ZZ") lbrRate = 0;

            var lbrTp = dms.string.isEmpty(data.lbrTp) ? "01" : data.lbrTp;


            if(checkVal) {
                copyData = {
                     lbrTp: lbrTp
                    ,lbrCd:data.lbrCd                                   // 정비코드
                    ,lbrNm:data.lbrNm                                   // 정비항목
                    ,lbrHm: (roTpCd == "02" ) ? data.lbrHm : Number(dms.string.defaultString(data.payLbrHm,data.lbrHm))          // 공임시간
                    ,lbrPrc: data.lbrPrc                                // 공임단가
                    ,serCnt: Number(data.serCnt)                        // 정비건수
                    ,dstinCd:data.dstinCd
                    ,vinNo:$("#vinNo").val()
                };
                lbrSuggestGrid.dataSource.add(copyData);
            }
        });
    };

    /** 수리건의 삭제  **/
    $("#lbrSuggestDel").kendoButton({
         click:function (e){
             var rows = lbrSuggestGrid.select();

             rows.each(function(index, row) {
                 lbrSuggestGrid.removeRow(row);
             });
             //changeTotalAmt();
         }
         ,enable:false
    });

    //수리건의  결과값 세팅
    lbrSuggestSet = function(jobNo, listType){
        lbrSuggestPreFixId = dms.string.strNvl(listType) == "" ? preFixId:listType;
        lbrSuggestJobNo = jobNo;

        lbrSuggestGrid.dataSource.read();
    };

    getLbrSuggestData = function() {
        var lbrSuggestData = lbrSuggestGrid.dataSource.data();

        return lbrSuggestData;
    };

});

</script>