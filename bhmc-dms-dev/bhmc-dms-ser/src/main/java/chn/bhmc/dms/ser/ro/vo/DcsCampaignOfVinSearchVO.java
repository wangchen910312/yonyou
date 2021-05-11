package chn.bhmc.dms.ser.ro.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName: PreCheckVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 3. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * since author description
 * ===================================================
 * 2016. 3. 28. Kwon Ki Hyun 최초 생성
 * </pre>
 */

public class DcsCampaignOfVinSearchVO extends SearchVO{



  /**
   * Statements
   * (long)serialVersionUID
   */
    private static final long serialVersionUID = -2375143456488245249L;

    /**
     * 차대번호
     **/
    private String sVinNo;

    /**
     * crNo
     **/
    private String sCrNo;

    /**
     * LbrCd
     **/
    private String sLbrCd;

    /**
     * @return the sLbrCd
     */
    public String getsLbrCd() {
        return sLbrCd;
    }

    /**
     * @param sLbrCd the sLbrCd to set
     */
    public void setsLbrCd(String sLbrCd) {
        this.sLbrCd = sLbrCd;
    }

    /**
     * @return the sCrNo
     */
    public String getsCrNo() {
        return sCrNo;
    }

    /**
     * @param sCrNo the sCrNo to set
     */
    public void setsCrNo(String sCrNo) {
        this.sCrNo = sCrNo;
    }

    /**
     * @return the sVinNo
     */
    public String getsVinNo() {
        return sVinNo;
    }

    /**
     * @param sVinNo the sVinNo to set
     */
    public void setsVinNo(String sVinNo) {
        this.sVinNo = sVinNo;
    }

}
