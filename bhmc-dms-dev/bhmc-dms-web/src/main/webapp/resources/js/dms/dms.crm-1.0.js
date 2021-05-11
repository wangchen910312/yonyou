(function(window, document, $) {
	'use strict';
	var crmJs = {
	};

	crmJs = {
        /**
         * crm js
         */
            isDateValidPeriod:function(fromDate, toDate, msg){
                /* startDt   : date type
                   endDt     : date type
                   msg  : '<spring:message code="global.err.checkDateValue"/>'
                Ex:
                if(crmJs.isDateValidPeriod($("#startDt").data("kendoExtMaskedDatePicker").value()
                            ,$("#endDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                        $("#grid").data("kendoExtGrid").dataSource.page(1);
                    }else{
                        $("#endDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                        $("#endDt").focus();
                        return false;
                    }

               */
                if(fromDate == null || toDate == null){
                    return true;
                }
                if(typeof fromDate != typeof toDate){
                    return false;
                }
                if(fromDate > toDate){
                    dms.notification.warning(msg);
                    return false;
                }
                return true;
            }
        };
	window.crmJs = crmJs;
}(window, document, jQuery));
