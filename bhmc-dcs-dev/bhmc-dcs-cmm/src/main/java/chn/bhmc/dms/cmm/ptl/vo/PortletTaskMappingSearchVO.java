package chn.bhmc.dms.cmm.ptl.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PortletTaskMappingSearchVO.java
 * @Description : 포틀릿-직무 매핑 SearchVO
 * @author Kang Seok Han
 * @since 2017. 3. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 9.    Kang Seok Han    최초 생성
 * </pre>
 */

public class PortletTaskMappingSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6876041175776410923L;

    /**
     * 포틀릿 ID
     */
    private String sPortletId;

    /**
     * 포틀릿명
     */
    private String sPortletNm;

    /**
     * 출력여부
     */
    private String sDisplayYn;

    /**
     * 직무코드
     */
    private String sTskCd;

    /**
     * @return the sPortletId
     */
    public String getsPortletId() {
        return sPortletId;
    }

    /**
     * @param sPortletId the sPortletId to set
     */
    public void setsPortletId(String sPortletId) {
        this.sPortletId = sPortletId;
    }

    /**
     * @return the sPortletNm
     */
    public String getsPortletNm() {
        return sPortletNm;
    }

    /**
     * @param sPortletNm the sPortletNm to set
     */
    public void setsPortletNm(String sPortletNm) {
        this.sPortletNm = sPortletNm;
    }

    /**
     * @return the sDisplayYn
     */
    public String getsDisplayYn() {
        return sDisplayYn;
    }

    /**
     * @param sDisplayYn the sDisplayYn to set
     */
    public void setsDisplayYn(String sDisplayYn) {
        this.sDisplayYn = sDisplayYn;
    }

    /**
     * @return the sTskCd
     */
    public String getsTskCd() {
        return sTskCd;
    }

    /**
     * @param sTskCd the sTskCd to set
     */
    public void setsTskCd(String sTskCd) {
        this.sTskCd = sTskCd;
    }
}
