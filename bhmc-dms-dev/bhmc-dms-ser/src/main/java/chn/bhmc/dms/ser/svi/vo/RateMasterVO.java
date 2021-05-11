package chn.bhmc.dms.ser.svi.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotBlank;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * 임률관리 VO
 * </pre>
 *
 * @ClassName   : RateMasterVO.java
 * @Description : 임률관리 VO.
 * @author Yin Xueyuan
 * @since 2016. 1. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 25.     Yin Xueyuan     최초 생성
 * </pre>
 */

public class RateMasterVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5800841956681934408L;

    /**
     * 딜러코드
     */
    private String dlrCd;

    /**
     * 임률코드
     */
    private String rteCd;

    /**
     * RO유형
     */
    @NotBlank
    private String roTp;

    /**
     * 임률금액
     */
    private Double rteAmt;

    /**
     * 적용시작일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date applyStartDt;

    /**
     * 적용종료일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date applyEndDt;

    /**
     * 사용여부
     */
    private String useYn;

    /**
     * 사용코드
     */
    private String useCd;

    /**
     * 사용명
     */
    private String useNm;

    /**
     * 브랜드코드
     */
    private String brandCd;

    public String getDlrCd() {
        return dlrCd;
    }

    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    public String getRteCd() {
        return rteCd;
    }

    public void setRteCd(String rteCd) {
        this.rteCd = rteCd;
    }

    public String getRoTp() {
        return roTp;
    }

    public void setRoTp(String roTp) {
        this.roTp = roTp;
    }

    public Double getRteAmt() {
        return rteAmt;
    }

    public void setRteAmt(Double rteAmt) {
        this.rteAmt = rteAmt;
    }

    public Date getApplyStartDt() {
        return applyStartDt;
    }

    public void setApplyStartDt(Date applyStartDt) {
        this.applyStartDt = applyStartDt;
    }

    public Date getApplyEndDt() {
        return applyEndDt;
    }

    public void setApplyEndDt(Date applyEndDt) {
        this.applyEndDt = applyEndDt;
    }

    public String getUseYn() {
        return useYn;
    }

    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }

    public String getUseCd() {
        return useCd;
    }

    public void setUseCd(String useCd) {
        this.useCd = useCd;
    }

    public String getUseNm() {
        return useNm;
    }

    public void setUseNm(String useNm) {
        this.useNm = useNm;
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

}
