package chn.bhmc.dms.sal.orc.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotAssignedOrderSearchVO.java
 * @Description : 미배정 주문조회 조건 VO
 * @author Bong
 * @since 2016. 3. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 10.     Bong                 최초 생성
 * </pre>
 */

public class NotAssignedOrderSearchVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6310606794936967133L;

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    private String sCarlineCd;   // 차종코드
    private String sModelCd;     // 모델코드
    private String sOcnCd;       // OCN코드
    private String sExtColorCd;  // 외색코드
    private String sIntColorCd;  // 내색코드
    private String sDlrCd;       // 딜러코드
    private String sOrdTp;       // 오더타입코드
    private String sPaym;
    private String sFscNm;
    private String sFscCd;
    private String sOrdStartDtStr;
    private String sOrdEndDtStr;
    private String sAdjStatCd;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   sOrdStartDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   sOrdEndDt;
    private  String                 sOrdPrid;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   sOrdDtS;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   sOrdDtE;

    // 주문취소 신청 일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   sAskDtS;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   sAskDtE;





    /**
     * @return the sAskDtS
     */
    public Date getsAskDtS() {
        return sAskDtS;
    }
    /**
     * @param sAskDtS the sAskDtS to set
     */
    public void setsAskDtS(Date sAskDtS) {
        this.sAskDtS = sAskDtS;
    }
    /**
     * @return the sAskDtE
     */
    public Date getsAskDtE() {
        return sAskDtE;
    }
    /**
     * @param sAskDtE the sAskDtE to set
     */
    public void setsAskDtE(Date sAskDtE) {
        this.sAskDtE = sAskDtE;
    }
    /**
     * @return the sFscCd
     */
    public String getsFscCd() {
        return sFscCd;
    }
    /**
     * @param sFscCd the sFscCd to set
     */
    public void setsFscCd(String sFscCd) {
        this.sFscCd = sFscCd;
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
     * @return the sOcnCd
     */
    public String getsOcnCd() {
        return sOcnCd;
    }
    /**
     * @param sOcnCd the sOcnCd to set
     */
    public void setsOcnCd(String sOcnCd) {
        this.sOcnCd = sOcnCd;
    }
    /**
     * @return the sExtColorCd
     */
    public String getsExtColorCd() {
        return sExtColorCd;
    }
    /**
     * @param sExtColorCd the sExtColorCd to set
     */
    public void setsExtColorCd(String sExtColorCd) {
        this.sExtColorCd = sExtColorCd;
    }
    /**
     * @return the sIntColorCd
     */
    public String getsIntColorCd() {
        return sIntColorCd;
    }
    /**
     * @param sIntColorCd the sIntColorCd to set
     */
    public void setsIntColorCd(String sIntColorCd) {
        this.sIntColorCd = sIntColorCd;
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
     * @return the sOrdTp
     */
    public String getsOrdTp() {
        return sOrdTp;
    }
    /**
     * @param sOrdTp the sOrdTp to set
     */
    public void setsOrdTp(String sOrdTp) {
        this.sOrdTp = sOrdTp;
    }
    /**
     * @return the sPaym
     */
    public String getsPaym() {
        return sPaym;
    }
    /**
     * @param sPaym the sPaym to set
     */
    public void setsPaym(String sPaym) {
        this.sPaym = sPaym;
    }
    /**
     * @return the sFscNm
     */
    public String getsFscNm() {
        return sFscNm;
    }
    /**
     * @param sFscNm the sFscNm to set
     */
    public void setsFscNm(String sFscNm) {
        this.sFscNm = sFscNm;
    }
    /**
     * @return the sOrdStartDtStr
     */
    public String getsOrdStartDtStr() {
        return sOrdStartDtStr;
    }
    /**
     * @param sOrdStartDtStr the sOrdStartDtStr to set
     */
    public void setsOrdStartDtStr(String sOrdStartDtStr) {
        this.sOrdStartDtStr = sOrdStartDtStr;
    }
    /**
     * @return the sOrdEndDtStr
     */
    public String getsOrdEndDtStr() {
        return sOrdEndDtStr;
    }
    /**
     * @param sOrdEndDtStr the sOrdEndDtStr to set
     */
    public void setsOrdEndDtStr(String sOrdEndDtStr) {
        this.sOrdEndDtStr = sOrdEndDtStr;
    }
    /**
     * @return the sOrdStartDt
     */
    public Date getsOrdStartDt() {
        return sOrdStartDt;
    }
    /**
     * @param sOrdStartDt the sOrdStartDt to set
     */
    public void setsOrdStartDt(Date sOrdStartDt) {
        this.sOrdStartDt = sOrdStartDt;
    }
    /**
     * @return the sOrdEndDt
     */
    public Date getsOrdEndDt() {
        return sOrdEndDt;
    }
    /**
     * @param sOrdEndDt the sOrdEndDt to set
     */
    public void setsOrdEndDt(Date sOrdEndDt) {
        this.sOrdEndDt = sOrdEndDt;
    }
    /**
     * @return the sOrdPrid
     */
    public String getsOrdPrid() {
        return sOrdPrid;
    }
    /**
     * @param sOrdPrid the sOrdPrid to set
     */
    public void setsOrdPrid(String sOrdPrid) {
        this.sOrdPrid = sOrdPrid;
    }
    /**
     * @return the sOrdDtS
     */
    public Date getsOrdDtS() {
        return sOrdDtS;
    }
    /**
     * @param sOrdDtS the sOrdDtS to set
     */
    public void setsOrdDtS(Date sOrdDtS) {
        this.sOrdDtS = sOrdDtS;
    }
    /**
     * @return the sOrdDtE
     */
    public Date getsOrdDtE() {
        return sOrdDtE;
    }
    /**
     * @param sOrdDtE the sOrdDtE to set
     */
    public void setsOrdDtE(Date sOrdDtE) {
        this.sOrdDtE = sOrdDtE;
    }
    /**
     * @return the sAdjStatCd
     */
    public String getsAdjStatCd() {
        return sAdjStatCd;
    }
    /**
     * @param sAdjStatCd the sAdjStatCd to set
     */
    public void setsAdjStatCd(String sAdjStatCd) {
        this.sAdjStatCd = sAdjStatCd;
    }
}