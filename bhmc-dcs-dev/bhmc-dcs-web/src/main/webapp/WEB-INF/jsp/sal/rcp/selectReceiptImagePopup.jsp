<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<%--
    JSP Name : selectReceiptImagePopup.jsp
    Description : 영수증 이미지 팝업
    author Yunseung Kim
    since 2017. 3. 23.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2017. 3. 22.     Yunseung Kim     최초 생성
--%>
<section id="windows" class="pop_wrap">
    <div class="header_area">

    </div>

    <div class="table_info table_info">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:100%;">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col"><spring:message code='sal.lbl.Item' /></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input type="hidden" id="uploadFileBlob" />
                        <img id="scanImageView" name="ScanImageView" src=""  width="800">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="header_area">
        <div class="btn_right">
            <button type="button" id="btnClose" class="btn_s btn_s_min5"><spring:message code="par.btn.close" /></button>
        </div>
    </div>
</section>

<script type="text/javascript">
//2020.08.20 tjx 图片显示
function imgDisplay(img_str) {  
    $("#scanImageView").attr("src", "data:image/jpg; base64," + img_str);  
 };  

function imageLoader(){
    var fileView = document.querySelector("img");
    var bolbBytes = $("#uploadFileBlob").val();
    var fileData = window.atob(bolbBytes);
    fileView.src = fileData;

    fileView.onload = function() {
        if(this.width > 800){
            fileView.width = 800;
        }else{
            fileView.width = this.width;
        }
    };
}

$(document).ready(function() {

    var options = parent.receiptImagePopupWindow.options.content.data;
    var requestUrl = "";
    if(options.sParent == "addTaxReceipt"){                 // 부가세영수증관리 화면에서 호출
        requestUrl = "<c:url value='/sal/rcp/selectAddTaxReceiptImageSearch.do' />";
    }else if(options.sParent == "vehicleCombineReceipt"){   // 기동차영수증관리 화면에서 호출
        requestUrl = "<c:url value='/sal/rcp/selectReceiptImageSearch.do' />";
    }else{
        requestUrl = "<c:url value='/sal/rcp/selectReceiptDetailPopupSearch.do' />";
    }

    //btnClose
    $("#btnClose").kendoButton({
        click:function(e){
            parent.receiptImagePopupWindow.close();
        }
    });

    $.ajax({
        url:requestUrl
        ,data:JSON.stringify({sReceiptId:options.sReceiptId, sCarId:options.sCarId, sSeq:options.sSeq, sVinNo:options.sVinNo,sReceiptNo:options.sReceiptNo}) <!-- R19111100817 一台车提交了两个不同号的发票，应该显示两行，目前只显示了一行。同时希望可以像<新能源补贴申请审核>页面类似的，可显示全部和最新的数据 贾明 2019-11-11 图片信息  END -->
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,async:false
        ,error:function(jqXHR,status,error){
            // itemCd not use check message
            //显示错误信息
        	dms.notification.error(jqXHR.responseJSON.errors);
        }
        ,success:function(data, textStatus){
        	//2020.8.20 tjx 修改发票图片查询逻辑,发票地址为空,查数据库blob数据,否则(以删除)查本地路径下的图片进行显示
        	if("" == data.imgDecoder || null == data.imgDecoder){
        		 $("#uploadFileBlob").val(data.receiptImg);
                 imageLoader();
        	}else{
                var img_str = data.imgDecoder;  
                imgDisplay(img_str);
        	}
           
        }
    });

    /* $("#scanImageView").prop("src", _contextPath + "/sal/rcp/selectSalesVehicleCombineReceiptImg.do?inline=true&carId="+options.sCarId); */

});
</script>