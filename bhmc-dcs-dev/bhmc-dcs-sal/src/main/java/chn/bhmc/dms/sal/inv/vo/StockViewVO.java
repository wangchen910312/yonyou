 package chn.bhmc.dms.sal.inv.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : StockViewVO
 * @Description : 재고조회 VO
 * @author Jin Suk Kim
 * @since 2016. 3. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 24.     Jin Suk Kim     최초 생성
 * </pre>
 */

public class StockViewVO extends BaseVO{
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -4536013990994966261L;

    private String carlineCd;
    private String carlineNm;
    private String modelCd;
    private String modelNm;
    private String ocnCd;
    private String ocnNm;
    private String extColorCd;
    private String extColorNm;
    private String intColorCd;
    private String intColorNm;

    private int cntTot;
    private int avlbStock;
    private int policyStock;
    private int damageStock;
    private int displayStock;
    private int longStock;
    private int dlrStock;
    /**
     * @return the carlineCd
     */
    public String getCarlineCd() {
        return carlineCd;
    }
    /**
     * @param carlineCd the carlineCd to set
     */
    public void setCarlineCd(String carlineCd) {
        this.carlineCd = carlineCd;
    }
    /**
     * @return the carlineNm
     */
    public String getCarlineNm() {
        return carlineNm;
    }
    /**
     * @param carlineNm the carlineNm to set
     */
    public void setCarlineNm(String carlineNm) {
        this.carlineNm = carlineNm;
    }
    /**
     * @return the modelCd
     */
    public String getModelCd() {
        return modelCd;
    }
    /**
     * @param modelCd the modelCd to set
     */
    public void setModelCd(String modelCd) {
        this.modelCd = modelCd;
    }
    /**
     * @return the modelNm
     */
    public String getModelNm() {
        return modelNm;
    }
    /**
     * @param modelNm the modelNm to set
     */
    public void setModelNm(String modelNm) {
        this.modelNm = modelNm;
    }
    /**
     * @return the ocnCd
     */
    public String getOcnCd() {
        return ocnCd;
    }
    /**
     * @param ocnCd the ocnCd to set
     */
    public void setOcnCd(String ocnCd) {
        this.ocnCd = ocnCd;
    }
    /**
     * @return the ocnNm
     */
    public String getOcnNm() {
        return ocnNm;
    }
    /**
     * @param ocnNm the ocnNm to set
     */
    public void setOcnNm(String ocnNm) {
        this.ocnNm = ocnNm;
    }
    /**
     * @return the extColorCd
     */
    public String getExtColorCd() {
        return extColorCd;
    }
    /**
     * @param extColorCd the extColorCd to set
     */
    public void setExtColorCd(String extColorCd) {
        this.extColorCd = extColorCd;
    }
    /**
     * @return the extColorNm
     */
    public String getExtColorNm() {
        return extColorNm;
    }
    /**
     * @param extColorNm the extColorNm to set
     */
    public void setExtColorNm(String extColorNm) {
        this.extColorNm = extColorNm;
    }
    /**
     * @return the intColorCd
     */
    public String getIntColorCd() {
        return intColorCd;
    }
    /**
     * @param intColorCd the intColorCd to set
     */
    public void setIntColorCd(String intColorCd) {
        this.intColorCd = intColorCd;
    }
    /**
     * @return the intColorNm
     */
    public String getIntColorNm() {
        return intColorNm;
    }
    /**
     * @param intColorNm the intColorNm to set
     */
    public void setIntColorNm(String intColorNm) {
        this.intColorNm = intColorNm;
    }
    /**
     * @return the cntTot
     */
    public int getCntTot() {
        return cntTot;
    }
    /**
     * @param cntTot the cntTot to set
     */
    public void setCntTot(int cntTot) {
        this.cntTot = cntTot;
    }
    /**
     * @return the avlbStock
     */
    public int getAvlbStock() {
        return avlbStock;
    }
    /**
     * @param avlbStock the avlbStock to set
     */
    public void setAvlbStock(int avlbStock) {
        this.avlbStock = avlbStock;
    }
    /**
     * @return the policyStock
     */
    public int getPolicyStock() {
        return policyStock;
    }
    /**
     * @param policyStock the policyStock to set
     */
    public void setPolicyStock(int policyStock) {
        this.policyStock = policyStock;
    }
    /**
     * @return the damageStock
     */
    public int getDamageStock() {
        return damageStock;
    }
    /**
     * @param damageStock the damageStock to set
     */
    public void setDamageStock(int damageStock) {
        this.damageStock = damageStock;
    }
    /**
     * @return the displayStock
     */
    public int getDisplayStock() {
        return displayStock;
    }
    /**
     * @param displayStock the displayStock to set
     */
    public void setDisplayStock(int displayStock) {
        this.displayStock = displayStock;
    }
    /**
     * @return the longStock
     */
    public int getLongStock() {
        return longStock;
    }
    /**
     * @param longStock the longStock to set
     */
    public void setLongStock(int longStock) {
        this.longStock = longStock;
    }
    /**
     * @return the dlrStock
     */
    public int getDlrStock() {
        return dlrStock;
    }
    /**
     * @param dlrStock the dlrStock to set
     */
    public void setDlrStock(int dlrStock) {
        this.dlrStock = dlrStock;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}