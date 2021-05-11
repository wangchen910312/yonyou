package chn.bhmc.dms.ser.est.vo;

import java.util.List;

import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.ser.cmm.vo.TabInfoSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : EstimateSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 4. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 25.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

@ValidDescriptor({

})
public class EstimateSaveVO extends TabInfoSaveVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5554130670278013559L;

    private EstimateVO estimateVO;

    List<EstimateDetailVO> estimateDetailSaveVO;

    private String estDocNo;

    /**
     * @return the estimateVO
     */
    public EstimateVO getEstimateVO() {
        return estimateVO;
    }

    /**
     * @param estimateVO the estimateVO to set
     */
    public void setEstimateVO(EstimateVO estimateVO) {
        this.estimateVO = estimateVO;
    }

    /**
     * @return the estimateDetailSaveVO
     */
    public List<EstimateDetailVO> getEstimateDetailSaveVO() {
        return estimateDetailSaveVO;
    }

    /**
     * @param estimateDetailSaveVO the estimateDetailSaveVO to set
     */
    public void setEstimateDetailSaveVO(List<EstimateDetailVO> estimateDetailSaveVO) {
        this.estimateDetailSaveVO = estimateDetailSaveVO;
    }

    /**
     * @return the estDocNo
     */
    public String getEstDocNo() {
        return estDocNo;
    }

    /**
     * @param estDocNo the estDocNo to set
     */
    public void setEstDocNo(String estDocNo) {
        this.estDocNo = estDocNo;
    }

}
