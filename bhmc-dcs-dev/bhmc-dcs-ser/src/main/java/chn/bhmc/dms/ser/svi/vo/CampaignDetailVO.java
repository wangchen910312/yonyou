package chn.bhmc.dms.ser.svi.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CampaignDetailVO.java
 * @Description : 캠페인 상세 VO
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

public class CampaignDetailVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = 198174229536067524L;
    
    /**
     * 캠페인번호
     **/
    @NotEmpty
    private String crNo;
    
    /**
     * 캠페인 유형
     */
    private String crTp;
    
    /**
     * 캠페인명
     **/
    private String crNm;
    
    /**
     * 캠페인 공임코드
     **/
    private String lbrCd;
    
    /**
     * 캠페인 공임명
     **/
    private String lbrNm;
    
    /**
     * 캠페인 공임 수량
     **/
    private int lbrQty;
    
    /**
     * 캠페인 공임 작업 시간
     **/
    private Double lbrHm;
    
    /**
     * 캠페인 공임 금액
     **/
    private Double lbrAmt;
    
    /**
     * 캠페인 원인코드
     **/
    private String cauCd;
    
    /**
     * 캠페인 원인코드명
     **/
    private String cauNm;
    
    /**
     * 캠페인 현상코드
     **/
    private String phenCd;
    
    /**
     * 캠페인 현상코드명
     **/
    private String phenNm;
    
    /**
     * 캠페인 LTS MODEL 코드
     **/
    private String ltsModelCd;
    
    /**
     * 캠페인 LTS MODEL 명
     **/
    private String ltsModelNm;
    
    /**
     * 캠페인 원인 부품코드
     **/
    private String cauItemCd;
    
    /**
     * 캠페인 원인 부품명
     **/
    private String cauItemNm;
    
    /**
     * 캠페인 부품
     */
    private String itemCd;
    
    /**
     * 캠페인부품명
     */
    private String itemNm;
    
    /**
     * 캠페인 부품수량
     **/
    private int itemQty;
    
    /**
     * 캠페인 부품 단위
     */
    private String stockUnitCd;
    
    /**
     * 캠페인  부품금액
     */
    private Double salePrcAmt;
    
    /**
     * 공임단가
     */
    private Double lbrRate;
    
    /**
     * 공임금액
     */
    private Double lbrPrc;
    
    /**
     * 캠페인빈 사용여부
     **/
    private String useYn;
    
    /**
     * 캠페인 대상빈
     **/
    private String vinNo;
    
    /**
     * 캠페인 사용 딜러
     **/
    private String dlrCd;
    
    /**
     * 캠페인 사용일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date useDt;
    
    /**
     * 캠페인 승상구분 
     **/
    private String pcDstinCd;
    
    /**
     * 입고창고코드
     */
    private String grStrgeCd;
    
    /**
     * 출고창고코드
     */
    private String giStrgeCd;

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
     * @return the lbrCd
     */
    public String getLbrCd() {
        return lbrCd;
    }

    /**
     * @param lbrCd the lbrCd to set
     */
    public void setLbrCd(String lbrCd) {
        this.lbrCd = lbrCd;
    }

    /**
     * @return the lbrNm
     */
    public String getLbrNm() {
        return lbrNm;
    }

    /**
     * @param lbrNm the lbrNm to set
     */
    public void setLbrNm(String lbrNm) {
        this.lbrNm = lbrNm;
    }

    /**
     * @return the lbrQty
     */
    public int getLbrQty() {
        return lbrQty;
    }

    /**
     * @param lbrQty the lbrQty to set
     */
    public void setLbrQty(int lbrQty) {
        this.lbrQty = lbrQty;
    }

    /**
     * @return the lbrHm
     */
    public Double getLbrHm() {
        return lbrHm;
    }

    /**
     * @param lbrHm the lbrHm to set
     */
    public void setLbrHm(Double lbrHm) {
        this.lbrHm = lbrHm;
    }

    /**
     * @return the lbrAmt
     */
    public Double getLbrAmt() {
        return lbrAmt;
    }

    /**
     * @param lbrAmt the lbrAmt to set
     */
    public void setLbrAmt(Double lbrAmt) {
        this.lbrAmt = lbrAmt;
    }

    /**
     * @return the cauCd
     */
    public String getCauCd() {
        return cauCd;
    }

    /**
     * @param cauCd the cauCd to set
     */
    public void setCauCd(String cauCd) {
        this.cauCd = cauCd;
    }

    /**
     * @return the cauNm
     */
    public String getCauNm() {
        return cauNm;
    }

    /**
     * @param cauNm the cauNm to set
     */
    public void setCauNm(String cauNm) {
        this.cauNm = cauNm;
    }

    /**
     * @return the phenCd
     */
    public String getPhenCd() {
        return phenCd;
    }

    /**
     * @param phenCd the phenCd to set
     */
    public void setPhenCd(String phenCd) {
        this.phenCd = phenCd;
    }

    /**
     * @return the phenNm
     */
    public String getPhenNm() {
        return phenNm;
    }

    /**
     * @param phenNm the phenNm to set
     */
    public void setPhenNm(String phenNm) {
        this.phenNm = phenNm;
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

    /**
     * @return the ltsModelNm
     */
    public String getLtsModelNm() {
        return ltsModelNm;
    }

    /**
     * @param ltsModelNm the ltsModelNm to set
     */
    public void setLtsModelNm(String ltsModelNm) {
        this.ltsModelNm = ltsModelNm;
    }

    
     
    /**
     * @return the cauItemCd
     */
    public String getCauItemCd() {
        return cauItemCd;
    }

    /**
     * @param cauItemCd the cauItemCd to set
     */
    public void setCauItemCd(String cauItemCd) {
        this.cauItemCd = cauItemCd;
    }

    /**
     * @return the cauItemNm
     */
    public String getCauItemNm() {
        return cauItemNm;
    }

    /**
     * @param cauItemNm the cauItemNm to set
     */
    public void setCauItemNm(String cauItemNm) {
        this.cauItemNm = cauItemNm;
    }

    /**
     * @return the itemQty
     */
    public int getItemQty() {
        return itemQty;
    }

    /**
     * @param itemQty the itemQty to set
     */
    public void setItemQty(int itemQty) {
        this.itemQty = itemQty;
    }

    /**
     * @return the useYn
     */
    public String getUseYn() {
        return useYn;
    }

    /**
     * @param useYn the useYn to set
     */
    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }

    /**
     * @return the vinNo
     */
    public String getVinNo() {
        return vinNo;
    }

    /**
     * @param vinNo the vinNo to set
     */
    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }

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
     * @return the useDt
     */
    public Date getUseDt() {
        return useDt;
    }

    /**
     * @param useDt the useDt to set
     */
    public void setUseDt(Date useDt) {
        this.useDt = useDt;
    }

    /**
     * @return the pcDstinCd
     */
    public String getPcDstinCd() {
        return pcDstinCd;
    }

    /**
     * @param pcDstinCd the pcDstinCd to set
     */
    public void setPcDstinCd(String pcDstinCd) {
        this.pcDstinCd = pcDstinCd;
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
     * @return the salePrcAmt
     */
    public Double getSalePrcAmt() {
        return salePrcAmt;
    }

    /**
     * @param salePrcAmt the salePrcAmt to set
     */
    public void setSalePrcAmt(Double salePrcAmt) {
        this.salePrcAmt = salePrcAmt;
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
     * @return the itemNm
     */
    public String getItemNm() {
        return itemNm;
    }

    /**
     * @param itemNm the itemNm to set
     */
    public void setItemNm(String itemNm) {
        this.itemNm = itemNm;
    }

    /**
     * @return the lbrRate
     */
    public Double getLbrRate() {
        return lbrRate;
    }

    /**
     * @param lbrRate the lbrRate to set
     */
    public void setLbrRate(Double lbrRate) {
        this.lbrRate = lbrRate;
    }

    /**
     * @return the lbrPrc
     */
    public Double getLbrPrc() {
        return lbrPrc;
    }

    /**
     * @param lbrPrc the lbrPrc to set
     */
    public void setLbrPrc(Double lbrPrc) {
        this.lbrPrc = lbrPrc;
    }

    /**
     * @return the stockUnitCd
     */
    public String getStockUnitCd() {
        return stockUnitCd;
    }

    /**
     * @param stockUnitCd the stockUnitCd to set
     */
    public void setStockUnitCd(String stockUnitCd) {
        this.stockUnitCd = stockUnitCd;
    }

    /**
     * @return the grStrgeCd
     */
    public String getGrStrgeCd() {
        return grStrgeCd;
    }

    /**
     * @param grStrgeCd the grStrgeCd to set
     */
    public void setGrStrgeCd(String grStrgeCd) {
        this.grStrgeCd = grStrgeCd;
    }

    /**
     * @return the giStrgeCd
     */
    public String getGiStrgeCd() {
        return giStrgeCd;
    }

    /**
     * @param giStrgeCd the giStrgeCd to set
     */
    public void setGiStrgeCd(String giStrgeCd) {
        this.giStrgeCd = giStrgeCd;
    }
    
    
    
    
    
    

}
