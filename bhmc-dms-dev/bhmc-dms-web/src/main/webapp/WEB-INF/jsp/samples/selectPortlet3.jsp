<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div class="table_grid">
    <table class="grid" id="ptl-sample-3">
        <caption></caption>
        <thead>
            <tr>
                <th scope="col" data-field="data1">客户名</th>
                <th scope="col" data-field="data2">区分</th>
                <th scope="col" data-field="data3">配件名</th>
                <th scope="col" data-field="data4">签约状态</th>
                <th scope="col" data-field="data5">签约日</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>韓康錫</td>
                <td>签约</td>
                <td>锦湖轮胎</td>
                <td>接受报价</td>
                <td>2015-12-15</td>
            </tr>
            <tr>
                <td>韓康錫</td>
                <td>签约</td>
                <td>韩泰轮胎</td>
                <td>接受报价</td>
                <td>2015-12-14</td>
            </tr>
            <tr>
                <td>韓康錫</td>
                <td>签约</td>
                <td>锦湖轮胎 .</td>
                <td>报价确认</td>
                <td>2015-12-11</td>
            </tr>
            <tr>
                <td>韓康錫</td>
                <td>签约</td>
                <td>锦湖轮胎</td>
                <td>接受报价</td>
                <td>2015-12-15</td>
            </tr>
            <tr>
                <td>韓康錫</td>
                <td>签约</td>
                <td>韩泰轮胎</td>
                <td>接受报价</td>
                <td>2015-12-14</td>
            </tr>
            <tr>
                <td>韓康錫</td>
                <td>签约</td>
                <td>锦湖轮胎 .</td>
                <td>报价确认</td>
                <td>2015-12-11</td>
            </tr>
            <tr>
                <td>韓康錫</td>
                <td>签约</td>
                <td>锦湖轮胎</td>
                <td>接受报价</td>
                <td>2015-12-15</td>
            </tr>
            <tr>
                <td>韓康錫</td>
                <td>签约</td>
                <td>韩泰轮胎</td>
                <td>接受报价</td>
                <td>2015-12-14</td>
            </tr>
        </tbody>
    </table>
</div>

<script>
    $(document).ready(function() {
        $("#ptl-sample-3").kendoGrid();
    });
</script>
