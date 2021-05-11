package chn.bhmc.dms.bat.cmm.sms.vo;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SendSmsAmountVO.java
 * @Description : SMS 잔여 내역을 조회하기 위한 VO
 * @author Choi Kyung Yong
 * @since 2017. 03. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========   ==============    =========================
 *  2017. 3. 28.  Choi KyungYong           최초 생성
 * </pre>
 */

public class SendSmsAmountVO{

    /**
     * 딜러코드
     **/
    private String dlrCd;

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

    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "SendSmsAmountVO [dlrCd=" + dlrCd + "]";
    }
}
