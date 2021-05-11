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
 * @ClassName   : CustPublishInfoVO
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

public class CustPublishInfoVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3473792498442184300L;

    /**
    * 딜러코드
    **/
    private String dlrCd;

    /**
    * 발행번호
    **/
    private String publiNo;

    /**
    * 발행유형 고객 또는 차
    **/
    private String publiCd;

    /**
     * 할인사용구분
     **/
     private String dcUseTp;

    /**
    * 쿠폰시퀀스
    **/
    private int cupnSeq;
    private String cupnNm;

    /**
    * 패키지일련번호
    **/
    //PKG_SEQ

    private int pkgSeq;

    /**
    * 고객번호
    **/
    //CUST_NO

    private String custNo;

    /**
    * 고객명
    **/
    //CUST_NM

    private String custNm;


    /**
    * VIN
    **/
    //VIN_NO

    private String vinNo;
    private String carRegNo;

    /**
    * 쿠폰유효시작일
    **/
    //CUPN_FROM_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date cupnFromDt;

    /**
    * 쿠폰유효종료일
    **/
    //CUPN_TO_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date cupnToDt;

    /**
    * 유효일수
    **/
    //CUPN_VALID_PRID

    //private int cupnValidPrid;
    private String cupnValidPrid;

    /**
    * 발행일
    **/
    //PUBLI_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date publiDt;

    /**
     * 사용한날
     **/
    //USED_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date usedDt;

    /**
    * 발행자
    **/
    //PUBLI_USR_ID

    private String publiUsrId;
    private String publiUsrNm;
    /**
     * 쿠폰사용체크 사용자
     **/
    //CHK_USR_ID

    private String chkUsrId;
    private String chkUsrNm;

    /**
    * 사용유무
    **/


    private String useYn;

    /**
    * 등록자ID
    **/


    private String regUsrId;

    /**
    * 등록일자
    **/

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;

    /**
    * 수정자ID
    **/
    //UPDT_USR_ID

    private String updtUsrId;

    /**
    * 수정일자
    **/
    //UPDT_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;

    private String dcCd;

    private String dlrMbr;
    private String bmMbr;

    private String hpNo;

    /*
     * 사용처
     */
    private String useTp;

    /*
     * 사용번호
     */
    private String useNum;

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
     * @return the publiNo
     */
    public String getPubliNo() {
        return publiNo;
    }

    /**
     * @param publiNo the publiNo to set
     */
    public void setPubliNo(String publiNo) {
        this.publiNo = publiNo;
    }

    /**
     * @return the publiCd
     */
    public String getPubliCd() {
        return publiCd;
    }

    /**
     * @param publiCd the publiCd to set
     */
    public void setPubliCd(String publiCd) {
        this.publiCd = publiCd;
    }

    /**
     * @return the cupnSeq
     */
    public int getCupnSeq() {
        return cupnSeq;
    }

    /**
     * @param cupnSeq the cupnSeq to set
     */
    public void setCupnSeq(int cupnSeq) {
        this.cupnSeq = cupnSeq;
    }

    /**
     * @return the pkgSeq
     */
    public int getPkgSeq() {
        return pkgSeq;
    }

    /**
     * @param pkgSeq the pkgSeq to set
     */
    public void setPkgSeq(int pkgSeq) {
        this.pkgSeq = pkgSeq;
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
     * @return the vinNo
     */
    public String getVinNo() {
        return vinNo;
    }

    /**
     * @param vinNo the vinNo to set
     */
    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }

    /**
     * @return the cupnFromDt
     */
    public Date getCupnFromDt() {
        return cupnFromDt;
    }

    /**
     * @param cupnFromDt the cupnFromDt to set
     */
    public void setCupnFromDt(Date cupnFromDt) {
        this.cupnFromDt = cupnFromDt;
    }

    /**
     * @return the cupnToDt
     */
    public Date getCupnToDt() {
        return cupnToDt;
    }

    /**
     * @param cupnToDt the cupnToDt to set
     */
    public void setCupnToDt(Date cupnToDt) {
        this.cupnToDt = cupnToDt;
    }

