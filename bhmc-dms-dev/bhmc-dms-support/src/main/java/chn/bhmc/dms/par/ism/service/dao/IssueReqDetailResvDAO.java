package chn.bhmc.dms.par.ism.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.par.ism.vo.IssueReqDetailVO;
import chn.bhmc.dms.par.ism.vo.IssueReqSearchVO;

/**
 * 부품요청예약 상세 데이타 매퍼 클래스
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

@Mapper("issueReqDetailResvDAO")
public interface IssueReqDetailResvDAO {

    /**
     * 조회 조건에 해당하는 구매요청예약 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록
     */
    public List<IssueReqDetailVO> selectIssueReqDetailResvesByCondition(IssueReqSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 구매요청상세 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록 수
     */
    public int selectIssueReqDetailResvesByConditionCnt(IssueReqSearchVO searchVO);

    /**
     * 부품요청상세 준비정보를 수정한다.
     * @param issueReqDetailVO - 수정할 정보가 담긴 IssueReqDetailVO
     * @return 수정된 목록수
     */
    public int updateIssueReqDetailResv(IssueReqDetailVO issueReqDetailVO);

    /**
     * 부품요청상세 준비상태를 수정한다.
     * @param issueReqDetail - 수정할 정보가 담긴 IssueReqDetail
     * @return 수정된 목록수
     */
    public int updateIssuePartsReadyStatus(IssueReqDetailVO issueReqDetailVO);


}
