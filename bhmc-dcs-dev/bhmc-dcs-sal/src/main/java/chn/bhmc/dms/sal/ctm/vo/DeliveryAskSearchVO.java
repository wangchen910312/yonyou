package chn.bhmc.dms.sal.ctm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DeliveryAskSearchVO
 * @Description : 출고요청관리 조회 VO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.07      Kim Jin Suk      최초 생성
 * </pre>
 */

public class DeliveryAskSearchVO extends SearchVO{
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -839104826828513198L;

    private  String          sDlrCd;              // 딜러코드
    private  String          sContractStatCd;     // 계약상태
    private  String          sContractCustNo;     // 고객번호

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sAllocStartDt;       // 배정일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sAllocEndDt;         // 배정일

    private  String          sContractNo;    // 계약번호
    private  String          sContractTp;    // 계약유형

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sGiReqStartDt;      // 출고요청일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sGiReqEndDt;      // 출고요청일

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sGiStartDt;      // 출고확정일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sGiEndDt;        // 출고확정일

    private  String          sCarlineCd;     // 차종코드

    private  String          sModelCd;       // 모델코드
    private  String          sOcnCd;         // OCN
    private  String          sExtColorCd;    // 외장색코드
    private  String          sIntColorCd;    // 내장색코드

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sDlReqStartDt;       // 고객인도요청일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sDlReqEndDt;       // 고객인도요청일

    private  String          sVinNo;         // vin no

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
     * @return the sAllocStartDt
     */
    public Date getsAllocStartDt() {
        return sAllocStartDt;
    }

    /**
     * @param sAllocStartDt the sAllocStartDt to set
     */
    public void setsAllocStartDt(Date sAllocStartDt) {
        this.sAllocStartDt = sAllocStartDt;
    }

    /**
     * @return the sAllocEndDt
     */
    public Date getsAllocEndDt() {
        return sAllocEndDt;
    }

    /**
     * @param sAllocEndDt the sAllocEndDt to set
     */
    public void setsAllocEndDt(Date sAllocEndDt) {
        this.sAllocEndDt = sAllocEndDt;
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
     * @return the sContractTp
     */
    public String getsContractTp() {
        return sContractTp;
    }

    /**
     * @param sContractTp the sContractTp to set
     */
    public void setsContractTp(String sContractTp) {
        this.sContractTp = sContractTp;
    }

    /**
     * @return the sGiReqStartDt
     */
    public Date getsGiReqStartDt() {
        return sGiReqStartDt;
    }

    /**
     * @param sGiReqStartDt the sGiReqStartDt to set
     */
    public void setsGiReqStartDt(Date sGiReqStartDt) {
        this.sGiReqStartDt = sGiReqStartDt;
    }

    /**
     * @return the sGiReqEndDt
     */
    public Date getsGiReqEndDt() {
        return sGiReqEndDt;
    }

    /**
     * @param sGiReqEndDt the sGiReqEndDt to set
     */
    public void setsGiReqEndDt(Date sGiReqEndDt) {
        this.sGiReqEndDt = sGiReqEndDt;
    }

    /**
     * @return the sGiStartDt
     */
    public Date getsGiStartDt() {
        return sGiStartDt;
    }

    /**
     * @param sGiStartDt the sGiStartDt to set
     */
    public void setsGiStartDt(Date sGiStartDt) {
        this.sGiStartDt = sGiStartDt;
    }

    /**
     * @return the sGiEndDt
     */
    public Date getsGiEndDt() {
        return sGiEndDt;
    }

    /**
     * @param sGiEndDt the sGiEndDt to set
     */
    public void setsGiEndDt(Date sGiEndDt) {
        this.sGiEndDt = sGiEndDt;
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
     * @return the sDlReqStartDt
     */
    public Date getsDlReqStartDt() {
        return sDlReqStartDt;
    }

    /**
     * @param sDlReqStartDt the sDlReqStartDt to set
     */
    public void setsDlReqStartDt(Date sDlReqStartDt) {
        this.sDlReqStartDt = sDlReqStartDt;
    }

    /**
     * @return the sDlReqEndDt
     */
    public Date getsDlReqEndDt() {
        return sDlReqEndDt;
    }

    /**
     * @param sDlReqEndDt the sDlReqEndDt to set
     */
    public void setsDlReqEndDt(Date sDlReqEndDt) {
        this.sDlReqEndDt = sDlReqEndDt;
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
