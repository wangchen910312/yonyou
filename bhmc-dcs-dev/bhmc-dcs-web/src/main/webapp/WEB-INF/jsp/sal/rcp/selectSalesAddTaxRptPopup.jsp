<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<section id="windows" class="pop_wrap">
   <%-- <button type="button" class="btn_m btn_submit" id="btnSubmit"><spring:message code='global.btn.submit' /></button> --%>
    <!-- 영수증 -->
    <div class="mt0" id="receiptUpload">
        <div class="workProgress_btnArea2 clfix">
            <div class="inbox" style="width:98%">
                <!-- 
                <div class="header_area top_area" style="height:45px;">
                    <div class="left_area">
                        <p class="top_txt"><spring:message code='sal.lbl.ScanImage' /></span></p>
                    </div>
                    <div class="btn_right">
                        <button type="button" id="btnExport" class="btn_s btn_s_min5">다운로드</button>
                    </div>
                </div>
                -->
                <div class="top_area">
                    <p class="top_txt"><spring:message code='sal.lbl.ScanImage' /></span></p>
                </div>
                <div class="con_area">
                    <!-- width:100%;height:369px; -->
                    <img id="scanImageView" src="" style="width:100%; display:block;">
                </div>
            </div>
        </div>
        <br>
    </div>
<!-- 영수증 업로드-->
</section>


<script type="text/javascript">

/**
 * 팝업 옵션
 */
var parentData = parent.selectSalesAddTaxRptPopupWin.options.content.data;

$(document).ready(function(){
    
    
    $("#btnSubmit").kendoButton({
        click:function(e) {
            detailSet();
        }
    });
    
    $("#btnExport").kendoButton({
        click:function(e) {
            //$("#scanImageView")[0].document.execCommand("SaveAs");
            /*
            var aTag = document.createElement('a');
            aTag.download = 'image.jpeg';
            aTag.href = $("#scanImageView")[0].src;
            aTag.click();
            */
            
            //document.querySelector("img").click();

            //location.href = $("#scanImageView")[0].src;
            
            /*
            var a = document.createElement('a');
            a.download = "output.jpeg";
            a.href = $("#scanImageView")[0].src;
            document.body.appendChild(a);
            a.click();
            document.body.removeChild(a);
            */
            
            /*
            window.win = open ($("#scanImageView")[0].src);
            win.document.execCommand("SaveAs");
            */
            
            /*
            window.win = open ($("#scanImageView")[0].src);
            setTimeout('win.document.execCommand("SaveAs")', 500);
            */
            
            /*
            var file = $("#scanImageView")[0].src;
            var img = str_replace('data:image/jpeg;base64,', '', file);
            file_put_contents('img/imag.png', base64_decode(img));
            */
            
            //file_put_contents('img.png', base64_decode(explode(',',$("#scanImageView")[0].src)[1]));
        }
    });
    
    
    detailSet = function(){
        
        $.ajax({
            url:"<c:url value='/sal/rcp/selectSalesAddTaxReceiptByKey.do' />",
            type:'POST',
            dataType:'json',
            data: "sVinNo="+parentData.sVinNo,
            //data: "sVinNo=LBETLBFC2HY247645",
            async : false,
            error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors);
            },
            success:function(data){
                //이미지 로딩
                if(dms.string.isNotEmpty(data.receiptImg)){
                    var fileView = document.querySelector("img");
                    var fileData = window.atob(data.receiptImg);
                    fileView.src = fileData;
                
                    fileView.onload = function() {
                        if(this.width > 850){
                            fileView.width = 850;
                        }else{
                            fileView.width = this.width;
                        }
                    };
                }
               
            }
        });
    };

     if( dms.string.isNotEmpty(parentData.sVinNo) ){
         detailSet();
     }
    
});
 
/* 

var selectSalesAddTaxRptPopupWin;
function selectSalesAddTaxRptPopupWindow(){

    selectSalesAddTaxRptPopupWin = dms.window.popup({
        windowId:"selectSalesAddTaxRptPopupWin"
        ,title:"<spring:message code='sal.title.ReceiptUpload' />"   
        ,width :700
        ,height:470
        ,draggable:true
        ,modal:true
        ,resizable:false
        ,visible:false
        ,content:{
            url:"<c:url value='/sal/rcp/selectSalesAddTaxRptPopup.do'/>"
            ,data:{
                "type":null
                ,"autoBind":false
                ,"sVinNo":'LBEADAFC1HX157245'
                ,"callbackFunc":function(data){
                     
                }
            }
        }

    });
}
*/
</script>
