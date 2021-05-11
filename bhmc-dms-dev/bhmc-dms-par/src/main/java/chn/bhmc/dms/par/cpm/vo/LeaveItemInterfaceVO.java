package chn.bhmc.dms.par.cpm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 방치품 인터페이스 VO
 *
 * @ClassName   : LeaveItemInterfaceVO.java
 * @Description : LeaveItemInterfaceVO Class
 * @author In Bo Shim
 * @since 2016. 8. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 27.     In Bo Shim     최초 생성
 * </pre>
 */

public class LeaveItemInterfaceVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1150198558617483605L;

    /**
     * 순번
     **/
    private String seq;

    /**
     * 거래유형
     **/
    private String sellType;

    /**
     * 구매딜러코드
     **/
    private String buyerDealerCd;

    /**
     * 구매딜러명칭
     **/
    private String buyerDealerNm;

    /**
     * 판매딜러코드
     **/
    private String sellerDealerCd;

    /**
     * 판매딜러명칭
     **/
    private String sellerDealerNm;

    /**
     * 부품번호
     **/
    private String parPartNocd;

    /**
     * 수령
     **/
    private int num = 0;

    /**
     * 가격
     **/
    private double price = 0;

    /**
     * 총금액
     **/
    private double totTurnover = 0.0;

    /**
     * 거래일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date finishTime;

    /**
     * @return the seq
     */
    public String getSeq() {
        return seq;
    }

    /**
     * @param seq the seq to set
     */
    public void setSeq(String seq) {
        this.seq = seq;
    }

    /**
     * @return the sellType
     */
    public String getSellType() {
        return sellType;
    }
    /**
     * @param sellType the sellType to set
     */
    public void setSellType(String sellType) {
        this.sellType = sellType;
    }
    /**
     * @return the buyerDealerCd
     */
    public String getBuyerDealerCd() {
        return buyerDealerCd;
    }
    /**
     * @param buyerDealerCd the buyerDealerCd to set
     */
    public void setBuyerDealerCd(String buyerDealerCd) {
        this.buyerDealerCd = buyerDealerCd;
    }
    /**
     * @return the buyerDealerNm
     */
    public String getBuyerDealerNm() {
        return buyerDealerNm;
    }
    /**
     * @param buyerDealerNm the buyerDealerNm to set
     */
    public void setBuyerDealerNm(String buyerDealerNm) {
        this.buyerDealerNm = buyerDealerNm;
    }
    /**
     * @return the sellerDealerCd
     */
    public String getSellerDealerCd() {
        return sellerDealerCd;
    }
    /**
     * @param sellerDealerCd the sellerDealerCd to set
     */
    public void setSellerDealerCd(String sellerDealerCd) {
        this.sellerDealerCd = sellerDealerCd;
    }
    /**
     * @return the sellerDealerNm
     */
    public String getSellerDealerNm() {
        return sellerDealerNm;
    }
    /**
     * @param sellerDealerNm the sellerDealerNm to set
     */
    public void setSellerDealerNm(String sellerDealerNm) {
        this.sellerDealerNm = sellerDealerNm;
    }
    /**
     * @return the parPartNocd
     */
    public String getParPartNocd() {
        return parPartNocd;
    }
    /**
     * @param parPartNocd the parPartNocd to set
     */
    public void setParPartNocd(String parPartNocd) {
        this.parPartNocd = parPartNocd;
    }
    /**
     * @return the num
     */
    public int getNum() {
        return num;
    }
    /**
     * @param num the num to set
     */
    public void setNum(int num) {
        this.num = num;
    }
    /**
     * @return the price
     */
    public double getPrice() {
        return price;
    }
    /**
     * @param price the price to set
     */
    public void setPrice(double price) {
        this.price = price;
    }
    /**
     * @return the totTurnover
     */
    public double getTotTurnover() {
        return totTurnover;
    }
    /**
     * @param totTurnover the totTurnover to set
     */
    public void setTotTurnover(double totTurnover) {
        this.totTurnover = totTurnover;
    }
    /**
     * @return the finishTime
     */
    public Date getFinishTime() {
        return finishTime;
    }
    /**
     * @param finishTime the finishTime to set
     */
    public void setFinishTime(Date finishTime) {
        this.finishTime = finishTime;
    }

}
