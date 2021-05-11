package chn.bhmc.dms.ser.wac.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoBaseSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 5. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 12.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public class SanbaoBaseSearchVO extends SearchVO{
    
    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = -6417237151722629677L;

    /**
     * 적용구분코드 
     **/
    private String sApplyDstinCd;
    
    /**
     * 품목항목코드 
     **/
    private String sItemAtcCd;

    /**
     * 품목그룹코드 
     **/
    private String sItemGrpCd;

    /**
     * @return the sApplyDstinCd
     */
    public String getsApplyDstinCd() {
        return sApplyDstinCd;
    }

    /**
     * @param sApplyDstinCd the sApplyDstinCd to set
     */
    public void setsApplyDstinCd(String sApplyDstinCd) {
        this.sApplyDstinCd = sApplyDstinCd;
    }

    /**
     * @return the sItemAtcCd
     */
    public String getsItemAtcCd() {
        return sItemAtcCd;
    }

    /**
     * @param sItemAtcCd the sItemAtcCd to set
     */
    public void setsItemAtcCd(String sItemAtcCd) {
        this.sItemAtcCd = sItemAtcCd;
    }

    /**
     * @return the sItemGrpCd
     */
    public String getsItemGrpCd() {
        return sItemGrpCd;
    }

    /**
     * @param sItemGrpCd the sItemGrpCd to set
     */
    public void setsItemGrpCd(String sItemGrpCd) {
        this.sItemGrpCd = sItemGrpCd;
    }
    
    
    
    
}
