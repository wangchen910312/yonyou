package chn.bhmc.dms.par.stm.vo;

import java.io.Serializable;
import java.util.List;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : InvestigationListVO.java
 * @Description : InvestigationListVO.java
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

public class InvestigationListVO extends BaseVO implements Serializable{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6365204091143435598L;

    private  InvestigationVO              investigationVO;

    private  List<InvestigationItemVO>    investigationItemList;

    /**
     * @return the investigationVO
     */
    public InvestigationVO getInvestigationVO() {
        return investigationVO;
    }

    /**
     * @param investigationVO the investigationVO to set
     */
    public void setInvestigationVO(InvestigationVO investigationVO) {
        this.investigationVO = investigationVO;
    }

    /**
     * @return the investigationItemList
     */
    public List<InvestigationItemVO> getInvestigationItemList() {
        return investigationItemList;
    }

    /**
     * @param investigationItemList the investigationItemList to set
     */
    public void setInvestigationItemList(List<InvestigationItemVO> investigationItemList) {
        this.investigationItemList = investigationItemList;
    }



}
