package chn.bhmc.dms.bat.cmm.sms.vo;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SmsAmountResultVO.java
 * @Description : SMS 잔여 내역을 조회하기 위한 VO
 * @author Choi Kyung Yong
 * @since 2017. 03. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since            author              description
 *  ===========    ================    =======================
 *  2017. 03. 28.   Choi KyungYong            최초 생성
 * </pre>
 */

public class SmsAmountResultVO {

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * SMS 예치금 잔액
     **/
    private double smsRemainAmount;

    /**
     * SMS 전송 가능 건수
     **/
    private int smsRemainCnt;

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
     * @return the smsRemainAmount
     */
    public double getSmsRemainAmount() {
        return smsRemainAmount;
    }

    /**
     * @param smsRemainAmount the smsRemainAmount to set
     */
    public void setSmsRemainAmount(double smsRemainAmount) {
        this.smsRemainAmount = smsRemainAmount;
    }

    /**
     * @return the smsRemainCnt
     */
    public int getSmsRemainCnt() {
        return smsRemainCnt;
    }

    /**
     * @param smsRemainCnt the smsRemainCnt to set
     */
    public void setSmsRemainCnt(int smsRemainCnt) {
        this.smsRemainCnt = smsRemainCnt;
    }

    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "SmsAmountResultVO [dlrCd=" + dlrCd + ", smsRemainAmount=" + smsRemainAmount + ", smsRemainCnt="
                + smsRemainCnt + "]";
    }
}
