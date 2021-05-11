<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- 버튼메시지 팝업 -->
<section id="window" class="pop_wrap">
    <div class="msg_box">
        <p id="sMsg"></p>
    </div>
    <div class="btn_bottom">
        <button id="btn01" class="btn_m"></button>
        &nbsp;&nbsp;
        <button id="btn02" class="btn_m"></button>
        &nbsp;&nbsp;
        <button id="btn03" class="btn_m"></button>
    </div>
</section>
<!-- //버튼메시지 팝업 -->

<!-- script -->
<script>
$(document).ready(function() {
    var options = parent.popupWindow.options.content.data;

    $("#btn01").kendoButton({
        click:function(e){
            var data = [];
            data.msg = '01';
            options.callbackFunc(data);
            parent.popupWindow.close();
        }
    });

    $("#btn02").kendoButton({
        click:function(e){
            var data = [];
            data.msg = '02';
            options.callbackFunc(data);
            parent.popupWindow.close();
        }
    });

    $("#sMsg").html(options.msg);
    $("#btn01").text(options.btnMsg01);
    $("#btn02").text(options.btnMsg02);

    if(typeof(options.btnMsg03) != "undefined"){
        $("#btn03").kendoButton({
            click:function(e){
                var data = [];
                data.msg = '03';
                options.callbackFunc(data);
                parent.popupWindow.close();
            }
        });

        $("#btn03").text(options.btnMsg03);
    }else{
        $("#btn03").hide();
    }

});




</script>
<!-- //script -->

