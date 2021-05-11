package chn.bhmc.dms.ser.wac.vo;

import java.util.Date;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : SanbaoBaseVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 5. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *  since   author description
 * =========== ============= ===========================
 * 2016. 5. 12.  Kwon Ki Hyun  최초 생성
 * </pre>
 */
@ValidDescriptor({
     @ValidField(field="applyDstinCd", mesgKey="global.lbl.vinNo")
     ,@ValidField(field="wartApplyStartDt", mesgKey="ser.lbl.wartStartDt")
     ,@ValidField(field="wartApplyEndDt", mesgKey="ser.lbl.wartEndDt")
})
public class SanbaoBaseVO extends BaseVO{
     
    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = -8392791431823142347L;

    /**
     * 적용구분코드 
     **/
    @NotEmpty
    private String applyDstinCd;  
     
    /**
     * 라인번호 
     **/
    private int lineNo;   
     
    /**
     * 적용기간 
     **/
    @Length(min=1, max=2)
    private int applyPrid;   
     
    /**
     * 주행거리값 
     **/
    @Length(min=1, max=7)
    private int runDistVal;  
     
    /**
     * 비율  
     **/
    private Double rate; 
     
    /**
     * 알림시작조건값 
     **/
    @Length(min=1, max=2)
    private int alrtStartTermVal; 
     
    /**
     * 기술자문조건값 
     **/
    @Length(min=1, max=2)
    private int tcavTermVal;  
     
    /**
     * 보증적용시작일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    @NotEmpty
    private Date wartApplyStartDt; 
     
    /**
     * 보증적용종료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    @NotEmpty
    private Date wartApplyEndDt;

    /**
     * @return the applyDstinCd
     */
    public String getApplyDstinCd() {
        return applyDstinCd;
    }

    /**
     * @param applyDstinCd the applyDstinCd to set
     */
    public void setApplyDstinCd(String applyDstinCd) {
        this.applyDstinCd = applyDstinCd;
    }

    /**
     * @return the lineNo
     */
    public int getLineNo() {
        return lineNo;
    }

    /**
     * @param lineNo the lineNo to set
     */
    public void setLineNo(int lineNo) {
        this.lineNo = lineNo;
    }

    /**
     * @return the applyPrid
     */
    public int getApplyPrid() {
        return applyPrid;
    }

    /**
     * @param applyPrid the applyPrid to set
     */
    public void setApplyPrid(int applyPrid) {
        this.applyPrid = applyPrid;
    }

    /**
     * @return the runDistVal
     */
    public int getRunDistVal() {
        return runDistVal;
    }

    /**
     * @param runDistVal the runDistVal to set
     */
    public void setRunDistVal(int runDistVal) {
        this.runDistVal = runDistVal;
    }

    /**
     * @return the rate
     */
    public Double getRate() {
        return rate;
    }

    /**
     * @param rate the rate to set
     */
    public void setRate(Double rate) {
        this.rate = rate;
    }

    /**
     * @return the alrtStartTermVal
     */
    public int getAlrtStartTermVal() {
        return alrtStartTermVal;
    }

    /**
     * @param alrtStartTermVal the alrtStartTermVal to set
     */
    public void setAlrtStartTermVal(int alrtStartTermVal) {
        this.alrtStartTermVal = alrtStartTermVal;
    }

    /**
     * @return the tcavTermVal
     */
    public int getTcavTermVal() {
        return tcavTermVal;
    }

    /**
     * @param tcavTermVal the tcavTermVal to set
     */
    public void setTcavTermVal(int tcavTermVal) {
        this.tcavTermVal = tcavTermVal;
    }

    /**
     * @return the wartApplyStartDt
     */
    public Date getWartApplyStartDt() {
        return wartApplyStartDt;
    }

    /**
     * @param wartApplyStartDt the wartApplyStartDt to set
     */
    public void setWartApplyStartDt(Date wartApplyStartDt) {
        this.wartApplyStartDt = wartApplyStartDt;
    }

    /**
     * @return the wartApplyEndDt
     */
    public Date getWartApplyEndDt() {
        return wartApplyEndDt;
    }

    /**
     * @param wartApplyEndDt the wartApplyEndDt to set
     */
    public void setWartApplyEndDt(Date wartApplyEndDt) {
        this.wartApplyEndDt = wartApplyEndDt;
    } 
    
    
     
}
