package chn.bhmc.dms.dply.cmm.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DeployGroupForDashboardVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Cheol Man Oh
 * @since 2016. 6. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 17.     Cheol Man Oh     최초 생성
 * </pre>
 */

public class DeployGroupForDashboardVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1847513452730716683L;

    private String specCd            ;

    private String deployVerNo      ;

    private String deployGrpId        ;

    private String deployStatCd       ;

    private int    deployTargDlrCnt   ;

    private int    deployEndDlrCnt    ;

    /**

    /**
     * @param deployGrpId the deployGrpId to set
     */
    public void setDeployGrpId(String deployGrpId) {
        this.deployGrpId = deployGrpId;
    }

    /**
     * @return the deployGrpId
     */
    public String getDeployGrpId() {
        return deployGrpId;
    }

    /**
     * @param deployStatCd the deployStatCd to set
     */
    public void setDeployStatCd(String deployStatCd) {
        this.deployStatCd = deployStatCd;
    }

    /**
     * @return the deployStatCd
     */
    public String getDeployStatCd() {
        return deployStatCd;
    }

    /**
     * @param deployEndDlrCnt the deployEndDlrCnt to set
     */
    public void setDeployEndDlrCnt(int deployEndDlrCnt) {
        this.deployEndDlrCnt = deployEndDlrCnt;
    }

    /**
     * @return the deployEndDlrCnt
     */
    public int getDeployEndDlrCnt() {
        return deployEndDlrCnt;
    }

    /**
     * @param deployTargDlrCnt the deployTargDlrCnt to set
     */
    public void setDeployTargDlrCnt(int deployTargDlrCnt) {
        this.deployTargDlrCnt = deployTargDlrCnt;
    }

    /**
     * @return the deployTargDlrCnt
     */
    public int getDeployTargDlrCnt() {
        return deployTargDlrCnt;
    }

    /**
     * @param specCd the specCd to set
     */
    public void setSpecCd(String specCd) {
        this.specCd = specCd;
    }

    /**
     * @return the specCd
     */
    public String getSpecCd() {
        return specCd;
    }

    /**
     * @param deployVerNo the deployVerNo to set
     */
    public void setDeployVerNo(String deployVerNo) {
        this.deployVerNo = deployVerNo;
    }

    /**
     * @return the deployVerNo
     */
    public String getDeployVerNo() {
        return deployVerNo;
    }


}
