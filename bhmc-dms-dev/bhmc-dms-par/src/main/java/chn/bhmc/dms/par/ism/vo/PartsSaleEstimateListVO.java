package chn.bhmc.dms.par.ism.vo;

import java.io.Serializable;
import java.util.List;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PartsSaleEstimateListVO.java
 * @Description : PartsSaleEstimateListVO.class
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


public class PartsSaleEstimateListVO extends BaseVO implements Serializable{


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2791818344189396054L;

    /**
     *  부품판매견적서VO
     */
    private PartsSaleEstimateVO partsSaleEstimateVO;

    /**
     * 부품판매견적서목록
     */
    private List<PartsSaleEstimateItemVO> partsSaleEstimateItemList;

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

    /**
     * @return the partsSaleEstimateItemList
     */
    public List<PartsSaleEstimateItemVO> getPartsSaleEstimateItemList() {
        return partsSaleEstimateItemList;
    }

    /**
     * @param purcOrdItemList the purcOrdItemList to set
     */
    public void setPartsSaleEstimateItemList(List<PartsSaleEstimateItemVO> partsSaleEstimateItemList) {
        this.partsSaleEstimateItemList = partsSaleEstimateItemList;
    }

}
