package chn.bhmc.dms.bat.par.ism.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
/**
 * 재고실사 VO
 *
 * @ClassName   : InvestigationVO.java
 * @Description : InvestigationVO Class
 * @author Ju Won Lee
 * @since 2016. 1. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 21.     Ju Won Lee     최초 생성
 * </pre>
 */



public class BatItemMovingAvgPrcVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1L;

    /**
     * 딜러코드
     **/
    private  String            dlrCd;

    /**
     * 부품번호
     **/
    private  String            itemCd;

    /**
     * 창고코드
     **/
    private  String            strgeCd;

    /**
     * 발생일자
     **/
    //GEN_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              genDt;

    /**
     * SEQ(히스토리용)
     **/
    //SEQ
    private  int            seq;

    /**
     * 총수량
     **/
    //TOT_QTY
    private  Double            totQty;

    /**
     * 이동평균가격
     **/
    //MOVING_AVG_PRC
    private  Double            movingAvgPrc;

    /**
     * 이전 발생일자
     **/
    //BEF_GEN_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              befGenDt;

    /**
     * 이전 총수량
     **/
    //BEF_TOT_QTY
    private  Double            befTotQty;

    /**
     * 이전 이동평균가격
     **/
    //BEF_MOVING_AVG_PRC
    private  Double            befMovingAvgPrc;

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
     * @return the strgeCd
     */
    public String getStrgeCd() {
        return strgeCd;
    }

    /**
     * @param strgeCd the strgeCd to set
     */
    public void setStrgeCd(String strgeCd) {
        this.strgeCd = strgeCd;
    }

    /**
     * @return the itemCd
     */
    public String getItemCd() {
        return itemCd;
    }

    /**
     * @param itemCd the itemCd to set
     */
    public void setItemCd(String itemCd) {
        this.itemCd = itemCd;
    }

    /**
     * @return the genDt
     */
    public Date getGenDt() {
        return genDt;
    }

    /**
     * @param genDt the genDt to set
     */
    public void setGenDt(Date genDt) {
        this.genDt = genDt;
    }

    /**
     * @return the totQty
     */
    public Double getTotQty() {
        return totQty;
    }

    /**
     * @param totQty the totQty to set
     */
    public void setTotQty(Double totQty) {
        this.totQty = totQty;
    }

    /**
     * @return the movingAvgPrc
     */
    public Double getMovingAvgPrc() {
        return movingAvgPrc;
    }

    /**
     * @param movingAvgPrc the movingAvgPrc to set
     */
    public void setMovingAvgPrc(Double movingAvgPrc) {
        this.movingAvgPrc = movingAvgPrc;
    }

    /**
     * @return the befGenDt
     */
    public Date getBefGenDt() {
        return befGenDt;
    }

    /**
     * @param befGenDt the befGenDt to set
     */
    public void setBefGenDt(Date befGenDt) {
        this.befGenDt = befGenDt;
    }

    /**
     * @return the befTotQty
     */
    public Double getBefTotQty() {
        return befTotQty;
    }

    /**
     * @param befTotQty the befTotQty to set
     */
    public void setBefTotQty(Double befTotQty) {
        this.befTotQty = befTotQty;
    }

    /**
     * @return the befMovingAvgPrc
     */
    public Double getBefMovingAvgPrc() {
        return befMovingAvgPrc;
    }

    /**
     * @param befMovingAvgPrc the befMovingAvgPrc to set
     */
    public void setBefMovingAvgPrc(Double befMovingAvgPrc) {
        this.befMovingAvgPrc = befMovingAvgPrc;
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

}
