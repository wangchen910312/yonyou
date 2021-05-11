<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.springframework.context.i18n.LocaleContextHolder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="springLocale" scope="session" value="<%=LocaleContextHolder.getLocale().getLanguage()%>" />
<div style="text-align:right">
<a href="<c:url value='/' />">HOME</a>
<input id="langChanger" type="text" style="width:60px;margin:7px 10px;" />
<script type="text/javascript">
 //조회조건 - 배치활성여부
 $("#langChanger").kendoExtDropDownList({
     dataSource:["ko","zh"]
     ,change:function(e){
         var url;

         if(location.href.indexOf("?") > 0){

             if(location.href.indexOf("lang=") > 0){
                 url = location.href.replace(/lang=\S{2}/g, "lang=" + this.value());
             }else{
                 url = location.href + "lang=" + this.value();
             }

         } else {
             url = location.href + "?lang=" + this.value();
         }

         location.href = url;
     }
 });

$("#langChanger").data("kendoExtDropDownList").value("${springLocale}");


</script>
</div>








