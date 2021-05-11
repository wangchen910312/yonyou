package chn.bhmc.dms.crm.dmm.vo;

import com.fasterxml.jackson.annotation.JsonProperty;

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

public class BlueMembershipIfConsumeVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5727498187901514053L;

    @JsonProperty("Point")
    private String point;//가용 포인트 , 적립 or 소비 포인트

    @JsonProperty("PointSeq")
    private String addPoint;//적립 포인트

    @JsonProperty("DealerId")
    private String dealerId;//딜러 아이디

    @JsonProperty("Type")
    private String pointType;//1 신규, 2 소비

    @JsonProperty("UpdateDate")
    private String pointDt;//포인스 사용,적립 일 (yyyyMMddHHmmss)

    @JsonProperty("Remark")
    private String remark;//사용,적립 내용

    @JsonProperty("Operator")
    private String operator;//조작인

    @JsonProperty("RoDocNo")
    private String roDocNo;//RO문서번호

    @JsonProperty("ContractNo")
    private String contractNo;//계약번호

    @JsonProperty("OrderNo")
    private String consumeNo;//포인트사용 번호

    /**
     * @return the point
     */
    public String getPoint() {
        return point;
    }

    /**
     * @param point the point to set
     */
    public void setPoint(String point) {
        this.point = point;
    }

    /**
     * @return the addPoint
     */
    public String getAddPoint() {
        return addPoint;
    }

    /**
     * @param addPoint the addPoint to set
     */
    public void setAddPoint(String addPoint) {
        this.addPoint = addPoint;
    }

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
     * @return the pointType
     */
    public String getPointType() {
        return pointType;
    }

    /**
     * @param pointType the pointType to set
     */
    public void setPointType(String pointType) {
        this.pointType = pointType;
    }

    /**
     * @return the pointDt
     */
    public String getPointDt() {
        return pointDt;
    }

    /**
     * @param pointDt the pointDt to set
     */
    public void setPointDt(String pointDt) {
        this.pointDt = pointDt;
    }

    /**
     * @return the remark
     */
    public String getRemark() {
        return remark;
    }

    /**
     * @param remark the remark to set
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * @return the operator
     */
    public String getOperator() {
        return operator;
    }

    /**
     * @param operator the operator to set
     */
    public void setOperator(String operator) {
        this.operator = operator;
    }

    /**
     * @return the roDocNo
     */
    public String getRoDocNo() {
        return roDocNo;
    }

    /**
     * @param roDocNo the roDocNo to set
     */
    public void setRoDocNo(String roDocNo) {
        this.roDocNo = roDocNo;
    }

    /**
     * @return the contractNo
     */
    public String getContractNo() {
        return contractNo;
    }

    /**
     * @param contractNo the contractNo to set
     */
    public void setContractNo(String contractNo) {
        this.contractNo = contractNo;
    }

    /**
     * @return the consumeNo
     */
    public String getConsumeNo() {
        return consumeNo;
    }

    /**
     * @param consumeNo the consumeNo to set
     */
    public void setConsumeNo(String consumeNo) {
        this.consumeNo = consumeNo;
    }



}
