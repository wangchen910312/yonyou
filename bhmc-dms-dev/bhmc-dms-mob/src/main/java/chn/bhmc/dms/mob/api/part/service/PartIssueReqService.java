package chn.bhmc.dms.mob.api.part.service;

import java.util.List;

import chn.bhmc.dms.mob.api.part.vo.IssueReqSearchVO;
import chn.bhmc.dms.mob.api.part.vo.IssueReqVO;



/**
 * 부품요청 헤더 서비스
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

public interface PartIssueReqService {

    
    /**
     * 조회 조건에 해당하는 부품요청 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록
     */
    public List<IssueReqVO> selectIssueReqsByCondition(IssueReqSearchVO searchVO) throws Exception;

    
}
