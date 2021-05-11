package chn.bhmc.dms.crm.cso.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * 시승노선조회 SearchVO
 *
 * @ClassName   : TestDriveClineSearchVO.java
 * @Description : TestDriveClineSearchVO Class
 * @author in moon lee
 * @since 2016.05.12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.05.12.     in moon lee     최초 생성
 * </pre>
 */

public class TestDriveClineSearchVO extends SearchVO {

    private  String      sDlrCd;
    private  String      sPltCd;
    private  String      sUseYn;
    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }
    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }
    /**
     * @return the sPltCd
     */
    public String getsPltCd() {
        return sPltCd;
    }
    /**
     * @param sPltCd the sPltCd to set
     */
    public void setsPltCd(String sPltCd) {
        this.sPltCd = sPltCd;
    }
    /**
     * @return the sUseYn
     */
    public String getsUseYn() {
        return sUseYn;
    }
    /**
     * @param sUseYn the sUseYn to set
     */
    public void setsUseYn(String sUseYn) {
        this.sUseYn = sUseYn;
    }
    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "TestDriveClineSearchVO [sDlrCd=" + sDlrCd + ", sPltCd=" + sPltCd + ", sUseYn=" + sUseYn + "]";
    }

}