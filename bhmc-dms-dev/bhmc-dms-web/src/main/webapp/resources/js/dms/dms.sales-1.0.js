(function(window, document, $) {
    'use strict';
    var salesJs = {
    };

    /**
     * event
     */
    salesJs.event = {
            /**
             * Date change event check
             * from   : date type
             * to     : date type
             * msg  : '<spring:message code="global.err.checkDateValue"/>'
             * 검색조건 : 일자의 시작일-종료일 날짜 비교
             */
            fnChkSearchDate : function(e){
                //if(dms.string.isEmpty($(this).val())){return;}
                if(dms.string.isEmpty(e.data.from.val())){return;}
                if(dms.string.isEmpty(e.data.to.val())){return;}

                var startDt = e.data.from.data("kendoExtMaskedDatePicker").value();
                var endDt = e.data.to.data("kendoExtMaskedDatePicker").value();
                if(startDt > endDt){
                    //dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
                    dms.notification.warning(e.data.msg);
                    $(this).data("kendoExtMaskedDatePicker").value(new Date(''));
                    $(this).focus();
                }
            }

    };

    /**
     * validate
     */
    salesJs.validate = {
        /**
         * 시작일과 종료일을 비교.
         * @param fromDate
         * @param toDate
         * @param msg
         * @returns {Boolean}
         */
        isDateValidPeriod : function(fromDate, toDate){
            if(fromDate == null || toDate == null){
                return true;
            }
            if(typeof fromDate != typeof toDate){
                return false;
            }
            if(fromDate > toDate){
                return false;
            }
            return true;
        },

        /**
         * form ~ to 날짜 공백 날짜 비교.
         * 두번째 날짜변수값만 입력한 경우 . true
         * @param fromDate
         * @param toDate
         * @returns
         */
        isFromDateValid : function(oneDate, towDate){
            return dms.string.isEmpty(oneDate)&&dms.string.isNotEmpty(towDate)?true:false;
        },

        /**
         * 숫자형 체크
         * 나누기 연산에 따른 오류결과값 0으로 치환.
         * @param number
         * @returns
         */
        naNcheck : function(data){
            return isNaN(data)?0:(Number(data)==Infinity||Number(data)==-Infinity)?0:Number(data);
        },

        /**
         * OBJ NULL 체크
         * @param Object배열
         * @returns
         * ex) isObjectNullCheck(NULL)      = true
         *     isObjectNullCheck([])        = true
         *     isObjectNullCheck({})        = true
         *     isObjectNullCheck({"a":"b"}) = false
         */
        isObjectNullCheck : function(){
            if(typeof(data) == "undefined"){
                return true;
            }
            if(data == null){
                return true;
            }

            var isResult = true;
            $.each(data, function(index, row) {
                isResult = false;
            });
            return isResult;
        },

        /**
         * DataSet에 값이 있는지 확인.
         */
        isArrayValues : function(Obj, name, value){
            var isReturn = false;
            $.each(Obj, function(idx, col){
                if(col[name] == value){
                    isReturn = true;
                }
            });
            return isReturn;
        }
    };

    salesJs.String = {
        /**
         * 문자를 받아서 3자리마다 콤마를 찍어 반환한다.
         */
        addcomma : function(arg){
            var v = arg.toString();

            var tmp=v.split('.');
            var str=new Array();
            var v=tmp[0].replace(/,/gi,''); //콤마를 빈문자열로 대체

            for(var i=0;i<=v.length;i++){ //문자열만큼 루프를 돈다.

                str[str.length]=v.charAt(v.length-i); //스트링에 거꾸로 담음

                if(i%3==0&&i!=0&&i!=v.length){ //첫부분이나, 끝부분에는 콤마가 안들어감
                    str[str.length]='.'; //세자리마다 점을 찍음 - 배열을 핸들링할때 쉼표가 들어가면 헛갈리므로
                }
            }

            str=str.reverse().join('').replace(/\./gi,','); //배열을 거꾸로된 스트링으로 바꾼후에, 점을 콤마로 치환

            if(str.substring(0,1) == "-" && str.substring(1,2) == ","){
                str = "-" + str.substring(2);
            }

            //return (tmp.length==2 && parseInt(tmp[1]) > 0)?str+'.'+tmp[1]:str;
            return str;
        },

        /**
         * 3자리 콤마를 지워서 반환한다.
         */
        deletecomma : function(str){
            if((str.toString()).indexOf(",") < 0) return str;
            if (str == '') str = "0";
            return str.replace(/(.:)*[,]/gi,"");
        }

    };

    salesJs.Grid = {
        mergeRows : function(gridId, colTitle) {

            $('#' + gridId + '>.k-grid-content>table').each(function (index, item) {

                var dimension_col = 1;
                // First, scan first row of headers for the "Dimensions" column.
                $('#' + gridId + '>.k-grid-header>.k-grid-header-wrap>table').find('th').each(function () {
                    if ($(this).text() == colTitle) {

                        // first_instance holds the first instance of identical td
                        var first_instance = null;

                        $(item).find('tr').each(function () {

                            // find the td of the correct column (determined by the colTitle)
                            var dimension_td = $(this).find('td:nth-child(' + dimension_col + ')');

                            if (first_instance == null) {
                                first_instance = dimension_td;
                            } else if (dimension_td.text() == first_instance.text()) {
                                // if current td is identical to the previous
                                // then remove the current td
                                dimension_td.remove();
                                // increment the rowspan attribute of the first instance
                                first_instance.attr('rowspan', typeof first_instance.attr('rowspan') == "undefined" ? 2 : first_instance.attr('rowspan') + 1);
                            } else {
                                // this cell is different from the last
                                first_instance = dimension_td;
                            }
                        });
                        return;
                    }
                    dimension_col++;
                });

            });
        }
    };

    salesJs.Date = {};

    window.salesJs = salesJs;
}(window, document, jQuery));
