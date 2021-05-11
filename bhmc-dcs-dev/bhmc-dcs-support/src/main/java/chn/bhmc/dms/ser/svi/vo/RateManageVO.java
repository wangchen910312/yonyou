package chn.bhmc.dms.ser.svi.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * 임률관리 VO
 * </pre>
 *
 * @ClassName : RateMasterVO.java
 * @Description : 임률관리 VO.
 * @author Yin Xueyuan
 * @since 2016. 1. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * since  author  description
 * =========== ============= ===========================
 * 2016. 1. 25. Yin Xueyuan 최초 생성
 * </pre>
 */

@ValidDescriptor({
     @ValidField(field="dlrCd", mesgKey="global.lbl.dlrCd")
    ,@ValidField(field="rteDocNo", mesgKey="global.lbl.rateCd")
    ,@ValidField(field="rpirTp", mesgKey="ser.lbl.rpirTp")
})
public class RateManageVO extends BaseVO {
        
    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = 2598836469752557733L;

    /**
     * 구분코드 
     **/
    private String dstinCd; 
     
    /**
     * 딜러코드 
     **/
    private String dlrCd; 
     
    /**
     * 임률코드 
     **/
    private String rteDocNo; 
     
    /**
     * 수리유형 
     **/
    private String rpirTp; 
     
    /**
     * 일반임률비율 
     **/
    private Double gnlRteRate; 
     
    /**
     * 보증임률비율 
     **/
    private Double wartRteRate; 
     
    /**
     * 보험임률비율 
     **/
    private Double incRteRate; 
     
    /**
     * 내부임률비율 
     **/
    private Double intRteRate; 
     
    /**
     * 재작업임률비율
     **/
    private Double rwrkRteRate; 
     
    /**
     * 브랜드코드 
     **/
    private String brandCd; 
     
    /**
     * 적용시작일자 
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date  applyStartDt; 
     
    /**
     * 적용종료일자 
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date  applyEndDt; 
     
    /**
     * 사용여부 
     **/
    private String useYn;

    /**
     * @return the dstinCd
     */
    public String getDstinCd() {
        return dstinCd;
    }

    /**
     * @param dstinCd the dstinCd to set
     */
    public void setDstinCd(String dstinCd) {
        this.dstinCd = dstinCd;
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
     * @return the rteDocNo
     */
    public String getRteDocNo() {
        return rteDocNo;
    }

    /**
     * @param rteDocNo the rteDocNo to set
     */
    public void setRteDocNo(String rteDocNo) {
        this.rteDocNo = rteDocNo;
    }

    /**
     * @return the rpirTp
     */
    public String getRpirTp() {
        return rpirTp;
    }

    /**
     * @param rpirTp the rpirTp to set
     */
    public void setRpirTp(String rpirTp) {
        this.rpirTp = rpirTp;
    }

    /**
     * @return the gnlRteRate
     */
    public Double getGnlRteRate() {
        return gnlRteRate;
    }

    /**
     * @param gnlRteRate the gnlRteRate to set
     */
    public void setGnlRteRate(Double gnlRteRate) {
        this.gnlRteRate = gnlRteRate;
    }

    /**
     * @return the wartRteRate
     */
    public Double getWartRteRate() {
        return wartRteRate;
    }

    /**
     * @param wartRteRate the wartRteRate to set
     */
    public void setWartRteRate(Double wartRteRate) {
        this.wartRteRate = wartRteRate;
    }

    /**
     * @return the incRteRate
     */
    public Double getIncRteRate() {
        return incRteRate;
    }

    /**
     * @param incRteRate the incRteRate to set
     */
    public void setIncRteRate(Double incRteRate) {
        this.incRteRate = incRteRate;
    }

    /**
     * @return the intRteRate
     */
    public Double getIntRteRate() {
        return intRteRate;
    }

    /**
     * @param intRteRate the intRteRate to set
     */
    public void setIntRteRate(Double intRteRate) {
        this.intRteRate = intRteRate;
    }

    /**
     * @return the rwrkRteRate
     */
    public Double getRwrkRteRate() {
        return rwrkRteRate;
    }

    /**
     * @param rwrkRteRate the rwrkRteRate to set
     */
    public void setRwrkRteRate(Double rwrkRteRate) {
        this.rwrkRteRate = rwrkRteRate;
    }

    /**
     * @return the brandCd
     */
    public String getBrandCd() {
        return brandCd;
    }

    /**
     * @param brandCd the brandCd to set
     */
    public void setBrandCd(String brandCd) {
        this.brandCd = brandCd;
    }

    /**
     * @return the applyStartDt
     */
    public Date getApplyStartDt() {
        return applyStartDt;
    }

    /**
     * @param applyStartDt the applyStartDt to set
     */
    public void setApplyStartDt(Date applyStartDt) {
        this.applyStartDt = applyStartDt;
    }

    /**
     * @return the applyEndDt
     */
    public Date getApplyEndDt() {
        return applyEndDt;
    }

    /**
     * @param applyEndDt the applyEndDt to set
     */
    public void setApplyEndDt(Date applyEndDt) {
        this.applyEndDt = applyEndDt;
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
     
     
     

}
