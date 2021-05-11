package chn.bhmc.dms.par.pmm.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * 공급처별 부품 마스터 관리 검색 VO
 *
 * @ClassName   : PartsVenderPriceMasterSearchVO.java
 * @Description : PartsVenderPriceMasterSearchVO Class
 * @author In Bo Shim
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.     In Bo Shim     최초 생성
 * </pre>
 */

public class PartsVenderMasterSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8630186559194133969L;

    /**
     * 딜러코드
     */
    @NotEmpty
    private String sDlrCd;

    /**
     * 거래처코드
     */
    private String sBpCd;

    /**
     * 품목번호
     */
    private String sItemCd;

    /**
     * 적용여부
     */
    private String sApplyYn;

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

    /**
     * @return the sBpCd
     */
    public String getsBpCd() {
        return sBpCd;
    }

    /**
     * @param sBpCd the sBpCd to set
     */
    public void setsBpCd(String sBpCd) {
        this.sBpCd = sBpCd;
    }

    /**
     * @return the sItemCd
     */
    public String getsItemCd() {
        return sItemCd;
    }

    /**
     * @param sItemCd the sItemCd to set
     */
    public void setsItemCd(String sItemCd) {
        this.sItemCd = sItemCd;
    }

    /**
     * @return the sApplyYn
     */
    public String getsApplyYn() {
        return sApplyYn;
    }

    /**
     * @param sApplyYn the sApplyYn to set
     */
    public void setsApplyYn(String sApplyYn) {
        this.sApplyYn = sApplyYn;
    }
}
