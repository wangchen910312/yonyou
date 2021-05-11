package chn.bhmc.dms.sal.veh.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 19.     Kim yewon              최초 생성
 * </pre>
 */

public class VehicleColorSearchVO extends SearchVO{
    private static final long serialVersionUID = -6023274259297438078L;

    private String sModelCd;                  // 모델코드
    private String sModelNm;                  // 모델명
    private String sExtColorCd;               // 외장색코드
    private String sExtColorNm;               // 외장색명
    private String sIntColorCd;               // 내장색코드
    private String sIntColorNm;               // 내장색명
    private String sColorTp;                  // 색상유형
    private String sTwoToneYn;                // 투톤여부
    private String sUseYn;                    // 사용여부
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartDt;                  // 적용시작일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndDt;                    // 적용종료일






    /**
     * @return the sModelNm
     */
    public String getsModelNm() {
        return sModelNm;
    }
    /**
     * @param sModelNm the sModelNm to set
     */
    public void setsModelNm(String sModelNm) {
        this.sModelNm = sModelNm;
    }
    /**
     * @return the sExtColorNm
     */
    public String getsExtColorNm() {
        return sExtColorNm;
    }
    /**
     * @param sExtColorNm the sExtColorNm to set
     */
    public void setsExtColorNm(String sExtColorNm) {
        this.sExtColorNm = sExtColorNm;
    }
    /**
     * @return the sIntColorNm
     */
    public String getsIntColorNm() {
        return sIntColorNm;
    }
    /**
     * @param sIntColorNm the sIntColorNm to set
     */
    public void setsIntColorNm(String sIntColorNm) {
        this.sIntColorNm = sIntColorNm;
    }
    /**
     * @return the sModelCd
     */
    public String getsModelCd() {
        return sModelCd;
    }
    /**
     * @param sModelCd the sModelCd to set
     */
    public void setsModelCd(String sModelCd) {
        this.sModelCd = sModelCd;
    }
    /**
     * @return the sExtColorCd
     */
    public String getsExtColorCd() {
        return sExtColorCd;
    }
    /**
     * @param sExtColorCd the sExtColorCd to set
     */
    public void setsExtColorCd(String sExtColorCd) {
        this.sExtColorCd = sExtColorCd;
    }
    /**
     * @return the sIntColorCd
     */
    public String getsIntColorCd() {
        return sIntColorCd;
    }
    /**
     * @param sIntColorCd the sIntColorCd to set
     */
    public void setsIntColorCd(String sIntColorCd) {
        this.sIntColorCd = sIntColorCd;
    }
    /**
     * @return the sColorTp
     */
    public String getsColorTp() {
        return sColorTp;
    }
    /**
     * @param sColorTp the sColorTp to set
     */
    public void setsColorTp(String sColorTp) {
        this.sColorTp = sColorTp;
    }
    /**
     * @return the sTwoToneYn
     */
    public String getsTwoToneYn() {
        return sTwoToneYn;
    }
    /**
     * @param sTwoToneYn the sTwoToneYn to set
     */
    public void setsTwoToneYn(String sTwoToneYn) {
        this.sTwoToneYn = sTwoToneYn;
    }
    /**
     * @return the sUseYn
     */
    public String getsUseYn() {
        return sUseYn;
    }
    /**
     * @param sUseYn the sUseYn to set
     */
    public void setsUseYn(String sUseYn) {
        this.sUseYn = sUseYn;
    }

    /**
     * @return the sStartDt
     */
    public Date getsStartDt() {
        return sStartDt;
    }
    /**
     * @param sStartDt the sStartDt to set
     */
    public void setsStartDt(Date sStartDt) {
        this.sStartDt = sStartDt;
    }
    /**
     * @return the sEndDt
     */
    public Date getsEndDt() {
        return sEndDt;
    }
    /**
     * @param sEndDt the sEndDt to set
     */
    public void setsEndDt(Date sEndDt) {
        this.sEndDt = sEndDt;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
