package chn.bhmc.dms.sal.bsc.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.hibernate.validator.constraints.NotBlank;

import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

@ValidDescriptor({
     @ValidField(field="fincCmpCd", mesgKey="global.lbl.fincCmp")
    ,@ValidField(field="useYn", mesgKey="global.lbl.useYn")
})
public class FinancialProductsManagementVO implements Serializable {

	private static final long serialVersionUID = -6091261787809835772L;

	private String dlrCd;
	@NotBlank
	private String fincCmpCd;
	private String fincItemNm;
    private String fincItemCd;
    private String fincItemTp;
    private String fincItemPrid;
    private String creditGradeCd;
    private String custTp;
    private double contractAmt;
    private double prepayRate;
    private double prepayDlAmt;
    private double latepayDlAmt;
    private double cashPrc;
    private double mmPayAmtRate;
    private double remIntrRate;
    private double instIntrRate;
    private double hdlgFeeRate;
    private double hdlgFeeAmt;
    private double grteIncaRate;
    private double grteIncAmt;
    private double stampAmt;
    private double authAmt;
    private double instSbodtAmt;
    private String bpCd;
    private double contractAmtRate;
    @NotBlank
    private String useYn;

    private String regUsrId;
    private String regUsrNm;
    private String updtUsrId;
    private String updtUsrNm;

    private String fincItemKindCd;

    /**
     * 대상모델 추가목록
     */
    @Valid
    private List<FinancialProductsManagementModelVO> insertFincModelList = new ArrayList<FinancialProductsManagementModelVO>();

    /**
     * 대상모델 수정목록
     */
    @Valid
    private List<FinancialProductsManagementModelVO> updateFincModelList = new ArrayList<FinancialProductsManagementModelVO>();

