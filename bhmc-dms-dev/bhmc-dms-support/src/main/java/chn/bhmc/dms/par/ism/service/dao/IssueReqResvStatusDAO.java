package chn.bhmc.dms.par.ism.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.par.ism.vo.IssueReqResvStatusVO;
import chn.bhmc.dms.par.ism.vo.IssueReqSearchVO;

/**
 * 부품예약상태 데이타 매퍼 클래스
 *
 * @author In Bo Shim
 * @since 2016. 8. 16.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 8. 16.     In Bo Shim      최초 생성
 * </pre>
 */

@Mapper("issueReqResvStatusDAO")
public interface IssueReqResvStatusDAO {

    /**
     * 조회 조건에 해당하는 구매요청상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록
     */
    public List<IssueReqResvStatusVO> selectIssueReqResvStatusByCondition(IssueReqSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 부품예약상태 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록 수
     */
    public int selectIssueReqResvStatusByConditionCnt(IssueReqSearchVO searchVO);
}
