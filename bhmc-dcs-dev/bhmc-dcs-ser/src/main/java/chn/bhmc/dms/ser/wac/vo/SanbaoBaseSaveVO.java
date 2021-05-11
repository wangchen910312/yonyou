package chn.bhmc.dms.ser.wac.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoBaseSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 5. 13.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 13.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public class SanbaoBaseSaveVO extends BaseSaveVO<Object>{
     
    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = -4001268629089830772L;
    
    private BaseSaveVO<SanbaoBaseVO> gridBaseVO;
    private BaseSaveVO<SanbaoBaseVO> gridRoBaseVO;
    private BaseSaveVO<SanbaoBaseVO> gridRateVO;
    private BaseSaveVO<SanbaoBasePartVO> gridPartVO;
    
    
    /**
     * @return the gridBaseVO
     */
    public BaseSaveVO<SanbaoBaseVO> getGridBaseVO() {
        return gridBaseVO;
    }
    /**
     * @param gridBaseVO the gridBaseVO to set
     */
    public void setGridBaseVO(BaseSaveVO<SanbaoBaseVO> gridBaseVO) {
        this.gridBaseVO = gridBaseVO;
    }
    /**
     * @return the gridRoBaseVO
     */
    public BaseSaveVO<SanbaoBaseVO> getGridRoBaseVO() {
        return gridRoBaseVO;
    }
    /**
     * @param gridRoBaseVO the gridRoBaseVO to set
     */
    public void setGridRoBaseVO(BaseSaveVO<SanbaoBaseVO> gridRoBaseVO) {
        this.gridRoBaseVO = gridRoBaseVO;
    }
    /**
     * @return the gridRateVO
     */
    public BaseSaveVO<SanbaoBaseVO> getGridRateVO() {
        return gridRateVO;
    }
    /**
     * @param gridRateVO the gridRateVO to set
     */
    public void setGridRateVO(BaseSaveVO<SanbaoBaseVO> gridRateVO) {
        this.gridRateVO = gridRateVO;
    }
    /**
     * @return the gridPartVO
     */
    public BaseSaveVO<SanbaoBasePartVO> getGridPartVO() {
        return gridPartVO;
    }
    /**
     * @param gridPartVO the gridPartVO to set
     */
    public void setGridPartVO(BaseSaveVO<SanbaoBasePartVO> gridPartVO) {
        this.gridPartVO = gridPartVO;
    }
    
    
           

}
