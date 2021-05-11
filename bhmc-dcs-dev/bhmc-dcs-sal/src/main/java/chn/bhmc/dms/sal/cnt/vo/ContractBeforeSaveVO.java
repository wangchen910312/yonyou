package chn.bhmc.dms.sal.cnt.vo;

import javax.validation.Valid;

import chn.bhmc.dms.core.datatype.BaseSaveVO;



/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ContractBeforeSaveVO
 * @Description : 전략출고 판매 save VO
 * @author Kang Seok Han
 * @since 2016. 9. 05.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016. 9. 05.    Kim Jin Suk        최초 생성
 * </pre>
 */

public class ContractBeforeSaveVO extends BaseSaveVO<ContractBeforeItemVO>{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4010522153940344067L;

    // 계약정보
    @Valid
    private ContractBeforeVO beforeVO;

    /**
     * @return the beforeVO
     */
    public ContractBeforeVO getBeforeVO() {
        return beforeVO;
    }

    /**
     * @param beforeVO the beforeVO to set
     */
    public void setBeforeVO(ContractBeforeVO beforeVO) {
        this.beforeVO = beforeVO;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}
