package chn.bhmc.dms.mob.api.part.service;

import java.util.List;

import chn.bhmc.dms.mob.api.part.vo.CarInfoSearchVO;
import chn.bhmc.dms.mob.api.part.vo.CarInfoVO;



/**
 * 차종, 모델, 옵션 정보 관리 서비스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.05         Kim Jin Suk            최초 생성
 * </pre>
 */

public interface PartCarInfoService {

    /**
     * 차종 정보를 조회한다. (코드형 리스트)
     * @param searchVO - 조회 조건을 포함하는 CarInfoSearchVO
     * @return 조회 목록
     */
   // public int selectCarListsByConditionCnt(CarInfoSearchVO searchVO) throws Exception;
    public List<CarInfoVO> selectCarListsByCondition(CarInfoSearchVO searchVO) throws Exception;

    /**
     * 모델 정보를 조회한다. (코드형 리스트)
     * @param searchVO - 조회 조건을 포함하는 CarInfoSearchVO
     * @return 조회 목록
     */
    //public int selectModelListsByConditionCnt(CarInfoSearchVO searchVO) throws Exception;
    public List<CarInfoVO> selectModelListsByCondition(CarInfoSearchVO searchVO) throws Exception;
    //public List<CarInfoVO> selectModelListsByCondition2(CarInfoSearchVO searchVO) throws Exception;

   }
