package chn.bhmc.dms.cmm.cmp.vo;

import java.util.Date;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : StorageVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Kang Seok Han     최초 생성
 * </pre>
 */

public class StorageVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 133891399423948989L;

    @NotBlank
    @Length(max=20)
    private String strgeCd;

    @NotBlank
    @Length(max=20)
    private String pltCd;

    private String pltNm;

    @NotBlank
    @Length(max=20)
    private String dlrCd;

    @NotBlank
    @Length(max=30)
    private String strgeNm;

    @NotBlank
    @Pattern(regexp="[Y|N]")
    private String netingUseYn;

    @NotBlank
    @Pattern(regexp="[Y|N]")
    private String locMngYn;

    @NotBlank
    @Length(min=2, max=10)
    private String strgeTp;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date strgeCreDt;

    private String strgeRegPrsnNm;

    private String remark;

    /**
     * @return the strgeCd
     */
    public String getStrgeCd() {
        return strgeCd;
    }

    /**
     * @param strgeCd the strgeCd to set
     */
    public void setStrgeCd(String strgeCd) {
        this.strgeCd = strgeCd;
    }

    /**
     * @return the pltCd
     */
    public String getPltCd() {
        return pltCd;
    }

    /**
     * @param pltCd the pltCd to set
     */
    public void setPltCd(String pltCd) {
        this.pltCd = pltCd;
    }

    /**
     * @return the pltNm
     */
    public String getPltNm() {
        return pltNm;
    }

    /**
     * @param pltNm the pltNm to set
     */
    public void setPltNm(String pltNm) {
        this.pltNm = pltNm;
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
     * @return the strgeNm
     */
    public String getStrgeNm() {
        return strgeNm;
    }

    /**
     * @param strgeNm the strgeNm to set
     */
    public void setStrgeNm(String strgeNm) {
        this.strgeNm = strgeNm;
    }

    /**
     * @return the netingUseYn
     */
    public String getNetingUseYn() {
        return netingUseYn;
    }

    /**
     * @param netingUseYn the netingUseYn to set
     */
    public void setNetingUseYn(String netingUseYn) {
        this.netingUseYn = netingUseYn;
    }

    /**
     * @return the locMngYn
     */
    public String getLocMngYn() {
        return locMngYn;
    }

    /**
     * @param locMngYn the locMngYn to set
     */
    public void setLocMngYn(String locMngYn) {
        this.locMngYn = locMngYn;
    }

    /**
     * @return the strgeTp
     */
    public String getStrgeTp() {
        return strgeTp;
    }

    /**
     * @param strgeTp the strgeTp to set
     */
    public void setStrgeTp(String strgeTp) {
        this.strgeTp = strgeTp;
    }

    /**
     * @return the strgeCreDt
     */
    public Date getStrgeCreDt() {
        return strgeCreDt;
    }

    /**
     * @param strgeCreDt the strgeCreDt to set
     */
    public void setStrgeCreDt(Date strgeCreDt) {
        this.strgeCreDt = strgeCreDt;
    }

    /**
     * @return the strgeRegPrsnNm
     */
    public String getStrgeRegPrsnNm() {
        return strgeRegPrsnNm;
    }

    /**
     * @param strgeRegPrsnNm the strgeRegPrsnNm to set
     */
    public void setStrgeRegPrsnNm(String strgeRegPrsnNm) {
        this.strgeRegPrsnNm = strgeRegPrsnNm;
    }

    /**
     * @return the remark
     */
    public String getRemark() {
        return remark;
    }

    /**
     * @param remark the remark to set
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }
}
