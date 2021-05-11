package chn.bhmc.dms.par.stm.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ToolGiSaveVO.java
 * @Description : ToolGiSaveVO.class
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

public class ToolGiSaveVO extends BaseSaveVO<ToolGiItemVO>{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3344984203543611647L;


    private  ToolGiVO          toolGiVO;

    /**
     * @return the toolGiVO
     */
    public ToolGiVO getToolGiVO() {
        return toolGiVO;
    }

    /**
     * @param toolGiVO the toolGiVO to set
     */
    public void setToolGiVO(ToolGiVO toolGiVO) {
        this.toolGiVO = toolGiVO;
    }


}
