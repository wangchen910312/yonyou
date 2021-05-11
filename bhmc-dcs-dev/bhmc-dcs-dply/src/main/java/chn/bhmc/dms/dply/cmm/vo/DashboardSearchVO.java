package chn.bhmc.dms.dply.cmm.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DashboardSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Cheol Man Oh
 * @since 2016. 6. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 16.     Cheol Man Oh     최초 생성
 * </pre>
 */

public class DashboardSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6121289316011058408L;

    private String sTerm;

    private String sSpecCd;

    private String sDeployVerNo;

    private String sDeployGrpId;


    /**
     * @param sTerm the sTerm to set
     */
    public void setsTerm(String sTerm) {
        this.sTerm = sTerm;
    }

    /**
     * @return the sTerm
     */
    public String getsTerm() {
        return sTerm;
    }

    /**
     * @param sSpecCd the sSpecCd to set
     */
    public void setsSpecCd(String sSpecCd) {
        this.sSpecCd = sSpecCd;
    }

    /**
     * @return the sSpecCd
     */
    public String getsSpecCd() {
        return sSpecCd;
    }

    /**
     * @param sDeployVerNo the sDeployVerNo to set
     */
    public void setsDeployVerNo(String sDeployVerNo) {
        this.sDeployVerNo = sDeployVerNo;
    }

    /**
     * @return the sDeployVerNo
     */
    public String getsDeployVerNo() {
        return sDeployVerNo;
    }

    /**
     * @param sDeployGrpId the sDeployGrpId to set
     */
    public void setsDeployGrpId(String sDeployGrpId) {
        this.sDeployGrpId = sDeployGrpId;
    }

    /**
     * @return the sDeployGrpId
     */
    public String getsDeployGrpId() {
        return sDeployGrpId;
    }


}
