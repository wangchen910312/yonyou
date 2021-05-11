package chn.bhmc.dms.sal.prm.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;


public class PromotionSaveVO extends BaseSaveVO<Object> {

	private static final long serialVersionUID = 7601614535185580114L;

	PromotionVO promotionVO;

	String contractTp;
	String promotionCd;
	String dlrCd;
	String regUsrId;

	BaseSaveVO<PromotionVO> custVO;

	BaseSaveVO<PromotionVO> modelVO;



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
     * @return the promotionCd
     */
    public String getPromotionCd() {
        return promotionCd;
    }

    /**
     * @param promotionCd the promotionCd to set
     */
    public void setPromotionCd(String promotionCd) {
        this.promotionCd = promotionCd;
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
     * @return the contractTp
     */
    public String getContractTp() {
        return contractTp;
    }

    /**
     * @param contractTp the contractTp to set
     */
    public void setContractTp(String contractTp) {
        this.contractTp = contractTp;
    }

    /**
     * @return the promotionVO
     */
    public PromotionVO getPromotionVO() {
        return promotionVO;
    }

    /**
     * @param promotionVO the promotionVO to set
     */
    public void setPromotionVO(PromotionVO promotionVO) {
        this.promotionVO = promotionVO;
    }

    /**
     * @return the custVO
     */
    public BaseSaveVO<PromotionVO> getCustVO() {
        return custVO;
    }

    /**
     * @param custVO the custVO to set
     */
    public void setCustVO(BaseSaveVO<PromotionVO> custVO) {
        this.custVO = custVO;
    }

    /**
     * @return the modelVO
     */
    public BaseSaveVO<PromotionVO> getModelVO() {
        return modelVO;
    }

    /**
     * @param modelVO the modelVO to set
     */
    public void setModelVO(BaseSaveVO<PromotionVO> modelVO) {
        this.modelVO = modelVO;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }



}
