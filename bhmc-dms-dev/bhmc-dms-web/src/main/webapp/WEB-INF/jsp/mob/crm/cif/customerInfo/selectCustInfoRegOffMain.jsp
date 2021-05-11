<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<title>北京现代 DMS</title>
<!--
<link rel="stylesheet" type="text/css" href="../../../css/mob/kendo.mobile.all.min.css">
<link rel="stylesheet" type="text/css" href="../../../css/mob/mdms.css">
<script type="text/javascript" src="../../../js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="../../../js/mob/mpublish.js"></script>

-->
<link rel="stylesheet" type="text/css" href="./css/kendo.mobile.all.min.css">
<link rel="stylesheet" type="text/css" href="./css/mdms.css">
<script type="text/javascript" src="./js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="./js/kendo.all.min.js"></script>
<script type="text/javascript" src="./js/dms.common-1.0.js"></script>
<script type="text/javascript" src="./js/mobCommon_local.js"></script>
<script type="text/javascript" src="./js/dms.parts-1.0.js"></script>

</head>
<body>
<div id="mwrap">
    <!-- header -->
    <header id="header">
        <span class="allmenu">주요메뉴 열기</span>
        <span class="localback" onclick="javascript:goBack();">Back</span>
        <h1>客户注册</h1>
        <span class="alarm"><span class="login" onclick="javascript:goLogin();">LOGIN</span></span>
    </header>
    <!-- //header -->

    <!-- content -->
    <section id="content">
        <div class="co_group">
            <div class="content_title">
                <h2>제목</h2>
            </div>
            <div class="formarea">
                <table class="flist01">
                    <caption>客户信息录入</caption>
                    <colgroup>
                        <col style="width:25%;">
                        <col style="">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row">线索类型</th>
                            <td>
                            <div class="f_select">
                                <select class="" id="custSource" >
                                    <option selected val="">선택옵션</option>
                                    <option value="11">옵션 11</option>
                                    <option value="22">옵션 22</option>
                                </select>
                            </div>
                            </td>
                        </tr>
            <tr>
                            <th scope="row">线索来源</th>
                            <td>
                            <div class="f_select">
                                <select class="" id="custSource2" >
                                    <option selected val="">선택옵션</option>
                                    <option value="11">옵션 11</option>
                                    <option value="22">옵션 22</option>
                                </select>
                            </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">业务客户名称</th>
                            <td>
                                <div class="f_text">
                                    <input type="text" id="custNm" placeholder="">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">电话</th>
                            <td>
                                <div class="f_text">
                                    <input type="text" id="custHp" name="" placeholder="">
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="con_btnarea btncount2 mb0">
                <div><span class="btnd1t2"  id="btnInit" onclick="javascript:init();">初始化</span></div>
                <div><span class="btnd1" id="btnSave" onclick="javascript:save();">保存</span></div>
            </div>
        </div>

        <!-- content_list -->
        <section id="content_list">
            <div class="content_title mtitle">
                <h1><spring:message code='global.lbl.incomplete' />登录客户目录</h1>
            </div>
            <div class="listarea">
                <div class="dlistitem listhead">
                    <span style="width:50%"><spring:message code='global.lbl.incomplete' />业务客户名称</span>
                    <span style="width:50%"><spring:message code='global.lbl.incomplete' />录入日期</span>
                    <span class="clboth" style="width:50%"><spring:message code='global.lbl.incomplete' />电话</span>
                    <span style="width:50%"><spring:message code='global.lbl.incomplete' />线索类型</span>
                </div>
                <iframe id="mainList" border="0" frameborder="0" width="100%" height=""> </iframe>
            </div>
        </section>
    </section>

</div>

<!-- script -->
<script>
$(document).ready(function() {
    // iframe 컨텐츠 높이만큼 설정하기
    $("#mainList").load(function() {
        //var h = $(this).contents().height();
        //$(this).height( h );
    });
});

var toDate,
    gCrud;

toDate = new Date();



//고객출처
var custSourceList             =  [],
custSourceObj              = {};

var tempSourceList =[];
var custSourceList2=[];
var custSourceNm;

$(document).ready(function() {

    
var userAgent = navigator.userAgent.toLowerCase();

        if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1) || (userAgent.search("ipad") > -1))
        {
            document.location="bhmccp://SELECT?TABLE_NM=Lead_Source&return_func=resultLeadData";
    }else{
            try{
                window.bhmccp.SELECT('Lead_Source','','resultLeadData');
            }catch(e){
        var resultList = "{\"data\":[{\"LEAD_SEQ\":\"00\",\"LEAD_CD\":\"11\",\"LEAD_NM\":\"테스트2\"},{\"LEAD_SEQ\":\"00\",\"LEAD_CD\":\"22\",\"LEAD_NM\":\"테스트2\"},{\"LEAD_SEQ\":\"00\",\"LEAD_CD\":\"33\",\"LEAD_NM\":\"테스트3\"},{\"LEAD_SEQ\":\"01\",\"LEAD_CD\":\"11\",\"LEAD_NM\":\"테스트11\"},{\"LEAD_SEQ\":\"02\",\"LEAD_CD\":\"11\",\"LEAD_NM\":\"테스트12\"}]}";
        resultLeadData(resultList);
            }
    }

    


    function initPage(){
        /* if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        }
        partsJs.validate.groupObjAllDataInit();
        gCrud = 'C';
        $(".skeyarea").hide();
        */
        //getItemListInit();
    setItemList("{\"data\":[]}");
    }


    //initPage();

    // 타이틀
    $("#header_title").html("客户注册"); //고객등록
    //$("#header_title").on("click", contentSearch);

    // 목록 조회
    $("#mainList").attr("src", "selectCustInfoRegOffList.html");
    //document.getElementById("selectCustInfoRegOffList").contentWindow.selectItemList();

    // 버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentList(); }
        else if ($("#content_detail").css("display") == "block") { contentList(); }
    });

    //버튼 - TOP
    $("#docu_top").bind("click", function()
    {
        $("body,html").animate({scrollTop: 0}, 200);
    });

    //상단으로 이동
    $(window).scroll(function () {
        if ($(this).scrollTop() != 0)
        {
            $("#docu_top").fadeIn();
        }
        else
        {
            $("#docu_top").fadeOut();
        }
    });
        return false;

});

    //버튼 - 로그인
    function goLogin() {
        if( mob.browser.isSafari() ) {
            document.location='bhmccp://goLogin';
        }
        else {
            window.bhmccp.goLogin();
        }
    }

    //버튼 - 백
    function goBack() {
        if( mob.browser.isSafari() ) {
            document.location='bhmccp://goLocalBack';
        }
        else {
            window.bhmccp.goLocalBack();
        }
    }


