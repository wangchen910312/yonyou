package chn.bhmc.dms.par.pmm.vo;

import java.util.List;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PartsVenderSalPriceTargetSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2016. 4. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 19.     In Bo Shim     최초 생성
 * </pre>
 */

public class PartsVenderSalPriceTargetSaveVO {

    /**
     * 판매가 생성 대상선정 헤더 VO
     **/
    private PartsVenderSalPriceTargetHistoryVO partsVenderSalPriceTargetHistoryVO;

    /**
     * 판매가 생성 대상선정 상세 VO
     **/
    private List<PartsVenderSalPriceTargetMasterVO> partsVenderSalPriceTargetMasterDetailVO;

    /**
     * @return the partsVenderSalPriceTargetHistoryVO
     */
    public PartsVenderSalPriceTargetHistoryVO getPartsVenderSalPriceTargetHistoryVO() {
        return partsVenderSalPriceTargetHistoryVO;
    }

    /**
     * @param partsVenderSalPriceTargetHistoryVO the partsVenderSalPriceTargetHistoryVO to set
     */
    public void setPartsVenderSalPriceTargetHistoryVO(PartsVenderSalPriceTargetHistoryVO partsVenderSalPriceTargetHistoryVO) {
        this.partsVenderSalPriceTargetHistoryVO = partsVenderSalPriceTargetHistoryVO;
    }

    /**
     * @return the partsVenderSalPriceTargetMasterDetailVO
     */
    public List<PartsVenderSalPriceTargetMasterVO> getPartsVenderSalPriceTargetMasterDetailVO() {
        return partsVenderSalPriceTargetMasterDetailVO;
    }

    /**
     * @param partsVenderSalPriceTargetMasterDetailVO the partsVenderSalPriceTargetMasterDetailVO to set
     */
    public void setPartsVenderSalPriceTargetMasterDetailVO(
            List<PartsVenderSalPriceTargetMasterVO> partsVenderSalPriceTargetMasterDetailVO) {
        this.partsVenderSalPriceTargetMasterDetailVO = partsVenderSalPriceTargetMasterDetailVO;
    }

}
