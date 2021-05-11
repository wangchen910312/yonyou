package chn.bhmc.dms.crm.dmm.vo;

import org.json.simple.JSONAware;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : BlueMembershipIfVO
 * @Description : 블루멤버십 회원정보(인터페이스) VO
 * @author Kim Hyun Ho
 * @since 2016. 5. 20.
 * @version 1.0
 * @see
 * @Modification Information
 *
 *               <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 20.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class BlueMembershipIfCalcPointInfoVO implements JSONAware {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5727498187901514053L;

    // 인터페이스 파라미터용
    @JsonProperty("BlueMembership_Id")
    private String blueMembershipId = "";

    @JsonProperty("Phone")
    private String hpNo = ""; // 휴대폰 번호

    @JsonProperty("IdentityNumber")
    private String ssnCrnNo = "";// 신분증 번호

    @JsonProperty("VIN")
    private String vinNo = "";// VIN 번호

    @JsonProperty("ConsumeType")
    private String pointCd;// 소비 유형(0:사고차 수리(보통), 1:첫 정비, 2: 차량 구매, 3: 정기 정비, 8:판금, 9:부품, 10:용품

    @JsonProperty("ConsumePoints")
    private String occrPointVal = "0";// 소비 포인트 ( 적립인 경우 값을 0 )

    @JsonProperty("TotalCost")
    private String totAmt = "0";// 총 비용

    @JsonProperty("PointCost")
    private String occrPointCost = "0";// 소비 금액(포인트 대신 결재 비용 )

    @JsonProperty("RewardPoints")
    private String accuPointVal = "0";// 발생 포인트

    @JsonProperty("ConsumeDate")
    private String consumeDate;// 소비 시간 (yyyyMMddHHmmss)

    @JsonProperty("DmsOrderNo")
    private String useNum = "";//소비번호

    /**
     * @return the blueMembershipId
     */
    public String getBlueMembershipId() {
        return blueMembershipId;
    }

    /**
     * @param blueMembershipId
     *            the blueMembershipId to set
     */
    public void setBlueMembershipId(String blueMembershipId) {
        this.blueMembershipId = blueMembershipId;
    }

    /**
     * @return the hpNo
     */
    public String getHpNo() {
        return hpNo;
    }

    /**
     * @param hpNo
     *            the hpNo to set
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
     * @param ssnCrnNo
     *            the ssnCrnNo to set
     */
    public void setSsnCrnNo(String ssnCrnNo) {
        this.ssnCrnNo = ssnCrnNo;
    }

    /**
     * @return the vinNo
     */
    public String getVinNo() {
        return vinNo;
    }

    /**
     * @param vinNo
     *            the vinNo to set
     */
    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }

    /**
     * @return the pointCd
     */
    public String getPointCd() {
        return pointCd;
    }

    /**
     * @param pointCd
     *            the pointCd to set
     */
    public void setPointCd(String pointCd) {
        this.pointCd = pointCd;
    }

    /**
     * @return the occrPointVal
     */
    public String getOccrPointVal() {
        return occrPointVal;
    }

    /**
     * @param occrPointVal
     *            the occrPointVal to set
     */
    public void setOccrPointVal(String occrPointVal) {
        this.occrPointVal = occrPointVal;
    }

    /**
     * @return the totAmt
     */
    public String getTotAmt() {
        return totAmt;
    }

    /**
     * @param totAmt
     *            the totAmt to set
     */
    public void setTotAmt(String totAmt) {
        this.totAmt = totAmt;
    }

    /**
     * @return the occrPointCost
     */
    public String getOccrPointCost() {
        return occrPointCost;
    }

    /**
     * @param occrPointCost
     *            the occrPointCost to set
     */
    public void setOccrPointCost(String occrPointCost) {
        this.occrPointCost = occrPointCost;
    }

    /**
     * @return the accuPointVal
     */
    public String getAccuPointVal() {
        return accuPointVal;
    }

    /**
     * @param accuPointVal
     *            the accuPointVal to set
     */
    public void setAccuPointVal(String accuPointVal) {
        this.accuPointVal = accuPointVal;
    }

    /**
     * @return the consumeDate
     */
    public String getConsumeDate() {
        return consumeDate;
    }

    /**
     * @param consumeDate
     *            the consumeDate to set
     */
    public void setConsumeDate(String consumeDate) {
        this.consumeDate = consumeDate;
    }

    /*
     * @see org.json.simple.JSONAware#toJSONString()
     */
    @Override
    public String toJSONString() {
        try {
            return (new ObjectMapper()).writeValueAsString(this);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * @return the useNum
     */
    public String getUseNum() {
        return useNum;
    }

    /**
     * @param useNum the useNum to set
     */
    public void setUseNum(String useNum) {
        this.useNum = useNum;
    }
}
