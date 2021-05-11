package chn.bhmc.dms.ser.est.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.est.vo.EstimateSearchVO;
import chn.bhmc.dms.ser.est.vo.EstimateVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : EstimateDAO.java
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
@Mapper("estimateDAO")
public interface EstimateDAO {

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
    public EstimateVO selectEstimateManageByKey(EstimateSearchVO searchVO)throws Exception;


    /**
    *
    * 예약 견적서 정보 조회
    *
    * @param searchVO - 견적서 정보 조회
    * @return
    * @throws Exception
    */
    public EstimateVO selectEstInResvManageByKey(EstimateSearchVO searchVO)throws Exception;

    /**
    *
    * 견적서 항목 정보를 등록한다.
    *
    * @param saveVO - 견적서 항목 등록  목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public void insertEstimates(EstimateVO estimateVO)throws Exception;

    /**
    *
    * 견적서 항목 정보를 수정한다.
    *
    * @param saveVO - 견적서 항목 수정 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public void updateEstimates(EstimateVO estimateVO)throws Exception;

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
    
    /**
     * 견적서 취소 한다.
     * @param estimateVO - 수정할 정보가 담긴 CalculateVO
     * @return 수정된 목록수
     */
    public void cancelEstimate(EstimateVO estimateVO)throws Exception;

}
