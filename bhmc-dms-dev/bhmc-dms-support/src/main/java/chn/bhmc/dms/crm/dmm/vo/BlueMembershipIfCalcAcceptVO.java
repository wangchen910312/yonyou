package chn.bhmc.dms.crm.dmm.vo;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BlueMembershipIfVO
 * @Description : 블루멤버십 회원정보(인터페이스) VO
 * @author Kim Hyun Ho
 * @since 2016. 5. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 20.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class BlueMembershipIfCalcAcceptVO extends BaseVO {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5727498187901514053L;

    private String dealerId;//딜러 ID
    private String beginDate;//시작 날짜(yyyyMMdd)
    private String endDate;//완료 날짜(yyyyMMdd)
    private String totalPoint;//총 포인트
    private String totalAmt; //총 금액
    private String isAgree;//정산동의여부
    private String comment;//비고
    private List<BlueMembershipIfCalcPointInfoVO> pointUseList;//포인트 사용내역


    /**
     * @return the dealerId
     */
    public String getDealerId() {
        return dealerId;
    }
    /**
     * @param dealerId the dealerId to set
     */
    public void setDealerId(String dealerId) {
        this.dealerId = dealerId;
    }
    /**
     * @return the beginDate
     */
    public String getBeginDate() {
        return beginDate;
    }
    /**
     * @param beginDate the beginDate to set
     */
    public void setBeginDate(String beginDate) {
        this.beginDate = beginDate;
    }
    /**
     * @return the endDate
     */
    public String getEndDate() {
        return endDate;
    }
    /**
     * @param endDate the endDate to set
     */
    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }
    /**
     * @return the totalPoint
     */
    public String getTotalPoint() {
        return totalPoint;
    }
    /**
     * @param totalPoint the totalPoint to set
     */
    public void setTotalPoint(String totalPoint) {
        this.totalPoint = totalPoint;
    }
    /**
     * @return the totalAmt
     */
    public String getTotalAmt() {
        return totalAmt;
    }
    /**
     * @param totalAmt the totalAmt to set
     */
    public void setTotalAmt(String totalAmt) {
        this.totalAmt = totalAmt;
    }

    /**
     * @return the isAgree
     */
    public String getIsAgree() {
        return isAgree;
    }
    /**
     * @param isAgree the isAgree to set
     */
    public void setIsAgree(String isAgree) {
        this.isAgree = isAgree;
    }
    /**
     * @return the comment
     */
    public String getComment() {
        return comment;
    }
    /**
     * @param comment the comment to set
     */
    public void setComment(String comment) {
        this.comment = comment;
    }
    /**
     * @return the pointUseList
     */
    public List<BlueMembershipIfCalcPointInfoVO> getPointUseList() {
        return pointUseList;
    }
    /**
     * @param pointUseList the pointUseList to set
     */
    public void setPointUseList(List<BlueMembershipIfCalcPointInfoVO> pointUseList) {
        this.pointUseList = pointUseList;
    }
    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "BlueMembershipIfCalcAcceptVO [dealerId=" + dealerId + ", beginDate=" + beginDate + ", endDate="
                + endDate + ", totalPoint=" + totalPoint + ", totalAmt=" + totalAmt + ", isAgree=" + isAgree
                + ", comment=" + comment + ", pointUseList=" + pointUseList + "]";
    }
}
