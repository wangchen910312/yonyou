package chn.bhmc.dms.dply.cmm.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DplyCmmSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 4. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 6.     Kang Seok Han     최초 생성
 * </pre>
 */

public class DplyCmmSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8101335731244148238L;

    private String sPrtyNm;

    /**
     * @param sPrtyNm the sPrtyNm to set
     */
    public void setsPrtyNm(String sPrtyNm) {
        this.sPrtyNm = sPrtyNm;
    }

    /**
     * @return the sPrtyNm
     */
    public String getsPrtyNm() {
        return sPrtyNm;
    }

}
