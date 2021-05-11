package chn.bhmc.dms.ser.svi.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * techMan 기능관리 조회 SearchVO
 * </pre>
 *
 * @ClassName   : TechManFnMasterSearchVO.java
 * @Description : techMan 기능관리 조회 SearchVO.
 * @author Yin Xueyuan
 * @since 2016. 2. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 11.     Yin Xueyuan     최초 생성
 * </pre>
 */

public class TechManFnMasterSearchVO extends SearchVO {

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
     * 조회조건 - 테크멘 id
     */
    private String sTecId;

    /**
     * 조회조건 - 테크멘 명
     */
    private String sTecNm;

    /**
     * 조회조건 - 업무구분
     */
    private String sWrkTp;

    private String sSysNo;

    private String sDeptNm;

    public String getsDlrCd() {
        return sDlrCd;
    }

    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    public String getsTecId() {
        return sTecId;
    }

    public void setsTecId(String sTecId) {
        this.sTecId = sTecId;
    }

    public String getsTecNm() {
        return sTecNm;
    }

    public void setsTecNm(String sTecNm) {
        this.sTecNm = sTecNm;
    }

    /**
     * @return the sWrkTp
     */
    public String getsWrkTp() {
        return sWrkTp;
    }

    /**
     * @param sWrkTp the sWrkTp to set
     */
    public void setsWrkTp(String sWrkTp) {
        this.sWrkTp = sWrkTp;
    }

    /**
     * @return the sSysNo
     */
    public String getsSysNo() {
        return sSysNo;
    }

    /**
     * @param sSysNo the sSysNo to set
     */
    public void setsSysNo(String sSysNo) {
        this.sSysNo = sSysNo;
    }

    /**
     * @return the sDeptNm
     */
    public String getsDeptNm() {
        return sDeptNm;
    }

    /**
     * @param sDeptNm the sDeptNm to set
     */
    public void setsDeptNm(String sDeptNm) {
        this.sDeptNm = sDeptNm;
    }

}