// 버튼 - 저장
    function save(){
        
        if(!validCheck()){
            alert('전화번호를 확인하세요.');
            return;
        }
        
        var custNm = $("#custNm").val();
        var custHp = $("#custHp").val();
        var custSourceTxt = $("#custSource").text();
        var custSourceVal = $("#custSource").val();
    var custSourceVal2 = $("#custSource2").val();
        
        //ToDo 오프라인 native연동 테스트 필요
        var userAgent = navigator.userAgent.toLowerCase();
        if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1) || (userAgent.search("ipad") > -1))
        {
            document.location='bhmccp://SAVE?TABLE_NM=Lead_info&return_func=resultSave&CUST_NM='+custNm+'&CUST_HP='+custHp+'&INFO_TP='+custSourceVal+'&INFO_PATH='+custSourceVal2;
        }else{
            try{
                
                var param = {"CUST_NM":custNm, "CUST_TP":"01","CUST_HP":custHp,"INFO_TP":custSourceVal,"INFO_PATH":custSourceVal2};
                
                window.bhmccp.SAVE('Lead_info',JSON.stringify(param),'resultSave');
            }catch(e){

                
            }
        }
    }
    
    
    function resultSave(param){
        //추가성공
        if(param =='Y'){
            var custNm = $("#custNm").val();
                var custHp = $("#custHp").val();
                var custSourceTxt = $("#custSource").text();
                var custSourceVal = $("#custSource").val();
            document.getElementById("mainList").contentWindow.addItemList(custNm, custHp, custSourceNm, custSourceVal);
        }else{
            alert('추가실패');
        }
    }
    
    
    

    
    function setItemList(param){
        //SHJ
        alert(param);
        var resultList = JSON.parse(param);
    console.log(document.getElementById("mainList").text());
    document.getElementById("mainList").contentWindow.getItemList(param);


        }
    

    // 버튼 - 초기화
    function init(){
        $("#custNm").val("");
        $("#custHp").val("");
        //$("#custSource").data("kendoExtDropDownList").value("");
                $("#custSource").val("");
    }
    
    function validCheck() {
        var validChars = "0123456789-";
        
        val = $("#custHp").val();
        
        for(var i = 0 ; i <val.length; i++){
            if(validChars.indexOf(val.charAt(i)) == -1 ){
                return false;
            }
        }

    var _custSource=$("#custSource").val();
if(_custSource=="") return false;
    var _custSource2=$("#custSource2").val();
if(_custSource2=="") return false;
            return true;
        
    }
    
    function resetHeight(){
        // iframe 컨텐츠 높이만큼 설정하기
        var h = $("#mainList").contents().height();
        
        $("#mainList").height( h );
    }
    
    function resultLeadData(param){
    var result = JSON.parse(param);
    var rowCount = result.data.length;
    
        if(rowCount > 0){
            $.each(result.data , function(i , row){
                    if(row.LEAD_SEQ=="00"){
                custSourceList.push({
                        "cmmCd":row.LEAD_CD,
                        "cmmCdNm":row.LEAD_NM,
                "LEAD_SEQ":row.LEAD_SEQ
                        });
            }else{
                tempSourceList.push({
                        "cmmCd":row.LEAD_CD,
                        "cmmCdNm":row.LEAD_NM,
                "LEAD_SEQ":row.LEAD_SEQ
                        });
            }
                    rowCount --;
            });

        // 고객출처
            $("#custSource").kendoExtDropDownList({
                dataTextField: "cmmCdNm"
                ,dataValueField: "cmmCd"
                ,dataSource : custSourceList
                ,index : 0
                ,optionLabel:"선택"
            ,select:onSelectSearchHoldTp
            });
        }
    }

    function onSelectSearchHoldTp(e){
         
    custSourceList2=[];


         
        
     var dataItem = this.dataItem(e.item);
    custSourceNm=dataItem.cmmCdNm;
     var i=0;
    

     for(i=0; i<tempSourceList.length; i++){
        if(dataItem.cmmCd==tempSourceList[i].cmmCd){
                custSourceList2.push({"cmmCd":tempSourceList[i].cmmCd,"cmmCdNm":tempSourceList[i].cmmCdNm});
            }
     }

         $("#custSource2").kendoExtDropDownList({
                dataTextField: "cmmCdNm"
                ,dataValueField: "cmmCd"
                ,dataSource : custSourceList2
                ,index : 0
                ,optionLabel:"선택"
            
            });

     }

</script>
<!-- //script -->
</body>
</html>
