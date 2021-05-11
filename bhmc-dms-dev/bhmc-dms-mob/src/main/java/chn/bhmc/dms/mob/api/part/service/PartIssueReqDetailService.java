package chn.bhmc.dms.mob.api.part.service;

import java.util.List;

import chn.bhmc.dms.mob.api.part.vo.IssueReqDetailVO;
import chn.bhmc.dms.mob.api.part.vo.IssueReqSearchVO;


/**
 * 부품요청상세 서비스
 *
 * @author In Bo Shim
 * @since 2016. 2. 15.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 15.     In Bo Shim      최초 생성
 * </pre>
 */

public interface PartIssueReqDetailService {

    
    /**
     * 조회 조건에 해당하는 정비수령 부품요청상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록
     */
    public List<IssueReqDetailVO> selectIssueReqDetailsByCondition(IssueReqSearchVO searchVO) throws Exception;

  
    /**
     * 조회 조건에 해당하는 부품요청상세 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록 수
     */
    public int selectIssueReqDetailsByConditionCnt(IssueReqSearchVO searchVO) throws Exception;
    
    /**
     * 조회 조건에 해당하는 정비수령집계 부품요청상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록
     */
    public List<IssueReqDetailVO> selectIssueReqDetailStatusByCondition(IssueReqSearchVO searchVO) throws Exception;

    
}
