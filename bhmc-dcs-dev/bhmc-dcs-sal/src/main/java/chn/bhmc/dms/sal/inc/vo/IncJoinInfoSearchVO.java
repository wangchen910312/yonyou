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
    private String sContractNo;                                          //계약번호
    private String sIncCmpCd;                                            //보험회사코드
    private String sSaleId;                                              //판매ID(판매고문)
    private String sCustNo;                                              //고객코드
    private String sVinNo;                                               //VIN NO
    private String sVinNo1;                                              //VIN NO1
    private String sVinNo2;                                              //VIN NO2
    private String sIncTp;                                               //보험종류
    private String sDlrCd;                                               //딜러
    private String sIncNo;                                               //보험번호






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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }



}
