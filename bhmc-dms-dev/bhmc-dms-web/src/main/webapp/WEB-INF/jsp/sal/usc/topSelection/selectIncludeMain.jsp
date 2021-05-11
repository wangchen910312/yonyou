<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- VehicleSpec-옵션 -->
<!-- 그리드 시작 -->
<div class="table_grid mt10">
    <div id="grid" class="resizable_grid"></div>
</div>
<!-- 그리드 종료 -->

<div id="imageViewer" style="position:absolute;display:none;padding:5px;border:1px solid #BFCAD6;background-color:#FFFFFF;">
	<div id="imageNm" style="background-color:#E4EDF7;margin-bottom:5px;text-align:center;padding-top:5px;"></div>
	<div id="imageContainer" style="width:400px;height:400px;background-size:contain;background-repeat: no-repeat;background-position: center;"></div>
</div>

<script type="text/javascript">
var imageViewerTimer;

$(document).ready(function() {
    //그리드 설정
    $("#grid").kendoExtGrid({
    	gridId:"G-SAL-0413-130801"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/veh/vehicleSpec/selectVehicleImagesWithDocument.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["carId"] = carId;

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                        rnum:{type:"number"}
                        ,licenseNo:{type:"string"}
                        ,brand:{type:"string"}
                        ,imgNm:{type:"string"}
                        ,imgFileNm:{type:"string"}
                        ,imgStatus:{type:"string"}
                    }
                }
            }
        }
        ,pageable:false
        ,editable:false
        ,autoBind:true
        ,height:219
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,filterable:false
        ,appendEmptyColumn:true
        ,dataBound:function(e){
        	$(".vehicle-img", e.sender.tbody)
        	.mouseover(function(e){
        		var that = this;
        		$("#imageContainer").css({
        			"background-image":"url('http://zhihuan.xd2sc.com/Data/CarImageFile/"+$(this).data("imgFileNm")+"')"
        		});

        		imageViewerTimer = setTimeout(function(){
        			var windowHeight = $(window).innerHeight();
    				var top = (windowHeight-e.clientY >= 450)? e.clientY:e.clientY-(450-(windowHeight-e.clientY));
    				var left = e.clientX;

    				$("#imageNm").text($(that).data("imgNm"));

        			$("#imageViewer")
            		.css({
            			"top":top
            			,"left":left
            		}).show();

        			clearTimeout(imageViewerTimer);
        		}, 500);
        	})
        	.mouseout(function(e){
        		clearTimeout(imageViewerTimer);
        		$("#imageViewer").hide();
        	})
        }
        ,columns:[
            {field:"licenseNo", title:"<spring:message code='global.lbl.carNo' />", width:100, attributes:{"class":"ac"}} 					//차량번호
            ,{field:"brand", title:"<spring:message code='global.lbl.carNm' />", width:200} 												//차량명
            ,{field:"imgNm", title:"<spring:message code='sal.lbl.documentName' />", width:300												//자료명칭
            	,template:function(dataItem){
            		if(dms.string.isNotEmpty(dataItem.imgFileNm)){
            			return "<span data-img-nm='"+dataItem.imgNm+"' data-img-file-nm='"+dataItem.imgFileNm+"' style='text-decoration:underline;cursor:pointer;' class='vehicle-img'>"+dataItem.imgNm+"</a>";
            		}
            		return dataItem.imgNm;
            	}
            }
            ,{field:"imgFileNm", title:"<spring:message code='sal.lbl.uploadStatus' />" ,width:80, attributes:{"class":"ac"}, _hidden:true	//업로드상태
				,template:function(dataItem){
					if(dms.string.isEmpty(dataItem.imgFileNm)){
						return "<spring:message code='sal.lbl.img.notExist' />";
					}else{
						return "<spring:message code='sal.lbl.img.exist' />";
					}
				}
            }
        ]
    });
});
</script>