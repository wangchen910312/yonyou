package chn.bhmc.dms.mob.api.repair.service;
import java.util.List;

import chn.bhmc.dms.mob.api.repair.vo.CalculateSearchVO;
import chn.bhmc.dms.mob.api.repair.vo.CalculateVO;




public interface RepairCalculateService {


    /**
     * 조회 조건에 해당하는 정산 현황  갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return 조회 목록
     */
    public int selectCalculateListByConditionCnt(CalculateSearchVO searchVO)throws Exception;

    public CalculateVO selectCalculateByKey(CalculateSearchVO searchVO) throws Exception;
    
    public List<CalculateVO> selectCalculateListByCondition(CalculateSearchVO searchVO)throws Exception;
    
    public String  selectCalculatesAmouts(CalculateSearchVO searchVO)throws Exception;

    
}