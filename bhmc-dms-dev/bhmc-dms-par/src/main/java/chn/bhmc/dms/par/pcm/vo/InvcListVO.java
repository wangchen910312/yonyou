package chn.bhmc.dms.par.pcm.vo;

import java.io.Serializable;
import java.util.List;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : InvcListVO.java
 * @Description : InvcListVO.java
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

public class InvcListVO extends BaseVO implements Serializable{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6540217638370198311L;

    /**
     * 송장VO
     */
    private InvcVO invcVO;

    /**
     * 송장품목VO
     */
    private List<InvcItemVO> invcItemList;

    /**
     * @return the invcVO
     */
    public InvcVO getInvcVO() {
        return invcVO;
    }

    /**
     * @param invcVO the invcVO to set
     */
    public void setInvcVO(InvcVO invcVO) {
        this.invcVO = invcVO;
    }

    /**
     * @return the purcOrdItemList
     */
    public List<InvcItemVO> getInvcItemList() {
        return invcItemList;
    }

    /**
     * @param invcItemList the invcItemList to set
     */
    public void setInvcItemList(List<InvcItemVO> invcItemList) {
        this.invcItemList = invcItemList;
    }
}
