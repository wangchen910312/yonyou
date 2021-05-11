package chn.bhmc.dms.sal.inc.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleMasterSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 12.     Kim yewom              최초 생성
 * </pre>
 */

public class IncJoinInfoSaveVO extends BaseSaveVO<IncJoinInfoVO>  {

    private static final long serialVersionUID = -404572985973453926L;

    IncJoinInfoVO incJoinInfoVO;

    BaseSaveVO<IncJoinInfoVO> incDtlVO;

    private boolean isContract = false;

    /**
     * @return the incJoinInfoVO
     */
    public IncJoinInfoVO getIncJoinInfoVO() {
        return incJoinInfoVO;
    }

    /**
     * @param incJoinInfoVO the incJoinInfoVO to set
     */
    public void setIncJoinInfoVO(IncJoinInfoVO incJoinInfoVO) {
        this.incJoinInfoVO = incJoinInfoVO;
    }

    /**
     * @return the incDtlVO
     */
    public BaseSaveVO<IncJoinInfoVO> getIncDtlVO() {
        return incDtlVO;
    }

    /**
     * @param incDtlVO the incDtlVO to set
     */
    public void setIncDtlVO(BaseSaveVO<IncJoinInfoVO> incDtlVO) {
        this.incDtlVO = incDtlVO;
    }

    /**
     * @return the isContract
     */
    public boolean isContract() {
        return isContract;
    }

    /**
     * @param isContract the isContract to set
     */
    public void setContract(boolean isContract) {
        this.isContract = isContract;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}