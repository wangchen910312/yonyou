<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">

    <div class="header_area">
        <h1 class="title_basic"><spring:message code="ser.title.sanbaoReturnApr" /></h1><!-- 삼포반품승인 List -->
        <div class="btn_right">
            <button type="button" id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button>
        </div>
    </div>
    <div class="table_grid mt10">
        <div id="grid" class="grid"></div>
    </div>
<input type="hidden" id="sVinNo" name="sVinNo"/>
</section>
<script type="text/javascript">


//공통코드:반품유형
var returnTpList = [];
<c:forEach var="obj" items="${returnTpDs}">
returnTpList.push({
 cmmCdNm:"${obj.cmmCdNm}"
 , cmmCd:"${obj.cmmCd}"
});
</c:forEach>
var returnTpMap = dms.data.arrayToMap(returnTpList, function(obj){return obj.cmmCd;});

//공통코드:상태
var returnStatList = [];
<c:forEach var="obj" items="${returnStatDs}">
returnStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var returnStatMap = dms.data.arrayToMap(returnStatList, function(obj){return obj.cmmCd;});


//공통코드:요청구분유형
var reqDstinTpList = [];
<c:forEach var="obj" items="${reqDstinTpDs}">
reqDstinTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var reqDstinTpMap = dms.data.arrayToMap(reqDstinTpList, function(obj){return obj.cmmCd;});


$(document).ready( function(){

  //공통코드:반품구분 VALUE SETTING
    setReturnTpMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
            if(returnTpMap[value] != undefined)
            resultVal =  returnTpMap[value].cmmCdNm;
        }
        return resultVal;
    };

    //공통코드:상태  VALUE SETTING
    setReturnStatMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
            if(returnStatMap[value] != undefined)
            resultVal =  returnStatMap[value].cmmCdNm;
        }
        return resultVal;
    };

    //공통코드:요청구분유형  VALUE SETTING
    setReqDstinTpMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
            if(reqDstinTpMap[value] != undefined)
            resultVal =  reqDstinTpMap[value].cmmCdNm;
        }
        return resultVal;
    };
    /************************************************************
        팝업옵션 설정
    *************************************************************/

    var parentData = parent.sanbaoRtnApprSearchPopupWindow.options.content.data;
    $("#sVinNo").val(parentData.sVinNo);

    // 그리드 더블 클릭 이벤트.
    $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
         $("#btnSelect").click();
    });


    /************************************************************
        기능버튼 설정
    *************************************************************/
    // 조회 버튼.
    $("#btnSearch").kendoButton({
        click:function(e){
              $("#grid").data("kendoExtGrid").dataSource.read();
        }
    });

    // 선택 버튼.
    $("#btnSelect").kendoButton({
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();


            if(rows !== null)
            {
                var data = [];
                $.each(rows, function(idx, row){
                    data.push(grid.dataItem(row));
                });

                parentData.callbackFunc(data);
                parent.sanbaoRtnApprSearchPopupWindow.close();
            }
        }
    });

    // 닫기 버튼.
    $("#btnCancel").kendoButton({
        click:function(e){
              parent.sanbaoRtnApprSearchPopupWindow.close();
        }
    });


