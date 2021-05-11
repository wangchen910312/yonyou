package chn.bhmc.dms.sal.ond.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : OnLineDlrTransfReqSearchVO
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee Seungin
 * @since 2017. 03. 04.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 03. 04.     Lee Seungmin             최초 생성
 *
 * </pre>
 */

public class OnLineDlrTransfApprSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8070810599758939570L;
    private String sRecivComNm;                     //수령회사명칭
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sReqStartDt;                       //신청일 - 시작일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sReqEndDt;                         //신청일 - 종료일
    private String sDlrCd;
    private String sUsrId;
    private String sUseYn;
    private String sCarlineCd;
    private String sModelCd;
    private String sOcnCd;
    private String sExtColorCd;
    private String sIntColorCd;
    private String sReptToRecv;
    private String sEvalRsltCd;


    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    /**
     * @return the sRecivComNm
     */
    public String getsRecivComNm() {
        return sRecivComNm;
    }
    /**
     * @return the sReqStartDt
     */
    public Date getsReqStartDt() {
        return sReqStartDt;
    }
    /**
     * @return the sReqEndDt
     */
    public Date getsReqEndDt() {
        return sReqEndDt;
    }
    /**
     * @param sRecivComNm the sRecivComNm to set
     */
    public void setsRecivComNm(String sRecivComNm) {
        this.sRecivComNm = sRecivComNm;
    }
    /**
     * @param sReqStartDt the sReqStartDt to set
     */
    public void setsReqStartDt(Date sReqStartDt) {
        this.sReqStartDt = sReqStartDt;
    }
    /**
     * @param sReqEndDt the sReqEndDt to set
     */
    public void setsReqEndDt(Date sReqEndDt) {
        this.sReqEndDt = sReqEndDt;
    }
    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }
    /**
     * @return the sUsrId
     */
    public String getsUsrId() {
        return sUsrId;
    }
    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }
    /**
     * @param sUsrId the sUsrId to set
     */
    public void setsUsrId(String sUsrId) {
        this.sUsrId = sUsrId;
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
     * @return the sCarlineCd
     */
    public String getsCarlineCd() {
        return sCarlineCd;
    }
    /**
     * @return the sModelCd
     */
    public String getsModelCd() {
        return sModelCd;
    }
    /**
     * @return the sOcnCd
     */
    public String getsOcnCd() {
        return sOcnCd;
    }
    /**
     * @return the sExtColorCd
     */
    public String getsExtColorCd() {
        return sExtColorCd;
    }
    /**
     * @return the sIntColorCd
     */
    public String getsIntColorCd() {
        return sIntColorCd;
    }
    /**
     * @param sCarlineCd the sCarlineCd to set
     */
    public void setsCarlineCd(String sCarlineCd) {
        this.sCarlineCd = sCarlineCd;
    }
    /**
     * @param sModelCd the sModelCd to set
     */
    public void setsModelCd(String sModelCd) {
        this.sModelCd = sModelCd;
    }
    /**
     * @param sOcnCd the sOcnCd to set
     */
    public void setsOcnCd(String sOcnCd) {
        this.sOcnCd = sOcnCd;
    }
    /**
     * @param sExtColorCd the sExtColorCd to set
     */
    public void setsExtColorCd(String sExtColorCd) {
        this.sExtColorCd = sExtColorCd;
    }
    /**
     * @param sIntColorCd the sIntColorCd to set
     */
    public void setsIntColorCd(String sIntColorCd) {
        this.sIntColorCd = sIntColorCd;
    }
    /**
     * @return the sReptToRecv
     */
    public String getsReptToRecv() {
        return sReptToRecv;
    }
    /**
     * @return the sEvalRsltCd
     */
    public String getsEvalRsltCd() {
        return sEvalRsltCd;
    }
    /**
     * @param sReptToRecv the sReptToRecv to set
     */
    public void setsReptToRecv(String sReptToRecv) {
        this.sReptToRecv = sReptToRecv;
    }
    /**
     * @param sEvalRsltCd the sEvalRsltCd to set
     */
    public void setsEvalRsltCd(String sEvalRsltCd) {
        this.sEvalRsltCd = sEvalRsltCd;
    }

}