package chn.bhmc.dms.sal.veh.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ReceiptScanHistMgmtSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author chibeom.song
 * @since 2017. 2. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 25.     chibeom.song     최초 생성
 * </pre>
 */

public class ReceiptScanHistMgmtSearchVO extends SearchVO{

    private static final long serialVersionUID = -6023274259297438078L;

    // 검색조건
    private String langCd;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sUploadStDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sUploadEdDt;
    private String sVinNo;
    private String sReceiptNo;
    private String sDlrCd;

    /**
     * @return the langCd
     */
    public String getLangCd() {
        return langCd;
    }
    /**
     * @param langCd the langCd to set
     */
    public void setLangCd(String langCd) {
        this.langCd = langCd;
    }
    /**
     * @return the sUploadStDt
     */
    public Date getsUploadStDt() {
        return sUploadStDt;
    }
    /**
     * @param sUploadStDt the sUploadStDt to set
     */
    public void setsUploadStDt(Date sUploadStDt) {
        this.sUploadStDt = sUploadStDt;
    }
    /**
     * @return the sUploadEdDt
     */
    public Date getsUploadEdDt() {
        return sUploadEdDt;
    }
    /**
     * @param sUploadEdDt the sUploadEdDt to set
     */
    public void setsUploadEdDt(Date sUploadEdDt) {
        this.sUploadEdDt = sUploadEdDt;
    }
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
     * @return the sReceiptNo
     */
    public String getsReceiptNo() {
        return sReceiptNo;
    }
    /**
     * @param sReceiptNo the sReceiptNo to set
     */
    public void setsReceiptNo(String sReceiptNo) {
        this.sReceiptNo = sReceiptNo;
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

}
