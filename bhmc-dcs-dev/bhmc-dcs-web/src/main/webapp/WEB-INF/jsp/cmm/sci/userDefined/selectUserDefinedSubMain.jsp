<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div id="subGrid"></div>

<script type="text/javascript">
    $(document).ready(function() {
        // 그리드 설정
        $("#subGrid").kendoExtGrid({
            dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/cmm/sci/userDefined/selectUserDefinedSub.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {
                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sUsrDefReqDocId"] = "<c:out value='${sUsrDefReqDocId}' />";

                            return kendo.stringify(params);
                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                , schema:{
                    model:{
                        id:"rnum"
                      , fields:{
                            rnum:{type:"number", editable:false}
                          , usrDefReqDocId:{type:"string", editable:false}
                          , dlrCd:{type:"string", editable:false}
                          , dlrNm:{type:"string", editable:false}
                          <c:forEach var="result" items="${result}" varStatus="status">
                          , "field_${status.count}":{type:"string", editable:false}
                          </c:forEach>
                        }
                    }
                }
            }
            , height:219
            , selectable:"row"
            , editableOnlyNew:true
            , navigatable:false
            , pageable:false
            , resizable:false
            , change:function(e) {
                var selectedVal = this.dataItem(this.select());

                parent.fnUserDefinedPreviewPopup(selectedVal);
            }
            , columns:[
                {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:"false", attributes:{"class":"ac"}}
              , {field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:150, attributes:{"class":"ac"}}
              , {field:"dlrNm", title:"<spring:message code='global.lbl.dlrNm' />", width:150}
              <c:forEach var="result" items="${result}" varStatus="status">
              , {field:"field_${status.count}", title:"<spring:message code='global.lbl.survery' /> ${status.count}", width:150, attributes:{"class":"ac"}}
              </c:forEach>
              , {title:""}
            ]
        });
    });
</script>