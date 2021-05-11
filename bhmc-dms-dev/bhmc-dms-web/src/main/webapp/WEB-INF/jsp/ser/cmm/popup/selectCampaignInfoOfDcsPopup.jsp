<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<section id="windows" class="pop_wrap">

    <div class="header_area">
        <h2 class="title_basic"><spring:message code="crm.title.campaignActionRecordMng" /><!-- 방문서비스 --></h2>
    </div>
    <div class="table_grid mt10">
        <div id="grid" class="grid"></div>
    </div>
</section>

<script type="text/javascript">

$(document).ready(function() {

    var parentJsonData = parent.campaignInfoOfDcsPopup.options.content.data.result;
    var crTp = parentJsonData[0].crTp;
    var dlrCd = parentJsonData[0].dlrCd ;
    var lbrCd = parentJsonData[0].lbrCd ;
    var regDt = parentJsonData[0].regDt;
    var regUsrId = parentJsonData[0].regUsrId;
    var updtDt = parentJsonData[0].updtDt;
    var updtUsrId = parentJsonData[0].updtUsrId;
    var vinNo = parentJsonData[0].vinNo;
    var crNo = parentJsonData[0].crNo;

  //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SER-1011-000040"
        ,dataSource:[{dlrCd, vinNo, crNo, crTp, lbrCd, regDt, regUsrId, updtDt, updtUsrId }]
        ,autoBind:true
        ,pageable:false
        ,editable:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,sortable:false
        ,height:300
        ,columns:[
             {field:"dlrCd",title:"<spring:message code='crm.lbl.dlrCd' />",width:40,attributes:{"class":"ac"}}
             ,{field:"vinNo",title:"<spring:message code='crm.lbl.vinNo' />", width:90 ,attributes:{"class":"ac"}}//VIN
             ,{field:"crNo",title:"<spring:message code='global.lbl.crNo' />", width:50,attributes:{"class":"ac"}}
             ,{field:"crTp",title:"<spring:message code='ser.lbl.crTp' />", width:40 ,attributes:{"class":"ac"}}
             ,{field:"lbrCd",title:"<spring:message code='ser.lbl.lbrCd' />", width:60 ,attributes:{"class":"ac"}}
             ,{field:"regDt",title:"<spring:message code='global.lbl.regDt' />", width:120 ,attributes:{"class":"ac"}}
             ,{field:"updtDt",title:"<spring:message code='par.lbl.updtDt' />", width:120 ,attributes:{"class":"ac"}}
            ]
    });
});
</script>









