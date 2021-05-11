package chn.bhmc.dms.par.stm.vo;

import java.io.Serializable;
import java.util.List;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ToolGiListVO.java
 * @Description : ToolGiListVO.class
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


public class ToolGiListVO extends BaseVO implements Serializable{


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2791818344189396054L;


    private  ToolGiVO          toolGiVO;

    private  List<ToolGiItemVO>    toolGiItemList;

    /**
     * @return the toolGiVO
     */
    public ToolGiVO getToolGiVO(){
        return toolGiVO;
    }

    /**
     * @param toolGiVO the toolGiVO to set
     */
    public void setToolGiVO(ToolGiVO toolGiVO) {
        this.toolGiVO = toolGiVO;
    }

    /**
     * @return the toolGiItemList
     */
    public List<ToolGiItemVO> getToolGiItemList() {
        return toolGiItemList;
    }

    /**
     * @param purcOrdItemList the purcOrdItemList to set
     */
    public void setToolGiItemList(List<ToolGiItemVO> toolGiItemList) {
        this.toolGiItemList = toolGiItemList;
    }

}
