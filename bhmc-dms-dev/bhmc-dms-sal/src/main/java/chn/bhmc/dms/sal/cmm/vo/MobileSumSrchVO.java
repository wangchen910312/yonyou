package chn.bhmc.dms.sal.cmm.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobileSumSrchVO.java
 * @Description : 모바일 총경리 화면 조회용
 * @author Lee Seungmin
 * @since 2016. 10. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 10. 23.     Lee Seungmin     최초 생성
 * </pre>
 */

public class MobileSumSrchVO extends SearchVO {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7183909245080912175L;

    private String sDlrCd;

    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }

    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }
}
