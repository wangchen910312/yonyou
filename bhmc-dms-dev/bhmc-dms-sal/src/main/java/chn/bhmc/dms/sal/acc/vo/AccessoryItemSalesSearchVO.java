package chn.bhmc.dms.sal.acc.vo;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * @ClassName   : AccessoryItemSalesSearchVO
 * @Description : 용품판매문서 SearchVO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 29.    Kim Jin Suk      최초 생성
 * </pre>
 */

public class AccessoryItemSalesSearchVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5269672320273685100L;

    /**
     * 딜러코드
     */
    private String sDlrCd;

    /**
     * 용품업무유형
     */
    private String sGoodsTp;

    /**
     * 용품판매문서번호
     */
    private String sGoodsContractNo;

    /**
     * 판매계약번호
     */
    private String sSaleContractNo;

    /**
     * 용품판매계약일자 조회 시작일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartGoodsContractDt;

    /**
     * 용품판매계약일자 조회 종료일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndGoodsContractDt;

    /**
     * 계약고객번호
     */
    private String sContractCustNo;

    /**
     * 계약고객명
     */
    private String sContractCustNm;

    /**
     * VIN
     */
    private String sVinNo;

    /**
     * 용품판매문서상태
     */
    private String sContractStatCd;

    /**
     * 용품판매문서상태 목록
     **/
    private List<String> sContractStatCdList;

    /**
     * 예정출고일 조회 시작일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartExpcGiEndDt;

    /**
     * 예정출고일자 조회 종료일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndExpcGiEndDt;

    /**
     * 판매일자 조회 시작일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartRegDt;

    /**
     * 판매일자 조회 종료일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndRegDt;

    /**
     * 실제인도일 조회 시작일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartRealDlDt;

    /**
     * 실제인도일 조회 종료일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndRealDlDt;

    /**
     * 반품일 조회 시작일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartReturnDt;

    /**
     * 반품일 조회 종료일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndReturnDt;

    /**
     * 고객전화번호
     */
    private String sTelNo;

    /**
     * 차량번호
     */
    private String sCarRegNo;

    /**
     * 증정금액합계
     */
    private double sPrenSumAmt;

    /**
     * 차종
     */
    private String sCarlineCd;

    /**
     * 모델
     */
    private String sModelCd;

    /**
     * OCN
     */
    private String sOcnCd;

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
     * @return the sGoodsTp
     */
    public String getsGoodsTp() {
        return sGoodsTp;
    }

    /**
     * @param sGoodsTp the sGoodsTp to set
     */
    public void setsGoodsTp(String sGoodsTp) {
        this.sGoodsTp = sGoodsTp;
    }

    /**
     * @return the sGoodsContractNo
     */
    public String getsGoodsContractNo() {
        return sGoodsContractNo;
    }

    /**
     * @param sGoodsContractNo the sGoodsContractNo to set
     */
    public void setsGoodsContractNo(String sGoodsContractNo) {
        this.sGoodsContractNo = sGoodsContractNo;
    }

    /**
     * @return the sSaleContractNo
     */
    public String getsSaleContractNo() {
        return sSaleContractNo;
    }

    /**
     * @param sSaleContractNo the sSaleContractNo to set
     */
    public void setsSaleContractNo(String sSaleContractNo) {
        this.sSaleContractNo = sSaleContractNo;
    }

    /**
     * @return the sStartGoodsContractDt
     */
    public Date getsStartGoodsContractDt() {
        return sStartGoodsContractDt;
    }

    /**
     * @param sStartGoodsContractDt the sStartGoodsContractDt to set
     */
    public void setsStartGoodsContractDt(Date sStartGoodsContractDt) {
        this.sStartGoodsContractDt = sStartGoodsContractDt;
    }

    /**
     * @return the sEndGoodsContractDt
     */
    public Date getsEndGoodsContractDt() {
        return sEndGoodsContractDt;
    }

    /**
     * @param sEndGoodsContractDt the sEndGoodsContractDt to set
     */
    public void setsEndGoodsContractDt(Date sEndGoodsContractDt) {
        this.sEndGoodsContractDt = sEndGoodsContractDt;
    }

    /**
     * @return the sContractCustNo
     */
    public String getsContractCustNo() {
        return sContractCustNo;
    }

    /**
     * @param sContractCustNo the sContractCustNo to set
     */
    public void setsContractCustNo(String sContractCustNo) {
        this.sContractCustNo = sContractCustNo;
    }

    /**
     * @return the sContractCustNm
     */
    public String getsContractCustNm() {
        return sContractCustNm;
    }

    /**
     * @param sContractCustNm the sContractCustNm to set
     */
    public void setsContractCustNm(String sContractCustNm) {
        this.sContractCustNm = sContractCustNm;
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
     * @return the sContractStatCd
     */
    public String getsContractStatCd() {
        return sContractStatCd;
    }

    /**
     * @param sContractStatCd the sContractStatCd to set
     */
    public void setsContractStatCd(String sContractStatCd) {
        this.sContractStatCd = sContractStatCd;
    }

    /**
     * @return the sContractStatCdList
     */
    public List<String> getsContractStatCdList() {
        return sContractStatCdList;
    }

    /**
     * @param sContractStatCdList the sContractStatCdList to set
     */
    public void setsContractStatCdList(List<String> sContractStatCdList) {
        this.sContractStatCdList = sContractStatCdList;
    }

    /**
     * @return the sStartExpcGiEndDt
     */
    public Date getsStartExpcGiEndDt() {
        return sStartExpcGiEndDt;
    }

    /**
     * @param sStartExpcGiEndDt the sStartExpcGiEndDt to set
     */
    public void setsStartExpcGiEndDt(Date sStartExpcGiEndDt) {
        this.sStartExpcGiEndDt = sStartExpcGiEndDt;
    }

    /**
     * @return the sEndExpcGiEndDt
     */
    public Date getsEndExpcGiEndDt() {
        return sEndExpcGiEndDt;
    }

    /**
     * @param sEndExpcGiEndDt the sEndExpcGiEndDt to set
     */
    public void setsEndExpcGiEndDt(Date sEndExpcGiEndDt) {
        this.sEndExpcGiEndDt = sEndExpcGiEndDt;
    }

    /**
     * @return the sStartRegDt
     */
    public Date getsStartRegDt() {
        return sStartRegDt;
    }

    /**
     * @param sStartRegDt the sStartRegDt to set
     */
    public void setsStartRegDt(Date sStartRegDt) {
        this.sStartRegDt = sStartRegDt;
    }

    /**
     * @return the sEndRegDt
     */
    public Date getsEndRegDt() {
        return sEndRegDt;
    }

    /**
     * @param sEndRegDt the sEndRegDt to set
     */
    public void setsEndRegDt(Date sEndRegDt) {
        this.sEndRegDt = sEndRegDt;
    }

    /**
     * @return the sStartRealDlDt
     */
    public Date getsStartRealDlDt() {
        return sStartRealDlDt;
    }

    /**
     * @param sStartRealDlDt the sStartRealDlDt to set
     */
    public void setsStartRealDlDt(Date sStartRealDlDt) {
        this.sStartRealDlDt = sStartRealDlDt;
    }

    /**
     * @return the sEndRealDlDt
     */
    public Date getsEndRealDlDt() {
        return sEndRealDlDt;
    }

    /**
     * @param sEndRealDlDt the sEndRealDlDt to set
     */
    public void setsEndRealDlDt(Date sEndRealDlDt) {
        this.sEndRealDlDt = sEndRealDlDt;
    }

    /**
     * @return the sStartReturnDt
     */
    public Date getsStartReturnDt() {
        return sStartReturnDt;
    }

    /**
     * @param sStartReturnDt the sStartReturnDt to set
     */
    public void setsStartReturnDt(Date sStartReturnDt) {
        this.sStartReturnDt = sStartReturnDt;
    }

    /**
     * @return the sEndReturnDt
     */
    public Date getsEndReturnDt() {
        return sEndReturnDt;
    }

    /**
     * @param sEndReturnDt the sEndReturnDt to set
     */
    public void setsEndReturnDt(Date sEndReturnDt) {
        this.sEndReturnDt = sEndReturnDt;
    }

    /**
     * @return the sTelNo
     */
    public String getsTelNo() {
        return sTelNo;
    }

    /**
     * @param sTelNo the sTelNo to set
     */
    public void setsTelNo(String sTelNo) {
        this.sTelNo = sTelNo;
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
     * @return the sPrenSumAmt
     */
    public double getsPrenSumAmt() {
        return sPrenSumAmt;
    }

    /**
     * @param sPrenSumAmt the sPrenSumAmt to set
     */
    public void setsPrenSumAmt(double sPrenSumAmt) {
        this.sPrenSumAmt = sPrenSumAmt;
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

}
