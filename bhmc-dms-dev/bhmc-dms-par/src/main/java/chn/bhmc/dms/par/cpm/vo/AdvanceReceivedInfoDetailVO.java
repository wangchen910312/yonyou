package chn.bhmc.dms.par.cpm.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * 선수금 상세 VO
 *
 * @ClassName   : AdvanceReceivedInfoDetailVO.java
 * @Description : AdvanceReceivedInfoDetailVO Class
 * @author In Bo Shim
 * @since 2016. 5. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 23.     In Bo Shim     최초 생성
 * </pre>
 */

public class AdvanceReceivedInfoDetailVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8358527940683757328L;

    /**
     * 법인코드
     **/
    private String corpCd;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 수입일자
     **/
    private String impDt;

    /**
     * 일련번호
     **/
    private int seq;

    /**
     * 선수금유형
     **/
    private String preAmtTp;

    /**
     * 인보이스번호
     **/
    private String invcNo;

    /**
     * 입금액
     **/
    private Double dpstAmt = 0.0;

    /**
     * 총금액
     **/
    private Double totAmt = 0.0;

    /**
     * 입금참조번호
     **/
    private String dpstRefNo;

    /**
     * 잔금액
     **/
    private Double balAmt = 0.0;

    /**
     * 선수금추가일자
     **/
    private String preAmtAddDt;

    /**
     * 선수금추가시간
     **/
    private String preAmtAddHm;

    /**
     * 선수금수정일자
     **/
    private String preAmtUpdtDt;

    /**
     * 선수금수정시간
     **/
    private String preAmtUpdtHm;
    private String remark;//资金备注

    /**
     * @return the corpCd
     */
    public String getCorpCd() {
        return corpCd;
    }

    /**
     * @param corpCd the corpCd to set
     */
    public void setCorpCd(String corpCd) {
        this.corpCd = corpCd;
    }

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
     * @return the impDt
     */
    public String getImpDt() {
        return impDt;
    }

    /**
     * @param impDt the impDt to set
     */
    public void setImpDt(String impDt) {
        this.impDt = impDt;
    }

    /**
     * @return the seq
     */
    public int getSeq() {
        return seq;
    }

    /**
     * @param seq the seq to set
     */
    public void setSeq(int seq) {
        this.seq = seq;
    }

    /**
     * @return the preAmtTp
     */
    public String getPreAmtTp() {
        return preAmtTp;
    }

    /**
     * @param preAmtTp the preAmtTp to set
     */
    public void setPreAmtTp(String preAmtTp) {
        this.preAmtTp = preAmtTp;
    }

    /**
     * @return the invcNo
     */
    public String getInvcNo() {
        return invcNo;
    }

    /**
     * @param invcNo the invcNo to set
     */
    public void setInvcNo(String invcNo) {
        this.invcNo = invcNo;
    }

    /**
     * @return the dpstAmt
     */
    public Double getDpstAmt() {
        return dpstAmt;
    }

    /**
     * @param dpstAmt the dpstAmt to set
     */
    public void setDpstAmt(Double dpstAmt) {
        this.dpstAmt = dpstAmt;
    }

    /**
     * @return the totAmt
     */
    public Double getTotAmt() {
        return totAmt;
    }

    /**
     * @param totAmt the totAmt to set
     */
    public void setTotAmt(Double totAmt) {
        this.totAmt = totAmt;
    }

    /**
     * @return the dpstRefNo
     */
    public String getDpstRefNo() {
        return dpstRefNo;
    }

    /**
     * @param dpstRefNo the dpstRefNo to set
     */
    public void setDpstRefNo(String dpstRefNo) {
        this.dpstRefNo = dpstRefNo;
    }

    /**
     * @return the balAmt
     */
    public Double getBalAmt() {
        return balAmt;
    }

    /**
     * @param balAmt the balAmt to set
     */
    public void setBalAmt(Double balAmt) {
        this.balAmt = balAmt;
    }

    /**
     * @return the preAmtAddDt
     */
    public String getPreAmtAddDt() {
        return preAmtAddDt;
    }

    /**
     * @param preAmtAddDt the preAmtAddDt to set
     */
    public void setPreAmtAddDt(String preAmtAddDt) {
        this.preAmtAddDt = preAmtAddDt;
    }

    /**
     * @return the preAmtAddHm
     */
    public String getPreAmtAddHm() {
        return preAmtAddHm;
    }

    /**
     * @param preAmtAddHm the preAmtAddHm to set
     */
    public void setPreAmtAddHm(String preAmtAddHm) {
        this.preAmtAddHm = preAmtAddHm;
    }

    /**
     * @return the preAmtUpdtDt
     */
    public String getPreAmtUpdtDt() {
        return preAmtUpdtDt;
    }

    /**
     * @param preAmtUpdtDt the preAmtUpdtDt to set
     */
    public void setPreAmtUpdtDt(String preAmtUpdtDt) {
        this.preAmtUpdtDt = preAmtUpdtDt;
    }

    /**
     * @return the preAmtUpdtHm
     */
    public String getPreAmtUpdtHm() {
        return preAmtUpdtHm;
    }

    /**
     * @param preAmtUpdtHm the preAmtUpdtHm to set
     */
    public void setPreAmtUpdtHm(String preAmtUpdtHm) {
        this.preAmtUpdtHm = preAmtUpdtHm;
    }

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
    
    
}
