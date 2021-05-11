package chn.bhmc.dms.sal.cnt.vo;

import javax.validation.Valid;




/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ContractReSaveVO
 * @Description : 계약 저장 VO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016. 2. 15.    Kim Jin Suk        최초 생성
 * </pre>
 */

public class ContractReSaveVO {

    // 계약정보
    @Valid
    private ContractReVO contractReVO;

    // 프로모션 1
    @Valid
    private ContractRePromotionSaveVO corpPromotionVO;

    // 프로모션 2
    @Valid
    private ContractRePromotionSaveVO dlrPromotionVO;

    // 입출금
    @Valid
    private ContractRePayInfoSaveVO payInfoVO;

    // 보험 종류
    @Valid
    private ContractReIncSaveVO incVO;

    // 용품 goods
    private ContractReGoodsSaveVO goodsVO;

    // 부가비용
    @Valid
    private ContractReOptionSaveVO optionVO;

    // create, update Flag
    private String multiFlag = "";

    /**
     * @return the contractReVO
     */
    public ContractReVO getContractReVO() {
        return contractReVO;
    }

    /**
     * @param contractReVO the contractReVO to set
     */
    public void setContractReVO(ContractReVO contractReVO) {
        this.contractReVO = contractReVO;
    }

    /**
     * @return the corpPromotionVO
     */
    public ContractRePromotionSaveVO getCorpPromotionVO() {
        return corpPromotionVO;
    }

    /**
     * @param corpPromotionVO the corpPromotionVO to set
     */
    public void setCorpPromotionVO(ContractRePromotionSaveVO corpPromotionVO) {
        this.corpPromotionVO = corpPromotionVO;
    }

    /**
     * @return the dlrPromotionVO
     */
    public ContractRePromotionSaveVO getDlrPromotionVO() {
        return dlrPromotionVO;
    }

    /**
     * @param dlrPromotionVO the dlrPromotionVO to set
     */
    public void setDlrPromotionVO(ContractRePromotionSaveVO dlrPromotionVO) {
        this.dlrPromotionVO = dlrPromotionVO;
    }

    /**
     * @return the payInfoVO
     */
    public ContractRePayInfoSaveVO getPayInfoVO() {
        return payInfoVO;
    }

    /**
     * @param payInfoVO the payInfoVO to set
     */
    public void setPayInfoVO(ContractRePayInfoSaveVO payInfoVO) {
        this.payInfoVO = payInfoVO;
    }

    /**
     * @return the incVO
     */
    public ContractReIncSaveVO getIncVO() {
        return incVO;
    }

    /**
     * @param incVO the incVO to set
     */
    public void setIncVO(ContractReIncSaveVO incVO) {
        this.incVO = incVO;
    }

    /**
     * @return the goodsVO
     */
    public ContractReGoodsSaveVO getGoodsVO() {
        return goodsVO;
    }

    /**
     * @param goodsVO the goodsVO to set
     */
    public void setGoodsVO(ContractReGoodsSaveVO goodsVO) {
        this.goodsVO = goodsVO;
    }

    /**
     * @return the optionVO
     */
    public ContractReOptionSaveVO getOptionVO() {
        return optionVO;
    }

    /**
     * @param optionVO the optionVO to set
     */
    public void setOptionVO(ContractReOptionSaveVO optionVO) {
        this.optionVO = optionVO;
    }

    /**
     * @return the multiFlag
     */
    public String getMultiFlag() {
        return multiFlag;
    }

    /**
     * @param multiFlag the multiFlag to set
     */
    public void setMultiFlag(String multiFlag) {
        this.multiFlag = multiFlag;
    }
}
