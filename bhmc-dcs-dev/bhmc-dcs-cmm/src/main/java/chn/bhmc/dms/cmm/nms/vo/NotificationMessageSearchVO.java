package chn.bhmc.dms.cmm.nms.vo;

import chn.bhmc.dms.core.datatype.BaseSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotificationMessageSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 5. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 11.     Kang Seok Han     최초 생성
 * </pre>
 */

public class NotificationMessageSearchVO extends BaseSearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2743126613549442948L;

    private String sReceiveUsrId;
    private String sMesgTp;
    private String sSendYn;
    private String sReceiveYn;


    /**
     * @return the sReceiveUsrId
     */
    public String getsReceiveUsrId() {
        return sReceiveUsrId;
    }
    /**
     * @param sReceiveUsrId the sReceiveUsrId to set
     */
    public void setsReceiveUsrId(String sReceiveUsrId) {
        this.sReceiveUsrId = sReceiveUsrId;
    }
    /**
     * @return the sMesgTp
     */
    public String getsMesgTp() {
        return sMesgTp;
    }
    /**
     * @param sMesgTp the sMesgTp to set
     */
    public void setsMesgTp(String sMesgTp) {
        this.sMesgTp = sMesgTp;
    }
    /**
     * @return the sSendYn
     */
    public String getsSendYn() {
        return sSendYn;
    }
    /**
     * @param sSendYn the sSendYn to set
     */
    public void setsSendYn(String sSendYn) {
        this.sSendYn = sSendYn;
    }
    /**
     * @return the sReceiveYn
     */
    public String getsReceiveYn() {
        return sReceiveYn;
    }
    /**
     * @param sReceiveYn the sReceiveYn to set
     */
    public void setsReceiveYn(String sReceiveYn) {
        this.sReceiveYn = sReceiveYn;
    }

}
