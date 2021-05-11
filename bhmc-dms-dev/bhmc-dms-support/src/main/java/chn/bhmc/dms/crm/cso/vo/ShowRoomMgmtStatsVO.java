package chn.bhmc.dms.crm.cso.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 조회 SearchVO
 *
 * @ClassName   : ShowRoomMgmtSearchVO
 * @Description : ShowRoomMgmtSearchVO
 * @author in moon lee
 * @since 2016.03.07.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.07.     in moon lee     최초 생성
 * </pre>
 */

public class ShowRoomMgmtStatsVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -431280756326307489L;

    private String dlrCd;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date fromDt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date toDt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date year;

    private String dateTp;

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
     * @return the fromDt
     */
    public Date getFromDt() {
        return fromDt;
    }

    /**
     * @param fromDt the fromDt to set
     */
    public void setFromDt(Date fromDt) {
        this.fromDt = fromDt;
    }

    /**
     * @return the toDt
     */
    public Date getToDt() {
        return toDt;
    }

    /**
     * @param toDt the toDt to set
     */
    public void setToDt(Date toDt) {
        this.toDt = toDt;
    }

    /**
     * @return the year
     */
    public Date getYear() {
        return year;
    }

    /**
     * @param year the year to set
     */
    public void setYear(Date year) {
        this.year = year;
    }

    /**
     * @return the dateTp
     */
    public String getDateTp() {
        return dateTp;
    }

    /**
     * @param dateTp the dateTp to set
     */
    public void setDateTp(String dateTp) {
        this.dateTp = dateTp;
    }



}