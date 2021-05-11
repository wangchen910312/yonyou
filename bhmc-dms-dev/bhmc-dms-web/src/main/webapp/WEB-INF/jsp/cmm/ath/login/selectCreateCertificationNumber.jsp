<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--
    JSP Name : jspName.jsp
    Description : 설명을 기술합니다.
    author Choi Kyung Yong
    since 2016. 11. 22.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2016. 11. 22.     Choi Kyung Yong     최초 생성
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javaScript" language="javascript">
function getRandomNumber(){
    var ranNum=Math.floor(Math.random()*(99999-10000+1))+10000;
    return ranNum;
}
$(document).ready(function() {
    $("button").click(function (){
        $("#certiNum").val(getRandomNumber());

        var saveData={};
        var updateList=[];
        var r={};
        r.cmmCd="01";
        r.cmmCdNm="모바일인증번호";
        r.cmmCdNmLang=null;
        r.cmmGrpCd="COM063";
        r.cmmGrpCdNm="모바일 인증번호";
        r.remark1=$("#certiNum").val();
        r.useYn="Y";
        r.sortOrder="1";
        updateList.push(r);
        saveData.updateList=updateList;

        $.ajax({
            url:"/bhmc-dms-web/cmm/sci/commonCode/multiCommonCodes.do"
            ,data:JSON.stringify(saveData)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR,status,error) {

                //dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(jqXHR, textStatus) {

                /* grid.dataSource._destroyed = [];
                grid.dataSource.page(1);

                //정상적으로 반영 되었습니다.
                dms.notification.success("정상적으로 반영 되었습니다."); */
            }
        });
    });
});
</script>
</head>
<body>
	<button>CREATE NUMBER</button>
    <input type="number" id="certiNum">
</body>
</html>