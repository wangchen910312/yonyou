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
 * @ClassName : SanbaoBasePartVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 5. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * since author description
 * =========== ============= ===========================
 * 2016. 5. 12. Kwon Ki Hyun 최초 생성
 * </pre>
 */
@ValidDescriptor({
     @ValidField(field="itemGrpCd", mesgKey="ser.lbl.itemGrp")
     ,@ValidField(field="itemGrpNm", mesgKey="ser.lbl.itemGrpNm")
     ,@ValidField(field="itemAtcCd", mesgKey="ser.lbl.itemAtc")
     ,@ValidField(field="applyStartDt", mesgKey="ser.lbl.applyStartDt")
     ,@ValidField(field="applyEndDt", mesgKey="ser.lbl.applyEndDt")
})
public class SanbaoBasePartVO extends BaseVO{
    
     /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = 8034126589913385894L;
    
    private String vinNo;
    
    private String dlrCd;
    
    private String ltsModelCd;
    
    private String ltsModelNm;

    /**
     * 품목그룹코드 
     **/
    @NotEmpty
    private String itemGrpCd; 
     
    /**
     * 품목그룹명 
     **/
    @NotEmpty
    private String itemGrpNm; 
     
    /**
     * 품목항목코드 
     **/
    private String itemAtcCd; 
     
    /**
     * 동일하자교환조건값
     **/
    @Length(min=1, max=2)
    private int sameFauExchTermVal; 
     
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
     * 적용시작일자 
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date applyStartDt; 
     
    /**
     * 적용종료일자 
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date applyEndDt;
    
    /**
     * 대상여부 
     */
    private String itemGrpYn;
    
    /**
     * 발생횟수
     */
    private String occrCnt;
    
    private String carlineNm;
    
    

    public String getVinNo() {
        return vinNo;
    }

    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }

    public String getDlrCd() {
        return dlrCd;
    }

    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }
    
    

    public String getLtsModelCd() {
        return ltsModelCd;
    }

    public void setLtsModelCd(String ltsModelCd) {
        this.ltsModelCd = ltsModelCd;
    }

    public String getLtsModelNm() {
        return ltsModelNm;
    }

    public void setLtsModelNm(String ltsModelNm) {
        this.ltsModelNm = ltsModelNm;
    }

    /**
     * @return the itemGrpCd
     */
    public String getItemGrpCd() {
        return itemGrpCd;
    }

    /**
     * @param itemGrpCd the itemGrpCd to set
     */
    public void setItemGrpCd(String itemGrpCd) {
        this.itemGrpCd = itemGrpCd;
    }

    /**
     * @return the itemGrpNm
     */
    public String getItemGrpNm() {
        return itemGrpNm;
    }

    /**
     * @param itemGrpNm the itemGrpNm to set
     */
    public void setItemGrpNm(String itemGrpNm) {
        this.itemGrpNm = itemGrpNm;
    }

    /**
     * @return the itemAtcCd
     */
    public String getItemAtcCd() {
        return itemAtcCd;
    }

    /**
     * @param itemAtcCd the itemAtcCd to set
     */
    public void setItemAtcCd(String itemAtcCd) {
        this.itemAtcCd = itemAtcCd;
    }

    /**
     * @return the sameFauExchTermVal
     */
    public int getSameFauExchTermVal() {
        return sameFauExchTermVal;
    }

    /**
     * @param sameFauExchTermVal the sameFauExchTermVal to set
     */
    public void setSameFauExchTermVal(int sameFauExchTermVal) {
        this.sameFauExchTermVal = sameFauExchTermVal;
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
     * @return the itemGrpYn
     */
    public String getItemGrpYn() {
        return itemGrpYn;
    }

    /**
     * @param itemGrpYn the itemGrpYn to set
     */
    public void setItemGrpYn(String itemGrpYn) {
        this.itemGrpYn = itemGrpYn;
    }

    /**
     * @return the occrCnt
     */
    public String getOccrCnt() {
        return occrCnt;
    }

    /**
     * @param occrCnt the occrCnt to set
     */
    public void setOccrCnt(String occrCnt) {
        this.occrCnt = occrCnt;
    }

    public String getCarlineNm() {
        return carlineNm;
    }

    public void setCarlineNm(String carlineNm) {
        this.carlineNm = carlineNm;
    } 
    
    
     

}
