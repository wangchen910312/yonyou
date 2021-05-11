package chn.bhmc.dms.ser.cal.service;

import java.util.List;

import chn.bhmc.dms.ser.cal.vo.CalculateSearchVO;
import chn.bhmc.dms.ser.cal.vo.CalculateVO;


public interface CalculateService {

    /**
     * 조회 조건에 해당하는 정산 KEY 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return 조회 목록
     */
    public CalculateVO selectCalculateByKey(CalculateSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 정산 현황  갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return 조회 목록
     */
    public int selectCalculateListByConditionCnt(CalculateSearchVO searchVO)throws Exception;

    /**
     * 조회 조건에 해당하는 정산 현황 를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return 조회 목록
     */
    public List<CalculateVO> selectCalculateListByCondition(CalculateSearchVO searchVO)throws Exception;

    /**
     * 조회 조건에 해당하는 정산토탈금액을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return 조회 목록
     */
    public List<CalculateVO> selectCalculateAmtByCondition(CalculateSearchVO searchVO)throws Exception;
}