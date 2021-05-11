package chn.bhmc.dms.mob.api.sales.vo;

import chn.bhmc.dms.core.datatype.SearchResult;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : StrOrdOcnBlockingViewVO
 * @Description : 전략오더OCN블러킹 view VO
 * @author Kim Jin Suk
 * @since 2016. 8. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016. 7. 26.    Kim Jin Suk           최초 생성
 * </pre>
 */

public class DayFundStatusViewVO extends SearchResult{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1880582507578512565L;

    private String errorMsg = "";

    /**
     * @return the errorMsg
     */
    public String getErrorMsg() {
        return errorMsg;
    }
    /**
     * @param errorMsg the errorMsg to set
     */
    public void setErrorMsg(String errorMsg) {
        this.errorMsg = errorMsg;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
