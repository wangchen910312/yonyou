package chn.bhmc.dms.ser.svi.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : WorkGroupManageSearchVO.java
 * @Description : WorkGroupManageSearchVO
 * @author KyungMok Kim
 * @since 2016. 1. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 23.    KyungMok Kim     최초 생성
 * </pre>
 */

public class WorkGroupManageSearchVO extends SearchVO {

	private static final long serialVersionUID = -6579755691883848482L;

	private String sDlrCd;         // 딜러코드

	private String sWkgrpNo;       // 소조번호

	private String sWkgrpNm;       // 소조명칭

	private String sMngSaNm;       // 소조관리인

	private String sMngSaId;       // 소조관리인 ID

	private String sWkgrpStatCd;         // 반조상태

	@JsonDeserialize(using=JsonDateDeserializer.class)
	private Date sRegFromDt;       // 반조생성시간

	@JsonDeserialize(using=JsonDateDeserializer.class)
	private Date sRegToDt;         // 반조생성시간

	private String sSysNo;

	private String sTecId;


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
     * @return the sWkgrpNo
     */
    public String getsWkgrpNo() {
        return sWkgrpNo;
    }
    /**
     * @param sWkgrpNo the sWkgrpNo to set
     */
    public void setsWkgrpNo(String sWkgrpNo) {
        this.sWkgrpNo = sWkgrpNo;
    }

    public String getsWkgrpNm() {
        return sWkgrpNm;
    }
    public void setsWkgrpNm(String sWkgrpNm) {
        this.sWkgrpNm = sWkgrpNm;
    }
    public String getsMngSaId() {
        return sMngSaId;
    }
    public void setsMngSaId(String sMngSaId) {
        this.sMngSaId = sMngSaId;
    }

    /**
     * @return the sMngSaNm
     */
    public String getsMngSaNm() {
        return sMngSaNm;
    }
    /**
     * @param sMngSaNm the sMngSaNm to set
     */
    public void setsMngSaNm(String sMngSaNm) {
        this.sMngSaNm = sMngSaNm;
    }


    public String getsWkgrpStatCd() {
        return sWkgrpStatCd;
    }
    public void setsWkgrpStatCd(String sWkgrpStatCd) {
        this.sWkgrpStatCd = sWkgrpStatCd;
    }
    /**
     * @return the sRegFromDt
     */
    public Date getsRegFromDt() {
        return sRegFromDt;
    }
    /**
     * @param sRegFromDt the sRegFromDt to set
     */
    public void setsRegFromDt(Date sRegFromDt) {
        this.sRegFromDt = sRegFromDt;
    }
    /**
     * @return the sRegToDt
     */
    public Date getsRegToDt() {
        return sRegToDt;
    }
    /**
     * @param sRegToDt the sRegToDt to set
     */
    public void setsRegToDt(Date sRegToDt) {
        this.sRegToDt = sRegToDt;
    }
    /**
     * @return the sSysNo
     */
    public String getsSysNo() {
        return sSysNo;
    }
    /**
     * @param sSysNo the sSysNo to set
     */
    public void setsSysNo(String sSysNo) {
        this.sSysNo = sSysNo;
    }
    /**
     * @return the sTecId
     */
    public String getsTecId() {
        return sTecId;
    }
    /**
     * @param sTecId the sTecId to set
     */
    public void setsTecId(String sTecId) {
        this.sTecId = sTecId;
    }

}
