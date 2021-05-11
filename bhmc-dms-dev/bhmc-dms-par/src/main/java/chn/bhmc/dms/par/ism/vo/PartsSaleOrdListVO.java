package chn.bhmc.dms.par.ism.vo;

import java.io.Serializable;
import java.util.List;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PartsSaleOrdListVO.java
 * @Description : PartsSaleOrdListVO.class
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


public class PartsSaleOrdListVO extends BaseVO implements Serializable{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2791818344189396054L;

    /**
     * 부품판매오더VO
     */
    private PartsSaleOrdVO partsSaleOrdVO;

    /**
     * 부품판매오더용품목록
     */
    private List<PartsSaleOrdItemVO> partsSaleOrdItemList;

    /**
     * @return the partsSaleOrdVO
     */
    public PartsSaleOrdVO getPartsSaleOrdVO() {
        return partsSaleOrdVO;
    }

    /**
     * @param partsSaleOrdVO the partsSaleOrdVO to set
     */
    public void setPartsSaleOrdVO(PartsSaleOrdVO partsSaleOrdVO) {
        this.partsSaleOrdVO = partsSaleOrdVO;
    }

    /**
     * @return the partsSaleOrdItemList
     */
    public List<PartsSaleOrdItemVO> getPartsSaleOrdItemList() {
        return partsSaleOrdItemList;
    }

    /**
     * @param purcOrdItemList the purcOrdItemList to set
     */
    public void setPartsSaleOrdItemList(List<PartsSaleOrdItemVO> partsSaleOrdItemList) {
        this.partsSaleOrdItemList = partsSaleOrdItemList;
    }
}
