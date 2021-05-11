package chn.bhmc.dms.crm.cif.vo;

import java.util.Date;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 *
 * @ClassName   : CustChargeMstVO.java
 * @Description : 고객 충전 VO
 * @author liu jing
 * @since 2017. 1. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 1. 16.     liu jing               최초 생성
 * </pre>
 */

public class CustChargeMstVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7913216832635323963L;
    /**
     * Statements
     * (long)serialVersionUID
     */

    private String dlrCd;
    private String custNo;  // 고객 번호
    private String custNm;
    private String hpNo;
    private Double ableAmt; //가용 금액
    private Double totChrAmt;  //총 충전 금액
    private Double totUseAmt;  // 총 사용 금액
    private String regUsrId;  // 등록 사용자 ID
    private String regUsrNm;  // 등록 사용자 ID
    private Date regDt;   //등록일
    private String updtUsrId; //갱신 사용자 ID
    private Date updtDt;  // 갱신일
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
     * @return the custNo
     */
    public String getCustNo() {
        return custNo;
    }
    /**
     * @param custNo the custNo to set
     */
    public void setCustNo(String custNo) {
        this.custNo = custNo;
    }
    /**
     * @return the ableAmt
     */
    public Double getAbleAmt() {
        return ableAmt;
    }
    /**
     * @param ableAmt the ableAmt to set
     */
    public void setAbleAmt(Double ableAmt) {
        this.ableAmt = ableAmt;
    }
    /**
     * @return the totChrAmt
     */
    public Double getTotChrAmt() {
        return totChrAmt;
    }
    /**
     * @param totChrAmt the totChrAmt to set
     */
    public void setTotChrAmt(Double totChrAmt) {
        this.totChrAmt = totChrAmt;
    }
    /**
     * @return the totUseAmt
     */
    public Double getTotUseAmt() {
        return totUseAmt;
    }
    /**
     * @param totUseAmt the totUseAmt to set
     */
    public void setTotUseAmt(Double totUseAmt) {
        this.totUseAmt = totUseAmt;
    }
    /**
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }
    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }
    /**
     * @return the regDt
     */
    public Date getRegDt() {
        return regDt;
    }
    /**
     * @param regDt the regDt to set
     */
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }
    /**
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }
    /**
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }
    /**
     * @return the updtDt
     */
    public Date getUpdtDt() {
        return updtDt;
    }
    /**
     * @param updtDt the updtDt to set
     */
    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
    }
    /**
     * @return the custNm
     */
    public String getCustNm() {
        return custNm;
    }
    /**
     * @param custNm the custNm to set
     */
    public void setCustNm(String custNm) {
        this.custNm = custNm;
    }
    /**
     * @return the hpNo
     */
    public String getHpNo() {
        return hpNo;
    }
    /**
     * @param hpNo the hpNo to set
     */
    public void setHpNo(String hpNo) {
        this.hpNo = hpNo;
    }
    /**
     * @return the regUsrNm
     */
    public String getRegUsrNm() {
        return regUsrNm;
    }
    /**
     * @param regUsrNm the regUsrNm to set
     */
    public void setRegUsrNm(String regUsrNm) {
        this.regUsrNm = regUsrNm;
    }


}
