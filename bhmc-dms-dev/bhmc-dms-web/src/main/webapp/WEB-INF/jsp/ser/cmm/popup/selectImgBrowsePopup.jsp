<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="window" class="pop_wrap"  >

  <div class="table_form" role="search" data-btnid="btnSearch">
    <div class="table_form table_form_btn table_form_img">
        <table>
            <tbody>
                <tr>
                    <td class="ac bol_none carChkImg">
                        <div>
                            <img src="<c:url value='/resources/img/wa/img_carbody.png'/>" alt="">
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
 </div>
</section>

<script type="text/javascript">


var parentJsonData = parent.imageSearchPopupWin.options.content.data;

$(document).ready(function(){

    $(".carChkImg").html(parentJsonData.imgUrl);


});

</script>

