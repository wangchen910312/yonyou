package chn.bhmc.dms.bat.par.ism.vo;

/**
 * 시스템 딜러 VO
 *
 * @ClassName   : BatSysOwnerDealerVO.java
 * @Description : BatSysOwnerDealerVO Class
 * @author In Bo Shim
 * @since 2017. 2. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 28.     In Bo Shim     최초 생성
 * </pre>
 */

public class BatSysOwnerDealerVO {

    /**
     * 딜러코드
     */
    private String dlrCd;
    
    /**
     * 딜러명
     */
    private String dlrNm;
    
    /**
     * 시스템 딜러 여부
     */
    private String sysOwnerYN;

    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }

    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    /**
     * @return the dlrNm
     */
    public String getDlrNm() {
        return dlrNm;
    }

    /**
     * @param dlrNm the dlrNm to set
     */
    public void setDlrNm(String dlrNm) {
        this.dlrNm = dlrNm;
    }

    /**
     * @return the sysOwnerYN
     */
    public String getSysOwnerYN() {
        return sysOwnerYN;
    }

    /**
     * @param sysOwnerYN the sysOwnerYN to set
     */
    public void setSysOwnerYN(String sysOwnerYN) {
        this.sysOwnerYN = sysOwnerYN;
    }    
}
