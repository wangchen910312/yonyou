package chn.bhmc.dms.sal.rpt.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SalesOrderStatsSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Choi Kyung Yong
 * @since 2017. 2. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 20.     Choi Kyung Yong     최초 생성
 * </pre>
 */

public class SalesOrderStatsSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1990937284367497990L;

    private String sYearMonth;

    /**
     * @param sYearMonth the sYearMonth to set
     */
    public void setsYearMonth(String sYearMonth) {
        this.sYearMonth = sYearMonth;
    }

    /**
     * @return the sYearMonth
     */
    public String getsYearMonth() {
        return sYearMonth;
    }

}
