package chn.bhmc.dms.cmm.cmp.vo;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PlantVO.java
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
public class PlantVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5198889149866302573L;

    @NotEmpty
    private String pltCd;

    @NotEmpty
    private String dlrCd;

    @NotEmpty
    private String pltNm;

    @NotEmpty
    private String calendarId;

    @NotNull
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date fstStartDt;

    @NotNull
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date endDdlnDt;

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
     * @return the calendarId
     */
    public String getCalendarId() {
        return calendarId;
    }
    /**
     * @param calendarId the calendarId to set
     */
    public void setCalendarId(String calendarId) {
        this.calendarId = calendarId;
    }

    /**
     * @return the fstStartDt
     */
    public Date getFstStartDt() {
        return fstStartDt;
    }
    /**
     * @param fstStartDt the fstStartDt to set
     */
    public void setFstStartDt(Date fstStartDt) {
        this.fstStartDt = fstStartDt;
    }
    /**
     * @return the endDdlnDt
     */
    public Date getEndDdlnDt() {
        return endDdlnDt;
    }
    /**
     * @param endDdlnDt the endDdlnDt to set
     */
    public void setEndDdlnDt(Date endDdlnDt) {
        this.endDdlnDt = endDdlnDt;
    }

}