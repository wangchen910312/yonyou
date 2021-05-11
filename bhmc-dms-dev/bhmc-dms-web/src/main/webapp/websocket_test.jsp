<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.1.4.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/sockjs/sockjs-1.1.1.min.js" />"></script>
</head>
<body>
    <script type="text/javascript">
        var sock = new SockJS('http://localhost:8080/bhmc-dms-web/notificationMessageHandler.do');
        sock.onopen = function() {
            console.log('open');
        };
        sock.onmessage = function(e) {
            console.log('message', e.data);
        };
        sock.onclose = function() {
            console.log('close');
        };
        sock.send('test');
        sock.close();
    </script>
</body>
</html>


