<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
    <ul data-role="listview" data-source="listData" data-template="list-template" data-click="fileListViewClick">
    </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="deleteitem">
    <span style="width:70%">#:fileNm #파일명</span>
    <span style="width:30%">#:fileSize #크기</span>
</div>
</script>

<script type="text/javascript">
    var pageIndex = 0;
    var pageSize = 100;
    var rowIndex = 0;
    var rowTotal = 1000;

    var listData = new kendo.data.DataSource({
        transport:{
            read:function(options) {
                if (rowIndex >= rowTotal) {
                    return;
                }

                app.showLoading();
                pageIndex++;

                var params = {};
                params["recordCountPerPage"] = pageSize;
                params["pageIndex"] = pageIndex;
                params["firstIndex"] = (pageIndex - 1) * pageSize;
                params["lastIndex"] = pageIndex * pageSize;
                params["sort"] = null;

                params["sFileDocNo"] = parent.$("#sActiveFileDocNo").val();

                $.ajax({
                    url:"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />"
                    ,data:JSON.stringify(params)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error) {
                        parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
                        app.hideLoading();
                     }
                    ,success:function(result) {
                        if(result.data != null && result.data != "") {
                            var data = [];
                            rowTotal = result.total;

                            $.each(result.data , function(i , row){
                                rowIndex++;

                                data.push({pageIdx:pageIndex,
                                    rowIdx:rowIndex,
                                    fileDocNo:row.fileDocNo,
                                    fileNo:row.fileNo,
                                    fileNm:row.fileNm,
                                    fileSize:row.fileSize,
                                    fileTp:row.fileTp,
                                    fileData:row.fileData
                                });
                            });

                            options.success(data);
                            app.hideLoading();
                            //parent.setSubListHeight("detailList", rowTotal);
                            parent.setSubListHeightNew("detailList",1,rowTotal);
                        }
                        else {
                            app.hideLoading();
                            //parent.setSubListHeight("detailList", 0);
                            parent.setSubListHeightNew("detailList",1,0);
                        }

                        checklistCnt("fileList_noData", result.total, noDatamsg);
                    }
                });
            }
        },
        pageSize:pageSize,
        serverPaging:true,
        schema:{
            total:function(){ return rowTotal; }
        }
    });

    fileListViewClick = function(e) {
        parent.fnFileDetail(e.dataItem.fileDocNo, e.dataItem.fileNo);
    }

    var app = setKendoMobAppForNativeScroll();
</script>