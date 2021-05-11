package chn.bhmc.dms.par.ism.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PartsSaleEstimateSaveVO.java
 * @Description : PartsSaleEstimateSaveVO.class
 * @author Ju Won Lee
 * @since 2016. 2. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 3.     Ju Won Lee     최초 생성
 * </pre>
 */

public class PartsSaleEstimateSaveVO extends BaseSaveVO<PartsSaleEstimateItemVO>{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3344984203543611647L;

    /**
     *  부품판매견적서VO
     */
    private  PartsSaleEstimateVO          partsSaleEstimateVO;

    /**
     * @return the partsSaleEstimateVO
     */
    public PartsSaleEstimateVO getPartsSaleEstimateVO() {
        return partsSaleEstimateVO;
    }

    /**
     * @param partsSaleEstimateVO the partsSaleEstimateVO to set
     */
    public void setPartsSaleEstimateVO(PartsSaleEstimateVO partsSaleEstimateVO) {
        this.partsSaleEstimateVO = partsSaleEstimateVO;
    }
}
