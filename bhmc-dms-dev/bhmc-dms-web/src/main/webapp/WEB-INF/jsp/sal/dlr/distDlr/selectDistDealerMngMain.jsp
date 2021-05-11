<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>




<!-- 지역사무소관리 -->
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.title.localOfficeMgmt" /></h1><!-- 지역사무소관리 -->
        <div class="btn_right">
        <dms:access viewId="VIEW-I-12367" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button><!-- 저장 -->
        </dms:access>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->


    <!-- 그리드 시작 -->
    <div class="table_grid">
        <div id="mainGrid"></div>
    </div>
    <!-- 그리드 종료 -->

    <div class="header_area">
        <h2 class="title_basic"><spring:message code='sal.title.dealerInfo' /></h2><!-- 딜러정보 -->
    </div>

    <!-- 그리드 시작 -->
    <div class="table_grid">
        <div id="dealerGrid"></div>
    </div>
    <!-- 그리드 종료 -->

</section>

<!-- script -->
<script>
var usrId = "";

//직무공통코드 Array
var dutyCdDs = [];
<c:forEach var="obj" items="${dutyCdList}">
    dutyCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//직무공통코드 Map
var dutyCdMap = dms.data.arrayToMap(dutyCdDs, function(obj){ return obj.cmmCd; });


$(document).ready(function() {


    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e) {

            var grid = $("#dealerGrid").data("kendoExtGrid");
            var dataSource = grid.dataSource.view();

            var usrId = "";                                     //관리딜러
            var mngDlrCd = "";                                  //피관리딜러
            for(i=0;i<dataSource.length;i++){
                var chkRow =  $(".grid-checkbox-item[data-uid=" + grid._data[i].uid + "]").is(":checked");

                if(chkRow === true){
                    mngDlrCd += grid._data[i].dlrCd+",";
                }
            }

            var mainGrid = $("#mainGrid").data("kendoExtGrid");
            var selectIdx = mainGrid.select().index();
            var data = mainGrid.dataSource.view();
            var selectVal = data[selectIdx];
            usrId = selectVal.usrId;                //관리딜러
            psitCd = selectVal.dutyCd;              //직무



            $.ajax({
                url:"<c:url value='/sal/dlr/distDlr/saveDistDealer.do' />"
                ,data:JSON.stringify({"usrId":usrId,"mngDlrCd":mngDlrCd,"psitCd":psitCd})
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(request,status,error){
                    dms.notification.error(request.responseJSON.errors[0].errorMessage);
                }
            }).done(function(result) {

                $("#mainGrid").data("kendoExtGrid").dataSource.read();
                $("#dealerGrid").data("kendoExtGrid").dataSource.read();
                dms.notification.success("<spring:message code='global.lbl.save' var='save' /><spring:message code='global.info.successMsg' arguments='${save},' />");
                //수정이 완료되었습니다.
            });

        }
    });

    /*******************  //버튼   *******************************************/



    //그리드 설정
    $("#mainGrid").kendoExtGrid({
        gridId:"G-SAL-0721-113325"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/dlr/distDlr/selectDistDealerMng.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sort"] = options.sort;

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"usrId"
                    ,fields:{
                        usrId :{type:"string"}
                        ,usrNm:{type:"string"}
                        ,dutyCd:{type:"string"}
                    }
                }
            }
        }
        ,pageable:false
        ,editable:false
        ,autoBind:true
        ,height:173
        ,change:function(e) {

            if(!e.sender.dataItem(e.sender.select()).isNew()){

                var selectedVal = this.dataItem(this.select());

                if(selectedVal != null){

                    usrId = selectedVal.usrId;

                    var dealerGrid = $("#dealerGrid").data("kendoExtGrid");
                    var dataSource = dealerGrid.dataSource.view();

                    for(i=0;i<dataSource.length;i++){
                        var arrUsrId = dataSource[i].usrId;
                        var chkUsrId = false ;

                        if(arrUsrId != null && arrUsrId != ""){
                            var usrIdVl = arrUsrId.split(",");

                            for(j=0;j<usrIdVl.length;j++){
                                if(usrId == usrIdVl[j]){
                                    chkUsrId = true;
                                }
                            }

                            if(chkUsrId == true){
                                $(".grid-checkbox-item[data-uid=" + dealerGrid._data[i].uid + "]").prop("checked", true);
                            }else {
                                $(".grid-checkbox-item[data-uid=" + dealerGrid._data[i].uid + "]").prop("checked", false);
                            }
                        }

                    }
                }

            };
        }
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,columns:[
                    {field:"usrId"     ,title:"<spring:message code = 'sal.lbl.distOfficeCd'/>"   ,width:120  ,attributes:{"class":"ac"}} //지역사무소코드
                    ,{field:"usrNm"    ,title:"<spring:message code = 'sal.lbl.distOfficeNm'/>"   ,width:80   ,attributes:{"class":"al"}} //지역사무소명
                    ,{field:"dutyCd"   ,title:"<spring:message code = 'sal.lbl.deptCd'/>"         ,width:100  ,attributes:{"class":"ac"}  //담당업무
                        ,template:"# if(dutyCdMap[dutyCd] != null) { # #= dutyCdMap[dutyCd].cmmCdNm# # }#"
                     }
                ]
    });



    // 딜러그리드.
    $("#dealerGrid").kendoExtGrid({
        gridId:"G-SAL-0721-113326"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/dlr/distDlr/selectDealer.do' />"
                    , dataType:"json"
                    , type:"POST"
                    , contentType:"application/json;"
                }
                , parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sort"] = options.sort;

                        return kendo.stringify(params);
                    }
                }
            }
            , schema:{
                model:{
                    id:"dlrCd"
                    ,fields:{
                        dlrCd:{ type:"string"}
                       ,dlrNm:{ type:"string"}
                    }
                }
            }
        }
        ,dataBound:function(e) {

            var mainGrid = $("#mainGrid").data("kendoExtGrid");
            var selectIdx = mainGrid.select().index();
            var data = mainGrid.dataSource.view();
            var selectVal = data[selectIdx];


            if(selectIdx != -1){
                var dealerGrid = $("#dealerGrid").data("kendoExtGrid");
                var dataSource = dealerGrid.dataSource.view();

                for(i=0;i<dataSource.length;i++){
                    if(selectIdx != -1){

                        if(selectVal.usrId == dataSource[i].usrId){
                            $(".grid-checkbox-item[data-uid=" + dealerGrid._data[i].uid + "]").prop("checked", true);
                        }else {
                            $(".grid-checkbox-item[data-uid=" + dealerGrid._data[i].uid + "]").prop("checked", false);
                        }
                    }
                }
            }

        }
        , editable:false
        , pageable:false
        , height:265
        , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        , columns:[
                      {field:"chkYn", title:"<spring:message code='global.btn.select' />"
                        ,width:90
                        ,attributes:{"class":"ac"}
                        ,template  :"<input type='checkbox' data-uid='#= uid #' class='grid-checkbox-item' />"
                      }//선택
                     ,{field:"dlrCd" ,title:"<spring:message code = 'global.lbl.dlrCd'/>", width:120 ,attributes:{"class":"ac"}}  //딜러코드
                     ,{field:"dlrNm" ,title:"<spring:message code = 'global.lbl.dlrNm'/>", width:70  ,attributes:{"class":"al"}}  //딜러명
                    ]
    });


});

</script>
<!-- //script -->