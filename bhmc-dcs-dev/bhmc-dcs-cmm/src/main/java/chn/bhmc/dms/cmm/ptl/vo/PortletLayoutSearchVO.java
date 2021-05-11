package chn.bhmc.dms.cmm.ptl.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PortletLayoutSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 4. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 9.     Kang Seok Han     최초 생성
 * </pre>
 */

public class PortletLayoutSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2284366726660407715L;

    /**
     * 포틀릿 레이아웃 ID
     */
    private String sPortletLayoutId;

    /**
     * 포틀릿 레이아웃명
     */
    private String sPortletLayoutNm;

    /**
     * 디폴트 레이아웃 여부
     */
    private String sDefaultYn;

    /**
     * @return the sPortletLayoutId
     */
    public String getsPortletLayoutId() {
        return sPortletLayoutId;
    }

    /**
     * @param sPortletLayoutId the sPortletLayoutId to set
     */
    public void setsPortletLayoutId(String sPortletLayoutId) {
        this.sPortletLayoutId = sPortletLayoutId;
    }

    /**
     * @return the sPortletLayoutNm
     */
    public String getsPortletLayoutNm() {
        return sPortletLayoutNm;
    }

    /**
     * @param sPortletLayoutNm the sPortletLayoutNm to set
     */
    public void setsPortletLayoutNm(String sPortletLayoutNm) {
        this.sPortletLayoutNm = sPortletLayoutNm;
    }

    /**
     * @return the sDefaultYn
     */
    public String getsDefaultYn() {
        return sDefaultYn;
    }

    /**
     * @param sDefaultYn the sDefaultYn to set
     */
    public void setsDefaultYn(String sDefaultYn) {
        this.sDefaultYn = sDefaultYn;
    }

}
