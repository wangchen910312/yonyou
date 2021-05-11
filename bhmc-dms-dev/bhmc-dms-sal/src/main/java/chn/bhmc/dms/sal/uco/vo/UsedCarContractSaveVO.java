package chn.bhmc.dms.sal.uco.vo;

import javax.validation.Valid;




/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UsedCarContractSaveVO
 * @Description : 중고차 - 계약 저장 VO
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



public class UsedCarContractSaveVO {

    // 계약정보
    @Valid
    private UsedCarContractVO usedCarContractVO;

    // 입출금
    @Valid
    private UsedCarContractPayInfoSaveVO payInfoVO;

    // 보험 종류
    //@Valid
    private UsedCarContractIncSaveVO incVO;

    // 용품 goods

    // 부가비용
    //@Valid
    private UsedCarContractOptionSaveVO optionVO;

    // create, update Flag
    private String multiFlag = "";

    /**
     * @return the usedCarContractVO
     */
    public UsedCarContractVO getUsedCarContractVO() {
        return usedCarContractVO;
    }

    /**
     * @param usedCarContractVO the usedCarContractVO to set
     */
    public void setUsedCarContractVO(UsedCarContractVO usedCarContractVO) {
        this.usedCarContractVO = usedCarContractVO;
    }

    /**
     * @return the payInfoVO
     */
    public UsedCarContractPayInfoSaveVO getPayInfoVO() {
        return payInfoVO;
    }

    /**
     * @param payInfoVO the payInfoVO to set
     */
    public void setPayInfoVO(UsedCarContractPayInfoSaveVO payInfoVO) {
        this.payInfoVO = payInfoVO;
    }

    /**
     * @return the incVO
     */
    public UsedCarContractIncSaveVO getIncVO() {
        return incVO;
    }

    /**
     * @param incVO the incVO to set
     */
    public void setIncVO(UsedCarContractIncSaveVO incVO) {
        this.incVO = incVO;
    }

    /**
     * @return the optionVO
     */
    public UsedCarContractOptionSaveVO getOptionVO() {
        return optionVO;
    }

    /**
     * @param optionVO the optionVO to set
     */
    public void setOptionVO(UsedCarContractOptionSaveVO optionVO) {
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
