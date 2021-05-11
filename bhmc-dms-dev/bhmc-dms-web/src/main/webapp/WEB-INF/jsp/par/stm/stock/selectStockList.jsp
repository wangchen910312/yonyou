<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><!-- 库存列表查询 --></h1>
            <div class="btn_right">
                <button class="btn_m btn_search">查询</button><!-- 조회 -->
                <button class="btn_m btn_save">保存</button><!-- 저장 -->
                <button class="btn_m">下传文件</button>
            </div>
        </div>
        <div class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required">仓库</span></th>
                        <td class="required_area">
                            <input type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><span class="bu_required">产品分类</span></th>
                        <td class="required_area">
                            <input type="text" class="form_comboBox">
                        </td>
                        <th scope="row">产品组</th>
                        <td>
                            <input type="text" class="form_comboBox">
                        </td>
                        <th scope="row">配件停产与否</th>
                        <td>
                            <input type="text" class="form_comboBox">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">配件编号</th>
                        <td>
                            <div class="form_search">
                                <input type="text" value="" class="form_input">
                                <a href="javascript:;">검색</a>
                            </div>
                        </td>
                        <th scope="row">配件名称</th>
                        <td>
                            <input type="text" value="" class="form_input">
                        </td>
                        <th scope="row">车种</th>
                        <td>
                            <input type="text" class="form_comboBox">
                        </td>
                        <th scope="row">配件等级</th>
                        <td>
                            <input type="text" class="form_comboBox">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">呆滞品与否</th>
                        <td>
                            <input type="text" class="form_comboBox">
                        </td>
                        <th scope="row">最近入库日</th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input value="" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input value="" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                        <th scope="row">最近出库日</th>
                        <td class="bor_none">
                            <div class="form_float">
                                <div class="date_left">
                                    <input value="" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input value="" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                        <th scope="row"></th>
                        <td>
                            <label class="label_check"><input type="checkbox" class="form_check">&nbsp;可用数量为0的配件除外
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="table_grid mt10">
            <div class="grid" id="grid"></div>
        </div>

        <div class="table_form mt10">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row">货位</th><!--  -->
                        <td>
                            <input type="text" value="" class="form_input">
                        </td>
                        <th scope="row">到货周期</th><!--  -->
                        <td>
                            <input type="text" value="" readonly class="form_input form_readonly">
                        </td>
                        <th scope="row">计划入库仓库</th><!--  -->
                        <td>
                            <input type="text" value="" class="form_comboBox">
                        </td>
                        <th scope="row">最大安全库存</th><!--  -->
                        <td>
                            <input type="text" value="" class="form_input">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">最小订单数量</th><!--  -->
                        <td>
                            <input type="text" value="" class="form_input">
                        </td>
                        <th scope="row">最小安全库存</th><!--  -->
                        <td>
                            <input type="text" value="" class="form_input">
                        </td>
                        <th scope="row">合理库存</th><!--  -->
                        <td>
                            <input type="text" value="" readonly class="form_input form_readonly">
                        </td>
                        <th scope="row">合理库存系数</th><!--  -->
                        <td>
                            <input type="text" value="" class="form_input">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">配件等级</th><!--  -->
                        <td>
                            <input type="text" value="" readonly class="form_input form_readonly">
                        </td>
                        <th scope="row">3个月平均需求量</th><!--  -->
                        <td>
                            <input type="text" value="" readonly class="form_input form_readonly">
                        </td>
                        <th scope="row">6个月平均需求量</th><!--  -->
                        <td>
                            <input type="text" value="" readonly class="form_input form_readonly">
                        </td>
                        <th scope="row">12个月平均需求量</th><!--  -->
                        <td>
                            <input type="text" value="" readonly class="form_input form_readonly">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">合理库存计算</th><!--  -->
                        <td class="readonly_area">
                            <input type="text" value="" class="form_comboBox">
                        </td>
                        <th scope="row">呆滞品</th><!--  -->
                        <td class="readonly_area">
                            <input type="text" value="" class="form_comboBox">
                        </td>
                        <th scope="row">最新入库日</th><!--  -->
                        <td class="readonly_area">
                            <input type="text" value="" readonly class="form_datepicker">
                        </td>
                        <th scope="row">采购需求量计算</th><!--  -->
                        <td class="readonly_area">
                            <input type="text" value="" class="form_comboBox">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">配件停用</th>
                        <td>
                            <input type="text" value="" class="form_comboBox">
                        </td>
                        <th scope="row">最新出库日</th><!--  -->
                        <td class="readonly_area">
                            <input type="text" value="" readonly class="form_datepicker">
                        </td>
                        <th/>
                        <td/>
                        <th/>
                        <td/>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
