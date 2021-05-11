package chn.bhmc.dms.crm.dmm.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AddORConsumeintegralVO.java
 * @Description : BM 회원 포인트 명세
 * @author Kim Hyun Ho
 * @since 2016. 7. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 27.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class AddORConsumeintegralVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6000775527253442056L;

    //[TODO] 요청 파라미터
    private String DealerId; //딜러번호
    private String BeginDate; //시작 날짜(yyyyMMddHHmmss)
    private String EndDate; //완료 날짜(yyyyMMddHHmmss)
    private String IdentityNumber; //증서번호
    private String BlueMembership_No; //회원카드번호

    //[TODO] 응답 파라미터
    private String Yype; //1 신규, 2 소비
    private String UpdateDate; //포인트변동시간
    private String Point; //포인트 변동수치
    private String Remark; //포인트 변동원인
    private String Operator; //조작인

    //[TODO] 성공여부
    private String IfSuccess;

    /**
     * @return the dealerId
     */
    public String getDealerId() {
        return DealerId;
    }

    /**
     * @param dealerId the dealerId to set
     */
    public void setDealerId(String dealerId) {
        DealerId = dealerId;
    }

    /**
     * @return the beginDate
     */
    public String getBeginDate() {
        return BeginDate;
    }

    /**
     * @param beginDate the beginDate to set
     */
    public void setBeginDate(String beginDate) {
        BeginDate = beginDate;
    }

    /**
     * @return the endDate
     */
    public String getEndDate() {
        return EndDate;
    }

    /**
     * @param endDate the endDate to set
     */
    public void setEndDate(String endDate) {
        EndDate = endDate;
    }

    /**
     * @return the identityNumber
     */
    public String getIdentityNumber() {
        return IdentityNumber;
    }

    /**
     * @param identityNumber the identityNumber to set
     */
    public void setIdentityNumber(String identityNumber) {
        IdentityNumber = identityNumber;
    }

    /**
     * @return the blueMembership_No
     */
    public String getBlueMembership_No() {
        return BlueMembership_No;
    }

    /**
     * @param blueMembership_No the blueMembership_No to set
     */
    public void setBlueMembership_No(String blueMembership_No) {
        BlueMembership_No = blueMembership_No;
    }

    /**
     * @return the yype
     */
    public String getYype() {
        return Yype;
    }

    /**
     * @param yype the yype to set
     */
    public void setYype(String yype) {
        Yype = yype;
    }

    /**
     * @return the updateDate
     */
    public String getUpdateDate() {
        return UpdateDate;
    }

    /**
     * @param updateDate the updateDate to set
     */
    public void setUpdateDate(String updateDate) {
        UpdateDate = updateDate;
    }

    /**
     * @return the point
     */
    public String getPoint() {
        return Point;
    }

    /**
     * @param point the point to set
     */
    public void setPoint(String point) {
        Point = point;
    }

    /**
     * @return the remark
     */
    public String getRemark() {
        return Remark;
    }

    /**
     * @param remark the remark to set
     */
    public void setRemark(String remark) {
        Remark = remark;
    }

    /**
     * @return the operator
     */
    public String getOperator() {
        return Operator;
    }

    /**
     * @param operator the operator to set
     */
    public void setOperator(String operator) {
        Operator = operator;
    }

    /**
     * @return the ifSuccess
     */
    public String getIfSuccess() {
        return IfSuccess;
    }

    /**
     * @param ifSuccess the ifSuccess to set
     */
    public void setIfSuccess(String ifSuccess) {
        IfSuccess = ifSuccess;
    }


}
