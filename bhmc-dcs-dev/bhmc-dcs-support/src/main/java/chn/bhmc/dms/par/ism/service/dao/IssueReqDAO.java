package chn.bhmc.dms.par.ism.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.par.ism.vo.IssueReqSearchVO;
import chn.bhmc.dms.par.ism.vo.IssueReqStatusVO;
import chn.bhmc.dms.par.ism.vo.IssueReqVO;

/**
 * 구매요청 헤더 데이타 매퍼 클래스
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

@Mapper("issueReqDAO")
public interface IssueReqDAO {

    /**
     * 구매요청 정보를 등록한다.
     * @param issueReq - 등록할 정보가 담긴 IssueReqVO
     * @return 등록된 목록수
     */
    public int insertIssueReq(IssueReqVO issueReqVO);

    /**
     * 구매요청 정보를 수정한다.
     * @param issueReq - 수정할 정보가 담긴 IssueReqVO
     * @return 수정된 목록수
     */
    public int updateIssueReq(IssueReqVO issueReqVO);

    /**
     * 구매요청 정보를 삭제한다.
     * @param issueReq - 삭제할 정보가 담긴 IssueReqVO
     * @return 삭제된 목록수
     */
    public int deleteIssueReq(IssueReqVO issueReqVO);

    /**
     * Key에 해당하는 구매요청 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param parReqDocNo - 부품요청코드
     * @return 조회한 구매요청 정보
     */
    public IssueReqVO selectIssueReqByKey(@Param("dlrCd") String dlrCd, @Param("parReqDocNo") String parReqDocNo, @Param("roDocNo") String roDocNo, @Param("parGiTp") String parGiTp);

    /**
     * 조회 조건에 해당하는 구매요청 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록
     */
    public List<IssueReqVO> selectIssueReqsByCondition(IssueReqSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 구매요청 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록 수
     */
    public int selectIssueReqsByConditionCnt(IssueReqSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 구매요청현황 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록
     */
    public List<IssueReqStatusVO> selectIssueReqStatuesByCondition(IssueReqSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 구매요청현황 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록 수
     */
    public int selectIssueReqStatuesByConditionCnt(IssueReqSearchVO searchVO);

}