<script>
    $(document).ready(function() {


        $(".form_comboBox").kendoExtDropDownList();

        //btn
        $(".btn_m").kendoButton({
            click:function(e){
                // ready message
                dms.notification.success("<spring:message code='global.info.ready'/>");

            }
        });
        //btn
        $(".btn_s").kendoButton({
            click:function(e){
                // ready message
                dms.notification.success("<spring:message code='global.info.ready'/>");
            }
        });

        $(".form_datepicker").kendoDatePicker({
            format:"yyyy-MM-dd"
        });

      //년월
        $("#sYyMm").kendoDatePicker({
            //define the start view
            start:"year"
            //defines when the calendar shoule retrun date
            ,depth:"year"
            //display month and year in the input
            ,format:"yyyyMM"
        });

      //실사문서 그리드 세팅
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0808-161801"
           ,dataSource:[]
           ,height:150
           ,selectable:"row"
           ,scrollable :true
           ,autoBind   :false
           ,filterable:false
           ,appendEmptyColumn:true           //빈컬럼 적용. default:false
           ,pageable   :false
           ,editable   :false
           ,columns:[
                   {    title     :"序"
                       ,attributes:{"class":"ac"}
                       ,sortable  :false
                       ,width     :30 }
                 , {    title     :"仓库"
                       ,attributes:{"class":"ac"}
                       ,sortable  :false
                       ,width     :60 }
                 , {    title     :"配件编号"
                       ,attributes:{"class":"ac"}
                       ,sortable  :false
                       ,width     :80 }
                 , {    title     :"配件名称"
                       ,attributes:{"class":"ac"}
                       ,sortable  :false
                       ,width     :80 }
                 , {    title     :"单位"
                       ,attributes:{"class":"ac"}
                       ,sortable  :false
                       ,width     :60 }
                 , {    title     :"控制与否"
                       ,attributes:{"class":"ac"}
                       ,sortable  :false
                       ,width     :80 }
                 , {    title     :"可用库存"
                       ,attributes:{"class":"ac"}
                       ,sortable  :false
                       ,width     :80 }
                 , {    title     :"预约库存"
                       ,attributes:{"class":"ac"}
                       ,sortable  :false
                       ,width     :80 }
                 , {    title     :"保留库存"
                       ,attributes:{"class":"ac"}
                       ,sortable  :false
                       ,width     :80 }
                 , {    title     :"预计入库"
                       ,attributes:{"class":"ac"}
                       ,sortable  :false
                       ,width     :80 }
                 , {    title     :"预计出库"
                       ,attributes:{"class":"ac"}
                       ,sortable  :false
                       ,width     :80 }
                 , {    title     :"借出数量"
                       ,attributes:{"class":"ac"}
                       ,sortable  :false
                       ,width     :80 }
                 , {    title     :"借入数量"
                       ,attributes:{"class":"ac"}
                       ,sortable  :false
                       ,width     :80 }
                 , {    title     :"货位"
                       ,attributes:{"class":"ac"}
                       ,sortable  :false
                       ,width     :40 }
                 , {    title     :"供应商"
                       ,attributes:{"class":"ac"}
                       ,sortable  :false
                       ,width     :60 }
                 , {    title     :"配件分类"
                       ,attributes:{"class":"ac"}
                       ,sortable  :false
                       ,width     :80 }
                 , {    title     :"配件等级"
                       ,attributes:{"class":"ac"}
                       ,sortable  :false
                       ,width     :80 }
                 , {    title     :"车种"
                       ,attributes:{"class":"ac"}
                       ,sortable  :false
                       ,width     :60 }
                 , {    title     :"库存单价"
                       ,attributes:{"class":"ac"}
                       ,sortable  :false
                       ,width     :80 }
                 , {    title     :"采购价"
                       ,attributes:{"class":"ac"}
                       ,sortable  :false
                       ,width     :60 }
                  ,{
                        title     :"零售价"
                       ,headerAttributes:{"class":"hasBob"}
                       ,columns   :[
                            {  title     :"含税"
                              ,attributes:{"class":"ar"}
                              ,width     :60}
                           ,{  title     :"不含税"
                              ,attributes:{"class":"ar"}
                              ,width     :60}
                       ]
                   }
                  ,{
                        title     :"批发价"
                       ,headerAttributes:{"class":"hasBob"}
                       ,columns   :[
                            {  title     :"含税"
                              ,attributes:{"class":"ar"}
                              ,width     :60}
                           ,{  title     :"不含税"
                              ,attributes:{"class":"ar"}
                              ,width     :60}
                       ]
                   }
                  ,{
                        title     :"保险价"
                       ,headerAttributes:{"class":"hasBob"}
                       ,columns   :[
                            {  title     :"含税"
                              ,attributes:{"class":"ar"}
                              ,width     :60}
                           ,{  title     :"不含税"
                              ,attributes:{"class":"ar"}
                              ,width     :60}
                       ]
                   }
                  ,{
                        title     :"保证价"
                       ,headerAttributes:{"class":"hasBob"}
                       ,columns   :[
                            {  title     :"含税"
                              ,attributes:{"class":"ar"}
                              ,width     :60}
                           ,{  title     :"不含税"
                              ,attributes:{"class":"ar"}
                              ,width     :60}
                       ]
                   }
              ]
        });
    });
</script>