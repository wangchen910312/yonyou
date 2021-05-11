package chn.bhmc.dms.mis.tdm.vo;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * [딜러사] 목표분해도
 * </pre>
 *
 * @ClassName   : TargetDcptMgmtBaseVO.java
 * @Description : [딜러사] 목표분해도
 * @author chibeom.song
 * @since 2016. 7. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 21.   chibeom.song     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dealerDlrTp"            , mesgKey="mis.lbl.dealerconfig")
   ,@ValidField(field="dealerCarlineCd"        , mesgKey="mis.lbl.carlineCd")
   ,@ValidField(field="dealerGoalPrefVal"        , mesgKey="mis.lbl.dealergoalprefval")
   })
public class TargetDcptMgmtBaseVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1566890295849129058L;

 // 목표분해도 - 딜러분해(판매)
    private String sDealerDcptYear;             // 년도
    private String sDealerDcptMonth;            // 월
    private String sDealerDcptYearParam;
    private String sDealerDcptMonthParam;

    private String sDealerSaleDcptYyMm;

    private String dealerGoalYy;                // 목표년도
    private String dealerGoalMm;                // 목표월
    private String dealerSdptCd;                // 사업부코드
    private String dealerOfficeCd;              // 사무소코드
    private String dealerDlrCd;                 // 딜러코드
    private String dealerDlrTp;                 // 딜러유형
    private String dealerGoalTp;                // 목표유형
    private String dealerCarlineCd;             // 차종코드
    private String dealerCarlineNm;             // 차종명
    private String dealerGoalPrefVal;           // 목표설정값
    private String dealerPrefTp;                // 설정유형
    private String dealerRegUsrId;              // 등록자ID
    private String dealerRegDt;                 // 등록일자
    private String dealerUpdtUsrId;             // 수정자ID
    private String dealerUpdtDt;                // 수정일자

    private String allDealerGoalPrefVal;
    private String idccDealerGoalPrefVal;
    private String shopDealerGoalPrefVal;
    private String secondDealerGoalPrefVal;
    private String etcDealerGoalPrefVal;

    private String custDealerDlrTp;
    private String custDealerOpinionvalue;
    private String custDealerPrefVal;
    private String custDealerDlrCd;
    private String custDealerGoalYy;
    private String custDealerGoalMm;
    private String custDealerGoalPrefVal;
    private String custDealerUpdtUsrId;


    /**
     * @return the sDealerDcptYear
     */
    public String getsDealerDcptYear() {
        return sDealerDcptYear;
    }
    /**
     * @param sDealerDcptYear the sDealerDcptYear to set
     */
    public void setsDealerDcptYear(String sDealerDcptYear) {
        this.sDealerDcptYear = sDealerDcptYear;
    }
    /**
     * @return the sDealerDcptMonth
     */
    public String getsDealerDcptMonth() {
        return sDealerDcptMonth;
    }
    /**
     * @param sDealerDcptMonth the sDealerDcptMonth to set
     */
    public void setsDealerDcptMonth(String sDealerDcptMonth) {
        this.sDealerDcptMonth = sDealerDcptMonth;
    }
    /**
     * @return the sDealerDcptYearParam
     */
    public String getsDealerDcptYearParam() {
        return sDealerDcptYearParam;
    }
    /**
     * @param sDealerDcptYearParam the sDealerDcptYearParam to set
     */
    public void setsDealerDcptYearParam(String sDealerDcptYearParam) {
        this.sDealerDcptYearParam = sDealerDcptYearParam;
    }
    /**
     * @return the sDealerDcptMonthParam
     */
    public String getsDealerDcptMonthParam() {
        return sDealerDcptMonthParam;
    }
    /**
     * @param sDealerDcptMonthParam the sDealerDcptMonthParam to set
     */
    public void setsDealerDcptMonthParam(String sDealerDcptMonthParam) {
        this.sDealerDcptMonthParam = sDealerDcptMonthParam;
    }
    /**
     * @return the sDealerSaleDcptYyMm
     */
    public String getsDealerSaleDcptYyMm() {
        return sDealerSaleDcptYyMm;
    }
    /**
     * @param sDealerSaleDcptYyMm the sDealerSaleDcptYyMm to set
     */
    public void setsDealerSaleDcptYyMm(String sDealerSaleDcptYyMm) {
        this.sDealerSaleDcptYyMm = sDealerSaleDcptYyMm;
    }
    /**
     * @return the dealerGoalYy
     */
    public String getDealerGoalYy() {
        return dealerGoalYy;
    }
    /**
     * @param dealerGoalYy the dealerGoalYy to set
     */
    public void setDealerGoalYy(String dealerGoalYy) {
        this.dealerGoalYy = dealerGoalYy;
    }
    /**
     * @return the dealerGoalMm
     */
    public String getDealerGoalMm() {
        return dealerGoalMm;
    }
    /**
     * @param dealerGoalMm the dealerGoalMm to set
     */
    public void setDealerGoalMm(String dealerGoalMm) {
        this.dealerGoalMm = dealerGoalMm;
    }
    /**
     * @return the dealerSdptCd
     */
    public String getDealerSdptCd() {
        return dealerSdptCd;
    }
    /**
     * @param dealerSdptCd the dealerSdptCd to set
     */
    public void setDealerSdptCd(String dealerSdptCd) {
        this.dealerSdptCd = dealerSdptCd;
    }
    /**
     * @return the dealerOfficeCd
     */
    public String getDealerOfficeCd() {
        return dealerOfficeCd;
    }
    /**
     * @param dealerOfficeCd the dealerOfficeCd to set
     */
    public void setDealerOfficeCd(String dealerOfficeCd) {
        this.dealerOfficeCd = dealerOfficeCd;
    }
    /**
     * @return the dealerDlrCd
     */
    public String getDealerDlrCd() {
        return dealerDlrCd;
    }
    /**
     * @param dealerDlrCd the dealerDlrCd to set
     */
    public void setDealerDlrCd(String dealerDlrCd) {
        this.dealerDlrCd = dealerDlrCd;
    }
    /**
     * @return the dealerDlrTp
     */
    public String getDealerDlrTp() {
        return dealerDlrTp;
    }
    /**
     * @param dealerDlrTp the dealerDlrTp to set
     */
    public void setDealerDlrTp(String dealerDlrTp) {
        this.dealerDlrTp = dealerDlrTp;
    }
    /**
     * @return the dealerGoalTp
     */
    public String getDealerGoalTp() {
        return dealerGoalTp;
    }
    /**
     * @param dealerGoalTp the dealerGoalTp to set
     */
    public void setDealerGoalTp(String dealerGoalTp) {
        this.dealerGoalTp = dealerGoalTp;
    }
    /**
     * @return the dealerCarlineCd
     */
    public String getDealerCarlineCd() {
        return dealerCarlineCd;
    }
    /**
     * @param dealerCarlineCd the dealerCarlineCd to set
     */
    public void setDealerCarlineCd(String dealerCarlineCd) {
        this.dealerCarlineCd = dealerCarlineCd;
    }
    /**
     * @return the dealerCarlineNm
     */
    public String getDealerCarlineNm() {
        return dealerCarlineNm;
    }
    /**
     * @param dealerCarlineNm the dealerCarlineNm to set
     */
    public void setDealerCarlineNm(String dealerCarlineNm) {
        this.dealerCarlineNm = dealerCarlineNm;
    }
    /**
     * @return the dealerGoalPrefVal
     */
    public String getDealerGoalPrefVal() {
        return dealerGoalPrefVal;
    }
    /**
     * @param dealerGoalPrefVal the dealerGoalPrefVal to set
     */
    public void setDealerGoalPrefVal(String dealerGoalPrefVal) {
        this.dealerGoalPrefVal = dealerGoalPrefVal;
    }
    /**
     * @return the dealerPrefTp
     */
    public String getDealerPrefTp() {
        return dealerPrefTp;
    }
    /**
     * @param dealerPrefTp the dealerPrefTp to set
     */
    public void setDealerPrefTp(String dealerPrefTp) {
        this.dealerPrefTp = dealerPrefTp;
    }
    /**
     * @return the dealerRegUsrId
     */
    public String getDealerRegUsrId() {
        return dealerRegUsrId;
    }
    /**
     * @param dealerRegUsrId the dealerRegUsrId to set
     */
    public void setDealerRegUsrId(String dealerRegUsrId) {
        this.dealerRegUsrId = dealerRegUsrId;
    }
    /**
     * @return the dealerRegDt
     */
    public String getDealerRegDt() {
        return dealerRegDt;
    }
    /**
     * @param dealerRegDt the dealerRegDt to set
     */
    public void setDealerRegDt(String dealerRegDt) {
        this.dealerRegDt = dealerRegDt;
    }
    /**
     * @return the dealerUpdtUsrId
     */
    public String getDealerUpdtUsrId() {
        return dealerUpdtUsrId;
    }
    /**
     * @param dealerUpdtUsrId the dealerUpdtUsrId to set
     */
    public void setDealerUpdtUsrId(String dealerUpdtUsrId) {
        this.dealerUpdtUsrId = dealerUpdtUsrId;
    }
    /**
     * @return the dealerUpdtDt
     */
    public String getDealerUpdtDt() {
        return dealerUpdtDt;
    }
    /**
     * @param dealerUpdtDt the dealerUpdtDt to set
     */
    public void setDealerUpdtDt(String dealerUpdtDt) {
        this.dealerUpdtDt = dealerUpdtDt;
    }
    /**
     * @return the allDealerGoalPrefVal
     */
    public String getAllDealerGoalPrefVal() {
        return allDealerGoalPrefVal;
    }
    /**
     * @param allDealerGoalPrefVal the allDealerGoalPrefVal to set
     */
    public void setAllDealerGoalPrefVal(String allDealerGoalPrefVal) {
        this.allDealerGoalPrefVal = allDealerGoalPrefVal;
    }
    /**
     * @return the idccDealerGoalPrefVal
     */
    public String getIdccDealerGoalPrefVal() {
        return idccDealerGoalPrefVal;
    }
    /**
     * @param idccDealerGoalPrefVal the idccDealerGoalPrefVal to set
     */
    public void setIdccDealerGoalPrefVal(String idccDealerGoalPrefVal) {
        this.idccDealerGoalPrefVal = idccDealerGoalPrefVal;
    }
    /**
     * @return the shopDealerGoalPrefVal
     */
    public String getShopDealerGoalPrefVal() {
        return shopDealerGoalPrefVal;
    }
    /**
     * @param shopDealerGoalPrefVal the shopDealerGoalPrefVal to set
     */
    public void setShopDealerGoalPrefVal(String shopDealerGoalPrefVal) {
        this.shopDealerGoalPrefVal = shopDealerGoalPrefVal;
    }
    /**
     * @return the secondDealerGoalPrefVal
     */
    public String getSecondDealerGoalPrefVal() {
        return secondDealerGoalPrefVal;
    }
    /**
     * @param secondDealerGoalPrefVal the secondDealerGoalPrefVal to set
     */
    public void setSecondDealerGoalPrefVal(String secondDealerGoalPrefVal) {
        this.secondDealerGoalPrefVal = secondDealerGoalPrefVal;
    }
    /**
     * @return the etcDealerGoalPrefVal
     */
    public String getEtcDealerGoalPrefVal() {
        return etcDealerGoalPrefVal;
    }
    /**
     * @param etcDealerGoalPrefVal the etcDealerGoalPrefVal to set
     */
    public void setEtcDealerGoalPrefVal(String etcDealerGoalPrefVal) {
        this.etcDealerGoalPrefVal = etcDealerGoalPrefVal;
    }
    /**
     * @return the custDealerDlrTp
     */
    public String getCustDealerDlrTp() {
        return custDealerDlrTp;
    }
    /**
     * @param custDealerDlrTp the custDealerDlrTp to set
     */
    public void setCustDealerDlrTp(String custDealerDlrTp) {
        this.custDealerDlrTp = custDealerDlrTp;
    }
    /**
     * @return the custDealerOpinionvalue
     */
    public String getCustDealerOpinionvalue() {
        return custDealerOpinionvalue;
    }
    /**
     * @param custDealerOpinionvalue the custDealerOpinionvalue to set
     */
    public void setCustDealerOpinionvalue(String custDealerOpinionvalue) {
        this.custDealerOpinionvalue = custDealerOpinionvalue;
    }
    /**
     * @return the custDealerPrefVal
     */
    public String getCustDealerPrefVal() {
        return custDealerPrefVal;
    }
    /**
     * @param custDealerPrefVal the custDealerPrefVal to set
     */
    public void setCustDealerPrefVal(String custDealerPrefVal) {
        this.custDealerPrefVal = custDealerPrefVal;
    }
    /**
     * @return the custDealerDlrCd
     */
    public String getCustDealerDlrCd() {
        return custDealerDlrCd;
    }
    /**
     * @param custDealerDlrCd the custDealerDlrCd to set
     */
    public void setCustDealerDlrCd(String custDealerDlrCd) {
        this.custDealerDlrCd = custDealerDlrCd;
    }
    /**
     * @return the custDealerGoalYy
     */
    public String getCustDealerGoalYy() {
        return custDealerGoalYy;
    }
    /**
     * @param custDealerGoalYy the custDealerGoalYy to set
     */
    public void setCustDealerGoalYy(String custDealerGoalYy) {
        this.custDealerGoalYy = custDealerGoalYy;
    }
    /**
     * @return the custDealerGoalMm
     */
    public String getCustDealerGoalMm() {
        return custDealerGoalMm;
    }
    /**
     * @param custDealerGoalMm the custDealerGoalMm to set
     */
    public void setCustDealerGoalMm(String custDealerGoalMm) {
        this.custDealerGoalMm = custDealerGoalMm;
    }
    /**
     * @return the custDealerGoalPrefVal
     */
    public String getCustDealerGoalPrefVal() {
        return custDealerGoalPrefVal;
    }
    /**
     * @param custDealerGoalPrefVal the custDealerGoalPrefVal to set
     */
    public void setCustDealerGoalPrefVal(String custDealerGoalPrefVal) {
        this.custDealerGoalPrefVal = custDealerGoalPrefVal;
    }
    /**
     * @return the custDealerUpdtUsrId
     */
    public String getCustDealerUpdtUsrId() {
        return custDealerUpdtUsrId;
    }
    /**
     * @param custDealerUpdtUsrId the custDealerUpdtUsrId to set
     */
    public void setCustDealerUpdtUsrId(String custDealerUpdtUsrId) {
        this.custDealerUpdtUsrId = custDealerUpdtUsrId;
    }



}
