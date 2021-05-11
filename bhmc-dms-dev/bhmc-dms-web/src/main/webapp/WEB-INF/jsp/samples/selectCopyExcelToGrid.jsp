<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.springframework.context.i18n.LocaleContextHolder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="springLocaleLanguageLanguage" scope="session" value="<%=LocaleContextHolder.getLocale().getLanguage()%>" />
<!DOCTYPE html>
<html springLocaleLanguagengLocaleLanguage}">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<title>엑셀카피 그리드 샘플</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.common.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.rtl.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.default.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.dataviz.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.dataviz.default.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common.css"/>">

<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.1.4.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/kendo/kendo.all.min.js"/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/kendo/cultures/springLocaleLanguagee.${springLocaleLanguage}.min.js' />"></script>
<!--[if lt IE 9]>
    <script src="<c:url value="/resources/js/html5shiv.js"/>"></script>
<![endif]-->


<%-- 자바스크립트 전역변수:컨텍스트 경로 --%>
<script type="text/javascript">var _contextPath = "${pageContext.request.contextPath}";</script>

<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.common-1.0.js' />"></script>
<script type="text/javascript" src="<c:url value='/cmm/sci/js/selectCultureSettings.do' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/kendo.ui.ext-1.0.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/jquery.ext-1.0.js' />"></script>
<!-- <script type="text/javascrspringLocaleLanguage.culture("${springLocaleLanguage}");</script> -->
</head>

<body>

    <div id="wrap">
        <div id="container">
            <section id="content">
                <!-- 그리드 기능 버튼 시작 -->
                <div class="header_area">
                    <div class="btn_right">
                        <button class="btn_s btn_add" id="btnAdd"><spring:message code="global.btn.add" /></button>
                        <button class="btn_s btn_del" id="btnDel"><spring:message code="global.btn.del" /></button>
                        <button class="btn_s btn_save" id="btnSave"><spring:message code="global.btn.save" /></button>
                        <button class="btn_s btn_cancel" id="btnCancel"><spring:message code="global.btn.cancel" /></button>
                    </div>
                </div>
                <!-- 그리드 기능 버튼 종료 -->

                <!-- 그리드 시작 -->
                <div class="table_grid">
                    <div id="grid"></div>
                </div>
                <!-- 그리드 종료 -->


                <script type="text/javascript">


                $(document).ready(function() {

                    //그리드 설정
                    $("#grid").kendoExtGrid({
                        dataSource:{
                             transport:{
                                read:{
                                    url:"<c:url value='/cmm/sci/country/selectCountries.do' />"
                                }
                                ,parameterMap:function(options, operation) {
                                    if (operation === "read") {

                                        var params = {};

                                        params["recordCountPerPage"] = options.pageSize;
                                        params["pageIndex"] = options.page;
                                        params["firstIndex"] = options.skip;
                                        params["lastIndex"] = options.skip + options.take;
                                        params["sort"] = options.sort;

                                        return kendo.stringify(params);

                                    } else if (operation !== "read" && options.models) {
                                        return kendo.stringify(options.models);
                                    }
                                }
                            }
                            ,schema:{
                                model:{
                                    id:"cntryCd"
                                    ,fields:{
                                        rnum:{type:"number", editable:false}
                                        ,cntryCd:{type:"string", validation:{required:true}}
                                        ,cntryNm:{type:"string", validation:{required:true}}
                                        ,langCd:{type:"string", validation:{required:true}}
                                    }
                                }
                            }
                        }
                        ,multiSelectWithCheckbox:true
                        ,editableOnlyNew:true
                        ,editableOnlyNewExcludeColumns:["cntryNm"]
                        ,columns:[
                            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                                ,attributes:{"class":"ac"}
                            }
                            ,{field:"cntryCd", title:"<spring:message code='global.lbl.cntryCd' />", width:80
                                ,attributes:{"class":"ac"}
                            }
                            ,{field:"cntryNm", title:"<spring:message code='global.lbl.cntryNm' />", width:350}
                            ,{field:"langCd", title:"<spring:message code='global.lbl.langCd' />", width:80
                                ,attributes:{"class":"ac"}
                                ,editor:function(container, options) {
                                    $('<input required name="langCd" data-bind="value:' + options.field + '"/>')
                                    .appendTo(container)
                                    .kendoExtDropDownList({
                                        autoBind:false
                                        ,dataSource:supportedLangs
                                    });
                                    $('<span class="k-invalid-msg" data-for="langCd"></span>').appendTo(container);
                                }
                            }
                            ,{title:""}
                        ]

                    });
                });
            </section>
        </div>
    </div>

</body>
</html>