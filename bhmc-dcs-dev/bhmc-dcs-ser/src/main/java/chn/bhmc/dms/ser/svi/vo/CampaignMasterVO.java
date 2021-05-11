package chn.bhmc.dms.ser.svi.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CampaignMasterVO.java
 * @Description : 캠페인 정보 마스터VO
 * @author Kwon Ki Hyun
 * @since 2016. 2. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 19.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public class CampaignMasterVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = -4667654681242527682L;
    
    /**
     * 캠페인번호
     **/
    private String crNo;
    
    /**
     * 캠페인 유형
     */
    private String crTp;
    
    /**
     * 캠페인 명 
     **/
    private String crNm;
    
    /**
     * 캠페인시작일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date crStartDt;
    
    /**
     *캠페인 종료일자 
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date crEndDt;
    
    /**
     * 생산 시작일자 
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date creStartDt;
    
    /**
     *생산 종료일자 
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date creEndDt;
    
    /**
     *판매 시작일자 
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date saleStartDt;
    
    /**
     * 판매종료일자
    **/
    private Date saleEndDt;

    /**
     * 캠페인 종료여부
     **/
    private String crEndTp;
    
    /**
     * 캠페인 비고
     **/
    private String crIsaNm;
    
    /**
     * LTS MODEL CD
     */
    private String ltsModelCd;

    /**
     * @return the crNo
     */
    public String getCrNo() {
        return crNo;
    }

    /**
     * @param crNo the crNo to set
     */
    public void setCrNo(String crNo) {
        this.crNo = crNo;
    }

    /**
     * @return the crTp
     */
    public String getCrTp() {
        return crTp;
    }

    /**
     * @param crTp the crTp to set
     */
    public void setCrTp(String crTp) {
        this.crTp = crTp;
    }
    
    

    /**
     * @return the crNm
     */
    public String getCrNm() {
        return crNm;
    }

    /**
     * @param crNm the crNm to set
     */
    public void setCrNm(String crNm) {
        this.crNm = crNm;
    }

     

    /**
     * @return the crStartDt
     */
    public Date getCrStartDt() {
        return crStartDt;
    }

    /**
     * @param crStartDt the crStartDt to set
     */
    public void setCrStartDt(Date crStartDt) {
        this.crStartDt = crStartDt;
    }

    /**
     * @return the crEndDt
     */
    public Date getCrEndDt() {
        return crEndDt;
    }

    /**
     * @param crEndDt the crEndDt to set
     */
    public void setCrEndDt(Date crEndDt) {
        this.crEndDt = crEndDt;
    }

    /**
     * @return the creStartDt
     */
    public Date getCreStartDt() {
        return creStartDt;
    }

    /**
     * @param creStartDt the creStartDt to set
     */
    public void setCreStartDt(Date creStartDt) {
        this.creStartDt = creStartDt;
    }

    /**
     * @return the creEndDt
     */
    public Date getCreEndDt() {
        return creEndDt;
    }

    /**
     * @param creEndDt the creEndDt to set
     */
    public void setCreEndDt(Date creEndDt) {
        this.creEndDt = creEndDt;
    }

    /**
     * @return the saleStartDt
     */
    public Date getSaleStartDt() {
        return saleStartDt;
    }

    /**
     * @param saleStartDt the saleStartDt to set
     */
    public void setSaleStartDt(Date saleStartDt) {
        this.saleStartDt = saleStartDt;
    }

    /**
     * @return the saleEndDt
     */
    public Date getSaleEndDt() {
        return saleEndDt;
    }

    /**
     * @param saleEndDt the saleEndDt to set
     */
    public void setSaleEndDt(Date saleEndDt) {
        this.saleEndDt = saleEndDt;
    }

    /**
     * @return the crEndTp
     */
    public String getCrEndTp() {
        return crEndTp;
    }

    /**
     * @param crEndTp the crEndTp to set
     */
    public void setCrEndTp(String crEndTp) {
        this.crEndTp = crEndTp;
    }

    /**
     * @return the crIsaNm
     */
    public String getCrIsaNm() {
        return crIsaNm;
    }

    /**
     * @param crIsaNm the crIsaNm to set
     */
    public void setCrIsaNm(String crIsaNm) {
        this.crIsaNm = crIsaNm;
    }

    /**
     * @return the ltsModelCd
     */
    public String getLtsModelCd() {
        return ltsModelCd;
    }

    /**
     * @param ltsModelCd the ltsModelCd to set
     */
    public void setLtsModelCd(String ltsModelCd) {
        this.ltsModelCd = ltsModelCd;
    }
    
    

    
}