    /**
     * 대상모델 삭제
     */
    @Valid
    private List<FinancialProductsManagementModelVO> deleteFincModelList = new ArrayList<FinancialProductsManagementModelVO>();


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
     * @return the fincCmpCd
     */
    public String getFincCmpCd() {
        return fincCmpCd;
    }
    /**
     * @param fincCmpCd the fincCmpCd to set
     */
    public void setFincCmpCd(String fincCmpCd) {
        this.fincCmpCd = fincCmpCd;
    }
    /**
     * @return the fincItemNm
     */
    public String getFincItemNm() {
        return fincItemNm;
    }
    /**
     * @param fincItemNm the fincItemNm to set
     */
    public void setFincItemNm(String fincItemNm) {
        this.fincItemNm = fincItemNm;
    }
    /**
     * @return the fincItemCd
     */
    public String getFincItemCd() {
        return fincItemCd;
    }
    /**
     * @param fincItemCd the fincItemCd to set
     */
    public void setFincItemCd(String fincItemCd) {
        this.fincItemCd = fincItemCd;
    }
    /**
     * @return the fincItemTp
     */
    public String getFincItemTp() {
        return fincItemTp;
    }
    /**
     * @param fincItemTp the fincItemTp to set
     */
    public void setFincItemTp(String fincItemTp) {
        this.fincItemTp = fincItemTp;
    }
    /**
     * @return the fincItemPrid
     */
    public String getFincItemPrid() {
        return fincItemPrid;
    }
    /**
     * @param fincItemPrid the fincItemPrid to set
     */
    public void setFincItemPrid(String fincItemPrid) {
        this.fincItemPrid = fincItemPrid;
    }
    /**
     * @return the creditGradeCd
     */
    public String getCreditGradeCd() {
        return creditGradeCd;
    }
    /**
     * @param creditGradeCd the creditGradeCd to set
     */
    public void setCreditGradeCd(String creditGradeCd) {
        this.creditGradeCd = creditGradeCd;
    }
    /**
     * @return the custTp
     */
    public String getCustTp() {
        return custTp;
    }
    /**
     * @param custTp the custTp to set
     */
    public void setCustTp(String custTp) {
        this.custTp = custTp;
    }
    /**
     * @return the contractAmt
     */
    public double getContractAmt() {
        return contractAmt;
    }
    /**
     * @param contractAmt the contractAmt to set
     */
    public void setContractAmt(double contractAmt) {
        this.contractAmt = contractAmt;
    }
    /**
     * @return the prepayRate
     */
    public double getPrepayRate() {
        return prepayRate;
    }
    /**
     * @param prepayRate the prepayRate to set
     */
    public void setPrepayRate(double prepayRate) {
        this.prepayRate = prepayRate;
    }
    /**
     * @return the prepayDlAmt
     */
    public double getPrepayDlAmt() {
        return prepayDlAmt;
    }
    /**
     * @param prepayDlAmt the prepayDlAmt to set
     */
    public void setPrepayDlAmt(double prepayDlAmt) {
        this.prepayDlAmt = prepayDlAmt;
    }
    /**
     * @return the latepayDlAmt
     */
    public double getLatepayDlAmt() {
        return latepayDlAmt;
    }
    /**
     * @param latepayDlAmt the latepayDlAmt to set
     */
    public void setLatepayDlAmt(double latepayDlAmt) {
        this.latepayDlAmt = latepayDlAmt;
    }
    /**
     * @return the cashPrc
     */
    public double getCashPrc() {
        return cashPrc;
    }
    /**
     * @param cashPrc the cashPrc to set
     */
    public void setCashPrc(double cashPrc) {
        this.cashPrc = cashPrc;
    }
    /**
     * @return the mmPayAmtRate
     */
    public double getMmPayAmtRate() {
        return mmPayAmtRate;
    }
    /**
     * @param mmPayAmtRate the mmPayAmtRate to set
     */
    public void setMmPayAmtRate(double mmPayAmtRate) {
        this.mmPayAmtRate = mmPayAmtRate;
    }
    /**
     * @return the remIntrRate
     */
    public double getRemIntrRate() {
        return remIntrRate;
    }
    /**
     * @param remIntrRate the remIntrRate to set
     */
    public void setRemIntrRate(double remIntrRate) {
        this.remIntrRate = remIntrRate;
    }
    /**
     * @return the instIntrRate
     */
    public double getInstIntrRate() {
        return instIntrRate;
    }
    /**
     * @param instIntrRate the instIntrRate to set
     */
    public void setInstIntrRate(double instIntrRate) {
        this.instIntrRate = instIntrRate;
    }
    /**
     * @return the hdlgFeeRate
     */
    public double getHdlgFeeRate() {
        return hdlgFeeRate;
    }
    /**
     * @param hdlgFeeRate the hdlgFeeRate to set
     */
    public void setHdlgFeeRate(double hdlgFeeRate) {
        this.hdlgFeeRate = hdlgFeeRate;
    }
    /**
     * @return the hdlgFeeAmt
     */
    public double getHdlgFeeAmt() {
        return hdlgFeeAmt;
    }
    /**
     * @param hdlgFeeAmt the hdlgFeeAmt to set
     */
    public void setHdlgFeeAmt(double hdlgFeeAmt) {
        this.hdlgFeeAmt = hdlgFeeAmt;
    }
    /**
     * @return the grteIncaRate
     */
    public double getGrteIncaRate() {
        return grteIncaRate;
    }
    /**
     * @param grteIncaRate the grteIncaRate to set
     */
    public void setGrteIncaRate(double grteIncaRate) {
        this.grteIncaRate = grteIncaRate;
    }
    /**
     * @return the grteIncAmt
     */
    public double getGrteIncAmt() {
        return grteIncAmt;
    }
    /**
     * @param grteIncAmt the grteIncAmt to set
     */
    public void setGrteIncAmt(double grteIncAmt) {
        this.grteIncAmt = grteIncAmt;
    }
    /**
     * @return the stampAmt
     */
    public double getStampAmt() {
        return stampAmt;
    }
    /**
     * @param stampAmt the stampAmt to set
     */
    public void setStampAmt(double stampAmt) {
        this.stampAmt = stampAmt;
    }
    /**
     * @return the authAmt
     */
    public double getAuthAmt() {
        return authAmt;
    }
    /**
     * @param authAmt the authAmt to set
     */
    public void setAuthAmt(double authAmt) {
        this.authAmt = authAmt;
    }
    /**
     * @return the instSbodtAmt
     */
    public double getInstSbodtAmt() {
        return instSbodtAmt;
    }
    /**
     * @param instSbodtAmt the instSbodtAmt to set
     */
    public void setInstSbodtAmt(double instSbodtAmt) {
        this.instSbodtAmt = instSbodtAmt;
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
     * @return the contractAmtRate
     */
    public double getContractAmtRate() {
        return contractAmtRate;
    }
    /**
     * @param contractAmtRate the contractAmtRate to set
     */
    public void setContractAmtRate(double contractAmtRate) {
        this.contractAmtRate = contractAmtRate;
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
     * @return the regUsrNm
     */
    public String getRegUsrNm() {
        return regUsrNm;
    }
    /**
     * @param regUsrNm the regUsrNm to set
     */
    public void setRegUsrNm(String regUsrNm) {
        this.regUsrNm = regUsrNm;
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
     * @return the updtUsrNm
     */
    public String getUpdtUsrNm() {
        return updtUsrNm;
    }
    /**
     * @param updtUsrNm the updtUsrNm to set
     */
    public void setUpdtUsrNm(String updtUsrNm) {
        this.updtUsrNm = updtUsrNm;
    }
    /**
     * @return the fincItemKindCd
     */
    public String getFincItemKindCd() {
        return fincItemKindCd;
    }
    /**
     * @param fincItemKindCd the fincItemKindCd to set
     */
    public void setFincItemKindCd(String fincItemKindCd) {
        this.fincItemKindCd = fincItemKindCd;
    }
    /**
     * @return the insertFincModelList
     */
    public List<FinancialProductsManagementModelVO> getInsertFincModelList() {
        return insertFincModelList;
    }
    /**
     * @param insertFincModelList the insertFincModelList to set
     */
    public void setInsertFincModelList(List<FinancialProductsManagementModelVO> insertFincModelList) {
        this.insertFincModelList = insertFincModelList;
    }
    /**
     * @return the updateFincModelList
     */
    public List<FinancialProductsManagementModelVO> getUpdateFincModelList() {
        return updateFincModelList;
    }
    /**
     * @param updateFincModelList the updateFincModelList to set
     */
    public void setUpdateFincModelList(List<FinancialProductsManagementModelVO> updateFincModelList) {
        this.updateFincModelList = updateFincModelList;
    }
    /**
     * @return the deleteFincModelList
     */
    public List<FinancialProductsManagementModelVO> getDeleteFincModelList() {
        return deleteFincModelList;
    }
    /**
     * @param deleteFincModelList the deleteFincModelList to set
     */
    public void setDeleteFincModelList(List<FinancialProductsManagementModelVO> deleteFincModelList) {
        this.deleteFincModelList = deleteFincModelList;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}