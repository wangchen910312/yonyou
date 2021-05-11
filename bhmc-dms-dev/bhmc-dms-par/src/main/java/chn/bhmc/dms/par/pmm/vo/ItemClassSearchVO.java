package chn.bhmc.dms.par.pmm.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * 부품등급 검색 VO
 *
 * @ClassName   : ItemClassSearchVO.java
 * @Description : ItemClassSearchVO Class
 * @author Bo In Shim
 * @since 2016. 12. 01.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 12. 01.     Bo In Shim     최초 생성
 * </pre>
 */

public class ItemClassSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8852972153571555660L;

    /**
     * sDlrCd
     */
    @NotEmpty
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
