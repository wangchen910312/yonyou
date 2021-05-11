package chn.bhmc.dms.par.pmm.vo;
import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * 합격증 VO
 * </pre>
 *
 * @ClassName   : CertificationVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Eun Jung Jang
 * @since 2016. 5. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 25.     Eun Jung Jang     최초 생성
 * </pre>
 */

public class CertificationVO extends BaseVO {

     /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 545284963020246192L;

    /**
     * 저장 성공실패 여부
     **/
    private boolean resultYn = false;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 합격증번호
     **/
    private String certNo;

    /**
     * 합격증상태코드
     **/
    private String certStatCd;

    /**
     * 합격증유형
     **/
    private String certTp;

    /**
     * 전화번호
     **/
    private String telNo;

    /**
     * 휴대폰번호
     **/
    private String hpNo;

    /**
     * 고객번호
     **/
    private String custNo;

    /**
     * 고객명
     **/
    private String custNm;

    /**
     * 품목코드
     **/
    private String itemCd;

    /**
     * 품목명
     **/
    private String itemNm;

    /**
     * 원차대번호
     **/
    private String baseVinNo;

    /**
     * 신차대번호
     **/
    private String newVinNo;

    /**
     * 차량바디차대번호
     **/
    private String carBodyVinNo;

    /**
     * 상세내용
     **/
    private String detlCont;

    /**
     * 심사결과명(BMP I/F)
     **/
    private String evalRsltNm;

    /**
     * 심사의견내용(BMP I/F)
     **/
    private String evalOpnCont;

    /**
     * 우편번호(BMP I/F)
     **/
    private String zipCd;

