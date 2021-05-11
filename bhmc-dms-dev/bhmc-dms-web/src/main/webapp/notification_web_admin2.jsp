<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.1.4.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/sockjs/sockjs-1.1.1.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/stomp/stomp.min.js" />"></script>
</head>
<body>

    <div id="messages" style="width:820px;height:300px;border:1px solid #E5E5E5;margin:10px 0px;" ></div>
    <textarea id="debug" cols="100" rows="30">
    </textarea>

    <script>//<![CDATA[
    $(document).ready(function() {
        if(window.WebSocket) {
            var client, destination, user, password;

            client = Stomp.client("ws://127.0.0.1:61614");
            destination = "dms.notification.web.admin2";
            user = "amqdms";
            password = "amqdms";


            // this allows to display debug logs directly on the web page
            client.debug = function(str) {
                $("#debug").append(str + "\n");
            };

            // the client is notified when it is connected to the server.
            client.connect(user, password, function(frame) {
                client.debug("connected to Stomp");
                client.subscribe(destination, function(message) {
                    $("#messages").append("<p>" + message.body + "</p>\n");
                });
            });

//             client.disconnect(function() {
//                 $('#connected').fadeOut({ duration:'fast' });
//                 $('#connect').fadeIn();
//                 $("#messages").html("")
//             });
        }
    });
    //]]></script>

</body>
</html>


