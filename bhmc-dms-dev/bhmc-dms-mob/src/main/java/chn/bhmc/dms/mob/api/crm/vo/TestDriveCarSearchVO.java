package chn.bhmc.dms.mob.api.crm.vo;

import java.util.Date;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * 시승 차량 조회 SearchVO
 *
 * @ClassName   : TestDriveCarSearchVO.java
 * @Description : TestDriveCarSearchVO Class
 * @author in moon lee
 * @since 2016. 02. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 02. 11.     in moon lee     최초 생성
 * </pre>
 */

public class TestDriveCarSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1L;

    private  String      sDlrCd;
    private  String      sPltCd;
    private  String      sUseYn;
    private  String      sTdrvVinNo;    // 시승차 - 예약 수량 확인
    private  Date        sResvDt;       // 시승차 - 예약 수량 확인

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

    /**
     * @return the sTdrvVinNo
     */
    public String getsTdrvVinNo() {
        return sTdrvVinNo;
    }
    /**
     * @param sTdrvVinNo the sTdrvVinNo to set
     */
    public void setsTdrvVinNo(String sTdrvVinNo) {
        this.sTdrvVinNo = sTdrvVinNo;
    }

    /**
     * @return the sResvDt
     */
    public Date getsResvDt() {
        return sResvDt;
    }
    /**
     * @param sResvDt the sResvDt to set
     */
    public void setsResvDt(Date sResvDt) {
        this.sResvDt = sResvDt;
    }
    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "TestDriveCarSearchVO [sDlrCd=" + sDlrCd + ", sPltCd=" + sPltCd + ", sUseYn=" + sUseYn + ", sTdrvVinNo="
                + sTdrvVinNo + ", sResvDt=" + sResvDt + "]";
    }

}