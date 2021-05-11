package chn.bhmc.dms.ser.est.service;

import java.util.List;

import chn.bhmc.dms.ser.est.vo.EstimateSaveVO;
import chn.bhmc.dms.ser.est.vo.EstimateSearchVO;
import chn.bhmc.dms.ser.est.vo.EstimateVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : EstimateService.java
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

public interface EstimateService {

    /**
    *
    * 견적서 정보 목록 조회
    *
    * @param searchVO - 견적서 정보 목록 조회
    * @return
    * @throws Exception
    */
    public int selectEstimateManageByConditionCnt(EstimateSearchVO searchVO)throws Exception;

    /**
    *
    * 견적서 정보 조회
    *
    * @param searchVO - 견적서 정보 조회
    * @return
    * @throws Exception
    */
    public EstimateVO selectEstimateManageByKey(EstimateSearchVO searchVO) throws Exception;

    /**
    *
    * 견적서 항목 정보를 등록한다.
    *
    * @param saveVO - 견적서 항목 등록/수정 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public String mulitEstimates(EstimateSaveVO saveVO)throws Exception;

    /**
    *
    * 견적서 항목 정보를 취소한다.
    *
    * @param saveVO - 견적서 항목 취소 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public void cancelEstimate(EstimateVO estimateVO)throws Exception;

    /**
     *
     * 견적서 정보 리스트목록수 조회
     *
     * @param searchVO - 견적서 정보 조회
     * @return
     * @throws Exception
     */
    public int selectEstimateListByConditionCnt(EstimateSearchVO searchVO)throws Exception;

    /**
     *
     * 견적서 정보 리스트 조회
     *
     * @param searchVO - 견적서 정보 조회
     * @return
     * @throws Exception
     */
    public List<EstimateVO> selectEstimateListByCondition(EstimateSearchVO searchVO)throws Exception;

    /**
     * 견적서 출력 정보를 수정한다.
     * @param estimateVO - 수정할 정보가 담긴 CalculateVO
     * @return 수정된 목록수
     */
    public void updateEstimatePrint(EstimateVO estimateVO)throws Exception;
    
     
}
