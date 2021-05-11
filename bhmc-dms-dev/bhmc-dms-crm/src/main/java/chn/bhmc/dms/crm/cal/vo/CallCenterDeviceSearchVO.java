package chn.bhmc.dms.crm.cal.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * 콜센터 전화 상태 VO
 *
 * @ClassName   : CallCenterDeviceSearchVO.java
 * @Description : CallCenterDeviceSearchVO Class
 * @author in moon lee
 * @since 2016.11.08.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.11.08     in moon lee     최초 생성
 * </pre>
 */

public class CallCenterDeviceSearchVO extends SearchVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8278842454453121447L;

    /**
     * 딜러코드
     **/
    private  String              sDlrCd;

    /**
     * 콜이력일련번호
     **/
    private  int                 sCallHisSeq;

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
     * @return the sCallHisSeq
     */
    public int getsCallHisSeq() {
        return sCallHisSeq;
    }

    /**
     * @param sCallHisSeq the sCallHisSeq to set
     */
    public void setsCallHisSeq(int sCallHisSeq) {
        this.sCallHisSeq = sCallHisSeq;
    }



}