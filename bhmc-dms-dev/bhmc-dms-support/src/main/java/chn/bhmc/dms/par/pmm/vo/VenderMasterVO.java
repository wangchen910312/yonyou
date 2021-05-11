package chn.bhmc.dms.par.pmm.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * 거래처 관리 VO
 *
 * @ClassName   : VendorMasterVO.java
 * @Description : VendorMasterVO Class
 * @author In Bo Shim
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.     In Bo Shim     최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="dlrCd", mesgKey="par.lbl.dlrCd")
    ,@ValidField(field="bpCd", mesgKey="par.lbl.bpCd")
    ,@ValidField(field="bpNm", mesgKey="par.lbl.bpNm")
    ,@ValidField(field="bpFullNm", mesgKey="par.lbl.bpFullNm")
    ,@ValidField(field="bpEnNm", mesgKey="par.lbl.bpEnNm")
    ,@ValidField(field="bpTp", mesgKey="par.lbl.bpTp")
    ,@ValidField(field="cntryCd", mesgKey="par.lbl.cntryCd")
    ,@ValidField(field="distCd", mesgKey="par.lbl.distCd")
    ,@ValidField(field="ownRgstNm", mesgKey="par.lbl.ownRgstNm")
    ,@ValidField(field="crnNo", mesgKey="par.lbl.crnNo")
    ,@ValidField(field="dealCurrUnitCd", mesgKey="par.lbl.dealCurrUnitCd")
    ,@ValidField(field="cofDt", mesgKey="par.lbl.cofDt")
    ,@ValidField(field="zipCd", mesgKey="par.lbl.zipCd")
    ,@ValidField(field="addr", mesgKey="par.lbl.addr")
    ,@ValidField(field="homepageUrl", mesgKey="par.lbl.homepageUrl")
    ,@ValidField(field="telNo", mesgKey="par.lbl.telNo")
    ,@ValidField(field="faxNo", mesgKey="par.lbl.faxNo")
    ,@ValidField(field="prsnNm", mesgKey="par.lbl.prsnNm")
    ,@ValidField(field="prsnTelNo", mesgKey="par.lbl.prsnTelNo")
    ,@ValidField(field="prsnHpNo", mesgKey="par.lbl.prsnHpNo")
    ,@ValidField(field="prsnEmailNm", mesgKey="par.lbl.prsnEmailNm")
    ,@ValidField(field="payTp", mesgKey="par.lbl.payTp")
    ,@ValidField(field="payTermCd", mesgKey="par.lbl.payTermCd")
    ,@ValidField(field="bankNm", mesgKey="par.lbl.bankNm")
    ,@ValidField(field="bankAcNo", mesgKey="par.lbl.bankAcNo")
    ,@ValidField(field="acOwnerNm", mesgKey="par.lbl.acOwnerNm")
    ,@ValidField(field="endYn", mesgKey="par.lbl.endYn")
    ,@ValidField(field="remark", mesgKey="par.lbl.remark")
})
public class VenderMasterVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -683754833797418711L;

    /**
     * 딜러코드
     */
    @NotEmpty
    private String dlrCd;

    /**
     * 거래처코드
     */
    private String bpCd;

    /**
     * 거래처명
     */
    private String bpNm;

    /**
     * 거래처전명
     */
    private String bpFullNm;

    /**
     * 거래처영문
     */
    private String bpEnNm;

    /**
     * 거래처타입
     */
    private String bpTp;

    /**
     * 거래처타입카운트
     */
    private String bpTpCnt;

    /**
     * 국가코드
     */
    private String cntryCd;

    /**
     * 지역
     */
    private String distCd;

    /**
     * 지역명
     */
    private String distNm;

    /**
     * 대표자명
     */
    private String ownRgstNm;

    /**
     * 사업자등록번호
     */
    private String crnNo;

    /**
     * 계약번호
     */
    private String contractNo;

    /**
     * 계약시작일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date contractStartDt;

    /**
     * 계약종료일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date contractEndDt;

    /**
     * 거래화폐단위
     */
    private String dealCurrUnitCd;

    /**
     * 효력시작일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date cofDt;

    /**
     * 우편번호
     */
    private String zipCd;

    /**
     * 성코드
     */
    private String sungCd;

    /**
     * 성 명
     */
    private String sungNm;

    /**
     * 주소
     */
    private String addr;

    /**
     * 홈페이지주소
     */
    private String homepageUrl;

    /**
     * 대표 전화번호
     */
    private String telNo;

    /**
     * 대표 팩스번호
     */
    private String faxNo;

    /**
     * 담당자명
     */
    private String prsnNm;

    /**
     * 성별
     */
    private String sexCd = null;

    /**
     * 담당자전화
     */
    private String prsnTelNo;

    /**
     * 담당자H.P
     */
    private String prsnHpNo;

    /**
     * 담당자Email
     */
    private String prsnEmailNm;
    /**
     * 담당자FaxNo
     */
    private String prsnFaxNo;

    /**
     * 지불유형
     */
    private String payTp;

    /**
     * 지불조건
     */
    private String payTermCd;

    /**
     * 은행명
     */
    private String bankNm;

    /**
     * 은행계좌번호
     */
    private String bankAcNo;

    /**
     * 예금주
     */
    private String acOwnerNm;

    /**
     * 은행카드번호
     */
    private String bankCardNo;

    /**
     * 종료여부
     */
    private String endYn = "N";

    /**
     * 비고
     */
    private String remark;

    /**
     * 가격계수
     */
    private Double dcRate = 0.0;

    /**
     * 가격계수(VIEW용)
     */
    private Double dcRateView = 0.0;

    /**
     * 가격유형
     */
    private String prcTp;

    /**
     * 세율
     */
    private Double taxRate = 0.0;

    /**
     * 거래처구분
     */
    private String bpDstinCd;

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
     * @return the bpCd
     */
    public String getBpCd() {
        return bpCd;
    }

    /**
     * @param bpCd the bpCd to set
     */
    public void setBpCd(String bpCd) {
        this.bpCd = bpCd;
    }

    /**
     * @return the bpNm
     */
    public String getBpNm() {
        return bpNm;
    }

    /**
     * @param bpNm the bpNm to set
     */
    public void setBpNm(String bpNm) {
        this.bpNm = bpNm;
    }

    /**
     * @return the bpFullNm
     */
    public String getBpFullNm() {
        return bpFullNm;
    }

    /**
     * @param bpFullNm the bpFullNm to set
     */
    public void setBpFullNm(String bpFullNm) {
        this.bpFullNm = bpFullNm;
    }

    /**
     * @return the bpEnNm
     */
    public String getBpEnNm() {
        return bpEnNm;
    }

    /**
     * @param bpEnNm the bpEnNm to set
     */
    public void setBpEnNm(String bpEnNm) {
        this.bpEnNm = bpEnNm;
    }

    /**
     * @return the bpTp
     */
    public String getBpTp() {
        return bpTp;
    }

    /**
     * @param bpTp the bpTp to set
     */
    public void setBpTp(String bpTp) {
        this.bpTp = bpTp;
    }

    /**
     * @return the bpTpCnt
     */
    public String getBpTpCnt() {
        return bpTpCnt;
    }

    /**
     * @param bpTpCnt the bpTpCnt to set
     */
    public void setBpTpCnt(String bpTpCnt) {
        this.bpTpCnt = bpTpCnt;
    }

    /**
     * @return the cntryCd
     */
    public String getCntryCd() {
        return cntryCd;
    }

    /**
     * @param cntryCd the cntryCd to set
     */
    public void setCntryCd(String cntryCd) {
        this.cntryCd = cntryCd;
    }

    /**
     * @return the distCd
     */
    public String getDistCd() {
        return distCd;
    }

    /**
     * @param distCd the distCd to set
     */
    public void setDistCd(String distCd) {
        this.distCd = distCd;
    }

    /**
     * @return the distNm
     */
    public String getDistNm() {
        return distNm;
    }

    /**
     * @param distNm the distNm to set
     */
    public void setDistNm(String distNm) {
        this.distNm = distNm;
    }

    /**
     * @return the ownRgstNm
     */
    public String getOwnRgstNm() {
        return ownRgstNm;
    }

    /**
     * @param ownRgstNm the ownRgstNm to set
     */
    public void setOwnRgstNm(String ownRgstNm) {
        this.ownRgstNm = ownRgstNm;
    }

    /**
     * @return the crnNo
     */
    public String getCrnNo() {
        return crnNo;
    }

    /**
     * @param crnNo the crnNo to set
     */
    public void setCrnNo(String crnNo) {
        this.crnNo = crnNo;
    }

    /**
     * @return the contractNo
     */
    public String getContractNo() {
        return contractNo;
    }

    /**
     * @param contractNo the contractNo to set
     */
    public void setContractNo(String contractNo) {
        this.contractNo = contractNo;
    }

    /**
     * @return the contractStartDt
     */
    public Date getContractStartDt() {
        return contractStartDt;
    }

    /**
     * @param contractStartDt the contractStartDt to set
     */
    public void setContractStartDt(Date contractStartDt) {
        this.contractStartDt = contractStartDt;
    }

    /**
     * @return the contractEndDt
     */
    public Date getContractEndDt() {
        return contractEndDt;
    }

    /**
     * @param contractEndDt the contractEndDt to set
     */
    public void setContractEndDt(Date contractEndDt) {
        this.contractEndDt = contractEndDt;
    }

    /**
     * @return the dealCurrUnitCd
     */
    public String getDealCurrUnitCd() {
        return dealCurrUnitCd;
    }

    /**
     * @param dealCurrUnitCd the dealCurrUnitCd to set
     */
    public void setDealCurrUnitCd(String dealCurrUnitCd) {
        this.dealCurrUnitCd = dealCurrUnitCd;
    }

    /**
     * @return the cofDt
     */
    public Date getCofDt() {
        return cofDt;
    }

    /**
     * @param cofDt the cofDt to set
     */
    public void setCofDt(Date cofDt) {
        this.cofDt = cofDt;
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
     * @return the sungCd
     */
    public String getSungCd() {
        return sungCd;
    }

    /**
     * @param sungCd the sungCd to set
     */
    public void setSungCd(String sungCd) {
        this.sungCd = sungCd;
    }

    /**
     * @return the sungNm
     */
    public String getSungNm() {
        return sungNm;
    }

    /**
     * @param sungNm the sungNm to set
     */
    public void setSungNm(String sungNm) {
        this.sungNm = sungNm;
    }

    /**
     * @return the addr
     */
    public String getAddr() {
        return addr;
    }

    /**
     * @param addr the addr to set
     */
    public void setAddr(String addr) {
        this.addr = addr;
    }

    /**
     * @return the homepageUrl
     */
    public String getHomepageUrl() {
        return homepageUrl;
    }

    /**
     * @param homepageUrl the homepageUrl to set
     */
    public void setHomepageUrl(String homepageUrl) {
        this.homepageUrl = homepageUrl;
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
     * @return the faxNo
     */
    public String getFaxNo() {
        return faxNo;
    }

    /**
     * @param faxNo the faxNo to set
     */
    public void setFaxNo(String faxNo) {
        this.faxNo = faxNo;
    }

    /**
     * @return the prsnNm
     */
    public String getPrsnNm() {
        return prsnNm;
    }

    /**
     * @param prsnNm the prsnNm to set
     */
    public void setPrsnNm(String prsnNm) {
        this.prsnNm = prsnNm;
    }

    /**
     * @return the sexCd
     */
    public String getSexCd() {
        return sexCd;
    }

    /**
     * @param sexCd the sexCd to set
     */
    public void setSexCd(String sexCd) {
        this.sexCd = sexCd;
    }

    /**
     * @return the prsnTelNo
     */
    public String getPrsnTelNo() {
        return prsnTelNo;
    }

    /**
     * @param prsnTelNo the prsnTelNo to set
     */
    public void setPrsnTelNo(String prsnTelNo) {
        this.prsnTelNo = prsnTelNo;
    }

    /**
     * @return the prsnHpNo
     */
    public String getPrsnHpNo() {
        return prsnHpNo;
    }

    /**
     * @param prsnHpNo the prsnHpNo to set
     */
    public void setPrsnHpNo(String prsnHpNo) {
        this.prsnHpNo = prsnHpNo;
    }

    /**
     * @return the prsnEmailNm
     */
    public String getPrsnEmailNm() {
        return prsnEmailNm;
    }

    /**
     * @param prsnEmailNm the prsnEmailNm to set
     */
    public void setPrsnEmailNm(String prsnEmailNm) {
        this.prsnEmailNm = prsnEmailNm;
    }

    /**
     * @return the prsnFaxNo
     */
    public String getPrsnFaxNo() {
        return prsnFaxNo;
    }

    /**
     * @param prsnFaxNo the prsnFaxNo to set
     */
    public void setPrsnFaxNo(String prsnFaxNo) {
        this.prsnFaxNo = prsnFaxNo;
    }

    /**
     * @return the payTp
     */
    public String getPayTp() {
        return payTp;
    }

    /**
     * @param payTp the payTp to set
     */
    public void setPayTp(String payTp) {
        this.payTp = payTp;
    }

    /**
     * @return the payTermCd
     */
    public String getPayTermCd() {
        return payTermCd;
    }

    /**
     * @param payTermCd the payTermCd to set
     */
    public void setPayTermCd(String payTermCd) {
        this.payTermCd = payTermCd;
    }

    /**
     * @return the bankNm
     */
    public String getBankNm() {
        return bankNm;
    }

    /**
     * @param bankNm the bankNm to set
     */
    public void setBankNm(String bankNm) {
        this.bankNm = bankNm;
    }

    /**
     * @return the bankAcNo
     */
    public String getBankAcNo() {
        return bankAcNo;
    }

    /**
     * @param bankAcNo the bankAcNo to set
     */
    public void setBankAcNo(String bankAcNo) {
        this.bankAcNo = bankAcNo;
    }

    /**
     * @return the acOwnerNm
     */
    public String getAcOwnerNm() {
        return acOwnerNm;
    }

    /**
     * @param acOwnerNm the acOwnerNm to set
     */
    public void setAcOwnerNm(String acOwnerNm) {
        this.acOwnerNm = acOwnerNm;
    }

    /**
     * @return the bankCardNo
     */
    public String getBankCardNo() {
        return bankCardNo;
    }

    /**
     * @param bankCardNo the bankCardNo to set
     */
    public void setBankCardNo(String bankCardNo) {
        this.bankCardNo = bankCardNo;
    }

    /**
     * @return the endYn
     */
    public String getEndYn() {
        return endYn;
    }

    /**
     * @param endYn the endYn to set
     */
    public void setEndYn(String endYn) {
        this.endYn = endYn;
    }

    /**
     * @return the remark
     */
    public String getRemark() {
        return remark;
    }

    /**
     * @param remark the remark to set
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * @return the dcRate
     */
    public Double getDcRate() {
        return dcRate;
    }

    /**
     * @param dcRate the dcRate to set
     */
    public void setDcRate(Double dcRate) {
        this.dcRate = dcRate;
    }

    /**
     * @return the prcTp
     */
    public String getPrcTp() {
        return prcTp;
    }

    /**
     * @param prcTp the prcTp to set
     */
    public void setPrcTp(String prcTp) {
        this.prcTp = prcTp;
    }

    /**
     * @return the taxRate
     */
    public Double getTaxRate() {
        return taxRate;
    }

    /**
     * @param taxRate the taxRate to set
     */
    public void setTaxRate(Double taxRate) {
        this.taxRate = taxRate;
    }

    /**
     * @return the bpDstinCd
     */
    public String getBpDstinCd() {
        return bpDstinCd;
    }

    /**
     * @param bpDstinCd the bpDstinCd to set
     */
    public void setBpDstinCd(String bpDstinCd) {
        this.bpDstinCd = bpDstinCd;
    }

    /**
     * @return the dcRateView
     */
    public Double getDcRateView() {
        return dcRateView;
    }

    /**
     * @param dcRateView the dcRateView to set
     */
    public void setDcRateView(Double dcRateView) {
        this.dcRateView = dcRateView;
    }
}
