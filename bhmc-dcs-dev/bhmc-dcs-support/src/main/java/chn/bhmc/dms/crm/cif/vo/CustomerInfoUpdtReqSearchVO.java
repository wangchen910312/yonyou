package chn.bhmc.dms.crm.cif.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustomerInfoUpdtReqSearchVO
 * @Description : 클래스 설명을 기술합니다.
 * @author Kyo Jin Lee
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Kyo Jin Lee     최초 생성
 * </pre>
 */

public class CustomerInfoUpdtReqSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3804099736254610217L;

    private String sSeq;

    private String sDlrCd;

    private String sCustNo;

    private String sStatCd;

    private String sCustNm;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sReqDt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sReqDtFrom;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sReqDtTo;

    /**
     * @return the sSeq
     */
    public String getsSeq() {
        return sSeq;
    }

    /**
     * @param sSeq the sSeq to set
     */
    public void setsSeq(String sSeq) {
        this.sSeq = sSeq;
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
     * @return the sCustNo
     */
    public String getsCustNo() {
        return sCustNo;
    }

    /**
     * @param sCustNo the sCustNo to set
     */
    public void setsCustNo(String sCustNo) {
        this.sCustNo = sCustNo;
    }

    /**
     * @return the sStatCd
     */
    public String getsStatCd() {
        return sStatCd;
    }

    /**
     * @param sStatCd the sStatCd to set
     */
    public void setsStatCd(String sStatCd) {
        this.sStatCd = sStatCd;
    }

    /**
     * @return the sCustNm
     */
    public String getsCustNm() {
        return sCustNm;
    }

    /**
     * @param sCustNm the sCustNm to set
     */
    public void setsCustNm(String sCustNm) {
        this.sCustNm = sCustNm;
    }

    /**
     * @return the sReqDt
     */
    public Date getsReqDt() {
        return sReqDt;
    }

    /**
     * @param sReqDt the sReqDt to set
     */
    public void setsReqDt(Date sReqDt) {
        this.sReqDt = sReqDt;
    }

    /**
     * @return the sReqDtFrom
     */
    public Date getsReqDtFrom() {
        return sReqDtFrom;
    }

    /**
     * @param sReqDtFrom the sReqDtFrom to set
     */
    public void setsReqDtFrom(Date sReqDtFrom) {
        this.sReqDtFrom = sReqDtFrom;
    }

    /**
     * @return the sReqDtTo
     */
    public Date getsReqDtTo() {
        return sReqDtTo;
    }

    /**
     * @param sReqDtTo the sReqDtTo to set
     */
    public void setsReqDtTo(Date sReqDtTo) {
        this.sReqDtTo = sReqDtTo;
    }

}