//    /**
//     * @return the cupnValidPrid
//     */
//    public int getCupnValidPrid() {
//        return cupnValidPrid;
//    }
//
//    /**
//     * @param cupnValidPrid the cupnValidPrid to set
//     */
//    public void setCupnValidPrid(int cupnValidPrid) {
//        this.cupnValidPrid = cupnValidPrid;
//    }

    /**
     * @return the publiDt
     */
    public Date getPubliDt() {
        return publiDt;
    }

    /**
     * @param publiDt the publiDt to set
     */
    public void setPubliDt(Date publiDt) {
        this.publiDt = publiDt;
    }

    /**
     * @return the publiUsrId
     */
    public String getPubliUsrId() {
        return publiUsrId;
    }

    /**
     * @param publiUsrId the publiUsrId to set
     */
    public void setPubliUsrId(String publiUsrId) {
        this.publiUsrId = publiUsrId;
    }

    /**
     * @return the useYn
     */
    public String getUseYn() {
        return useYn;
    }

    /**
     * @param useYn the useYn to set
     */
    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }

    /**
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }

    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }

    /**
     * @return the regDt
     */
    public Date getRegDt() {
        return regDt;
    }

    /**
     * @param regDt the regDt to set
     */
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }

    /**
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }

    /**
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }

    /**
     * @return the updtDt
     */
    public Date getUpdtDt() {
        return updtDt;
    }

    /**
     * @param updtDt the updtDt to set
     */
    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
    }

    /**
     * @return the publiUsrNm
     */
    public String getPubliUsrNm() {
        return publiUsrNm;
    }

    /**
     * @param publiUsrNm the publiUsrNm to set
     */
    public void setPubliUsrNm(String publiUsrNm) {
        this.publiUsrNm = publiUsrNm;
    }

    /**
     * @return the dcCd
     */
    public String getDcCd() {
        return dcCd;
    }

    /**
     * @param dcCd the dcCd to set
     */
    public void setDcCd(String dcCd) {
        this.dcCd = dcCd;
    }

    /**
     * @return the dcUseTp
     */
    public String getDcUseTp() {
        return dcUseTp;
    }

    /**
     * @param dcUseTp the dcUseTp to set
     */
    public void setDcUseTp(String dcUseTp) {
        this.dcUseTp = dcUseTp;
    }

    /**
     * @return the usedDt
     */
    public Date getUsedDt() {
        return usedDt;
    }

    /**
     * @param usedDt the usedDt to set
     */
    public void setUsedDt(Date usedDt) {
        this.usedDt = usedDt;
    }

    /**
     * @return the chkUsrId
     */
    public String getChkUsrId() {
        return chkUsrId;
    }

    /**
     * @param chkUsrId the chkUsrId to set
     */
    public void setChkUsrId(String chkUsrId) {
        this.chkUsrId = chkUsrId;
    }

    /**
     * @return the chkUsrNm
     */
    public String getChkUsrNm() {
        return chkUsrNm;
    }

    /**
     * @param chkUsrNm the chkUsrNm to set
     */
    public void setChkUsrNm(String chkUsrNm) {
        this.chkUsrNm = chkUsrNm;
    }

    /**
     * @return the cupnNm
     */
    public String getCupnNm() {
        return cupnNm;
    }

    /**
     * @param cupnNm the cupnNm to set
     */
    public void setCupnNm(String cupnNm) {
        this.cupnNm = cupnNm;
    }

    /**
     * @return the dlrMbr
     */
    public String getDlrMbr() {
        return dlrMbr;
    }

    /**
     * @param dlrMbr the dlrMbr to set
     */
    public void setDlrMbr(String dlrMbr) {
        this.dlrMbr = dlrMbr;
    }

    /**
     * @return the bmMbr
     */
    public String getBmMbr() {
        return bmMbr;
    }

    /**
     * @param bmMbr the bmMbr to set
     */
    public void setBmMbr(String bmMbr) {
        this.bmMbr = bmMbr;
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
     * @param cupnValidPrid the cupnValidPrid to set
     */
    public void setCupnValidPrid(String cupnValidPrid) {
        this.cupnValidPrid = cupnValidPrid;
    }

    /**
     * @return the cupnValidPrid
     */
    public String getCupnValidPrid() {
        return cupnValidPrid;
    }

    /**
     * @return the useTp
     */
    public String getUseTp() {
        return useTp;
    }

    /**
     * @param useTp the useTp to set
     */
    public void setUseTp(String useTp) {
        this.useTp = useTp;
    }

    /**
     * @return the useNum
     */
    public String getUseNum() {
        return useNum;
    }

    /**
     * @param useNum the useNum to set
     */
    public void setUseNum(String useNum) {
        this.useNum = useNum;
    }

    /**
     * @return the carRegNo
     */
    public String getCarRegNo() {
        return carRegNo;
    }

    /**
     * @param carRegNo the carRegNo to set
     */
    public void setCarRegNo(String carRegNo) {
        this.carRegNo = carRegNo;
    }



}
