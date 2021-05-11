package chn.bhmc.dms.security.vo;

import java.io.Serializable;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MenuAccessSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Choi Kyung Yong
 * @since 2016. 12. 04.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since            author               description
 *  ===========    ================    =======================
 *  2016. 12. 04.   Choi Kyung Yong            최초 생성
 * </pre>
 */

public class MenuAccessSaveVO implements Serializable {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7147521651801753633L;

    /**
     * 아이디
     */
    private String usrId;

    /**
     * 이름
     */
    private String dlrCd;

    /**
     * 비밀번호
     */
    private String viewId;

    /**
     * @return the usrId
     */
    public String getUsrId() {
        return usrId;
    }

    /**
     * @param usrId the usrId to set
     */
    public void setUsrId(String usrId) {
        this.usrId = usrId;
    }

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
     * @return the viewId
     */
    public String getViewId() {
        return viewId;
    }

    /**
     * @param viewId the viewId to set
     */
    public void setViewId(String viewId) {
        this.viewId = viewId;
    }


}
