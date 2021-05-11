package chn.bhmc.dms.par.pcm.vo;

import java.io.Serializable;
import java.util.List;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PurcOrdListVO.java
 * @Description : PurcOrdListVO.class
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


public class PurcOrdListVO extends BaseVO implements Serializable{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2791818344189396054L;

    /**
     * 구매오더VO
     */
    private PurcOrdVO purcOrdVO;

    /**
     * 구매오더품목리스트
     */
    private List<PurcOrdItemVO> purcOrdItemList;
    //liuxueying 控制订单重复提交 update start
    private String subOrderToken;
    //liuxueying 控制订单重复提交 update end
    /**
     * @return the purcOrdVO
     */
    public PurcOrdVO getPurcOrdVO() {
        return purcOrdVO;
    }

    /**
     * @param purcOrdVO the purcOrdVO to set
     */
    public void setPurcOrdVO(PurcOrdVO purcOrdVO) {
        this.purcOrdVO = purcOrdVO;
    }

    /**
     * @return the purcOrdItemList
     */
    public List<PurcOrdItemVO> getPurcOrdItemList() {
        return purcOrdItemList;
    }

    /**
     * @param purcOrdItemList the purcOrdItemList to set
     */
    public void setPurcOrdItemList(List<PurcOrdItemVO> purcOrdItemList) {
        this.purcOrdItemList = purcOrdItemList;
    }

	public String getSubOrderToken() {
		return subOrderToken;
	}

	public void setSubOrderToken(String subOrderToken) {
		this.subOrderToken = subOrderToken;
	}
    
}