    /**
     * 우편발송일자(BMP I/F)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date zipSendDt;

    /**
     * 처리결과상세내용(BMP I/F)
     **/
    private String procRsltDetlCont;
    /**
     * 운송회사코드(BMP I/F)
     **/
    private String trsfCmpCd;
    /**
     * 오더번호(ORDERS_CODE)
     **/
    private String ordNo;
    /**
     * 명패발송명(SEND_NAME_PLATE)
     **/
    private String platSendNm;
    /**
     * 이메일명(MAIL_NO)
     **/
    private String emailNm;
    /**
     * 택배사명(EXPRESS_COMPANY)
     **/
    private String expsCmpNm;
    /**
     * 이메일일자(MAIL_TIME)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date emailDt;
    /**
     * 합격증신청번호(APPLY_CODE)
     **/
    private String certReqNo;
    /**
     * @return the resultYn
     */
    public boolean isResultYn() {
        return resultYn;
    }
    /**
     * @param resultYn the resultYn to set
     */
    public void setResultYn(boolean resultYn) {
        this.resultYn = resultYn;
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
     * @return the certNo
     */
    public String getCertNo() {
        return certNo;
    }
    /**
     * @param certNo the certNo to set
     */
    public void setCertNo(String certNo) {
        this.certNo = certNo;
    }
    /**
     * @return the certStatCd
     */
    public String getCertStatCd() {
        return certStatCd;
    }
    /**
     * @param certStatCd the certStatCd to set
     */
    public void setCertStatCd(String certStatCd) {
        this.certStatCd = certStatCd;
    }
    /**
     * @return the certTp
     */
    public String getCertTp() {
        return certTp;
    }
    /**
     * @param certTp the certTp to set
     */
    public void setCertTp(String certTp) {
        this.certTp = certTp;
    }
    /**
     * @return the telNo
     */
    public String getTelNo() {
        return telNo;
    }
    /**
     * @param telNo the telNo to set
     */
    public void setTelNo(String telNo) {
        this.telNo = telNo;
    }
    /**
     * @return the hpNo
     */
    public String getHpNo() {
        return hpNo;
    }
    /**
     * @param hpNo the hpNo to set
     */
    public void setHpNo(String hpNo) {
        this.hpNo = hpNo;
    }
    /**
     * @return the custNo
     */
    public String getCustNo() {
        return custNo;
    }
    /**
     * @param custNo the custNo to set
     */
    public void setCustNo(String custNo) {
        this.custNo = custNo;
    }
    /**
     * @return the custNm
     */
    public String getCustNm() {
        return custNm;
    }
    /**
     * @param custNm the custNm to set
     */
    public void setCustNm(String custNm) {
        this.custNm = custNm;
    }
    /**
     * @return the itemCd
     */
    public String getItemCd() {
        return itemCd;
    }
    /**
     * @param itemCd the itemCd to set
     */
    public void setItemCd(String itemCd) {
        this.itemCd = itemCd;
    }
    /**
     * @return the itemNm
     */
    public String getItemNm() {
        return itemNm;
    }
    /**
     * @param itemNm the itemNm to set
     */
    public void setItemNm(String itemNm) {
        this.itemNm = itemNm;
    }
    /**
     * @return the baseVinNo
     */
    public String getBaseVinNo() {
        return baseVinNo;
    }
    /**
     * @param baseVinNo the baseVinNo to set
     */
    public void setBaseVinNo(String baseVinNo) {
        this.baseVinNo = baseVinNo;
    }
    /**
     * @return the newVinNo
     */
    public String getNewVinNo() {
        return newVinNo;
    }
    /**
     * @param newVinNo the newVinNo to set
     */
    public void setNewVinNo(String newVinNo) {
        this.newVinNo = newVinNo;
    }
    /**
     * @return the carBodyVinNo
     */
    public String getCarBodyVinNo() {
        return carBodyVinNo;
    }
    /**
     * @param carBodyVinNo the carBodyVinNo to set
     */
    public void setCarBodyVinNo(String carBodyVinNo) {
        this.carBodyVinNo = carBodyVinNo;
    }
    /**
     * @return the detlCont
     */
    public String getDetlCont() {
        return detlCont;
    }
    /**
     * @param detlCont the detlCont to set
     */
    public void setDetlCont(String detlCont) {
        this.detlCont = detlCont;
    }
    /**
     * @return the evalRsltNm
     */
    public String getEvalRsltNm() {
        return evalRsltNm;
    }
    /**
     * @param evalRsltNm the evalRsltNm to set
     */
    public void setEvalRsltNm(String evalRsltNm) {
        this.evalRsltNm = evalRsltNm;
    }
    /**
     * @return the evalOpnCont
     */
    public String getEvalOpnCont() {
        return evalOpnCont;
    }
    /**
     * @param evalOpnCont the evalOpnCont to set
     */
    public void setEvalOpnCont(String evalOpnCont) {
        this.evalOpnCont = evalOpnCont;
    }
    /**
     * @return the zipCd
     */
    public String getZipCd() {
        return zipCd;
    }
    /**
     * @param zipCd the zipCd to set
     */
    public void setZipCd(String zipCd) {
        this.zipCd = zipCd;
    }
    /**
     * @return the zipSendDt
     */
    public Date getZipSendDt() {
        return zipSendDt;
    }
    /**
     * @param zipSendDt the zipSendDt to set
     */
    public void setZipSendDt(Date zipSendDt) {
        this.zipSendDt = zipSendDt;
    }
    /**
     * @return the procRsltDetlCont
     */
    public String getProcRsltDetlCont() {
        return procRsltDetlCont;
    }
    /**
     * @param procRsltDetlCont the procRsltDetlCont to set
     */
    public void setProcRsltDetlCont(String procRsltDetlCont) {
        this.procRsltDetlCont = procRsltDetlCont;
    }
    /**
     * @return the trsfCmpCd
     */
    public String getTrsfCmpCd() {
        return trsfCmpCd;
    }
    /**
     * @param trsfCmpCd the trsfCmpCd to set
     */
    public void setTrsfCmpCd(String trsfCmpCd) {
        this.trsfCmpCd = trsfCmpCd;
    }
    /**
     * @return the ordNo
     */
    public String getOrdNo() {
        return ordNo;
    }
    /**
     * @param ordNo the ordNo to set
     */
    public void setOrdNo(String ordNo) {
        this.ordNo = ordNo;
    }
    /**
     * @return the platSendNm
     */
    public String getPlatSendNm() {
        return platSendNm;
    }
    /**
     * @param platSendNm the platSendNm to set
     */
    public void setPlatSendNm(String platSendNm) {
        this.platSendNm = platSendNm;
    }
    /**
     * @return the emailNm
     */
    public String getEmailNm() {
        return emailNm;
    }
    /**
     * @param emailNm the emailNm to set
     */
    public void setEmailNm(String emailNm) {
        this.emailNm = emailNm;
    }
    /**
     * @return the expsCmpNm
     */
    public String getExpsCmpNm() {
        return expsCmpNm;
    }
    /**
     * @param expsCmpNm the expsCmpNm to set
     */
    public void setExpsCmpNm(String expsCmpNm) {
        this.expsCmpNm = expsCmpNm;
    }
    /**
     * @return the emailDt
     */
    public Date getEmailDt() {
        return emailDt;
    }
    /**
     * @param emailDt the emailDt to set
     */
    public void setEmailDt(Date emailDt) {
        this.emailDt = emailDt;
    }
    /**
     * @return the certReqNo
     */
    public String getCertReqNo() {
        return certReqNo;
    }
    /**
     * @param certReqNo the certReqNo to set
     */
    public void setCertReqNo(String certReqNo) {
        this.certReqNo = certReqNo;
    }

}
