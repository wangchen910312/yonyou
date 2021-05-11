package chn.bhmc.dms.par.pmm.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DealerInfoSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ki hyun Kwon
 * @since 2017. 7. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 7. 28.     Lee Hyeong Gyun     최초 생성
 * </pre>
 */

public class DealerInfoSearchVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3627317232583553186L;

    private String dmrDlrCd;

    /**
     * @return the dmrDlrCd
     */
    public String getDmrDlrCd() {
        return dmrDlrCd;
    }

    /**
     * @param dmrDlrCd the dmrDlrCd to set
     */
    public void setDmrDlrCd(String dmrDlrCd) {
        this.dmrDlrCd = dmrDlrCd;
    }





}
