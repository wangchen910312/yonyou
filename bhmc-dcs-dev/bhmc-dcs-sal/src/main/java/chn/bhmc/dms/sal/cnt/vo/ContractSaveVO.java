package chn.bhmc.dms.sal.cnt.vo;

import javax.validation.Valid;



/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ContractSearchVO
 * @Description : 계약정보 조회 VO
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

public class ContractSaveVO {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7325236452633850428L;

    // 계약정보
    @Valid
    private ContractVO contractVO;

    // 로컬옵션
    @Valid
    private ContractLocalOptionSaveVO localOptionVO;

    // 프로모션
    @Valid
    private ContractPromotionSaveVO promotionVO;

    // create, update Flag
    private String multiFlag = "";

    /**
     * @return the contractVO
     */
    public ContractVO getContractVO() {
        return contractVO;
    }

    /**
     * @param contractVO the contractVO to set
     */
    public void setContractVO(ContractVO contractVO) {
        this.contractVO = contractVO;
    }

    /**
     * @return the localOptionVO
     */
    public ContractLocalOptionSaveVO getLocalOptionVO() {
        return localOptionVO;
    }

    /**
     * @param localOptionVO the localOptionVO to set
     */
    public void setLocalOptionVO(ContractLocalOptionSaveVO localOptionVO) {
        this.localOptionVO = localOptionVO;
    }

    /**
     * @return the promotionVO
     */
    public ContractPromotionSaveVO getPromotionVO() {
        return promotionVO;
    }

    /**
     * @param promotionVO the promotionVO to set
     */
    public void setPromotionVO(ContractPromotionSaveVO promotionVO) {
        this.promotionVO = promotionVO;
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

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
