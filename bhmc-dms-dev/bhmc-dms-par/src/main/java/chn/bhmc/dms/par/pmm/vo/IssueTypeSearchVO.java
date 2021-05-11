package chn.bhmc.dms.par.pmm.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * 출고유형 검색 VO
 *
 * @ClassName   : IssueTypeSearchVO.java
 * @Description : IssueTypeSearchVO Class
 * @author In Bo Shim
 * @since 2016. 1. 8.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 8.     In Bo Shim      최초 생성
 * </pre>
 */

public class IssueTypeSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4418124446378174010L;

    /**
     * 딜러코드
     */
    @NotEmpty
    private String sDlrCd;

    /**
     * 출고유형코드
     */
    private String sParGiTp;

    /**
     * 출고유형명
     */
    private String sGiTpNm;

    /**
     * 사용유무
     */
    private String sUseYn;

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
     * @return the sParGiTp
     */
    public String getsParGiTp() {
        return sParGiTp;
    }

    /**
     * @param sParGiTp the sParGiTp to set
     */
    public void setsParGiTp(String sParGiTp) {
        this.sParGiTp = sParGiTp;
    }

    /**
     * @return the sGiTpNm
     */
    public String getsGiTpNm() {
        return sGiTpNm;
    }

    /**
     * @param sGiTpNm the sGiTpNm to set
     */
    public void setsGiTpNm(String sGiTpNm) {
        this.sGiTpNm = sGiTpNm;
    }

    /**
     * @return the sUseYn
     */
    public String getsUseYn() {
        return sUseYn;
    }

    /**
     * @param sUseYn the sUseYn to set
     */
    public void setsUseYn(String sUseYn) {
        this.sUseYn = sUseYn;
    }

}
