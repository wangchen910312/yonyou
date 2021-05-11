package chn.bhmc.dms.ser.svi.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * 임률관리 조회 SearchVO
 * </pre>
 *
 * @ClassName   : RateMasterSearchVO.java
 * @Description : 임률관리 조회 SearchVO.
 * @author Yin Xueyuan
 * @since 2016. 1. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 25.     Yin Xueyuan     최초 생성
 * </pre>
 */

public class SubBpMasterSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6947437255468486983L;

    /**
     * 조회조건 - 딜러코드
     */
    private String sDlrCd;

    /**
     * 조회조건 - 외주거래처코드
     */
    private String sSubBpCd;

    /**
     * 조회조건 - 외주거래처명
     */
    private String sSubBpNm;

    /**
     * 조회조건 - 사용여부
     */
    private String sUseYn;

    public String getsDlrCd() {
        return sDlrCd;
    }

    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    public String getsSubBpCd() {
        return sSubBpCd;
    }

    public void setsSubBpCd(String sSubBpCd) {
        this.sSubBpCd = sSubBpCd;
    }

    public String getsSubBpNm() {
        return sSubBpNm;
    }

    public void setsSubBpNm(String sSubBpNm) {
        this.sSubBpNm = sSubBpNm;
    }

    public String getsUseYn() {
        return sUseYn;
    }

    public void setsUseYn(String sUseYn) {
        this.sUseYn = sUseYn;
    }




}
