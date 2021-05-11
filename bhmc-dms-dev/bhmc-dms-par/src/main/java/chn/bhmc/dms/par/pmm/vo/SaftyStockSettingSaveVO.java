package chn.bhmc.dms.par.pmm.vo;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * SaftyStockSettingSaveVO
 *
 * @ClassName   : SaftyStockSettingSaveVO.java
 * @Description : SaftyStockSettingSaveVO Class
 * @author In Bo Shim
 * @since 2016. 9. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 10.     In Bo Shim     최초 생성
 * </pre>
 */

public class SaftyStockSettingSaveVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1085901718734438154L;

    /**
     * 적정재고 설정 VO
     **/
    private SaftyStockSettingVO saftyStockSettingVO;

    /**
     * 가중치 상세 목록 VO
     **/
    private List<SaftyStockWeightVO> saftyStockWeightDetailVO;

    /**
     * 공급률 상세 목록 VO
     **/
    private List<SupplyRulePivotVO> supplyRuleDetailVO;

    /**
     * @return the saftyStockSettingVO
     */
    public SaftyStockSettingVO getSaftyStockSettingVO() {
        return saftyStockSettingVO;
    }

    /**
     * @param saftyStockSettingVO the saftyStockSettingVO to set
     */
    public void setSaftyStockSettingVO(SaftyStockSettingVO saftyStockSettingVO) {
        this.saftyStockSettingVO = saftyStockSettingVO;
    }

    /**
     * @return the saftyStockWeightDetailVO
     */
    public List<SaftyStockWeightVO> getSaftyStockWeightDetailVO() {
        return saftyStockWeightDetailVO;
    }

    /**
     * @param saftyStockWeightDetailVO the saftyStockWeightDetailVO to set
     */
    public void setSaftyStockWeightDetailVO(List<SaftyStockWeightVO> saftyStockWeightDetailVO) {
        this.saftyStockWeightDetailVO = saftyStockWeightDetailVO;
    }

    /**
     * @return the supplyRuleDetailVO
     */
    public List<SupplyRulePivotVO> getSupplyRuleDetailVO() {
        return supplyRuleDetailVO;
    }

    /**
     * @param supplyRuleDetailVO the supplyRuleDetailVO to set
     */
    public void setSupplyRuleDetailVO(List<SupplyRulePivotVO> supplyRuleDetailVO) {
        this.supplyRuleDetailVO = supplyRuleDetailVO;
    }

}
