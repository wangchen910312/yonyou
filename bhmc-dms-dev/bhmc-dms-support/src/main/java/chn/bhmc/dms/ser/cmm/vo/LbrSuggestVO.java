package chn.bhmc.dms.ser.cmm.vo;

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
 * @ClassName   : LbrSuggestVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2017. 1. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 1. 17.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public class LbrSuggestVO extends BaseVO {
    
    
    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = 8338548785930271386L;

    /**
     * PREFIX ID 
     **/
    @NotEmpty
    private  String     preFixId;  
     
    /**
     * 딜러코드      
     **/
    @NotEmpty
    private  String     dlrCd;     
     
    /**
     * 업무번호      
     **/
    @NotEmpty
    private  String     jobNo;     
     
    /**
     * 라인번호      
     **/
    private  int        lineNo;    
    
    /**
     * 차대번호
     */
    private String vinNo;
     
    /**
     * 공임코드      
     **/
    //LBR_CD
    private  String     lbrCd;     
     
    /**
     * 공임명       
     **/
    //LBR_NM
    private  String     lbrNm;     
     
    /**
     * 공임시간(수불공임)
     **/
    //LBR_HM
    private  Double     lbrHm;     
     
    /**
     * 공임유형(수리유형)
     **/
    //LBR_TP
    private  String     lbrTp;     
     
    /**
     * 정비건수      
     **/
    //SER_CNT
    private  int        serCnt;    
     
    /**
     * 공임구분      
     **/
    //DSTIN_CD
    private  String     dstinCd;   
     
    /**
     * 비고        
     **/
    //REMARK
    private  String     remark;
    
    /**
     * 등록일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;
    

    public String getPreFixId() {
        return preFixId;
    }

    public void setPreFixId(String preFixId) {
        this.preFixId = preFixId;
    }

    public String getDlrCd() {
        return dlrCd;
    }

    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    public String getJobNo() {
        return jobNo;
    }

    public void setJobNo(String jobNo) {
        this.jobNo = jobNo;
    }

    public int getLineNo() {
        return lineNo;
    }

    public void setLineNo(int lineNo) {
        this.lineNo = lineNo;
    }

    public String getVinNo() {
        return vinNo;
    }

    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }

    public String getLbrCd() {
        return lbrCd;
    }

    public void setLbrCd(String lbrCd) {
        this.lbrCd = lbrCd;
    }

    public String getLbrNm() {
        return lbrNm;
    }

    public void setLbrNm(String lbrNm) {
        this.lbrNm = lbrNm;
    }

    public Double getLbrHm() {
        return lbrHm;
    }

    public void setLbrHm(Double lbrHm) {
        this.lbrHm = lbrHm;
    }

    public String getLbrTp() {
        return lbrTp;
    }

    public void setLbrTp(String lbrTp) {
        this.lbrTp = lbrTp;
    }

    public int getSerCnt() {
        return serCnt;
    }

    public void setSerCnt(int serCnt) {
        this.serCnt = serCnt;
    }

    public String getDstinCd() {
        return dstinCd;
    }

    public void setDstinCd(String dstinCd) {
        this.dstinCd = dstinCd;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Date getRegDt() {
        return regDt;
    }

    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }    
      
 

}
