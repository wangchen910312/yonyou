package chn.bhmc.dms.sal.inc.vo;


import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : IncJoinInfoSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim yewon
 * @since 2016. 5. 03.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 03.      Kim yewon              최초 생성
 * </pre>
 */

public class IncJoinInfoSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sIncJoinStartDt;                                        //보험가입일자 - 시작일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sIncJoinEndDt;                                          //보험가입일자 - 종료일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCarSaleStartDt;                                        //차량판매일자 - 시작일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCarSaleEndDt;                                          //차량판매일자 - 종료일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCarRegStartDt;                                         //차량번호판등록일 - 시작일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCarRegEndDt;                                           //차량번호판등록일 - 종료일자
    private String sContractNo;                                          //계약번호
    private String sIncCmpCd;                                            //보험회사코드
    private String sSaleId;                                              //판매ID(판매고문)
    private String sCustNo;                                              //고객코드
    private String sCustNm;
    private String sVinNo;                                               //VIN NO
    private String sVinNo1;                                              //VIN NO1
    private String sVinNo2;                                              //VIN NO2
    private String sCarRegNo;                                            //차량번호
    private String sIncTp;                                               //보험종류
    private String sDlrCd;                                               //딜러
    private String sIncNo;                                               //보험번호
    private String sIncUsrNm;                                            //고객명
    private String sIncCs;                                               //보험종류
    private String sIncStat;                                             //보험상태
    
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sIncEndFromDt;
    
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sIncEndToDt;
    private String sFincYn;                                             // 대출여부
    
    /**
     * @return the sIncUsrNm
     */
    public String getsIncUsrNm() {
        return sIncUsrNm;
    }
    /**
     * @param sIncUsrNm the sIncUsrNm to set
     */
    public void setsIncUsrNm(String sIncUsrNm) {
        this.sIncUsrNm = sIncUsrNm;
    }
    /**
     * @return the sCarRegStartDt
     */
    public Date getsCarRegStartDt() {
        return sCarRegStartDt;
    }
    /**
     * @param sCarRegStartDt the sCarRegStartDt to set
     */
    public void setsCarRegStartDt(Date sCarRegStartDt) {
        this.sCarRegStartDt = sCarRegStartDt;
    }
    /**
     * @return the sCarRegEndDt
     */
    public Date getsCarRegEndDt() {
        return sCarRegEndDt;
    }
    /**
     * @param sCarRegEndDt the sCarRegEndDt to set
     */
    public void setsCarRegEndDt(Date sCarRegEndDt) {
        this.sCarRegEndDt = sCarRegEndDt;
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
     * @return the sIncNo
     */
    public String getsIncNo() {
        return sIncNo;
    }
    /**
     * @param sIncNo the sIncNo to set
     */
    public void setsIncNo(String sIncNo) {
        this.sIncNo = sIncNo;
    }
    /**
     * @return the sIncTp
     */
    public String getsIncTp() {
        return sIncTp;
    }
    /**
     * @param sIncTp the sIncTp to set
     */
    public void setsIncTp(String sIncTp) {
        this.sIncTp = sIncTp;
    }
    /**
     * @return the sVinNo1
     */
    public String getsVinNo1() {
        return sVinNo1;
    }
    /**
     * @param sVinNo1 the sVinNo1 to set
     */
    public void setsVinNo1(String sVinNo1) {
        this.sVinNo1 = sVinNo1;
    }
    /**
     * @return the sVinNo2
     */
    public String getsVinNo2() {
        return sVinNo2;
    }
    /**
     * @param sVinNo2 the sVinNo2 to set
     */
    public void setsVinNo2(String sVinNo2) {
        this.sVinNo2 = sVinNo2;
    }
    /**
     * @return the sCarRegNo
     */
    public String getsCarRegNo() {
        return sCarRegNo;
    }
    /**
     * @param sCarRegNo the sCarRegNo to set
     */
    public void setsCarRegNo(String sCarRegNo) {
        this.sCarRegNo = sCarRegNo;
    }
    /**
     * @return the sIncJoinStartDt
     */
    public Date getsIncJoinStartDt() {
        return sIncJoinStartDt;
    }
    /**
     * @param sIncJoinStartDt the sIncJoinStartDt to set
     */
    public void setsIncJoinStartDt(Date sIncJoinStartDt) {
        this.sIncJoinStartDt = sIncJoinStartDt;
    }
    /**
     * @return the sIncJoinEndDt
     */
    public Date getsIncJoinEndDt() {
        return sIncJoinEndDt;
    }
    /**
     * @param sIncJoinEndDt the sIncJoinEndDt to set
     */
    public void setsIncJoinEndDt(Date sIncJoinEndDt) {
        this.sIncJoinEndDt = sIncJoinEndDt;
    }
    /**
     * @return the sCarSaleStartDt
     */
    public Date getsCarSaleStartDt() {
        return sCarSaleStartDt;
    }
    /**
     * @param sCarSaleStartDt the sCarSaleStartDt to set
     */
    public void setsCarSaleStartDt(Date sCarSaleStartDt) {
        this.sCarSaleStartDt = sCarSaleStartDt;
    }
    /**
     * @return the sCarSaleEndDt
     */
    public Date getsCarSaleEndDt() {
        return sCarSaleEndDt;
    }
    /**
     * @param sCarSaleEndDt the sCarSaleEndDt to set
     */
    public void setsCarSaleEndDt(Date sCarSaleEndDt) {
        this.sCarSaleEndDt = sCarSaleEndDt;
    }
    /**
     * @return the sContractNo
     */
    public String getsContractNo() {
        return sContractNo;
    }
    /**
     * @param sContractNo the sContractNo to set
     */
    public void setsContractNo(String sContractNo) {
        this.sContractNo = sContractNo;
    }
    /**
     * @return the sIncCmpCd
     */
    public String getsIncCmpCd() {
        return sIncCmpCd;
    }
    /**
     * @param sIncCmpCd the sIncCmpCd to set
     */
    public void setsIncCmpCd(String sIncCmpCd) {
        this.sIncCmpCd = sIncCmpCd;
    }
    /**
     * @return the sSaleId
     */
    public String getsSaleId() {
        return sSaleId;
    }
    /**
     * @param sSaleId the sSaleId to set
     */
    public void setsSaleId(String sSaleId) {
        this.sSaleId = sSaleId;
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
     * @return the sIncCs
     */
    public String getsIncCs() {
        return sIncCs;
    }
    /**
     * @param sIncCs the sIncCs to set
     */
    public void setsIncCs(String sIncCs) {
        this.sIncCs = sIncCs;
    }
    /**
     * @return the sIncStat
     */
    public String getsIncStat() {
        return sIncStat;
    }
    /**
     * @param sIncStat the sIncStat to set
     */
    public void setsIncStat(String sIncStat) {
        this.sIncStat = sIncStat;
    }
    /**
     * @return the sIncEndFromDt
     */
    public Date getsIncEndFromDt() {
        return sIncEndFromDt;
    }
    /**
     * @param sIncEndFromDt the sIncEndFromDt to set
     */
    public void setsIncEndFromDt(Date sIncEndFromDt) {
        this.sIncEndFromDt = sIncEndFromDt;
    }
    /**
     * @return the sIncEndToDt
     */
    public Date getsIncEndToDt() {
        return sIncEndToDt;
    }
    /**
     * @param sIncEndToDt the sIncEndToDt to set
     */
    public void setsIncEndToDt(Date sIncEndToDt) {
        this.sIncEndToDt = sIncEndToDt;
    }
    /**
     * @return the sFincYn
     */
    public String getsFincYn() {
        return sFincYn;
    }
    /**
     * @param sFincYn the sFincYn to set
     */
    public void setsFincYn(String sFincYn) {
        this.sFincYn = sFincYn;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}