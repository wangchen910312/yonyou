package chn.bhmc.dms.cmm.ptl.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PortletTaskMappingVO.java
 * @Description : 포틀릿-직무 매핑 VO
 * @author Choi Kyung Yong
 * @since 2017. 2. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 23.   Choi Kyung Yong  최초 생성
 *  2017. 3. 08.   Han Kang Seok    필드 주석 추가
 * </pre>
 */

public class PortletTaskMappingVO  extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8626569159741014404L;

    /**
     * 포틀릿 ID
     */
    private String portletId;

    /**
     * 포틀릿명
     */
    private String portletNm;

    /**
     * 직무코드
     */
    private String tskCd;

    /**
     * 직무명
     */
    private String tskNm;

    public PortletTaskMappingVO(){}

    public PortletTaskMappingVO(String tskCd, String portletId, String usrId){
        super();

        this.tskCd = tskCd;
        this.portletId = portletId;
        super.setRegUsrId(usrId);
        super.setUpdtUsrId(usrId);
    }

    /**
     * @return the portletId
     */
    public String getPortletId() {
        return portletId;
    }

    /**
     * @param portletId the portletId to set
     */
    public void setPortletId(String portletId) {
        this.portletId = portletId;
    }

    /**
     * @return the tskCd
     */
    public String getTskCd() {
        return tskCd;
    }

    /**
     * @param tskCd the tskCd to set
     */
    public void setTskCd(String tskCd) {
        this.tskCd = tskCd;
    }

    /**
     * @param tskNm the tskNm to set
     */
    public void setTskNm(String tskNm) {
        this.tskNm = tskNm;
    }

    /**
     * @return the tskNm
     */
    public String getTskNm() {
        return tskNm;
    }

    /**
     * @param portletNm the portletNm to set
     */
    public void setPortletNm(String portletNm) {
        this.portletNm = portletNm;
    }

    /**
     * @return the portletNm
     */
    public String getPortletNm() {
        return portletNm;
    }
}
