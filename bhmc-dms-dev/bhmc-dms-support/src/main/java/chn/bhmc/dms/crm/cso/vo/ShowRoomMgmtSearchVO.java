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

public class ShowRoomMgmtSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1721429001135133265L;

    private String sDlrCd;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRegDt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRegDtFrom;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRegDtTo;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sYear;

    private String sDateTp;

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
     * @return the sYear
     */
    public Date getsYear() {
        return sYear;
    }

    /**
     * @param sYear the sYear to set
     */
    public void setsYear(Date sYear) {
        this.sYear = sYear;
    }

    /**
     * @return the sDateTp
     */
    public String getsDateTp() {
        return sDateTp;
    }

    /**
     * @param sDateTp the sDateTp to set
     */
    public void setsDateTp(String sDateTp) {
        this.sDateTp = sDateTp;
    }

    /**
     * @return the sRegDtFrom
     */
    public Date getsRegDtFrom() {
        return sRegDtFrom;
    }

    /**
     * @param sRegDtFrom the sRegDtFrom to set
     */
    public void setsRegDtFrom(Date sRegDtFrom) {
        this.sRegDtFrom = sRegDtFrom;
    }

    /**
     * @return the sRegDtTo
     */
    public Date getsRegDtTo() {
        return sRegDtTo;
    }

    /**
     * @param sRegDtTo the sRegDtTo to set
     */
    public void setsRegDtTo(Date sRegDtTo) {
        this.sRegDtTo = sRegDtTo;
    }

    /**
     * @return the sRegDt
     */
    public Date getsRegDt() {
        return sRegDt;
    }

    /**
     * @param sRegDt the sRegDt to set
     */
    public void setsRegDt(Date sRegDt) {
        this.sRegDt = sRegDt;
    }


}