package chn.bhmc.dms.par.cpm.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * 판매계획 저장 VO.
 *
 * @ClassName   : SalePlanSaveVO.java
 * @Description : SalePlanSaveVO Class
 * @author In Bo Shim
 * @since 2016. 7. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 28.     In Bo Shim     최초 생성
 * </pre>
 */

public class SalePlanSaveVO {

    /**
     * 판매계획 저장 VO
     **/
    private BaseSaveVO<SalePlanActVO> salePlanActSaveVO;

    /**
     * @return the salePlanActSaveVO
     */
    public BaseSaveVO<SalePlanActVO> getSalePlanActSaveVO() {
        return salePlanActSaveVO;
    }

    /**
     * @param salePlanActSaveVO the salePlanActSaveVO to set
     */
    public void setSalePlanActSaveVO(BaseSaveVO<SalePlanActVO> salePlanActSaveVO) {
        this.salePlanActSaveVO = salePlanActSaveVO;
    }
}
