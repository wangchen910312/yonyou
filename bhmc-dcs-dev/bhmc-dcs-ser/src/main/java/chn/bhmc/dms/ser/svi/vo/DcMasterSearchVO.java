package chn.bhmc.dms.ser.svi.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * 할인관리 조회 SearchVO
 * </pre>
 *
 * @ClassName   : DcMasterSearchVO.java
 * @Description : 할인관리 조회 SearchVO.
 * @author Yin Xueyuan
 * @since 2016. 2. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 16.     Yin Xueyuan     최초 생성
 * </pre>
 */

public class DcMasterSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6947437255468486983L;

    /**
     * 조회조건 - 딜러코드
     */
    private String  sDlrCd;

    /**
     * 조회조건 - 할인코드
     */
    private String sDcCd;

    /**
     * 조회조건 - 할인명
     */
    private String sDcNm;

    /**
     * 조회조건 - 할인유형코드
     */
    private String sDcTp;

    public String getsDlrCd() {
        return sDlrCd;
    }

    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    public String getsDcCd() {
        return sDcCd;
    }

    public void setsDcCd(String sDcCd) {
        this.sDcCd = sDcCd;
    }

    public String getsDcNm() {
        return sDcNm;
    }

    public void setsDcNm(String sDcNm) {
        this.sDcNm = sDcNm;
    }

    public String getsDcTp() {
        return sDcTp;
    }

    public void setsDcTp(String sDcTp) {
        this.sDcTp = sDcTp;
    }




}
