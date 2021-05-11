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
 * @ClassName   : WorkGroupMasterVO.java
 * @Description : 소조마스터 VO
 * @author KyungMok Kim
 * @since 2016. 2. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 23.    KyungMok Kim     최초 생성
 * </pre>
 */

public class WorkGroupMasterVO extends BaseVO {

    private static final long serialVersionUID = -4691080138511732369L;

    private String dlrCd;          // 딜러코드
    private String wkgrpNo;        // 소조번호
    private String wkgrpNm;        // 소조명
    private String wkgrpStatCd;    // 반조상태코드
    private String mngSaId;        // SA관리ID
    private String mngSaNm;        // SA관리명
    private String bayGrpTp;       // bay그룹유형
    private String rpirTp;          // 수리유형
    
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date wkgrpUseDt;       // 반조사용시간
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date wkgrpStopDt;      // 반조종료시간
    private String wkgrpRemark;    // 반조비고


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
     * @return the wkgrpNo
     */
    public String getWkgrpNo() {
        return wkgrpNo;
    }
    /**
     * @param wkgrpNo the wkgrpNo to set
     */
    public void setWkgrpNo(String wkgrpNo) {
        this.wkgrpNo = wkgrpNo;
    }
    /**
     * @return the wkgrpNm
     */
    public String getWkgrpNm() {
        return wkgrpNm;
    }
    /**
     * @param wkgrpNm the wkgrpNm to set
     */
    public void setWkgrpNm(String wkgrpNm) {
        this.wkgrpNm = wkgrpNm;
    }
    
    public String getWkgrpStatCd() {
        return wkgrpStatCd;
    }
    public void setWkgrpStatCd(String wkgrpStatCd) {
        this.wkgrpStatCd = wkgrpStatCd;
    }
    /**
     * @return the mngSaId
     */
    public String getMngSaId() {
        return mngSaId;
    }
    /**
     * @param mngSaId the mngSaId to set
     */
    public void setMngSaId(String mngSaId) {
        this.mngSaId = mngSaId;
    }
    /**
     * @return the mngSaNm
     */
    public String getMngSaNm() {
        return mngSaNm;
    }
    /**
     * @param mngSaNm the mngSaNm to set
     */
    public void setMngSaNm(String mngSaNm) {
        this.mngSaNm = mngSaNm;
    }
    /**
     * @return the bayGrpTp
     */
    public String getBayGrpTp() {
        return bayGrpTp;
    }
    /**
     * @param bayGrpTp the bayGrpTp to set
     */
    public void setBayGrpTp(String bayGrpTp) {
        this.bayGrpTp = bayGrpTp;
    }
    
    public String getRpirTp() {
        return rpirTp;
    }
    public void setRpirTp(String rpirTp) {
        this.rpirTp = rpirTp;
    }
    public Date getWkgrpUseDt() {
        return wkgrpUseDt;
    }
    public void setWkgrpUseDt(Date wkgrpUseDt) {
        this.wkgrpUseDt = wkgrpUseDt;
    }
    public Date getWkgrpStopDt() {
        return wkgrpStopDt;
    }
    public void setWkgrpStopDt(Date wkgrpStopDt) {
        this.wkgrpStopDt = wkgrpStopDt;
    }
    public String getWkgrpRemark() {
        return wkgrpRemark;
    }
    public void setWkgrpRemark(String wkgrpRemark) {
        this.wkgrpRemark = wkgrpRemark;
    }



}
