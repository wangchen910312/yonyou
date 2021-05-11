package chn.bhmc.dms.ser.svi.vo;

import org.springmodules.validation.bean.conf.loader.annotation.handler.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : EtcIssueManageVO.java
 * @Description : 기타사항 마스터VO
 * @author Kwon Ki Hyun
 * @since 2016. 9. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 14.   Kyung Mok Kim     최초 생성
 * </pre>
 */

public class EtcIssueManageVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -4667654320142527682L;

    /**
     * 딜러코드
     **/
    private  String     dlrCd;

    /**
     * 기타코드
     **/
    @NotEmpty
    private  String     etcCd;

    /**
     * 기타코드명
     **/
    //ETC_CD_NM
    private  String     etcCdNm;

    /**
     * 우선순위값
     **/
    //PROR_VAL
    private  int        prorVal;

    /**
     * 기타금액
     **/
    //ETC_AMT
    private  Double     etcAmt;

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
     * @return the etcCd
     */
    public String getEtcCd() {
        return etcCd;
    }

    /**
     * @param etcCd the etcCd to set
     */
    public void setEtcCd(String etcCd) {
        this.etcCd = etcCd;
    }

    /**
     * @return the etcCdNm
     */
    public String getEtcCdNm() {
        return etcCdNm;
    }

    /**
     * @param etcCdNm the etcCdNm to set
     */
    public void setEtcCdNm(String etcCdNm) {
        this.etcCdNm = etcCdNm;
    }

    /**
     * @return the prorVal
     */
    public int getProrVal() {
        return prorVal;
    }

    /**
     * @param prorVal the prorVal to set
     */
    public void setProrVal(int prorVal) {
        this.prorVal = prorVal;
    }

    /**
     * @return the etcAmt
     */
    public Double getEtcAmt() {
        return etcAmt;
    }

    /**
     * @param etcAmt the etcAmt to set
     */
    public void setEtcAmt(Double etcAmt) {
        this.etcAmt = etcAmt;
    }

}
