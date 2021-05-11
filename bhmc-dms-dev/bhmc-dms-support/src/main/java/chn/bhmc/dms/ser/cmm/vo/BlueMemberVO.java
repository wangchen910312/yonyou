package chn.bhmc.dms.ser.cmm.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BlueMemberSaveVO.java
 * @Description : 블루멤버스 Save
 * @author Kim Kyung Mok
 * @since 2016. 9. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 7.     Kim Kyung Mok     최초 생성
 * </pre>
 */

public class BlueMemberVO extends BaseSaveVO<Object> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4874972546314397876L;


    // 인터페이스 파라미터용
    private String vin;//VIN 번호
    private String consumeType;//소비 유형(0:사고차 수리(보통), 1:첫 정비, 2: 차량 구매, 3: 정기 정비, 8:판금 )
    private String consumePoints;//소비 포인트 ( 적립인 경우 값을 0 )
    private String totalCost;//총 비용
    private String blueMembershipNo;//회원 카드 번호
    /**
     * @return the vin
     */
    public String getVin() {
        return vin;
    }
    /**
     * @param vin the vin to set
     */
    public void setVin(String vin) {
        this.vin = vin;
    }
    /**
     * @return the consumeType
     */
    public String getConsumeType() {
        return consumeType;
    }
    /**
     * @param consumeType the consumeType to set
     */
    public void setConsumeType(String consumeType) {
        this.consumeType = consumeType;
    }
    /**
     * @return the consumePoints
     */
    public String getConsumePoints() {
        return consumePoints;
    }
    /**
     * @param consumePoints the consumePoints to set
     */
    public void setConsumePoints(String consumePoints) {
        this.consumePoints = consumePoints;
    }
    /**
     * @return the totalCost
     */
    public String getTotalCost() {
        return totalCost;
    }
    /**
     * @param totalCost the totalCost to set
     */
    public void setTotalCost(String totalCost) {
        this.totalCost = totalCost;
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

}
