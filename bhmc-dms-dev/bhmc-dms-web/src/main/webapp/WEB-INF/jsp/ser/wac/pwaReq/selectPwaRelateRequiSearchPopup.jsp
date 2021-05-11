<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 延保索赔结算选择页  pop_wrap -->

 <section id="windows" class="pop_wrap">
   <div id="tabstrip1" class="tab_area">
     <div class="header_area">
       <div class="btn_right">
            <button type="button" id="btnSelect" class="btn_m btn_Select" ><spring:message code="global.btn.select" /></button>
       </div>
     </div>
     <h2 class="title_basic"><spring:message code="ser.title.pwaList" /><spring:message code='global.title.info' /></h2>
     <div class="table_grid mt5">
        <!--  pwa索赔申请选择项 -->
         <div id="gridRelateMaster" class="grid"  style="height:300px;"></div>
     </div>
    
      <!-- PWA 选择项  -->
       <div id="tabstrip" class="tab_area">
                <ul>
                    <li class="k-state-active"><spring:message code="ser.lbl.lbr" /></li>
                    <li><spring:message code="ser.lbl.item" /></li>
                </ul>
                
                <!-- 维修项目 -->
                <div>
                    <div class="table_grid">
                        <div id="gridRelateLabor" class="grid"></div>
                    </div>
                </div>
                
                <!-- 配件项目 -->
                <div>
                    <div class="table_grid">
                        <div id="gridRelatePart" class="grid"></div>
                    </div>
                </div>
       </div>
     </div>
  </section>
<script type="text/javascript">
//获取父页面的参数
var parentJsonData = parent.selectPwaRequiItemPopupWindow.options.content.data;
var currentWin =  parent.selectPwaRequiItemPopupWindow;
//console.log("",parentJsonData.vinNo);
var pwaStatCdList = [];
//PWA 状态
<c:forEach var="obj" items="${pwaStatDs}">
    pwaStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var pwaStatMap = dms.data.arrayToMap(pwaStatCdList, function(obj){return obj.cmmCd;});

var pwaCauYnList = [];
<c:forEach var ="obj" items="${pwaCauYnDs}">
    pwaCauYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

