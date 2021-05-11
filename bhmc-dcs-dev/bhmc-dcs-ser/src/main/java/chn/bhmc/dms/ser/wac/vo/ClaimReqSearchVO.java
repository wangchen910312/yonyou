package chn.bhmc.dms.ser.wac.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimReqSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 5. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 17.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public class ClaimReqSearchVO extends SearchVO{
    
    
    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = -1887856162419465023L;

    /**
     * 조회 시작일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sClaimFromDt;
    
    /**
     * 조회 종료일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sClaimToDt;
    
    /**
     * 조회 시작일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRoFromDt;
    
    /**
     * 조회 종료일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRoToDt;
    
    /**
     * 차대번호
     */
    private String sVinNo;
    
    /**
     * 상태
     */
    private String sClaimStatCd;
    
    /**
     * 딜러코드
     */
    private String sDlrCd;
    
    /**
     * 클레임 유형
     */
    private String sClaimTp;
    
    /**
     * RO 유형
     */
    private String sRoTp;
    
    /**
     * LTS MODEL CD
     */
    private String sLtsModelCd;
    
    /**
     * RO 문서번호
     */
    private String sRoDocNo;
    
    /**
     * 클레임 문서번호
     */
    private String sClaimDocNo;

    
    /**
     * @return the sVinNo
     */
    public String getsVinNo() {
        return sVinNo;
    }

    /**
     * @param sVinNo the sVinNo to set
     */
    public void setsVinNo(String sVinNo) {
        this.sVinNo = sVinNo;
    }

    /**
     * @return the sClaimStatCd
     */
    public String getsClaimStatCd() {
        return sClaimStatCd;
    }

    /**
     * @param sClaimStatCd the sClaimStatCd to set
     */
    public void setsClaimStatCd(String sClaimStatCd) {
        this.sClaimStatCd = sClaimStatCd;
    }

    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }

    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    /**
     * @return the sClaimTp
     */
    public String getsClaimTp() {
        return sClaimTp;
    }

    /**
     * @param sClaimTp the sClaimTp to set
     */
    public void setsClaimTp(String sClaimTp) {
        this.sClaimTp = sClaimTp;
    }

    /**
     * @return the sRoTp
     */
    public String getsRoTp() {
        return sRoTp;
    }

    /**
     * @param sRoTp the sRoTp to set
     */
    public void setsRoTp(String sRoTp) {
        this.sRoTp = sRoTp;
    }

    /**
     * @return the sLtsModelCd
     */
    public String getsLtsModelCd() {
        return sLtsModelCd;
    }

    /**
     * @param sLtsModelCd the sLtsModelCd to set
     */
    public void setsLtsModelCd(String sLtsModelCd) {
        this.sLtsModelCd = sLtsModelCd;
    }

    /**
     * @return the sRoDocNo
     */
    public String getsRoDocNo() {
        return sRoDocNo;
    }

    /**
     * @param sRoDocNo the sRoDocNo to set
     */
    public void setsRoDocNo(String sRoDocNo) {
        this.sRoDocNo = sRoDocNo;
    }

    /**
     * @return the sClaimDocNo
     */
    public String getsClaimDocNo() {
        return sClaimDocNo;
    }

    /**
     * @param sClaimDocNo the sClaimDocNo to set
     */
    public void setsClaimDocNo(String sClaimDocNo) {
        this.sClaimDocNo = sClaimDocNo;
    }

    /**
     * @return the sClaimFromDt
     */
    public Date getsClaimFromDt() {
        return sClaimFromDt;
    }

    /**
     * @param sClaimFromDt the sClaimFromDt to set
     */
    public void setsClaimFromDt(Date sClaimFromDt) {
        this.sClaimFromDt = sClaimFromDt;
    }

    /**
     * @return the sClaimToDt
     */
    public Date getsClaimToDt() {
        return sClaimToDt;
    }

    /**
     * @param sClaimToDt the sClaimToDt to set
     */
    public void setsClaimToDt(Date sClaimToDt) {
        this.sClaimToDt = sClaimToDt;
    }

    /**
     * @return the sRoFromDt
     */
    public Date getsRoFromDt() {
        return sRoFromDt;
    }

    /**
     * @param sRoFromDt the sRoFromDt to set
     */
    public void setsRoFromDt(Date sRoFromDt) {
        this.sRoFromDt = sRoFromDt;
    }

    /**
     * @return the sRoToDt
     */
    public Date getsRoToDt() {
        return sRoToDt;
    }

    /**
     * @param sRoToDt the sRoToDt to set
     */
    public void setsRoToDt(Date sRoToDt) {
        this.sRoToDt = sRoToDt;
    } 
    
    

}