/************************************************************
    그리드 설정
*************************************************************/
/** 삼포 반품 정보 그리드 **/
$("#grid").kendoExtGrid({
  //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
    gridId:"G-SER-1011-000037"
    ,dataSource:{
        transport:{
               read :{
                   url:"<c:url value='/ser/cmm/popup/selectSanbaoReturnApprovePopups.do' />"
               }
             ,parameterMap:function(options , operation){
                 if(operation == "read"){

                  // 검색 조건을 파라미터로 담는다.
                     var params = {};
                     params["recordCountPerPage"] = options.pageSize;
                     params["pageIndex"] = options.page;
                     params["firstIndex"] = options.skip;
                     params["lastIndex"] = options.skip + options.take;
                     params["sort"] = options.sort;

                     params["sReturnStatCd"] = "A";
                     params["sVinNo"] = parentData.sVinNo;
                     if(parentData.sPreFixId != undefined)
                     params["sPreFixId"] = parentData.sPreFixId;

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
                    rnum:{type:"number"  }
                   ,lineNo:{type:"number"  }
                   ,returnReqDt:{type:"date"  }   //신청일자
                   ,vinNo:{type:"string"  }       //VIN
                   ,reqDstinTp:{type:"string"  }  //요청구분유형
                   ,returnDstinTp:{type:"string" }//반품구분
                   ,returnStatCd:{type:"string" } //상태
                   ,acptDt:{type:"date" }       //접수일자
                   ,judgDt:{type:"date" }         //승인일자
                   ,custBudnAmt:{type:"number" }  //고객부담금
                   ,dlrBudnAmt:{type:"number" }   //딜러부담금
                   ,corpDudnAmt:{type:"number" }  //법인부담금
                   ,returnApproveNo:{type:"string" }  //반품승인번호
                   ,pwaApproveNo:{type:"string" }  //사용된 PWA 승인번호
                   ,pwaUseYn:{type:"string" }  //PWA 사용여부
                }

             }//model
       }//schema
    }//dataSource
    ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
    ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
    ,multiSelectLocked:false          //멀티선택 컬럼 틀고정 default:false
    ,appendEmptyColumn:true           //빈컬럼 적용. default:false
    ,filterable:false                 // 필터링 기능 사용안함
    ,autoBind:false
    ,pageable:false
    ,editable:false
    ,height:200
    ,resizable:false
    ,columns:[
                {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, attributes:{"class":"ac"}}
               ,{field:"returnReqDt", title:"<spring:message code='ser.lbl.fincReqDt' />", width:120
                   , attributes :{"class":"ac"}
                   , format:"{0:<dms:configValue code='dateFormat' />}"
               }
               ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:170, attributes :{"class":"al"}}
               ,{field:"returnApproveNo", title:"<spring:message code='ser.lbl.returnApprNo' />", width:150, attributes :{"class":"al"}}
               ,{field:"reqDstinTp", title:"<spring:message code='ser.lbl.reqTp' />", width:100
                   , attributes :{"class":"ac"}
                   , template:"#= setReqDstinTpMap(reqDstinTp) #"
                   , editor:function(container, options){
                       $('<input required name="reqDstinTp" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                           ,valuePrimitive:true
                           ,dataValueField:"cmmCd"
                           ,dataSource:reqDstinTpList
                       });
                       $('<span class="k-invalid-msg" data-for="reqDstinTp"></span>').appendTo(container);
                      }
               }
               ,{field:"returnDstinTp", title:"<spring:message code='ser.lbl.returnDstin' />", width:100
                   , attributes :{"class":"ac"}
                   , template:"#= setReturnTpMap(returnDstinTp) #"
                   , editor:function(container, options){
                       $('<input required name="returnDstinTp" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                           ,valuePrimitive:true
                           ,dataValueField:"cmmCd"
                           ,dataSource:returnTpList
                       });
                       $('<span class="k-invalid-msg" data-for="returnDstinTp"></span>').appendTo(container);
                      }

               }
               ,{field:"returnStatCd", title:"<spring:message code='ser.lbl.statNm' />", width:100
                   , attributes :{"class":"ac"}
                   , template:"#= setReturnStatMap(returnStatCd) #"
                   , editor:function(container, options){
                       $('<input required name="returnStatCd" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                           ,valuePrimitive:true
                           ,dataValueField:"cmmCd"
                           ,dataSource:returnStatList
                       });
                       $('<span class="k-invalid-msg" data-for="returnStatCd"></span>').appendTo(container);
                      }
                 }
               ,{field:"acptDt", title:"<spring:message code='ser.lbl.acceptDt' />", width:120
                   , attributes :{"class":"ac"}
                   , format:"{0:<dms:configValue code='dateFormat' />}"
               }
               ,{field:"judgDt", title:"<spring:message code='ser.lbl.approveDt' />", width:120
                   , attributes :{"class":"ac"}
                   , format:"{0:<dms:configValue code='dateFormat' />}"
               }

               ,{field:"custBudnAmt", title:"<spring:message code='ser.lbl.custCharge' />", width:120
                   , attributes :{"class":"ar"}
                   , format:"{0:n0}"
               }
               ,{field:"dlrBudnAmt", title:"<spring:message code='ser.lbl.dlrCharge' />", width:120
                   , attributes :{"class":"ar"}
                   , format:"{0:n0}"
               }
               ,{field:"corpDudnAmt", title:"<spring:message code='ser.lbl.corpCharge' />", width:120
                   , attributes :{"class":"ar"}
                   , format:"{0:n0}"
               }
             ]

});

    if(parentData.autoBind){
      $("#grid").data("kendoExtGrid").dataSource.read();
    }

});
</script>