var pwaCauYnMap = dms.data.arrayToMap(pwaCauYnList , function(obj){return obj.cmmCd;});
var sPwaDocNoVal = "";
var pwaInfos = "";
//初始化
$(document).ready(function(e){

   setPwaStatMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
            if(pwaStatMap[value] != undefined)
            resultVal =  pwaStatMap[value].cmmCdNm;
        }
        return resultVal;
    };
    
    setPwaCauYnMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
            if(pwaCauYnMap[value] != undefined)
            resultVal =  pwaCauYnMap[value].cmmCdNm;
        }
        return resultVal;
    };
   
   
    //$("#gridRelateMaster").data('kendoExtGrid').dataSource.read();
    
    
    //双击选择
    //$("#gridRelateMaster").on("dblclick", "tr.k-state-selected", function (e) {});


    //选择事件
    $("#btnSelect").kendoButton({
        click:function(e){
            //选择的pwa信息
            var gridMaster = $("#gridRelateMaster").data("kendoExtGrid");
            var rows = gridMaster.select();
            if(0 == rows.length){ 
                dms.notification.warning("<spring:message code="crm.info.chkSelectItemMsg" /><spring:message code="ser.title.pwaList" /><spring:message code='global.title.info' />");
                 return;
            }
            //console.log("选择pwa信息",rows.length);
            var selectedVal = gridMaster.dataItem(rows);
            console.log("选择pwa信息",selectedVal);
            var pwaDocNoVal = selectedVal.pwaDocNo;//获取关联申请单号
            //获取维修项目数据
              var gridLabor = $("#gridRelateLabor").data("kendoExtGrid");
              var gridRelLaborData = gridLabor.dataSource._data;  
             //console.log("获取维修项目数据",gridRelLaborData);  
            
              //获取配件项目数据
              var gridPart = $("#gridRelatePart").data("kendoExtGrid");
              var gridRelPartData = gridPart.dataSource._data;
              //console.log("获取配件项目数据",gridRelPartData);  
              console.log("选择的信息有",pwaInfos["cauItemCd"]);
              parentJsonData.callbackFunc(pwaDocNoVal,gridRelLaborData,gridRelPartData,pwaInfos);
              currentWin.close();
        }
    });
    
    //选择PWA列表代出 维修项目列表、和配件项目列表数据
    detailSet = function(){
         var lbrGrid  = $("#gridRelateLabor").data("kendoExtGrid");
         var partGrid = $("#gridRelatePart").data("kendoExtGrid");
         var lbrUrl = "<c:url value='/ser/wac/pwaReq/selectPwaRequestLbrs.do' />";
         var partUrl = "<c:url value='/ser/wac/pwaReq/selectPwaRequestParts.do' />";
         lbrGrid.dataSource.transport.options.read.url = lbrUrl;
         partGrid.dataSource.transport.options.read.url = partUrl;
         lbrGrid.dataSource.data([]);
         partGrid.dataSource.data([]);
         lbrGrid.dataSource.read();
         partGrid.dataSource.read();
                    
     };
     
     //获取 PWA申请单据，PWA类型1字段选择了延保索赔结算类型，增加关联申请的带入内容，将主表的 原因配件代码、主作业代码、原因代码、现像代码、故障现像说明、维修方案几项都带出来
     getPwaInfo = function(data){
         $.ajax({
                 url:"<c:url value='/ser/wac/pwaReq/selectPwaRequestByKey.do' />"
                ,data:JSON.stringify(data)
                ,type:"POST"
                ,dataType:"json"
                ,contentType:"application/json"
                ,error:function(jqXHR,status,error) {

                   dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function (result){
                   pwaInfos = result;
                }
             }) ;
     };
     

   $("#gridRelateMaster").kendoExtGrid({
        gridId:"G-SER-0325-104410"
        ,dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/wac/pwaReq/selectPwaRelateRequiMains.do' />"
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;
                         params["sVinNo"] = parentJsonData.vinNo;
                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }
            }
           ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                        rnum:{type:"number" }
                       ,dlrCd:{type:"string" }
                       ,pwaStatCd:{type:"string" }
                       ,vinNo:{type:"string" }
                       ,pwaDocNo:{type:"string" }
                       ,hqApproveDt:{type:"date" }
                       ,dlrSignReqDt:{type:"date" }
                       ,updtDt:{type:"date" }
                    }

                 }//model
           }//schema
        }//dataSource
        ,editable:false
        ,scrollable:true
        ,autoBind:false
        ,sortable:false
        ,selectable:"row"
        ,height:240
        ,filterable:false 
        ,appendEmptyColumn:true
        ,dataBound:function(e) {
        }
        ,change:function (e){
            var selectedVal = this.dataItem(this.select());
            var dlrCd = selectedVal.dlrCd;
            var vinNo = selectedVal.vinNo;
            var pwaDocNo = selectedVal.pwaDocNo;
            var data = {
                    "sVinNo" : vinNo
                   ,"sPwaDocNo":pwaDocNo
            };
            pwaInfos = "";
            sPwaDocNoVal="";
            sPwaDocNoVal=selectedVal.pwaDocNo;
            detailSet();
            //获取 PWA申请单据，PWA类型1字段选择了延保索赔结算类型，增加关联申请的带入内容，将主表的 原因配件代码、主作业代码、原因代码、现像代码、故障现像说明、维修方案几项都带出来 
             pwaInfos = getPwaInfo(data);  
            
        }
        ,columns:[
                {field:"rnum",title:"<spring:message code='ser.lbl.no' />", width:50,sortable:false, attributes:{"class":"ac"}}
               ,{field:"dlrCd",title:"<spring:message code='ser.lbl.dlrCd' />", width:80,sortable:false, attributes :{"class":"al"} , hidden:true }//店代码
               ,{field:"pwaDocNo",title:"<spring:message code='ser.lbl.pwaDocNo' />", width:110, attributes :{"class":"al"} }//pwa 编号
               ,{field:"pwaStatCd",title:"<spring:message code='ser.lbl.statNm' />", width:80
                   ,attributes :{"class":"ac"}
                   ,template:"#=setPwaStatMap(pwaStatCd)#"
                 }//pwa 状态
              ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />" , width:150 , attributes :{"class":"al"}}//车辆识别码
              ,{field:"cauOperAtcCd", title:"<spring:message code='ser.lbl.mainLbrCd' />" , width:100 , attributes :{"class":"al"}}//主作业代码
              ,{field:"cauItemCd", title:"<spring:message code='ser.lbl.cauItemCd' />" , width:100 , attributes :{"class":"al"}}//原因配件代码
              ,{field:"itemApproveAmt", title:"<spring:message code='ser.lbl.itemAmt' />" , width:90 , attributes :{"class":"ar"}, format:"{0:n2}"}//配件金额
              ,{field:"lbrApproveAmt", title:"<spring:message code='ser.lbl.lbrAmt' />" , width:80 , attributes :{"class":"ar"}, format:"{0:n2}"}//工时费用
              ,{field:"subLbrApproveAmt", title:"<spring:message code='ser.lbl.subLbrAmt' />" , width:80 , attributes :{"class":"ar"}, format:"{0:n2}"}//外协金额
              ,{field:"pwaApproveNo", title:"<spring:message code='ser.lbl.pwaApprovalNo' />" , width:110 , attributes :{"class":"al"}}//PWA承认号码
              ,{field:"hqApproveNm", title:"<spring:message code='ser.lbl.hqApproveNm' />" , width:120 , attributes :{"class":"al"}}//判定人
              ,{field:"hqApproveDt" , title:"<spring:message code='ser.lbl.approveDt'/>", width:125
                  , attributes :{"class":"ac"}
                  , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
               }//审批日期
              ,{field:"dlrSignReqDt" , title:"<spring:message code='ser.lbl.fincReqDt' />", width:125
                  , attributes :{"class":"ac"}
                  , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
               }//申请日期
              ,{field:"updtDt" , title:"<spring:message code='ser.lbl.regDt' />", width:125
                  , attributes :{"class":"ac"}
                  , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
               }//录入日
               ,{field:"returnCnt", title:"<spring:message code='ser.lbl.returnCnt' />",  width:80 , attributes :{"class":"ar"}}//退回次数
             ]
    });

    $("#gridRelateMaster").data("kendoExtGrid").dataSource.read();
    
    //维修项目
    $("#gridRelateLabor").kendoExtGrid({
        gridId:"G-SER-0325-135424"
        ,dataSource:{
            transport:{
                   read :{
                       //url:"<c:url value='/ser/wac/pwaReq/selectPwaRequestLbrs.do' />"
                       url:null
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;
                         params["sPwaDocNo"]   = sPwaDocNoVal;
                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"lineNo"
                    ,fields:{
                        lineNo:{type:"number", editable:false}
                       ,lbrCd:{type:"string", editable:false, validation:{required:true}}
                       ,lbrNm:{type:"string" , editable:false}
                       ,lbrHm:{type:"number" , editable:false}
                       ,lbrQty:{type:"number", validation:{required:true}}
                       ,lbrPrc:{type:"number" , editable:true}
                       ,lbrAmt:{type:"number" }
                       ,cauLbrYn:{type:"string", editable:true}
                       ,lbrTp:{type:"string"}
                       ,lbrCdTp:{type:"string"}
                    }

                 }//model
           }//schema
        }//dataSource
        ,pageable:false
        ,sortable:false
        ,autoBind:false
        ,resizable:true
        ,height:180
        ,editable:false
        ,appendEmptyColumn:true
        ,selectable:"row"
        //,multiSelectWithCheckbox:true
        ,filterable:false                 
       // ,editableOnlyNew:true
       // ,editableOnlyNewExcludeColumns:["lbrQty","cauLbrYn"]
        ,columns:[
                {field:"rnum",title:"<spring:message code='ser.lbl.no' />", width:50, attributes:{"class":"ac"}}//序号
                ,{field:"lbrCd",title:"<spring:message code='ser.lbl.lbrCd' />", width:150, attributes:{"class":"al"}} //维修代码
               ,{field:"lbrNm",title:"<spring:message code='ser.lbl.lbrNm' />", width:200, attributes:{"class":"al"}}//维修项目
               ,{field:"lbrHm",title:"<spring:message code='ser.lbl.lbrHm' />", width:120, attributes:{"class":"ar"} }//标准工时
               ,{field:"lbrQty",title:"<spring:message code='ser.lbl.qty' />", width:95, attributes :{"class":"ar"}}//数量
               ,{field:"lbrPrc",title:"<spring:message code='ser.lbl.lbrPrc' />", width:120
                   , attributes :{"class":"ar"}
                   , format:"{0:n2}"
               }//工时单价
               ,{field:"lbrAmt",title:"<spring:message code='ser.lbl.amt' />", width:120
                   , attributes :{"class":"ar"}
                   , format:"{0:n2}"
               }//金额
               ,{field:"cauLbrYn",title:"<spring:message code='ser.lbl.mainLbrCd' />", width:120
                   , attributes :{"class":"ac"}
                   , template:"#= setPwaCauYnMap(cauLbrYn) #"
                 }//主作业代码
               ,{field:"relCauLbrYn"  , hidden : true }//연관 공임 코드 여부( N 이면 주작업 불가 )
               ,{field:"dstinCd"  , hidden : true }//공임 구분 코드
               ,{field:"lbrTp"  , hidden : true }//정비유형
               ,{field:"lbrCdTp"  , hidden : true }//공임코드유형
             ]

    });
    
    
    /**配件列表 **/
    $("#gridRelatePart").kendoExtGrid({
        gridId:"G-SER-0325-144832"
        ,dataSource:{
            transport:{
                   read :{
                       //url:"<c:url value='/ser/wac/pwaReq/selectPwaRequestParts.do' />"
                       url:null
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;
                        
                         params["sPwaDocNo"]   = sPwaDocNoVal;
                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"lineNo"
                    ,fields:{
                        lineNo:{type:"number", editable:false }
                       ,itemCd:{type:"string", editable:false, validation:{required:true} }//부품코드
                       ,itemNm:{type:"string", editable:false }//부품명
                       ,reqQty:{type:"number", validation:{required:true} } //수량
                       ,saleUnitCd:{type:"string", editable:false }//단위
                       ,itemPrc:{type:"number", editable:false } // 단가
                       ,salePrcAmt:{type:"number", editable:false }
                       ,itemTax:{type:"number", editable:false } // 세금
                       ,itemAmt:{type:"number", editable:true }//금액
                       ,cauItemYn:{type:"string", editable:true }
                       ,itemMarkup:{type:"number", editable:false }//markUp
                    }

                 }//model
           }//schema
        }//dataSource
        ,pageable:false
        ,autoBind:false
        ,sortable:false
        ,height:180
        ,resizable:false
        ,selectable:"row"
        //,multiSelectWithCheckbox:true
        ,appendEmptyColumn:true
        ,filterable:false               
        ,editable:false
        ,columns:[
                {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, attributes:{"class":"ac"}}//序号
               ,{field:"itemCd", title:"<spring:message code='ser.lbl.itemCd' />", width:150, attributes :{"class":"al"}}//配件编号
               ,{field:"itemNm", title:"<spring:message code='ser.lbl.itemNm' />", width:200, attributes :{"class":"al"}}//配件名称
               ,{field:"reqQty", title:"<spring:message code='ser.lbl.itemQty' />", width:95, attributes :{"class":"ar"}}//配件数量
               ,{field:"saleUnitCd", title:"<spring:message code='ser.lbl.unitCd' />", width:120, attributes :{"class":"ac"}}//单位
               ,{field:"itemPrc", title:"<spring:message code='ser.lbl.itemUntPrc' />", width:120, attributes :{"class":"ar"}, format:"{0:n2}"}//配件单价
               ,{field:"salePrcAmt", format:"{0:n2}", hidden:true}//부품기본가격  零件基本价格
               ,{field:"itemAmt", title:"<spring:message code='ser.lbl.itemAmt' />", width:120, attributes :{"class":"ar"}, format:"{0:n2}"}//配件金额
               ,{field:"cauItemYn", title:"<spring:message code='ser.lbl.cauItemCd' />", width:120
                   , attributes :{"class":"ac"}
                   , template:"#= setPwaCauYnMap(cauItemYn) #"
                 }//原因配件代码
                ,{field:"npnpMaxAmt" , width:20, hidden:true}
                ,{field:"npnpYn" , width:20, hidden:true}
                ,{field:"itemMarkup", format:"{0:n0}", hidden:true}//markup
             ]

    });
    
    //$("#gridRelateLabor").data("kendoExtGrid").dataSource.read();
   
});

$("#tabstrip").kendoExtTabStrip({
        animation:false
    });
    
   
</script>
