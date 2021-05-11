package chn.bhmc.dms.sal.prm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PromotionVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 2. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 15.    Kim yewon               최초 생성
 * </pre>
 */

public class PromotionSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    private String sDlrCd;                               // 딜러코드
    private String sApproveCd;                           // 승인여부
    private String sPromotionTp;                         // 프로모션유형

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartDt;                             // 시작일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndDt;                               // 종료일자

    private String sCarlineCd;                           // 차종
    private String sModelCd;                             // 모델
    private String sPromotionCd;                         // 프로모션코드
    private String sGb;                                  // 조회대상구분(계약품의에서 호출시 필요)
    private String sContractDt;                          // 계약일자(계약품의에서 호출시 필요)




    /**
     * @return the sContractDt
     */
    public String getsContractDt() {
        return sContractDt;
    }
    /**
     * @param sContractDt the sContractDt to set
     */
    public void setsContractDt(String sContractDt) {
        this.sContractDt = sContractDt;
    }
    /**
     * @return the sGb
     */
    public String getsGb() {
        return sGb;
    }
    /**
     * @param sGb the sGb to set
     */
    public void setsGb(String sGb) {
        this.sGb = sGb;
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
     * @return the sApproveCd
     */
    public String getsApproveCd() {
        return sApproveCd;
    }
    /**
     * @param sApproveCd the sApproveCd to set
     */
    public void setsApproveCd(String sApproveCd) {
        this.sApproveCd = sApproveCd;
    }
    /**
     * @return the sPromotionTp
     */
    public String getsPromotionTp() {
        return sPromotionTp;
    }
    /**
     * @param sPromotionTp the sPromotionTp to set
     */
    public void setsPromotionTp(String sPromotionTp) {
        this.sPromotionTp = sPromotionTp;
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
     * @return the sCarlineCd
     */
    public String getsCarlineCd() {
        return sCarlineCd;
    }
    /**
     * @param sCarlineCd the sCarlineCd to set
     */
    public void setsCarlineCd(String sCarlineCd) {
        this.sCarlineCd = sCarlineCd;
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
     * @return the sPromotionCd
     */
    public String getsPromotionCd() {
        return sPromotionCd;
    }
    /**
     * @param sPromotionCd the sPromotionCd to set
     */
    public void setsPromotionCd(String sPromotionCd) {
        this.sPromotionCd = sPromotionCd;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }


}
