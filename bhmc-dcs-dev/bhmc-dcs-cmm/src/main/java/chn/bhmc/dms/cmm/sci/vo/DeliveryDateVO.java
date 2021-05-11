package chn.bhmc.dms.cmm.sci.vo;

import java.util.Date;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DeliveryDateVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 4. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 25.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

public class DeliveryDateVO extends BaseVO {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1217230140453286226L;

    private Date    dt;
    private String  stringDt;

    /**
     * @return the dt
     */
    public Date getDt() {
        return dt;
    }
    /**
     * @param dt the dt to set
     */
    public void setDt(Date dt) {
        this.dt = dt;
    }
    /**
     * @return the stringDt
     */
    public String getStringDt() {
        return stringDt;
    }
    /**
     * @param stringDt the stringDt to set
     */
    public void setStringDt(String stringDt) {
        this.stringDt = stringDt;
    }
}