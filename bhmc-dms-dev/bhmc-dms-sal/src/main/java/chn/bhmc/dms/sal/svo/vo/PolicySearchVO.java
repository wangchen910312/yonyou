package chn.bhmc.dms.sal.svo.vo;


import chn.bhmc.dms.core.datatype.SearchVO;



/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PolicySearchVO
 * @Description : 특수차 정책 조회 VO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016. 9. 30.    Kim Jin Suk        최초 생성
 * </pre>
 */

public class PolicySearchVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2410041561206555157L;

    private String sPolicyTp;

    /**
     * @return the sPolicyTp
     */
    public String getsPolicyTp() {
        return sPolicyTp;
    }

    /**
     * @param sPolicyTp the sPolicyTp to set
     */
    public void setsPolicyTp(String sPolicyTp) {
        this.sPolicyTp = sPolicyTp;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}
