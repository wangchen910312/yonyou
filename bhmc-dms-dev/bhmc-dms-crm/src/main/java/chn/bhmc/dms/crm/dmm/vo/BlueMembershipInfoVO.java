package chn.bhmc.dms.crm.dmm.vo;

import java.util.Date;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BlueMembershipCalcSearchVO.java
 * @Description : 블루멤버십 정산 검색 VO
 * @author Kim Hyun Ho
 * @since 2016. 5. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 25.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class BlueMembershipInfoVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2668796708125559022L;

    private String dlrCd;
    private String custNo;
    private String custNm;
    private String hpNo;
    private String ssnCrnNo;
    private String blueMembershipNo;
    private String blueMembershipId;
    private Date blueMembershipJoinDt;
    private String blueMembershipJoinDlrCd;
    private String blueGradeChgDt;
    private String blueGradeCd;
    private String blueGradeCdNm;
    private int blueAvlbPointVal;
    private String blueLoginId;
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
     * @return the ssnCrnNo
     */
    public String getSsnCrnNo() {
        return ssnCrnNo;
    }
    /**
     * @param ssnCrnNo the ssnCrnNo to set
     */
    public void setSsnCrnNo(String ssnCrnNo) {
        this.ssnCrnNo = ssnCrnNo;
    }
    /**
     * @return the blueMembershipNo
     */
    public String getBlueMembershipNo() {
        return blueMembershipNo;
    }
    /**
     * @param blueMembershipNo the blueMembershipNo to set
     */
    public void setBlueMembershipNo(String blueMembershipNo) {
        this.blueMembershipNo = blueMembershipNo;
    }
    /**
     * @return the blueMembershipId
     */
    public String getBlueMembershipId() {
        return blueMembershipId;
    }
    /**
     * @param blueMembershipId the blueMembershipId to set
     */
    public void setBlueMembershipId(String blueMembershipId) {
        this.blueMembershipId = blueMembershipId;
    }
    /**
     * @return the blueMembershipJoinDt
     */
    public Date getBlueMembershipJoinDt() {
        return blueMembershipJoinDt;
    }
    /**
     * @param blueMembershipJoinDt the blueMembershipJoinDt to set
     */
    public void setBlueMembershipJoinDt(Date blueMembershipJoinDt) {
        this.blueMembershipJoinDt = blueMembershipJoinDt;
    }
    /**
     * @return the blueMembershipJoinDlrCd
     */
    public String getBlueMembershipJoinDlrCd() {
        return blueMembershipJoinDlrCd;
    }
    /**
     * @param blueMembershipJoinDlrCd the blueMembershipJoinDlrCd to set
     */
    public void setBlueMembershipJoinDlrCd(String blueMembershipJoinDlrCd) {
        this.blueMembershipJoinDlrCd = blueMembershipJoinDlrCd;
    }
    /**
     * @return the blueGradeChgDt
     */
    public String getBlueGradeChgDt() {
        return blueGradeChgDt;
    }
    /**
     * @param blueGradeChgDt the blueGradeChgDt to set
     */
    public void setBlueGradeChgDt(String blueGradeChgDt) {
        this.blueGradeChgDt = blueGradeChgDt;
    }
    /**
     * @return the blueGradeCd
     */
    public String getBlueGradeCd() {
        return blueGradeCd;
    }
    /**
     * @param blueGradeCd the blueGradeCd to set
     */
    public void setBlueGradeCd(String blueGradeCd) {
        this.blueGradeCd = blueGradeCd;
    }
    /**
     * @return the blueGradeCdNm
     */
    public String getBlueGradeCdNm() {
        return blueGradeCdNm;
    }
    /**
     * @param blueGradeCdNm the blueGradeCdNm to set
     */
    public void setBlueGradeCdNm(String blueGradeCdNm) {
        this.blueGradeCdNm = blueGradeCdNm;
    }
    /**
     * @return the blueAvlbPointVal
     */
    public int getBlueAvlbPointVal() {
        return blueAvlbPointVal;
    }
    /**
     * @param blueAvlbPointVal the blueAvlbPointVal to set
     */
    public void setBlueAvlbPointVal(int blueAvlbPointVal) {
        this.blueAvlbPointVal = blueAvlbPointVal;
    }
    /**
     * @return the blueLoginId
     */
    public String getBlueLoginId() {
        return blueLoginId;
    }
    /**
     * @param blueLoginId the blueLoginId to set
     */
    public void setBlueLoginId(String blueLoginId) {
        this.blueLoginId = blueLoginId;
    }

}
